const AWS = require('aws-sdk');
const b64 = require('base64-js');
const encryptionSdk = require('@aws-crypto/client-node');
const axios = require('axios');
var request = require('request');
const util = require('util');

// const { sendSMS, init } = require('sms-sparrow');
// const { setAuth, sendSMS } = require('sparrow-sms');

//Configure the encryption SDK client with the KMS key from the environment variables.

const { encrypt, decrypt } = encryptionSdk.buildClient(
  encryptionSdk.CommitmentPolicy.REQUIRE_ENCRYPT_ALLOW_DECRYPT
);

const generatorKeyId =
  'arn:aws:kms:ap-southeast-1:736086997297:alias/customSmsKey';

const keyIds = [
  'arn:aws:kms:ap-southeast-1:736086997297:key/89eaa86b-0632-4b27-ae1e-e67372359f18',
];
const keyring = new encryptionSdk.KmsKeyringNode({ generatorKeyId, keyIds });

exports.handler = async (event) => {
  //Decrypt the secret code using encryption SDK.
  const kachuwaHerokuUrl = 'https://send-sms-kachuwa.herokuapp.com';

  let plainTextCode;
  if (event.request.code) {
    const { plaintext, messageHeader } = await decrypt(
      keyring,
      b64.toByteArray(event.request.code)
    );
    plainTextCode = plaintext;
  }

  //PlainTextCode now has the decrypted secret.
  const userNumber = event.request.userAttributes.phone_number;
  const deviceId = event.request.userAttributes['custom:deviceId'];

  const code = plainTextCode.toString('utf-8');
  // init('v2_eWIcLkbAdQnFcieuuQeOba5AjhT.yMl2', 'kachuwa');

  const sendMessageToPC = async (message) => {
    try {
      const result = await axios.post(kachuwaHerokuUrl, {
        recipients: userNumber,
        text: `Your ${message} is ${code}.https://kachuwa.com`,
      });
      console.log(result);
    } catch (err) {
      console.log(err);
    }
  };

  const sendMessageToMobile = async (message) => {
    try {
      const result = await axios.post(kachuwaHerokuUrl, {
        recipients: userNumber,
        text: `Kachuwa: Your ${message} is ${code},
        Device Id: ${deviceId}`,
      });
      console.log(result);
    } catch (err) {
      console.log(err);
    }
  };

  const VERIFICATION_CODE = 'verification code';
  const PASSWORD_IS = 'password';

  if (event.triggerSource == 'CustomSMSSender_SignUp') {
    deviceId
      ? await sendMessageToMobile(VERIFICATION_CODE)
      : await sendMessageToPC(VERIFICATION_CODE);
  } else if (event.triggerSource == 'CustomSMSSender_ResendCode') {
    deviceId
      ? await sendMessageToMobile(VERIFICATION_CODE)
      : await sendMessageToPC(VERIFICATION_CODE);
  } else if (event.triggerSource == 'CustomSMSSender_ForgotPassword') {
    deviceId
      ? await sendMessageToMobile(VERIFICATION_CODE)
      : await sendMessageToPC(VERIFICATION_CODE);
  } else if (event.triggerSource == 'CustomSMSSender_UpdateUserAttribute') {
    deviceId
      ? await sendMessageToMobile(VERIFICATION_CODE)
      : await sendMessageToPC(VERIFICATION_CODE);
  } else if (event.triggerSource == 'CustomSMSSender_VerifyUserAttribute') {
    deviceId
      ? await sendMessageToMobile(VERIFICATION_CODE)
      : await sendMessageToPC(VERIFICATION_CODE);
  } else if (event.triggerSource == 'CustomSMSSender_AdminCreateUser') {
    deviceId
      ? await sendMessageToMobile(PASSWORD_IS)
      : await sendMessageToPC(PASSWORD_IS);
  } else if (
    event.triggerSource == 'CustomSMSSender_AccountTakeOverNotification'
  ) {
    deviceId
      ? await sendMessageToMobile(VERIFICATION_CODE)
      : await sendMessageToPC(VERIFICATION_CODE);
  } else {
    console.log('I AM INNNNNNNNNNNNNNNNNNNN');
  }
};
