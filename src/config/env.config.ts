import { config } from "dotenv";
config();
export const {
  PORT,
  DB_USERNAME,
  DB_PASSWORD,
  DB_SERVER,
  DB_DATABASE_NAME,
  NODE_ENV,
  STRIPE_SECRET_KEY,
  JWT_ACCESS_TOKEN_SECRET_KEY,
  JWT_REFRESH_TOKEN_SECRET_KEY,
  JWT_ACCESS_TOKEN_EXPIRATION_TIME,
  JWT_REFRESH_TOKEN_EXPIRATION_TIME,
  GOOGLE_CLIENT_ID,
  GOOGLE_CLIENT_SECRET,
  FRONTEND_URL,
} = process.env;