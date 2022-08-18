import { compare } from './test-cases/testCase01';
import { getConnection } from './db';

async function execute() {
  try {
    const conn = await getConnection();
    if (!conn) {
      throw new Error('Can not connect to database');
    }
    await compare(conn);
    console.info('Terminating connection...');
    await conn.end();
  } catch (error) {
    console.error('UNHANDLED ERROR', error);
  }
}

execute()
  .then((data) => data)
  .catch((error) => error);
