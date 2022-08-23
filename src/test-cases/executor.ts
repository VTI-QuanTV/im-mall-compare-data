import fs from 'fs';
import { AxiosUtils } from '../common/axiosUtils';
import path from 'path';
import mysql from 'mysql2/promise';
import { ENDPOINTS } from '../constants';
import _ from 'lodash';

const axiosRequest = new AxiosUtils();

async function execute(
  conn: mysql.Connection,
  api: ENDPOINTS,
): Promise<{ api: ENDPOINTS; result: boolean; testCase: number }[]> {
  try {
    const results = [];

    // STEP 1: Read files
    const scriptFile = fs.readFileSync(
      path.join(__dirname, `../scripts/${api}.sql`),
    );
    const responses = fs.readdirSync(
      path.join(__dirname, `../expected-responses/${api}`),
    );
    const requestAxios = fs.readFileSync(
      path.join(__dirname, `../request/${api}.json`),
    );
    const requestAxiosObj = JSON.parse(requestAxios.toString());

    // STEP 2: execute query
    await conn.query(scriptFile.toString());

    for (const expectedResp of responses) {
      const response = fs.readFileSync(
        path.join(__dirname, `../expected-responses/${api}/${expectedResp}`),
      );
      const testCaseNumber = Number(
        expectedResp.match(new RegExp('\\d+', 'g')),
      );

      // STEP 3: call API
      const requestConfig =
        requestAxiosObj[
          `testcase_${testCaseNumber.toString().padStart(3, '0')}`
        ];
      const actualResponse = await axiosRequest.request(requestConfig);

      // STEP 4: compare data
      const result = _.isEqual(
        JSON.parse(response.toString()),
        actualResponse.data,
      );

      results.push({
        api,
        testCase: testCaseNumber,
        result,
      });
    }

    return results;
  } catch (error) {
    console.info('UNHANDLED ERROR', error);
  }
}

export { execute };
