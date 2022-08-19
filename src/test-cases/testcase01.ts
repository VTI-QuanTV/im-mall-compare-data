import fs from 'fs';
import { AxiosUtils } from '../common/axiosUtils';
import path from 'path';
import { truncateTables } from '../common/sqlUtils';
import { config } from '../common/config';
import mysql from 'mysql2/promise';
import { compareJson } from '../objectService';
import {
  TEST_CASE_01_JSON_FILE,
  TEST_CASE_01_SQL_FILE,
  TEST_CASE_01_TABLES_TRUNCATE,
} from '../constants';

const axiosRequest = new AxiosUtils();

async function compare(conn: mysql.Connection): Promise<boolean> {
  try {
    // STEP 1: Read file
    const script = fs.readFileSync(
      path.join(__dirname, `../scripts/${TEST_CASE_01_SQL_FILE}`),
    );
    const response = fs.readFileSync(
      path.join(__dirname, `../expected-responses/${TEST_CASE_01_JSON_FILE}`),
    );

    // STEP 2: execute query
    await truncateTables(conn, TEST_CASE_01_TABLES_TRUNCATE);
    await conn.query(script.toString());

    // STEP 3: call API
    const projectId = encodeURIComponent(
      '00454d4a-b2c9-11eb-9fd6-06d367mpj001',
    );
    const actualResponse = await axiosRequest.request({
      method: 'GET',
      baseURL: config.apiUrl,
      url: `/projects/affiliate/${projectId}/conversions/unapproved`,
      headers: {
        'X-Organization-Id': '3',
        Authorization: '3',
        'X-From': '3',
      },
    });

    // STEP 3: compare data
    return compareJson(JSON.parse(response.toString()), actualResponse.data);
  } catch (error) {
    console.info('UNHANDLED ERROR', error);
  }
}

export { compare };
