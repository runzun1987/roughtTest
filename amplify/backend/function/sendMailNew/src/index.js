const sendEmail = require('./email');
exports.handler = async (event) => {
  const result = JSON.parse(event.body);
  const msg = result.msg;

  let response;

  try {
    const result = await sendEmail(msg);

    // TODO implement
    response = {
      statusCode: 200,
      //  Uncomment below to enable CORS requests
      //  headers: {
      //      "Access-Control-Allow-Origin": "*",
      //      "Access-Control-Allow-Headers": "*"
      //  },
      body: JSON.stringify('Email Send Success'),
    };
  } catch (err) {
    console.log(err);
    // TODO implement
    response = {
      statusCode: 400,
      //  Uncomment below to enable CORS requests
      //  headers: {
      //      "Access-Control-Allow-Origin": "*",
      //      "Access-Control-Allow-Headers": "*"
      //  },
      body: JSON.stringify('Email Send Unsuccess'),
    };
  }

  return response;
};
