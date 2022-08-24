import { ResultEnum } from '../constants';
import fs from 'fs';
import path from 'path';
import { config } from '../common/config';
import _ from 'lodash';

export function compareData(
  fieldsError: {
    path: string;
    api: string;
    result: ResultEnum;
    status: string;
    testCase: string;
    jsonFile: string;
    descriptions: any[];
  }[],
): {
  api: string;
  testCase: string;
  result: boolean;
}[] {
  try {
    const resultApiPath = config.resultApiDir;
    return fieldsError.map((data) => {
      const expectedResponse = fs.readFileSync(
        path.join(
          __dirname,
          `../expected-responses/${data.api?.replace(
            new RegExp('_', 'gm'),
            '-',
          )}/${data.testCase}_response.json`,
        ),
      );

      const actualResponse = fs.readFileSync(
        path.join(__dirname, `${resultApiPath}/${data.api}/${data.jsonFile}`),
      );

      return {
        api: data.api,
        testCase: data.testCase,
        result: _.isEqual(
          JSON.parse(expectedResponse.toString()),
          JSON.parse(actualResponse.toString())?.data,
        ),
      };
    });
  } catch (error) {
    console.error(error);
  }
}
