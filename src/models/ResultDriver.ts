import { Model, DataTypes,Optional } from 'sequelize';
import sequelize from '../connect_db';

interface ResultDriverAttributes {
  id: number;
  driver: string;
  point: number;
  car: string;
  pos: number;
  year: number;
}

interface ResultDriverCreationAttributes extends Optional<ResultDriverAttributes, 'id'> {}

class ResultDriver extends Model<ResultDriverAttributes,ResultDriverCreationAttributes> implements ResultDriverAttributes{
  public id!: number;
  public driver!: string;
  public car!: string;
  public pos!: number;
  public point!: number;
  public year!: number;
  // Other model methods and associations here
  public static associate(models: any): void{
    ResultDriver.belongsTo(models.Driver, { foreignKey: 'driver' });
  }
}

ResultDriver.init(
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
      allowNull: false,
    },
    driver: {
      type: DataTypes.STRING,
      primaryKey: true,
      allowNull: false,
      references:{
        model: 'Driver',
        key: 'fullname'
      }
    },
    car: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    pos: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    point: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    year: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
  },
  {
    sequelize,
    modelName: 'ResultDriver',
    tableName: 'resultdrivers',
    timestamps: false,
  }
);

export default ResultDriver;
