import { createConnection } from 'typeorm';
import { Team } from '../entities/Team';
import { Driver } from '../entities/Driver';

const teamsData = require('../../../crawler/team.json');
const driversData = require('../../../crawler/driver.json');

async function seed() {
  try {
    // Tạo kết nối đến cơ sở dữ liệu
    const connection = await createConnection();

    // Lấy repository của bảng "teams" và "drivers"
    const teamRepository = connection.getRepository(Team);
    const driverRepository = connection.getRepository(Driver);

    // Lặp qua dữ liệu từ file JSON và tạo các đối tượng "Team" tương ứng
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

    // Lưu các đối tượng "Driver" vào cơ sở dữ liệu
    await driverRepository.save(drivers);

    // Đóng kết nối đến cơ sở dữ liệu
    await connection.close();

    console.log('Dữ liệu đã được khởi tạo thành công!');
  } catch (error) {
    console.error('Lỗi:', error);
  }
}

seed();
