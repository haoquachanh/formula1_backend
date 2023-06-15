module.exports = {
    type: "mysql",
    host: "localhost",
    port: 3306,
    username: "root",
    password: "",
    database: "formula1",
    synchronize: true,
    logging: true,
    entities: ["src/models/*.ts"],
    migrations: ["src/migrations/*.ts"],
    subscribers: ["src/subscribers/*.ts"],
    cli: {
      entitiesDir: "src/models",
      migrationsDir: "src/migrations",
      subscribersDir: "src/subscribers"
    }
  };
  