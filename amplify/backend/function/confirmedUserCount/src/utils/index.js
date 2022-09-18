const REGION = 'ap-southeast-1';
const ACCESS_KEY_ID = process.env.ACCESSKEYID;
const SECRET_ACCESS_KEY = process.env.SECRETACCESSKEY;
const USER_POOL_ID = process.env.USER_POOL_ID;
const AWS = require('aws-sdk');
const getAllUserCount = async (filter, nextToken) => {
  var params = {
    UserPoolId: USER_POOL_ID,
    Filter: filter,
    PaginationToken: nextToken,
  };

  AWS.config.update({
    region: REGION,
    accessKeyId: ACCESS_KEY_ID,
    secretAccessKey: SECRET_ACCESS_KEY,
  });
  var cognitoidentityserviceprovider = new AWS.CognitoIdentityServiceProvider();

  const data = await cognitoidentityserviceprovider.listUsers(params).promise();
  return data;
};

exports.default = getTotalConfirmedUserCount = async () => {
  let users = [];
  const filter = 'cognito:user_status = "CONFIRMED"';
  let data;
  do {
    data = await getAllUserCount(filter, data && data.PaginationToken);
    users = [...data.Users, ...users];
  } while (data.PaginationToken);
  return users.length;
};
