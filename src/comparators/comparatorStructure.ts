import yaml from 'js-yaml';
import fs from 'fs';
import pug from 'pug';
import path from 'path';
import { CSV } from '../templates/csv/csv';
import {
  APPLICATION_JSON,
  COMPONENT_FILE_NAME,
  ErrorMessage,
  REGEX_LAST_SLASH,
  REGEX_STATUS_CODE,
  REGEX_STATUS_CODE_DASH,
  ResultEnum,
  UTF_8,
} from '../constants';
import { config } from '../common/config';

const swaggerDir = config.swaggerDir;
const responseDir = config.resultApiDir;
const htmlPath = config.report.htmlPath;
const csvPath = config.report.csvPath;

export function compareStructure(): {
  path: string;
  api: string;
  result: ResultEnum;
  status: string;
  testCase: string;
  jsonFile: string;
  descriptions: any[];
}[] {
  try {
    const swaggerPath = path.join(__dirname, swaggerDir);
    const fieldsError: {
      reason: string;
      file: string;
      path: string;
      result: ResultEnum;
      field?: string;
      expectedStatus?: string;
      actualStatus?: string;
    }[] = [];
    console.log('swagger path ====', swaggerPath);
    const swagger: any = yaml.load(
      fs.readFileSync(`${swaggerPath}/swagger.yaml`, { encoding: UTF_8 }),
    );
    const components = parseComponents();
    const responsesJson = parseResponseFiles();

    const swaggerByMethodAndStatus = groupSwaggerResponseByPath(
      swagger,
      components,
    );
    compareStatusCode(responsesJson, fieldsError);
    responsesJson
      .filter((resp) => resp.expectedStatusCode === resp.currentStatusCode)
      .forEach((resp) => {
        const parentFields: any[] = [];
        const expectResp = swaggerByMethodAndStatus[resp.path];
        compareJson(
          resp.fileName,
          expectResp,
          resp?.data,
          fieldsError,
          resp.path,
          parentFields,
        );

        if (fieldsError.every((el) => el.path !== resp.path)) {
          //  Good case
          fieldsError.push({
            reason: '',
            result: ResultEnum.GOOD,
            file: resp.fileName,
            path: resp.path,
          });
        }
      });

    // group field errors
    const regexStatusCodeDash = new RegExp(REGEX_STATUS_CODE_DASH, 'g');
    const regexStatusCode = new RegExp(REGEX_STATUS_CODE, 'g');
    const groupedResult = fieldsError
      .sort((a, b) => {
        const firstPath = a.path?.replace(regexStatusCodeDash, '');
        const secondPath = b.path?.replace(regexStatusCodeDash, '');
        if (firstPath > secondPath) {
          return 1;
        }
        if (firstPath < secondPath) {
          return -1;
        }
        if (a.file > b.file) {
          return 1;
        }
        if (a.file < b.file) {
          return -1;
        }
        return 0;
      })
      .reduce((arr, curr) => {
        const key = `${curr.path}-${curr.file}`;
        const updateElement = arr.find((el) => el.path === key);
        let descriptions = [];
        if (curr.field || curr.expectedStatus) {
          descriptions = curr.expectedStatus
            ? [
                `expect status: ${curr.expectedStatus}`,
                `actual status: ${curr.actualStatus}`,
              ]
            : [`${curr.reason}: ${curr.field}`];
        } else {
          descriptions = [curr.reason];
        }

        if (updateElement && curr.result === ResultEnum.NOT_GOOD) {
          updateElement.descriptions = [
            ...updateElement.descriptions,
            ...descriptions,
          ];
        } else {
          const result = {
            path: key,
            api: curr.path?.replace(regexStatusCodeDash, ''),
            status: curr.path?.match(regexStatusCode)[0],
            testCase: curr.file?.replace('.json', ''),
            jsonFile: curr.file,
            result: curr.result,
            descriptions:
              curr.result === ResultEnum.NOT_GOOD ? descriptions : [],
          };

          arr.push(result);
        }
        return arr;
      }, []);

    //  write to html
    const htmlDir = path.join(__dirname, htmlPath);
    const csvDir = path.join(__dirname, csvPath);
    if (!fs.existsSync(htmlDir)) {
      fs.mkdirSync(htmlDir);
    }
    if (!fs.existsSync(csvDir)) {
      fs.mkdirSync(csvDir);
    }
    const templateHtml = pug.compileFile(
      path.join(__dirname, '../templates/html/template.pug'),
    );
    fs.writeFileSync(
      path.join(__dirname, htmlPath),
      templateHtml({
        resultResp: groupedResult
          .filter((el) => el.result === ResultEnum.NOT_GOOD)
          .reduce((acc, curr) => {
            // eslint-disable-next-line @typescript-eslint/ban-ts-comment
            // @ts-ignore
            const dataFound = acc.find((el) => el.api === curr.api);
            if (dataFound) {
              dataFound.data = [...dataFound.data, curr];
            } else {
              acc.push({
                api: curr.api,
                data: [curr],
              });
            }
            return acc;
          }, []),
      }),
    );

    // write to csv
    const csv: CSV = new CSV();
    const dataCsv = groupedResult
      .filter((el) => el.result === ResultEnum.NOT_GOOD)
      .map(
        (el) =>
          `${el.api},${el.testCase},${
            el.jsonFile
          },"${el.descriptions.toString()}"`,
      );
    csv.setData(dataCsv);
    csv.build(path.join(__dirname, csvPath));

    return groupedResult.filter((el) => el.result === ResultEnum.GOOD);
  } catch (error) {
    console.error(error);
    return [];
  }
}

