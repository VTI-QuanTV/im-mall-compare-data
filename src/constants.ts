export enum ENDPOINTS {
  GET_PROJECTS_AFFILIATE_CONVERSIONS_UNAPPROVED = 'get-projects-affiliate-projectId-conversions-unapproved',
  GET_PROJECTS_AFFILIATE_CONVERSIONS_APPROVED = 'get-projects-affiliate-projectId-conversions-approved',
  GET_PROJECTS_AFFILIATE_CONVERSIONS = 'get-projects-affiliate-conversions',
  GET_INFLUENCER_AFFILIATE_SUMMARY = 'get-influencer-affiliate-influencerId-summary',
  GET_INFLUENCER_INFLUENCERID_EVALUATIONS = 'get-influencer-influencerId-evaluations',
  GET_INFLUENCER_INFLUENCERID_GENDER = 'get-influencer-influencerId-gender',
  GET_INFLUENCER_INFLUENCERID_INSITE = 'get-influencer-influencerId-insite',
  GET_INFLUENCER_INFLUENCERID_MEDIA = 'get-influencer-influencerId-media',
  GET_INFLUENCER_INFLUENCERID = 'get-influencer-influencerId',
}

export const APPLICATION_JSON = 'application/json';
export const COMPONENT_FILE_NAME = '_components.yaml';
export const UTF_8 = 'utf-8';
export const REGEX_STATUS_CODE_DASH = '(_[^\\_]+$)';
export const REGEX_STATUS_CODE = '([^\\_]+$)';
export const REGEX_LAST_SLASH = '[^\\/]+$';
export const CSV_HEADERS = [
  'API_ENDPOINT',
  'TESTCASE',
  'JSON_FILE',
  'DESCRIPTION',
];

export enum ResultEnum {
  GOOD = 'G',
  NOT_GOOD = 'NG',
}

export enum ErrorMessage {
  MISSING_PROPERTY = 'missing property',
  IS_NOT_ARRAY = 'is not array',
  IS_NOT_FLOAT = 'is not float',
  IS_NOT_INTEGER = 'is not integer',
  REDUNDANT_PROPERTY = 'redundant property',
  MUST_NOT_EMPTY_VALUE = 'must not empty value',
  EXPECTED_NULL_VALUE = 'expected null value',
  UNEXPECTED_HTTP_STATUS = 'unexpected http status code',
}
