import "reflect-metadata";
import express from "express";
import { createConnection } from "typeorm";
import routes from "./api/routes";
import 'dotenv/config'

const app = express();
const port = process.env.PORT || 3001;
createConnection()
  .then(() => {
    app.listen(port, () => {
      console.log(`Server is running on port ${port}`);
    });
  })
  .catch((error) => console.log('Failed in connecting database: ',error));

app.use(express.json());

// Thêm các cấu hình
// app.use('/api/v1',routes)
app.use('/',routes)

