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
    const resultApi002 = await testCase.execute(
      conn,
      ENDPOINTS.GET_PROJECTS_AFFILIATE_CONVERSIONS_UNAPPROVED,
    );
    const resultApi006 = await testCase.execute(
      conn,
      ENDPOINTS.GET_PROJECTS_AFFILIATE_CONVERSIONS_APPROVED,
    );
    const resultApi001 = await testCase.execute(
      conn,
      ENDPOINTS.GET_PROJECTS_AFFILIATE_CONVERSIONS,
    );
    const resultApi028 = await testCase.execute(
      conn,
      ENDPOINTS.GET_INFLUENCER_AFFILIATE_SUMMARY,
    );
    const resultApi030 = await testCase.execute(
      conn,
      ENDPOINTS.GET_INFLUENCER_INFLUENCERID_EVALUATIONS,
    );
    const results = [
      ...resultApi001,
      ...resultApi002,
      ...resultApi006,
      ...resultApi028,
      ...resultApi030,
    ];
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
