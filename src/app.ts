import { compare } from './test-cases/testCase01';
import { getConnection } from './db';

async function execute() {
  try {
    const conn = await getConnection();
    await compare(conn);
  } catch (error) {
    console.error('UNHANDLED ERROR', error);
  }
}

execute()
  .then((data) => data)
  .catch((error) => error);
