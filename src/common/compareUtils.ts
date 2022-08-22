import _ from 'lodash';
import { promises, readFileSync } from 'fs';
import { readdir } from 'fs/promises';

export class CompareUtils {
  public static compareDataResponseWithExpect(
    expectData: string,
    responseData: string,
  ) {
    return _.isEqual(JSON.parse(expectData), responseData);
  }

  public static async readResponseFile(filename: string) {
    try {
      const nameOfFiles = await readdir(filename);
      return nameOfFiles;
    } catch (err) {
      console.log(err);
      return null;
    }
  }

  public static readFile(filename: string) {
    try {
      return readFileSync(filename, 'utf-8');
    } catch (err) {
      console.log(err);
    }
  }
}
