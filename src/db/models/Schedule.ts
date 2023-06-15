'use strict';
import { Model, DataTypes, Optional } from 'sequelize';
import sequelize from '../config/database';


interface ScheduleAttributes {
  id: number;
  startdate: string;
  enddate: string;
  place: string;
  pos1: string;
  pos2: string;
  pos3: string;
  year: number;

}

interface ScheduleCreationAttributes extends Optional<ScheduleAttributes, 'id'> {}

class Schedule extends Model<ScheduleAttributes, ScheduleCreationAttributes> implements ScheduleAttributes {
    public id!: number;
    public date!: string;
    public startdate!: string;
    public enddate!: string;
    public place!: string;
    public pos1!: string;
    public pos2!: string;
    public pos3!: string;
    public year!: number;

  // Define associations
  public static associate(models: any): void {
  }
}

Schedule.init(
  {
    id: {
      allowNull: false,
      autoIncrement: true,
      primaryKey: true,
      type: DataTypes.INTEGER
    },
    startdate: {
      allowNull: false,
      type: DataTypes.STRING
    },
    enddate:{
        allowNull: false,
        type: DataTypes.STRING
    },
    place:{
        allowNull: false,
        type: DataTypes.STRING
    },
    pos1:{
        allowNull: false,
        type: DataTypes.STRING
    },
    pos2:{
        allowNull: false,
        type: DataTypes.STRING
    },
    pos3:{
        allowNull: false,
        type: DataTypes.STRING
    },
    year:{
        allowNull: false,
        type: DataTypes.INTEGER
    },
  },
  {
    sequelize,
    modelName: 'Schedule',
    tableName: 'schedules',
    timestamps: false
  }
);

export default Schedule;
