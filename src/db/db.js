import dotenv from 'dotenv'
dotenv.config()
import pg from 'pg'

const { Pool } = pg

const user = 'postgres';
const password = '0043';
const host = 'localhost';
const port = 5432;
const database = 'shortly';

const connection = new Pool({
  user,
  password,
  host,
  port,
  database
});

export { connection }