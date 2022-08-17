import { compare } from './test-cases/testCase01';

async function execute() {
  try {
    await compare();
  } catch (error) {
    console.error('UNHANDLED ERROR', error);
  }
}

execute();
