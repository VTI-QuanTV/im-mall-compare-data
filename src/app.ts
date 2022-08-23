import * as testCase from './test-cases/executor';
import * as api001 from './test-cases/API001-get-projects-affiliate-projectId-conversions';
import { getConnection } from './db';
import { ENDPOINTS } from './constants';

async function execute() {
  try {
    const conn = await getConnection();
    if (!conn) {
      throw new Error('Can not connect to database');
    }
    const results = await testCase.execute(
      conn,
      ENDPOINTS.GET_PROJECTS_AFFILIATE_CONVERSIONS_UNAPPROVED,
    );
    console.log(results);
    // const resultAPI001 = await api001.compare(conn);
    // console.log('Result API-001: ', resultAPI001);
    console.info('Terminating connection...');
    await conn.end();
  } catch (error) {
    console.error(error);
  }
}

execute()
  .then((data) => data)
  .catch((error) => error);
