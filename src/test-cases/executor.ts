import fs from 'fs';
import { AxiosUtils } from '../common/axiosUtils';
import path from 'path';
import mysql from 'mysql2/promise';
import { ENDPOINTS, NUMBER_OF_TESTCASES } from '../constants';
import { generateRequest } from './generatorRequest';
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
    // eslint-disable-next-line @typescript-eslint/ban-ts-comment
    // @ts-ignore
    const numberOfTestcases: number = NUMBER_OF_TESTCASES[api];

    // STEP 2: execute query
    await conn.query(scriptFile.toString());

    for (let index = 1; index <= numberOfTestcases; index++) {
      const response = fs.readFileSync(
        path.join(
          __dirname,
          `../expected-responses/${api}/testcase_${index
            .toString()
            ?.padStart(2, '0')}.json`,
        ),
      );

      // STEP 3: call API
      const requestConfig = generateRequest(api as ENDPOINTS, index);
      const actualResponse = await axiosRequest.request(requestConfig);

      // STEP 4: compare data
      const result = _.isEqual(
        JSON.parse(response.toString()),
        actualResponse.data,
      );

      results.push({
        api,
        testCase: index,
        result,
      });
    }

    return results;
  } catch (error) {
    console.info('UNHANDLED ERROR', error);
  }
}

export { execute };
