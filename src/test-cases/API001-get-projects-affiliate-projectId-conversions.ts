import { AxiosUtils } from '../common/axiosUtils';
import { config } from '../common/config';
import { CompareUtils } from '../common/compareUtils';
import mysql from 'mysql2/promise';
import {
  API_001_EXPECTED_FILE_NAME,
  API_001_SQL_FILE_NAME,
  ENDPOINTS,
  MESSAGE_FAILED,
  MESSAGE_PASS,
  NUMBER_OF_TESTCASES,
} from '../constants';

const axiosRequest = new AxiosUtils();

async function compare(conn: mysql.Connection): Promise<any> {
  try {
    const numberOfFileExpected = await CompareUtils.readResponseFile(
      `src/expected-responses/${ENDPOINTS.GET_PROJECTS_AFFILIATE_CONVERSIONS}`,
    );

    const script = CompareUtils.readFile(
      `src/scripts/${API_001_SQL_FILE_NAME}`,
    );

    await conn.query(script.toString());

    const resultCompare = [];
    const paramData = JSON.parse(
      CompareUtils.readFile(
        'src/parameter/get-projects-affiliate-projectId-conversions/api_001.json',
      ),
    );
    let actualResp;
    for (let i = 1; i <= numberOfFileExpected.length; i++) {
      let expectedData;
      if (i > 0) {
        expectedData = CompareUtils.readFile(
          `src/expected-responses/get-projects-affiliate-projectId-conversions/${API_001_EXPECTED_FILE_NAME}` +
            i +
            '.json',
        );
      }
      const projectId = paramData[i - 1].projectId;
      const API_ENDPOINT = `projects/affiliate/${projectId}/conversions`;
      delete paramData[i - 1]['projectId'];
      actualResp = await axiosRequest.request({
        method: 'GET',
        baseURL: config.apiUrl,
        url: API_ENDPOINT,
        headers: {
          'X-Organization-Id': '3',
          Authorization: '3',
          'X-From': '3',
        },
        params: paramData[i - 1],
      });

      const result = CompareUtils.compareDataResponseWithExpect(
        expectedData,
        actualResp.data,
      );
      !result
        ? resultCompare.push('expected_' + i + `${MESSAGE_FAILED}`)
        : resultCompare.push('expected_' + i + `${MESSAGE_PASS}`);
    }
    return resultCompare;
  } catch (error) {
    console.info('UNHANDLED ERROR', error);
  }
}

export { compare };
