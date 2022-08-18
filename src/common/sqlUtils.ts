import mysql from 'mysql2/promise';

export const truncateTables = async (
  conn: mysql.Connection,
  tables: string[],
): Promise<void> => {
  const statements = tables.map((name) => `TRUNCATE TABLE ${name};`).join(' ');
  await conn.query(statements);
};
