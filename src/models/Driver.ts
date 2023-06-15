import { Model, DataTypes, Optional } from 'sequelize';
import sequelize from '../connect_db';
import Team from './Team';

interface DriverAttributes {
  id: number;
  fullname: string;
  team: string;
  point: number;
  champion: number;
  avt: string;
  number: number;
  country: string;
}

interface DriverCreationAttributes extends Optional<DriverAttributes, 'id'> {}

class Driver extends Model<DriverAttributes, DriverCreationAttributes> implements DriverAttributes {
  public id!: number;
  public fullname!: string;
  public team!: string;
  public point!: number;
  public champion!: number;
  public avt!: string;
  public number!: number;
  public country!: string;

  // Define associations
  public static associate(models: any): void {
    Driver.belongsTo(models.Team, { foreignKey: 'team'});
    Driver.hasMany(models.ResultDHL, { foreignKey: 'driver'});
    Driver.hasMany(models.ResultDriver, { foreignKey: 'driver'});
    Driver.hasMany(models.ResultRace, { foreignKey: 'driver'});
  }
}

Driver.init(
    {
        id: {
            allowNull: false,
            autoIncrement: true,
            primaryKey: true,
            type: DataTypes.INTEGER
          },
          fullname: {
            allowNull: false,
            primaryKey: true,
            type: DataTypes.STRING
          },
          team:{
            allowNull:false,
            primaryKey: true,
            type: DataTypes.STRING,
            references:{
              model: Team,
              key: 'name',
            }
        },
        point:{
            allowNull:false,
            type: DataTypes.INTEGER
        },
        champion:{
            allowNull:false,
            type: DataTypes.INTEGER
        },
        avt:{
            allowNull:false,
            type: DataTypes.STRING
        },
        number:{
            allowNull:false,
            type: DataTypes.INTEGER
        },
        country:{
            allowNull:false,
            type: DataTypes.STRING
        },
    },
  {
    sequelize,
    modelName: 'Driver',
    tableName: 'drivers',
    timestamps: false
  }
);

export default Driver;