function groupSwaggerResponseByPath(swagger: any, components: any) {
  const swaggerByMethod: any = {};
  const swaggerRespGrouped: any = {};
  for (const [path, el] of Object.entries(swagger['paths'])) {
    for (const [method, detail] of Object.entries(el)) {
      swaggerByMethod[
        `${method?.toLowerCase()}${path
          .replace(/\//g, '_')
          .replace(/{|}|_v1|\$/g, '')}`
      ] = detail['responses'];
    }
  }
  for (const [path, el] of Object.entries(swaggerByMethod)) {
    for (const [statusCode, response] of Object.entries(el)) {
      const key = `${path}_${statusCode}`?.toLowerCase();
      if (!response?.content?.[APPLICATION_JSON]) {
        // empty response
        swaggerRespGrouped[key] = null;
        continue;
      }
      if (response?.content?.[APPLICATION_JSON]?.schema?.['$ref']) {
        const componentName = response?.content?.[APPLICATION_JSON]?.schema?.[
          '$ref'
        ]?.match(new RegExp(REGEX_LAST_SLASH, 'g'))?.[0];
        swaggerRespGrouped[key] = components[componentName];
        continue;
      }
      if (response?.content[APPLICATION_JSON]?.schema?.properties?.items) {
        // eslint-disable-next-line @typescript-eslint/ban-ts-comment
        // @ts-ignore
        response?.content[APPLICATION_JSON]?.schema?.properties?.items?.type =
          'array';
      }
      swaggerRespGrouped[key] = response?.content[APPLICATION_JSON]?.schema;
    }
  }

  return swaggerRespGrouped;
}

function parseComponents() {
  const swaggerPath = path.join(__dirname, swaggerDir);
  const component: any = yaml.load(
    fs.readFileSync(`${swaggerPath}/src/${COMPONENT_FILE_NAME}`, {
      encoding: UTF_8,
    }),
  );
  const componentsGrouped: any = {};
  for (const [className, refPath] of Object.entries(component?.schemas)) {
    const path: any = refPath;
    componentsGrouped[className] = yaml.load(
      fs.readFileSync(`${swaggerPath}/src/${path?.['$ref']?.slice(2)}`, {
        encoding: UTF_8,
      }),
    );
  }

  return componentsGrouped;
}

function compareStatusCode(
  responseJson: {
    path: string;
    fileName: string;
    expectedStatusCode: string;
    currentStatusCode: string;
    data: any;
  }[],
  fieldsError: {
    reason: string;
    file: string;
    path: string;
    result: ResultEnum;
    field?: string;
    expectedStatus?: string;
    actualStatus?: string;
  }[],
) {
  responseJson.forEach((resp) => {
    if (resp.expectedStatusCode !== resp.currentStatusCode) {
      fieldsError.push({
        reason: ErrorMessage.UNEXPECTED_HTTP_STATUS,
        result: ResultEnum.NOT_GOOD,
        file: resp.fileName,
        path: resp.path,
        expectedStatus: resp.expectedStatusCode,
        actualStatus: resp.currentStatusCode,
      });
    }
  });
}

