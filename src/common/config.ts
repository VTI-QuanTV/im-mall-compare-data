import dotenv from 'dotenv';

dotenv.config({ path: './process.env' });

export const config = {
    db: {
        host: process.env.DB_HOST,
        port: Number(process.env.DB_PORT),
        user: process.env.DB_USER,
        password: process.env.DB_PASSWORD,
        database: process.env.DB_SCHEMA
    },
    apiUrl: process.env.API_URL
};