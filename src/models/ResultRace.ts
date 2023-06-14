import { Model, DataTypes, Optional } from 'sequelize';
import sequelize from '../connect_db';
interface ResultRaceAttributes {
  id: number;
  driver: string;
  car: string;
  timeComplete: string;
  date: string;
  year: number;
  country: string;
}

interface ResultRaceCreationAttributes extends Optional<ResultRaceAttributes, 'id'> {}

class ResultRace extends Model<ResultRaceAttributes,ResultRaceCreationAttributes> implements ResultRaceAttributes {
  public id!: number;
  public driver!: string;
  public car!: string;
  public country!: string;
  public timeComplete!: string;
  public date!: string;
  public year!: number;
  // Other model methods and associations here
  static associate(models: any){
    ResultRace.belongsTo(models.Driver, { foreignKey: 'driver' });
  }
}

ResultRace.init(
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
    date: {
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
    modelName: 'ResultRace',
    tableName: 'resultraces',
    timestamps: false,
  }
);

export default ResultRace;
