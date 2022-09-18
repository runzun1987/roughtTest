const moment = require('moment-timezone');

exports.START_DAY = moment()
  .tz('Asia/Kathmandu')
  .startOf('day')
  .subtract(4, 'd')
  .utc();
exports.END_DAY = moment()
  .tz('Asia/Kathmandu')
  .endOf('day')
  .subtract(4, 'd')
  .utc();

exports.DATE_NOW_MOMENT = () => moment().tz('Asia/Kathmandu').utc();
