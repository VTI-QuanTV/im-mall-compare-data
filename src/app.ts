import * as initiationCompareData from './comparators/initiationCompareData';
import { getConnection } from './db';
import { compareStructure } from './comparators/comparatorStructure';
import fs from 'fs';
import path from 'path';
import { config } from './common/config';
import { compareData } from './comparators/comparatorData';

async function execute() {
  try {
    const conn = await getConnection();
    if (!conn) {
      throw new Error('Can not connect to database');
    }
    // clear dir
    fs.rmdirSync(path.join(__dirname, `${config.resultApiDir}/`), {
      recursive: true,
    });
    // STEP 1: init data compare
    console.info('MAKING DATA COMPARE...');
    await initiationCompareData.makeInputCompare(conn);

    // STEP 2: compare structure
    console.info('COMPARING STRUCTURE...');
    const goodCases = compareStructure();

    // STEP 3: compare data
    const results = compareData(goodCases);
    console.log(results);

    console.info('COMPARING SUCCESS');
    console.info('Terminating connection...');
    await conn.end();
  } catch (error) {
    console.error(error);
  }
}

execute()
  .then((data) => data)
  .catch((error) => error);
