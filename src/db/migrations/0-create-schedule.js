'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('schedules', {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
      },
      startdate: {
        type: Sequelize.STRING,
        allowNull: false,
      },
      enddate: {
        type: Sequelize.STRING,
        allowNull: false,
      },
      place: {
        type: Sequelize.STRING,
        allowNull: false,
      },
      pos1: {
        type: Sequelize.STRING,
        allowNull: false,
      },
      pos2: {
        type: Sequelize.STRING,
        allowNull: false,
      },
      pos3: {
        type: Sequelize.STRING,
        allowNull: false,
      },
      year: {
        type: Sequelize.INTEGER,
        allowNull: false,
      },
    });
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.dropTable('schedules');
  }
};
