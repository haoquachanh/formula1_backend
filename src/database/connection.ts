import { createConnection } from 'typeorm';

export const connectDatabase = async () => {
  try {
    await createConnection();
    console.log('Connected to the database');
  } catch (error) {
    console.error('Failed to connect to the database:', error);
  }
};
