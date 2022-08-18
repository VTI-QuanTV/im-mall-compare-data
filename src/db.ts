import mysql from 'mysql2/promise';
import { config } from './common/config';
import { ConnectionOptions } from 'mysql2';

const dbConfig: ConnectionOptions = {
  host: config.db.host,
  port: config.db.port,
  user: config.db.user,
  password: config.db.password,
  database: config.db.database,
  multipleStatements: true,
};

export async function getConnection(): Promise<mysql.Connection> {
  return mysql.createConnection(dbConfig);
}
