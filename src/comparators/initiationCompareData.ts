import fs from 'fs';
import { AxiosUtils } from '../common/axiosUtils';
import path from 'path';
import mysql from 'mysql2/promise';
import { ENDPOINTS, TypeCompare } from '../constants';
import { config } from '../common/config';

const axiosRequest = new AxiosUtils();
const resultApiDir = config.resultApiDir;

async function makeInputCompare(
  conn: mysql.Connection,
  listApi: any,
): Promise<void> {
  try {
    // STEP 1: Read files
    console.log(listApi);
    if (listApi && listApi?.api.length == 0) {
      const scriptFiles = fs.readdirSync(path.join(__dirname, `../scripts`));

      for (const scriptFile of scriptFiles) {
        const api = scriptFile.replace('.sql', '') as ENDPOINTS;
        // if (api.startsWith('get-inf')) {
        //   continue;
        // }
        const script = fs.readFileSync(
          path.join(__dirname, `../scripts/${scriptFile}`),
        );
        const requestFile = fs.readFileSync(
          path.join(
            __dirname,
            `../request/${scriptFile.replace('.sql', '.json')}`,
          ),
        );
        const requestObj = JSON.parse(requestFile.toString());

        // STEP 2: execute query
        await conn.query(script.toString());

        // eslint-disable-next-line prefer-const
        for (let [testCase, request] of Object.entries(requestObj)) {
          // STEP 3: call API;
          request = Object.assign(request, { baseURL: config.baseUrl });
          const actualResponse = await axiosRequest
            .request(request)
            .then((data) => data)
            .catch((error) => error);

          // STEP 4: save file
          const apiParse = api.replace(new RegExp('-', 'gm'), '_');
          const parentDir = path.join(__dirname, `${resultApiDir}`);
          const dir = path.join(__dirname, `${resultApiDir}/${apiParse}`);
          if (!fs.existsSync(parentDir)) {
            fs.mkdirSync(parentDir);
          }
          if (!fs.existsSync(dir)) {
            fs.mkdirSync(dir);
          }
          fs.writeFileSync(
            `${dir}/${testCase}.json`,
            JSON.stringify({
              status: actualResponse?.status,
              data: actualResponse?.data,
              // eslint-disable-next-line @typescript-eslint/ban-ts-comment
              // @ts-ignore
              expectedStatusCode: request['expectedStatusCode'],
            }),
          );
        }
      }
    } else {
      for (const api of listApi?.api) {
        const scriptFile = api + '.sql';
        // if (api.startsWith('get-inf')) {
        //   continue;
        // }
        const script = fs.readFileSync(
          path.join(__dirname, `../scripts/${scriptFile}`),
        );
        const requestFile = fs.readFileSync(
          path.join(
            __dirname,
            `../request/${scriptFile.replace('.sql', '.json')}`,
          ),
        );
        const requestObj = JSON.parse(requestFile.toString());

        // STEP 2: execute query
        await conn.query(script.toString());

        // eslint-disable-next-line prefer-const
        for (let [testCase, request] of Object.entries(requestObj)) {
          // STEP 3: call API;
          request = Object.assign(request, { baseURL: config.baseUrl });
          const actualResponse = await axiosRequest
            .request(request)
            .then((data) => data)
            .catch((error) => error);

          // STEP 4: save file
          const apiParse = api.replace(new RegExp('-', 'gm'), '_');
          const parentDir = path.join(__dirname, `${resultApiDir}`);
          const dir = path.join(__dirname, `${resultApiDir}/${apiParse}`);
          if (!fs.existsSync(parentDir)) {
            fs.mkdirSync(parentDir);
          }
          if (!fs.existsSync(dir)) {
            fs.mkdirSync(dir);
          }
          fs.writeFileSync(
            `${dir}/${testCase}.json`,
            JSON.stringify({
              status: actualResponse?.status,
              data: actualResponse?.data || actualResponse?.response?.data,
              // eslint-disable-next-line @typescript-eslint/ban-ts-comment
              // @ts-ignore
              expectedStatusCode: request['expectedStatusCode'],
            }),
          );
        }
      }
    }
  } catch (error) {
    console.info('UNHANDLED ERROR', error);
  }
}

export { makeInputCompare };
