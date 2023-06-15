'use strict';
module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('drivers', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      team: {
        allowNull: false,
        type: Sequelize.STRING,
        reference: {
          model: 'teams',
          key: 'name'
        }
      },
      fullname: {
        allowNull: false,
        primaryKey: true,
        type: Sequelize.STRING
      },
      point: {
        allowNull: false,
        type: Sequelize.INTEGER
      },
      champion: {
        allowNull: false,
        type: Sequelize.INTEGER
      },
      avt: {
        allowNull: false,
        type: Sequelize.STRING
      },
      number: {
        allowNull: false,
        type: Sequelize.INTEGER
      },
      country: {
        allowNull: false,
        type: Sequelize.STRING
      },
    });
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.dropTable('drivers');
  }
};
