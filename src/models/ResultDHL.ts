import { Model, DataTypes, Optional } from 'sequelize';
import sequelize from '../connect_db';
import Driver from './Driver';

interface ResultDHLAttributes {
  id: number;
  car: string;
  driver: string;
  country: string;
  timeComplete: string;
  year: number;
}

interface ResultDHLCreationAttributes extends Optional<ResultDHLAttributes, 'id'> {}

class ResultDHL extends Model<ResultDHLAttributes, ResultDHLCreationAttributes> implements ResultDHLAttributes {
  public id!: number;
  public driver!: string;
  public car!: string;
  public country!: string;
  public timeComplete!: string;
  public year!: number;

  // Other model methods and associations here
  static associate(models: any) {
    ResultDHL.belongsTo(models.Driver, { foreignKey: 'driver'});
  }
}

ResultDHL.init(
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
      allowNull: false,
    },
    driver: {
      allowNull: false,
      primaryKey: true,
      type: DataTypes.STRING,
      references: {
        model: 'Driver',
        key: 'fullname',
      },
    },
    car: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    country: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    timeComplete: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    year: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
  },
  {
    sequelize,
    modelName: 'ResultDHL',
    tableName: 'resultdhls',
    timestamps: false,
  }
);

export default ResultDHL;
