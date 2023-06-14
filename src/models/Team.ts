import { Model, DataTypes,Optional } from 'sequelize';
import sequelize from '../connect_db';

interface TeamAttributes {
  id: number;
  fullname: string;
  name: string;
  team_chief: string;
  champion: number;
}

interface TeamCreationAttributes extends Optional<TeamAttributes, 'id'> {}
class Team extends Model<TeamAttributes, TeamCreationAttributes> implements TeamAttributes{
  public id!: number;
  public name!: string;
  public fullname!: string;
  public team_chief!: string;
  public champion!: number;
  // Other model methods and associations here
  static associate(models: any){
    Team.hasMany(models.Driver, { foreignKey: 'team' });
  }
}

Team.init(
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
      allowNull: false,
    },
    name: {
      type: DataTypes.STRING,
      allowNull: false,
      primaryKey: true,
    },
    fullname: {
      type: DataTypes.STRING,
      primaryKey: true,
      allowNull: false,
    },
    team_chief: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    champion: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
  },
  {
    sequelize,
    modelName: 'Team',
    tableName: 'teams',
    timestamps: false,
  }
);

export default Team;
