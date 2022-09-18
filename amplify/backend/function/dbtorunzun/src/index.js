const d2es = require('dynamodb-to-elasticsearch');

const table = 'Cart-ts4dvmqdpfgm7e3bos4c3awnti-kachuwa',
  region = 'ap-southeast-1',
  es_endpoint =
    'https://search-amplify-elasti-htrkwqi1f046-q2sajxdjsuhe3svh5xz5gobuay.ap-southeast-1.es.amazonaws.com',
  es_data = { id: 'sortKey', type: 'data', indiceName: 'order' };

exports.handler = function (event, context, callback) {
  d2es.exec(table, region, es_endpoint, es_data, (err, success) => {
    if (err) {
      callback(err, null);
    } else {
      callback(null, success);
    }
  });
};
