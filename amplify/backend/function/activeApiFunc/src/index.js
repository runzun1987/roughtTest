/* Amplify Params - DO NOT EDIT
	ENV
	REGION
	STORAGE_KACHUWA_BUCKETNAME
Amplify Params - DO NOT EDIT */
const keyword = require('./utils/keyword');
const detail = require('./utils/detail');
const image = require('./utils/image');
const AWS = require('aws-sdk');
const s3 = new AWS.S3({
  accessKeyId: process.env.ACCESSKEYID,
  secretAccessKey: process.env.process.env.SECRETACCESSKEY,
});

String.prototype.interpolate = function (params) {
  const names = Object.keys(params);
  const vals = Object.values(params);
  return new Function(...names, `return \`${this}\`;`)(...vals);
};

exports.handler = async (event, ctx, callback) => {
  const bucketName = 'api-settings';
  var keyName = 'test.json';

  const params = { Bucket: bucketName, Key: keyName };

  const getData = () => {
    return new Promise((resolve, reject) => {
      s3.getObject(params, function (err, res) {
        if (err) reject(err);
        if (res) resolve(JSON.parse(res.Body.toString()));
      });
    });
  };

  const setData = (dataToUpdate) => {
    const buf = Buffer.from(JSON.stringify(dataToUpdate));
    const param2 = {
      Bucket: bucketName,
      Key: keyName,
      Body: buf,
    };
    return new Promise((resolve, reject) => {
      s3.putObject(param2, function (err, res) {
        if (err) reject(err);
        if (res) resolve(res);
      });
    });
  };
  const data = await getData();
  const result = JSON.parse(event.body);
  const service = result.service;
  const options = result.options;

  switch (service) {
    case 'keyword':
      const searchedKeyword = options.kw;
      const pageNumber = options.pageNum;
      const keywordResult = await keyword(searchedKeyword, pageNumber, data);
      return {
        statusCode: 200,
        headers: {
          'Access-Control-Allow-Origin': '*', // Required for CORS support to work
          'Access-Control-Allow-Credentials': true, // Required for cookies, authorization headers with HTTPS
        },
        body: JSON.stringify({ data: keywordResult }),
      };

    case 'detail':
      const productId = options.productId;
      const productResult = await detail(productId, data);
      return {
        statusCode: 200,
        headers: {
          'Access-Control-Allow-Origin': '*', // Required for CORS support to work
          'Access-Control-Allow-Credentials': true, // Required for cookies, authorization headers with HTTPS
        },
        body: JSON.stringify({ data: productResult }),
      };

    case 'image':
      const receivedImage = options.image;
      const imageResult = await image(receivedImage, data);
      return {
        statusCode: 200,
        headers: {
          'Access-Control-Allow-Origin': '*', // Required for CORS support to work
          'Access-Control-Allow-Credentials': true, // Required for cookies, authorization headers with HTTPS
        },
        body: JSON.stringify({ data: imageResult }),
      };
    case 'getData':
      return {
        statusCode: 200,
        headers: {
          'Access-Control-Allow-Origin': '*', // Required for CORS support to work
          'Access-Control-Allow-Credentials': true, // Required for cookies, authorization headers with HTTPS
        },
        body: JSON.stringify({ data: data }),
      };

    case 'update':
      const dataToUpdate = options.data;
      try {
        const resu = await setData(dataToUpdate);
        return {
          statusCode: 200,
          headers: {
            'Access-Control-Allow-Origin': '*', // Required for CORS support to work
            'Access-Control-Allow-Credentials': true, // Required for cookies, authorization headers with HTTPS
          },
          body: JSON.stringify({ data: resu }),
        };
      } catch (err) {
        console.log(err, 'errrrrrr');
      }
      break;

    default:
      return {
        statusCode: 404,
        headers: {
          'Access-Control-Allow-Origin': '*', // Required for CORS support to work
          'Access-Control-Allow-Credentials': true, // Required for cookies, authorization headers with HTTPS
        },
        body: JSON.stringify({ error: 'No service provided' }),
      };
  }
};
