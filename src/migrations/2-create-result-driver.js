'use strict';
module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('resultdrivers', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER,
      },
      driver: {
        type: Sequelize.STRING,
        allowNull: false,
        reference: {
          model: 'drivers',
          key: 'fullname'
        }
      },
      car: {
        type: Sequelize.STRING,
        allowNull: false,
      },
      pos: {
        type: Sequelize.INTEGER,
        allowNull: false,
      },
      point: {
        type: Sequelize.INTEGER,
        allowNull: false,
      },
      year: {
        type: Sequelize.INTEGER,
        allowNull: false,
      },
    });
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.dropTable('resultdrivers');
  }
};
