var AWS = require('aws-sdk');
AWS.config.update({ accessKeyId: 'ACCESS_KEY', secretAccessKey: 'SECRET_KEY' });
var s3bucket = new AWS.S3({ params: { Bucket: 'BUCKET_NAME' } });

module.exports = async (fileName, image) => {
  var s3 = new AWS.S3();
  var params = {
    Key: fileName,
    Body: image,
  };
  s3.upload(params, function (err, data) {
    if (err) {
      console.log(err, err.stack);
    } else {
      console.log(data);
    } // an error occurred
    // successful response
  });
  //   try {
  //     await Storage.put(fileName, image, {
  //       contentType: 'image/png', // contentType is optional
  //     });
  //   } catch (err) {
  //     console.log(err.message);
  //   }
};
