import fs from 'fs';
import * as response from '../expected-responses/testcase00.json';
import { AxiosUtils } from '../common/axiosUtils';
import path from 'path';
import { executeQuery } from '../common/sqlUtils';
import { config } from '../common/config';
import { TEST_CASE_001_ENDPOINT } from '../constants';

const axiosRequest = new AxiosUtils();

async function compare() {
  try {
    // STEP 1: Read file
    const script = fs.readFileSync(
      path.join(__dirname, '../scripts/test_00.sql'),
    );
    // STEP 2: execute query
    const dataQuery = await executeQuery(script.toString());
    // STEP 3: call API
    const actualResp = await axiosRequest.request({
      method: 'GET',
      baseURL: config.apiUrl,
      url: TEST_CASE_001_ENDPOINT,
      headers: {
        'X-Organization-Id': '3',
        Authorization: '3',
        'X-From': '3',
      },
    });
    // STEP 3: compare data
    // TODO: compare
  } catch (error) {
    console.info('UNHANDLED ERROR', error);
  }
}

export { compare };
