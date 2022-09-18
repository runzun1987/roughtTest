const { sendSMS, init } = require('sms-sparrow');

const sendKachuwaSMS = async (text, recipients) => {

  
  try {
    const result = await sendSMS(text, recipients);
   
  } catch (err) {
    console.log(err, 'eroorrrr');
  }
};

module.exports = sendKachuwaSMS;
