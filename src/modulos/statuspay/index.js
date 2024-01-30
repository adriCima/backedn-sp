const db = require('../../database/mysql');
const ctrl = require('./controller');

module.exports = ctrl(db);