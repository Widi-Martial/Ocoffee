import dotenv from 'dotenv';
dotenv.config()
import { Client } from 'pg';

export const client = new Client(process.env.PG_URL);

client.connect();

//module.exports = client;