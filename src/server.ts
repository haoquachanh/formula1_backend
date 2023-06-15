import "reflect-metadata";
import express from "express";
import { createConnection } from "typeorm";
import userRoutes from "./routes/userRoutes";

const app = express();
const port = 3000;

app.use(express.json());
app.use("/users", userRoutes);

createConnection()
  .then(() => {
    app.listen(port, () => {
      console.log(`Server is running on port ${port}`);
    });
  })
  .catch((error) => console.log(error));