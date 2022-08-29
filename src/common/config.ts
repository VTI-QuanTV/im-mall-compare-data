import dotenv from 'dotenv';

dotenv.config({ path: './process.env' });

export const config = {
  db: {
    host: process.env.DB_HOST,
    port: Number(process.env.DB_PORT),
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_SCHEMA,
  },
  resultApiDir: process.env.RESULT_API_DIR,
  swaggerDir: process.env.SWAGGER_DIR,
  responseDir: process.env.RESPONSE_DIR,
  reportDir: process.env.REPORT_DIR,
  baseUrlDir: process.env.API_URL,
  configDir: process.env.CONFIG_DIR,
};
