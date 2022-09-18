const Amplify = require('@aws-amplify/api').default;
const API = require('@aws-amplify/api').API;
const graphqlOperation = require('@aws-amplify/api').graphqlOperation;
const aws_exports = require('./exports').awsmobile;
const orderNotPaidByDate = require('./graphql/query').orderNotPaidByDate;

const orderSmsSendNotPaidBySmsSendDate =
  require('./graphql/query').orderSmsSendNotPaidBySmsSendDate;
const updateOrder = require('./graphql/mutation').updateOrder;
const { ConsoleLogger } = require('@aws-amplify/core');
const axios = require('axios');

const DATE_NOW_MOMENT = require('./time').DATE_NOW_MOMENT;
const END_DAY = require('./time').END_DAY;
const START_DAY = require('./time').START_DAY;

Amplify.configure(aws_exports);

exports.handler = async (event) => {
  //getting order this not paid of last 4 day
  const kachuwaHerokuUrl = 'https://send-sms-kachuwa.herokuapp.com';
  const result = await API.graphql(
    graphqlOperation(orderNotPaidByDate, {
      payment: 'notPaid',
      createdAt: {
        between: [START_DAY, END_DAY],
      },
      filter: {
        status: {
          ne: 'Cancelled',
        },
      },
    })
  );
  const orders = result.data.orderNotPaidByDate.items;

  console.log(orders, '1. orders:', orders);

  const details = orders.map((o) => ({
    phone: o.phone,
    id: o.id,
    firstName: o.firstName,
  }));

  console.log('2 Details: ', details);

  const data = [];

  details.forEach((x) => {
    const index = data.findIndex((d) => d.number === x.phone);

    if (index >= 0) {
      data[index].times += 1;
      data[index].id.push(x.id);
    } else {
      data.push({
        number: x.phone,
        times: 1,
        id: [x.id],
        name: x.firstName,
      });
    }
  });

  console.log('3: Data', data);

  //send sms
  for (let x = 0; x < data.length; x++) {
    const result = await axios.post(kachuwaHerokuUrl, {
      recipients: data[x].number,
      text: `Namaste ${data[x].name}!
      We have noticed that your  ${data[x].id.length} ${
        data[x].id.length > 1 ? 'orders' : 'order'
      }
       has not been paid from the last few days.
      You can pay easily from the dashboard page.
      Your order will be canceled if not paid in the next 24 hours.
      Thank you.
      https://kachuwa.com/shop/dashboard/`,
    });
    console.log(result, 'sms');
  }

  console.log('After sms send');

  const promisesDetail = [];
  for (let x = 0; x < details.length; x++) {
    promisesDetail.push(
      API.graphql(
        graphqlOperation(updateOrder, {
          input: {
            id: details[x].id,
            smsSendDate: DATE_NOW_MOMENT(),
            smsSendNotPaid: 'true',
          },
        })
      )
    );
  }

  const res1 = await Promise.all(promisesDetail);
  console.log('updateing order after sms send ', res1);

  const result2 = await API.graphql(
    graphqlOperation(orderSmsSendNotPaidBySmsSendDate, {
      smsSendNotPaid: 'true',
      smsSendDate: {
        le: DATE_NOW_MOMENT(),
      },
    })
  );

  console.log('checking orders less them now', result2);

  const check24data = result2.data.orderSmsSendNotPaidBySmsSendDate.items;
  console.log('checking orders less them now items', check24data);

  for (let x = 0; x < check24data.length; x++) {
    const then = new Date(check24data[x].smsSendDate);
    const now = new Date();

    const msBetweenDates = Math.abs(then.getTime() - now.getTime());

    // 👇️ convert ms to hours                  min  sec   ms
    const hoursBetweenDates = msBetweenDates / (60 * 60 * 1000);

    if (hoursBetweenDates < 24) {
      console.log('date is within 24 hours');
    } else {
      console.log('date is more then 24 so cancel order ');
      const xyz = await API.graphql(
        graphqlOperation(updateOrder, {
          id: check24data[x].id,
          status: 'Cancelled',
          smsSendNotPaid: 'Cancelled',
        })
      );

      console.log('after update order to cancel ', xyz);
    }
  }
};
