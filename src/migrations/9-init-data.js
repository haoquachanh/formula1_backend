const resultTeam = require('../../crawler/resultTeam.json');
const team = require('../../crawler/team.json');
const schedule = require('../../crawler/schedule.json');

const driver = require('../../crawler/driver.json');

const resultDHL = require('../../crawler/resultDHL.json');
const resultDriver = require('../../crawler/resultDriver.json');
const resultRace = require('../../crawler/resultRace.json');

module.exports = {
    up: async (queryInterface, Sequelize) => {
      // Insert teams data
      await queryInterface.bulkInsert('teams', team, {});
      await queryInterface.bulkInsert('schedules', schedule, {});
      await queryInterface.bulkInsert('resultteams', resultTeam, {});

      await queryInterface.bulkInsert('drivers', driver, {});
      
      await queryInterface.bulkInsert('resultdhls', resultDHL, {});
      await queryInterface.bulkInsert('resultdrivers', resultDriver, {});
      await queryInterface.bulkInsert('resultraces', resultRace, {});

    },
  
    down: async (queryInterface, Sequelize) => {
      // Delete inserted teams data
      await queryInterface.bulkDelete('teams', null, {});
      await queryInterface.bulkDelete('schedules', null, {});
      await queryInterface.bulkDelete('resultteams', null, {});
      await queryInterface.bulkDelete('drivers', null, {});
      await queryInterface.bulkDelete('resultdhls', null, {});
      await queryInterface.bulkDelete('resultdrivers', null, {});
      await queryInterface.bulkDelete('resultraces', null, {});
    }
  };


