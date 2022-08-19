import fs from 'fs';
import { AxiosUtils } from '../common/axiosUtils';
import path from 'path';
import { truncateTables } from '../common/sqlUtils';
import mysql from 'mysql2/promise';
import { ENDPOINTS, TRUNCATE_TABLES } from '../constants';
import { generateRequest } from './generatorRequest';
import _ from 'lodash';

const axiosRequest = new AxiosUtils();

async function execute(
  conn: mysql.Connection,
  api: string,
): Promise<{ api: string; result: boolean; testCase: string }[]> {
  try {
    const results = [];
    // eslint-disable-next-line @typescript-eslint/ban-ts-comment
    // @ts-ignore
    const tableTruncates = TRUNCATE_TABLES[api] as string[];
    // STEP 1: Read files
    const scriptFiles = fs.readdirSync(
      path.join(__dirname, `../scripts/${api}`),
    );

    for (const fileName of scriptFiles) {
      const script = fs.readFileSync(
        path.join(__dirname, `../scripts/${api}/${fileName}`),
      );
      const response = fs.readFileSync(
        path.join(
          __dirname,
          `../expected-responses/${api}/${fileName.replace('.sql', '.json')}`,
        ),
      );
      // STEP 2: execute query
      await truncateTables(conn, tableTruncates);
      await conn.query(script.toString());

      // STEP 3: call API
      const requestConfig = generateRequest(
        api as ENDPOINTS,
        Number(fileName.match(/\d+/)[0]),
      );
      const actualResponse = await axiosRequest.request(requestConfig);
      // STEP 3: compare data
      const result = _.isEqual(
        JSON.parse(response.toString()),
        actualResponse.data,
      );

      results.push({
        api,
        testCase: fileName,
        result,
      });
    }

    return results;
  } catch (error) {
    console.info('UNHANDLED ERROR', error);
  }
}

export { execute };
