const Amplify = require('@aws-amplify/api').default;
const API = require('@aws-amplify/api').API;
const graphqlOperation = require('@aws-amplify/api').graphqlOperation;
const aws_exports = require('./exports').awsmobile;

const getPrice = require('./graphql/queries').getPrice;

Amplify.configure(aws_exports);
/**
 * @type {import('@types/aws-lambda').APIGatewayProxyHandler}
 */
exports.handler = async (event) => {
  // console.log(`EVENT: ${JSON.stringify(event)}`);

  //console.log('From out');

  const body = JSON.parse(event['body']);

  const title = body['title'];
  const price = body['price'];
  const type = body['type'];

  let finalPrice;

  try {
    const result = await API.graphql(
      graphqlOperation(getPrice, {
        id: 'da7ec697-0a62-4cad-8bfb-9a56d11ca685',
      })
    );

    const formula = JSON.parse(result.data.getPrice.code);

    if (type == 'ali') {
      const ali_code = formula.ali;
      const ali_function = new Function(ali_code.arguments, ali_code.body);
      finalPrice = ali_function(price, title);
    } else if (type == 'tb') {
      const tb_code = formula.tb;

      const tb_function = new Function(tb_code.arguments, tb_code.body);
      finalPrice = tb_function(price, title);
    } else {
      finalPrice = 0;
    }
  } catch (err) {
    console.log(err, '----');
  }
  return {
    statusCode: 200,
    //  Uncomment below to enable CORS requests
    //  headers: {
    //      "Access-Control-Allow-Origin": "*",
    //      "Access-Control-Allow-Headers": "*"
    //  },
    body: JSON.stringify({ finalPrice }),
  };
};
