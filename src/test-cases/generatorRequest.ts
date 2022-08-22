import { AxiosRequestConfig } from 'axios';
import { config } from '../common/config';
import { ENDPOINTS, TESTCASES } from '../constants';

export function generateRequest(
  api: ENDPOINTS,
  testCase: TESTCASES,
): AxiosRequestConfig {
  let projectId;

  switch (api) {
    case ENDPOINTS.GET_PROJECTS_AFFILIATE_CONVERSIONS_UNAPPROVED:
      switch (testCase) {
        case TESTCASES.TESTCASE005:
          projectId = encodeURIComponent(
            'a16b9356-2b17-11ec-aba9-06e52fpid001',
          );

          return {
            method: 'GET',
            baseURL: config.apiUrl,
            url: `/projects/affiliate/${projectId}/conversions/unapproved`,
            headers: {
              'X-Organization-Id': '1',
              Authorization: '1',
              'X-From': '1',
            },
          };
        case TESTCASES.TESTCASE019:
          projectId = encodeURIComponent(
            'a16b9356-2b17-11ec-aba9-06e52fpid001',
          );

          return {
            method: 'GET',
            baseURL: config.apiUrl,
            url: `/projects/affiliate/${projectId}/conversions/unapproved`,
            headers: {
              'X-Organization-Id': '1',
              Authorization: '1',
              'X-From': '1',
            },
            params: {
              limit: 10,
              offset: 0,
              from: '2022-05-31 00:00:00',
              to: '2022-06-08 00:00:00',
              sortKey: 'conversionId',
              sortType: 'ASC',
            },
          };
        case TESTCASES.TESTCASE055:
          projectId = encodeURIComponent(
            'a16b9356-2b17-11ec-aba9-06e52fpid001',
          );

          return {
            method: 'GET',
            baseURL: config.apiUrl,
            url: `/projects/affiliate/${projectId}/conversions/unapproved`,
            headers: {
              'X-Organization-Id': '1',
              Authorization: '1',
              'X-From': '1',
            },
            params: {
              limit: 50,
              offset: 0,
              from: '2022-06-06 00:00:00',
              to: '2022-06-08 00:00:00',
              sortKey: 'conversionId',
              sortType: 'ASC',
            },
          };
        case TESTCASES.TESTCASE066:
          projectId = encodeURIComponent(
            'a16b9356-2b17-11ec-aba9-06e52fpid001',
          );

          return {
            method: 'GET',
            baseURL: config.apiUrl,
            url: `/projects/affiliate/${projectId}/conversions/unapproved`,
            headers: {
              'X-Organization-Id': '1',
              Authorization: '1',
              'X-From': '1',
            },
            params: {
              limit: 50,
              offset: 0,
              from: '2022-05-31 00:00:00',
              to: '2022-06-08 00:00:00',
              sortKey: 'influencerId',
              sortType: 'ASC',
            },
          };
        case TESTCASES.TESTCASE071:
          projectId = encodeURIComponent(
            'a16b9356-2b17-11ec-aba9-06e52fpid001',
          );

          return {
            method: 'GET',
            baseURL: config.apiUrl,
            url: `/projects/affiliate/${projectId}/conversions/unapproved`,
            headers: {
              'X-Organization-Id': '1',
              Authorization: '1',
              'X-From': '1',
            },
            params: {
              limit: 50,
              offset: 0,
              from: '2022-05-31 00:00:00',
              to: '2022-06-08 00:00:00',
              sortKey: 'influencerId',
              sortType: 'DESC',
            },
          };
      }
  }
}