function compareJson(
  fileName: string,
  expectResp: any,
  currentResp: any,
  fields: any[],
  path: string,
  parentFields?: string[],
  index?: number,
) {
  try {
    if (
      (expectResp?.type !== 'object' &&
        expectResp?.type === typeof currentResp) ||
      expectResp === currentResp ||
      (isEmpty(expectResp) && isEmpty(currentResp))
    ) {
      return;
    }

    if (!expectResp && currentResp) {
      fields.push({
        reason: ErrorMessage.EXPECTED_NULL_VALUE,
        result: ResultEnum.NOT_GOOD,
        file: fileName,
        path,
      });
      return;
    }

    if (!currentResp && expectResp) {
      fields.push({
        reason: ErrorMessage.MUST_NOT_EMPTY_VALUE,
        result: ResultEnum.NOT_GOOD,
        file: fileName,
        path,
      });
      return;
    }

    //  check redundant fields
    const redundantFields = Object.keys(currentResp).filter((key) =>
      Object.keys(expectResp?.properties || expectResp).every(
        (currentKey) => currentKey !== key,
      ),
    );

    if (redundantFields?.length) {
      redundantFields.forEach((field) => {
        const fieldName = parentFields?.length
          ? `${parentFields.join('.')}${
              typeof index === 'number' ? `[${index}]` : ''
            }.${field}`
          : field;
        fields.push({
          reason: ErrorMessage.REDUNDANT_PROPERTY,
          result: ResultEnum.NOT_GOOD,
          file: fileName,
          path,
          field: fieldName,
        });
      });
    }

    // compare to expected
    for (const [name, detail] of Object.entries(
      expectResp?.properties || expectResp,
    )) {
      const fieldName = parentFields?.length
        ? `${parentFields.join('.')}${
            typeof index === 'number' ? `[${index}]` : ''
          }.${name}`
        : name;
      const checkObj: any = detail;
      // lack field
      // eslint-disable-next-line no-prototype-builtins
      if (!currentResp.hasOwnProperty(name)) {
        fields.push({
          reason: ErrorMessage.MISSING_PROPERTY,
          file: fileName,
          result: ResultEnum.NOT_GOOD,
          path,
          field: fieldName,
        });
        continue;
      }

      if (!checkObj?.properties && currentResp[name] !== null) {
        // no need recursion
        switch (checkObj?.type) {
          case 'array':
            if (!Array.isArray(currentResp[name])) {
              fields.push({
                reason: ErrorMessage.IS_NOT_ARRAY,
                file: fileName,
                result: ResultEnum.NOT_GOOD,
                path,
                field: fieldName,
              });
            }
            if (Array.isArray(currentResp[name]) && checkObj?.items) {
              // recursion
              let idx = typeof index === 'number' ? index : 0;
              parentFields.push(name);
              for (const nestedObj of currentResp[name]) {
                compareJson(
                  fileName,
                  checkObj?.items,
                  nestedObj,
                  fields,
                  path,
                  parentFields,
                  idx,
                );
                idx++;
              }
            }
            break;
          case 'float':
            if (typeof currentResp[name] !== 'number') {
              fields.push({
                reason: ErrorMessage.IS_NOT_FLOAT,
                file: fileName,
                result: ResultEnum.NOT_GOOD,
                path,
                field: fieldName,
              });
            }
            break;
          case 'integer':
            if (!isInteger(currentResp[name])) {
              fields.push({
                reason: ErrorMessage.IS_NOT_INTEGER,
                result: ResultEnum.NOT_GOOD,
                file: fileName,
                path,
                field: fieldName,
              });
            }
            break;
          default:
            if (typeof currentResp[name] !== checkObj?.type) {
              fields.push({
                reason: `is not ${checkObj?.type}`,
                result: ResultEnum.NOT_GOOD,
                file: fileName,
                path,
                field: fieldName,
              });
            }
            break;
        }

        continue;
      }

      if (checkObj?.properties && Array.isArray(currentResp[name])) {
        // recursion
        let idx = typeof index === 'number' ? index : 0;
        parentFields.push(name);
        for (const nestedObj of currentResp[name]) {
          compareJson(
            fileName,
            checkObj?.properties,
            nestedObj,
            fields,
            path,
            parentFields,
            idx,
          );
          idx++;
        }
        continue;
      }

      if (checkObj?.properties && !Array.isArray(currentResp[name])) {
        compareJson(
          fileName,
          checkObj?.properties,
          currentResp[name],
          fields,
          path,
          parentFields,
          index,
        );
      }
    }
  } catch (error) {
    throw new Error(`Unhandled error in: ${path}/${fileName}`);
  }
}

function parseResponseFiles(): {
  path: string;
  fileName: string;
  expectedStatusCode: string;
  currentStatusCode: string;
  data: any;
}[] {
  const currentResponses: {
    path: string;
    fileName: string;
    expectedStatusCode: string;
    currentStatusCode: string;
    data: any;
  }[] = [];
  const responsePath = path.join(__dirname, responseDir);
  const dirs = fs.readdirSync(responsePath);
  for (const apiUrl of dirs) {
    const files = fs.readdirSync(`${responsePath}/${apiUrl}`);
    for (const fileName of files) {
      try {
        const file = fs.readFileSync(`${responsePath}/${apiUrl}/${fileName}`, {
          encoding: UTF_8,
        });
        const resp = JSON.parse(file);
        //  invalid format json file
        if (!resp?.expectedStatusCode || !resp.status) {
          throw new Error();
        }
        const currentStatusCode = resp?.status?.toString() || '';
        currentResponses.push({
          path: `${apiUrl}_${currentStatusCode}`?.trim()?.toLowerCase(),
          fileName: fileName?.trim()?.toLowerCase(),
          currentStatusCode: currentStatusCode?.trim(),
          expectedStatusCode: resp.expectedStatusCode?.toString(),
          data: resp.data,
        });
      } catch (err) {
        console.info(
          'invalid response type in case: ',
          `${responsePath}\\${apiUrl}\\${fileName}`,
        );
      }
    }
  }

  return currentResponses;
}

function isInteger(n: number) {
  return n === +n && n === (n | 0);
}

function isEmpty(el: any) {
  return !el || el.length === 0;
}
