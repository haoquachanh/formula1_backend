import { createConnection } from 'typeorm';
import { ResultDHL } from '../entities/ResultDHL';
import { ResultDriver } from '../entities/ResultDriver';
import { ResultRace } from '../entities/ResultRace';
import { ResultTeam } from '../entities/ResultTeam';
import { Schedule } from '../entities/Schedule';
import { Driver } from '../entities/Driver';
import { Team } from '../entities/Team';

const resultDHLData = require('../../../data/resultDHL.json');
const resultDriverData = require('../../../data/driver.json');
const resultRaceData = require('../../../data/resultRace.json');
const resultTeamData = require('../../../data/resultTeam.json');
const scheduleData = require('../../../data/schedule.json');
const teamsData = require('../../../data/team.json');
const driversData = require('../../../data/driver.json');

async function seed() {
  try {
    // Tạo kết nối đến cơ sở dữ liệu
    const connection = await createConnection();

    // Lấy repository của các bảng tương ứng
    const resultDHLRepository = connection.getRepository(ResultDHL);
    const resultDriverRepository = connection.getRepository(ResultDriver);
    const resultRaceRepository = connection.getRepository(ResultRace);
    const resultTeamRepository = connection.getRepository(ResultTeam);
    const scheduleRepository = connection.getRepository(Schedule);
    const driverRepository = connection.getRepository(Driver);
    const teamRepository = connection.getRepository(Team);

    // Tìm các đối tượng Driver và Team theo tên từ dữ liệu có sẵn

    const nullTeam = new Team();
    nullTeam.name = 'N/A';
    await teamRepository.save(nullTeam);


    const teams = teamsData.map((teamData: any) => {
      const team = new Team();
      team.fullname = teamData.fullname;
      team.team_chief = teamData.team_chief;
      team.champion = teamData.champion;
      team.name = teamData.name;
      return team;
    });

    // Lưu các đối tượng "Team" vào cơ sở dữ liệu
    await teamRepository.save(teams);

    // Lặp qua dữ liệu từ file JSON và tạo các đối tượng "Driver" tương ứng

    let nullDriver = new Driver();
    await driverRepository.save(nullDriver);
    let nullDriver2 = new Driver();
    await driverRepository.save(nullDriver2);
    let nullDriver3 = new Driver();
    await driverRepository.save(nullDriver3);


    const drivers = driversData.map((driverData: any) => {
      const driver = new Driver();
      driver.team = teams.find((team: Team) => team.name === driverData.team);
      driver.country = driverData.country;
      driver.point = driverData.point;
      driver.champion = driverData.champion;
      driver.fullname = driverData.fullname;
      driver.number = driverData.number;
      driver.avt = driverData.avt;
      return driver;
    });
    await driverRepository.save(drivers);

    // Seed dữ liệu cho bảng ResultDHL
    const resultDHLs = resultDHLData.map((resultDHLItem: any) => {
      const resultDHL = new ResultDHL();
      resultDHL.driver = drivers.find((driver: Driver) => driver.fullname === resultDHLItem.driver);
      resultDHL.timeComplete = resultDHLItem.timeComplete;
      resultDHL.country = resultDHLItem.country;
      resultDHL.car = resultDHLItem.car;
      resultDHL.year = resultDHLItem.year;
      return resultDHL;
    });
    await resultDHLRepository.save(resultDHLs);

    // Seed dữ liệu cho bảng ResultDriver
    const resultDrivers = resultDriverData.map((resultDriverItem: any) => {
      const resultDriver = new ResultDriver();
      resultDriver.driver = drivers.find((driver: Driver) => driver.fullname === resultDriverItem.driver);
      resultDriver.pos = resultDriverItem.pos;
      resultDriver.point = resultDriverItem.point;
      resultDriver.car = resultDriverItem.car;
      resultDriver.year = resultDriverItem.year;
      return resultDriver;
    });
    await resultDriverRepository.save(resultDrivers);

    // Seed dữ liệu cho bảng ResultRace
    const resultRaces = resultRaceData.map((resultRaceItem: any) => {
      const resultRace = new ResultRace();
      resultRace.date = resultRaceItem.date;
      resultRace.car = resultRaceItem.car;
      resultRace.timeComplete = resultRaceItem.timeComplete;
      resultRace.country = resultRaceItem.country;
      resultRace.driverData = drivers.find((driver: Driver) => driver.fullname === resultRaceItem.driver);
      resultRace.year = resultRaceItem.year;
      return resultRace;
    });
    await resultRaceRepository.save(resultRaces);

    // Seed dữ liệu cho bảng ResultTeam
    const resultTeams = resultTeamData.map((resultTeamItem: any) => {
      const resultTeam = new ResultTeam();
      resultTeam.team = teams.find((team: Team) => team.name.substring(0, 3) === resultTeamItem.team.substring(0, 3));
      resultTeam.pos = resultTeamItem.pos;
      resultTeam.point = resultTeamItem.point;
      resultTeam.year = resultTeamItem.year;
      return resultTeam;
    });
    await resultTeamRepository.save(resultTeams);

    // Seed dữ liệu cho bảng Schedule
    const nullDriverId1 = 1;
    const nullDriverId2 = 2;
    const nullDriverId3 = 3;
    const schedules = scheduleData.map((scheduleItem: any) => {
      const schedule = new Schedule();
      schedule.startdate = scheduleItem.startdate;
      schedule.enddate = scheduleItem.enddate;
      schedule.place = scheduleItem.place;
      schedule.year = scheduleItem.year;
    


      // Tìm các tài xế dựa trên tên và gán vào mảng drivers
      const driver1 = drivers.find((driver: Driver) => driver.fullname.toUpperCase().includes(scheduleItem.pos1));
      const driver2 = drivers.find((driver: Driver) => driver.fullname.toUpperCase().includes(scheduleItem.pos2));
      const driver3 = drivers.find((driver: Driver) => driver.fullname.toUpperCase().includes(scheduleItem.pos3));
      schedule.drivers = [
        driver1 || driverRepository.findOne({where: {id:nullDriverId1}}),
        driver2 || driverRepository.findOne({where: {id:nullDriverId2}}),
        driver3 || driverRepository.findOne({where: {id:nullDriverId3}}),
      ];
    
      // schedule.drivers = [driver1, driver2, driver3];
    
      return schedule;
    });
    
    await scheduleRepository.save(schedules);
    
    // Đóng kết nối đến cơ sở dữ liệu
    
    console.log('Dữ liệu đã được khởi tạo thành công!');
    await connection.close();
  } catch (error) {
    console.error('Lỗi:', error);
  }
}

seed();
