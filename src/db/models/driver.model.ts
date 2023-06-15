import { 
    Model, 
    Optional, 
    DataTypes,  
    ModelScopeOptions,
    ModelValidateOptions, 
    BelongsToGetAssociationMixin,} from 'sequelize'
import { sequelize } from '.'

// models/checklist.model.ts
import { Team } from './team.model'


//bug in 2 lines behind
Team.hasMany(Driver);
Driver.belongsTo(Team, { foreignKey: 'team' });

export interface DriverAttributes {
    id: number
    fullname: string
    team: string
    avt: string
    country: string
    champion: number
    number: number
    point: number
}

const DriverDefinition = {
    id: {
        allowNull: false,
        autoIncrement: true, 
        primaryKey: true, 
        type: DataTypes.INTEGER, 
    },
    fullname: { allowNull: false, unique: true, type: DataTypes.STRING, },
    team: { allowNull: false, type: DataTypes.STRING, },
    avt: { allowNull: false, type: DataTypes.STRING, },
    country: { allowNull: false, type: DataTypes.STRING, },
    point: { allowNull: true, type: DataTypes.INTEGER, },
    number: {allowNull: true,type: DataTypes.INTEGER,},
    champion: { allowNull: true,type: DataTypes.INTEGER },
  }



export interface DriverCreationAttributes extends Optional<DriverAttributes, 'id'> {}

export class Driver
  extends Model<DriverAttributes, DriverCreationAttributes>
  implements DriverAttributes
{
  public id!: number
  public team!: string
  public fullname!: string
  public country!: string
  public avt!: string
  public number!: number;
  public point!: number;
  public champion!: number;

  static readonly scopes: ModelScopeOptions = {}
  static readonly validations: ModelValidateOptions = {}
}

// Initialization
Driver.init(DriverDefinition, {
  sequelize, 
  tableName: 'drivers', // tên bảng trong MySQL
  underscored: true, // chuyển tên cột từ camelCase thành underscored
  updatedAt: false, // mặc định thêm các cột updated_at
  createdAt: false, // và created_at
  scopes: Driver.scopes,
  validate: Driver.validations,
})

