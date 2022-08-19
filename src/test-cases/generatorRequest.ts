import { AxiosRequestConfig } from 'axios';
import { config } from '../common/config';
import { ENDPOINTS, TESTCASES } from '../constants';

export function generateRequest(
  api: ENDPOINTS,
  testCase: TESTCASES,
): AxiosRequestConfig {
  switch (api) {
    case ENDPOINTS.GET_PROJECTS_AFFILIATE_CONVERSIONS_UNAPPROVED:
      switch (testCase) {
        case TESTCASES.TESTCASE01:
          // eslint-disable-next-line no-case-declarations
          const projectId = encodeURIComponent(
            '00454d4a-b2c9-11eb-9fd6-06d367mpj001',
          );
          return {
            method: 'GET',
            baseURL: config.apiUrl,
            url: `/projects/affiliate/${projectId}/conversions/unapproved`,
            headers: {
              'X-Organization-Id': '3',
              Authorization: '3',
              'X-From': '3',
            },
          };
      }
  }
}
