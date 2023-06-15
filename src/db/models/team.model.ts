import { 
    Model, 
    Optional, 
    DataTypes,  
    ModelScopeOptions,
    ModelValidateOptions, 
    BelongsToGetAssociationMixin,} from 'sequelize'
import { sequelize } from '.'

const TeamDefinition = {
    id: {
      allowNull: false,
      autoIncrement: true,
      primaryKey: true,
      type: DataTypes.INTEGER,
    },
    fullname: {
      allowNull: false,
      unique: true,
      type: DataTypes.STRING,
    },
    name: {
      allowNull: false,
      type: DataTypes.STRING,
    },
    team_chief: {
      allowNull: false,
      type: DataTypes.STRING,
    },
    champion: {
      allowNull: true,
      type: DataTypes.INTEGER,
    },
  }

export interface TeamAttributes {
    id: number
    fullname: string
    name: string
    team_chief: string
    champion: number
}

export interface TeamCreationAttributes extends Optional<TeamAttributes, 'id'> {}

export class Team
  extends Model<TeamAttributes, TeamCreationAttributes>
  implements TeamAttributes
{
  public id!: number
  public name!: string
  public fullname!: string
  public team_chief!: string;
  public champion!: number;

  static readonly scopes: ModelScopeOptions = {}
  static readonly validations: ModelValidateOptions = {}
}

// Initialization
Team.init(TeamDefinition, {
  sequelize, 
  tableName: 'teams', // tên bảng trong MySQL
  underscored: true, // chuyển tên cột từ camelCase thành underscored
  updatedAt: false, // mặc định thêm các cột updated_at
  createdAt: false, // và created_at
  scopes: Team.scopes,
  validate: Team.validations,
})

