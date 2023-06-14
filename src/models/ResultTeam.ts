import { Model, DataTypes,Optional } from 'sequelize';
import sequelize from '../connect_db';

interface ResultTeamAttributes {
  id: number;
  team: string;
  pos: number;
  point: number;
  year: number;
}

interface ResultTeamCreationAttributes extends Optional<ResultTeamAttributes, 'id'> {}


class ResultTeam extends Model<ResultTeamAttributes,ResultTeamCreationAttributes> implements ResultTeamAttributes {
  public id!: number;
  public team!: string;
  public pos!: number;
  public point!: number;
  public year!: number;
  // Other model methods and associations here
  static associate(models: any){
  }
}

ResultTeam.init(
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
      allowNull: false,
    },
    team: {
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
    modelName: 'ResultTeam',
    tableName: 'resultteams',
    timestamps: false,
  }
);

export default ResultTeam;
