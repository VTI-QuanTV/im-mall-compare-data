import * as testCase from './test-cases/executor';
import { getConnection } from './db';
import { ENDPOINTS } from './constants';

async function execute() {
  try {
    const conn = await getConnection();
    if (!conn) {
      throw new Error('Can not connect to database');
    }
    console.info('STARTING COMPARE DATA...');
    const results = await Promise.all([
      testCase.execute(
        conn,
        ENDPOINTS.GET_PROJECTS_AFFILIATE_CONVERSIONS_UNAPPROVED,
      ),
      testCase.execute(conn, ENDPOINTS.GET_PROJECTS_AFFILIATE_CONVERSIONS),
      testCase.execute(conn, ENDPOINTS.GET_INFLUENCER_AFFILIATE_SUMMARY),
    ]).then((res) => res.reduce((acc, curr) => acc.concat(curr), []));
    console.log(results);
    console.info('Terminating connection...');
    await conn.end();
  } catch (error) {
    console.error(error);
  }
}

execute()
  .then((data) => data)
  .catch((error) => error);
