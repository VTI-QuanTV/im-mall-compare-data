import * as testCase01 from './test-cases/testcase01';
import { getConnection } from './db';

async function execute() {
  try {
    const conn = await getConnection();
    if (!conn) {
      throw new Error('Can not connect to database');
    }
    const resultCase1 = await testCase01.compare(conn);
    console.log('Result case 1: ', resultCase1);
    console.info('Terminating connection...');
    await conn.end();
  } catch (error) {
    console.error(error);
  }
}

execute()
  .then((data) => data)
  .catch((error) => error);
