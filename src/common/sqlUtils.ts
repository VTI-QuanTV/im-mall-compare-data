import { connection } from '../db';

export const executeQuery = (sqlString: string) => {
    return new Promise(((resolve, reject) => {
        connection.query(sqlString, (error, results) => {
            if (error) reject(error);
            resolve(results);
        });
    }));
};