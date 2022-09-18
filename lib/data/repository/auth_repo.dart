import 'dart:convert';
import 'dart:io';

import 'package:amplify_api/model_mutations.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/datasource/remote/dio/dio_client.dart';
import 'package:flutter_sixvalley_ecommerce/data/datasource/remote/exception/api_error_handler.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/body/login_model.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/body/register_model.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/base/api_response.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/social_login_model.dart';
import 'package:flutter_sixvalley_ecommerce/models/ModelProvider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/app_constants.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../graphql/mutations.dart';
import '../graphql/queries.dart';

class AuthRepo {
  final DioClient? dioClient;
  final SharedPreferences? sharedPreferences;
  AuthRepo({required this.dioClient, required this.sharedPreferences});

  Future<ApiResponse> socialLogin(SocialLoginModel socialLogin) async {
    try {
      Response response = await dioClient!.post(
        AppConstants.SOCIAL_LOGIN_URI,
        data: socialLogin.toJson(),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> registration(RegisterModel register) async {
    print(register.toJson());

    try {
      final userAttributes = <CognitoUserAttributeKey, String>{
        CognitoUserAttributeKey.email: register.email!,
        CognitoUserAttributeKey.phoneNumber: register.phone!,
        // CognitoUserAttributeKey.familyName: register.lName,
        // CognitoUserAttributeKey.givenName: register.fName,
        CognitoUserAttributeKey.custom("firstName"): register.fName!,
        CognitoUserAttributeKey.custom("lastName"): register.lName!,
        CognitoUserAttributeKey.custom("deviceId"): register.deviceId!
        // additional attributes as needed
      };
      final SignUpResult result = await Amplify.Auth.signUp(
        username: register.phone!,
        password: register.password!,
        options: CognitoSignUpOptions(userAttributes: userAttributes),
      );

      // setState(() {
      //   isSignUpComplete = result.isSignUpComplete;
      // });

      Response response = Response(
        requestOptions: RequestOptions(path: ''),
        data: result,
        statusCode: 200,
      );
      return ApiResponse.withSuccess(response);
    } on AuthException catch (e) {
      print('|ERrrorrrrrrrrrrrrrrrrrrrrrrr');
      print(e.message);
      return ApiResponse.withError(e.message);
      // safePrint(e.message);
    }
    // try {
    //   Response response = await dioClient.post(
    //     AppConstants.REGISTRATION_URI,
    //     data: register.toJson(),
    //   );
    //   return ApiResponse.withSuccess(response);
    // } catch (e) {
    //   return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    // }
  }

  Future<ApiResponse> login(LoginModel loginBody) async {
    await Amplify.Auth.signOut();

    try {
      SignInResult signInResult = await Amplify.Auth.signIn(
        username: loginBody.phone!,
        password: loginBody.password,
      );

      // Response response = await dioClient.post(
      //   AppConstants.LOGIN_URI,
      //   data: loginBody.toJson(),
      // );

      Response response = Response(
        requestOptions: RequestOptions(path: ''),
        data: signInResult,
        statusCode: 200,
      );
      return ApiResponse.withSuccess(response);
      // } on UserNotConfirmedException catch (e) {
      //   print(
      //       'ERRRRRRRRRRRRRRRRRRRRRRRoooooooooooooooooooooooooooooRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR');
      //   return ApiResponse.withError(e.message);
      //   //     return ApiResponse.withError("dsaaaaaaaaaaaaaaaaaaaaaaaa");
    } on AuthException catch (e) {
      return ApiResponse.withError(e.message);
    }
  }

  Future<ApiResponse> updateToken(String? userPhone) async {
    try {
      String _deviceToken = await _getDeviceToken();

      FirebaseMessaging.instance.subscribeToTopic(AppConstants.TOPIC);

      if (userPhone != null) {
        _when_logged_in(userPhone, _deviceToken);
      } else {
        _when_Not_Logged_In(_deviceToken);
      }

      Response response = Response(
          requestOptions: RequestOptions(path: ''),
          data: "done",
          statusCode: 200);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<String> _getDeviceToken() async {
    String _deviceToken;
    if (Platform.isIOS) {
      _deviceToken = (await FirebaseMessaging.instance.getAPNSToken())!;
    } else {
      _deviceToken = (await FirebaseMessaging.instance.getToken())!;
    }

    if (_deviceToken != null) {
      print('--------Device Token---------- ' + _deviceToken);
    }
    return _deviceToken;
  }

  Future<void> _when_logged_in(String userPhone, String _deviceToken) async {
    FirebaseMessaging.instance
        .unsubscribeFromTopic(AppConstants.UNREGISTERED_USER_TOPIC);
    FirebaseMessaging.instance
        .subscribeToTopic(AppConstants.REGISTERED_USER_TOPIC);

    //1. check if this phone exist in table
    dynamic fcmDevice =
        await _check_if_phone_exist_in_fcmDeviceTable(userPhone);

    if (fcmDevice != null) {
      //2.update table with new device Id
      await _update_DeviceTable_With_NewDeviceId(fcmDevice, _deviceToken);
    } else {
      //2. check device id exist in table
      dynamic fcmDevice =
          await _check_if_deviceID_exist_in_fcmDeviceTable(_deviceToken);

      if (fcmDevice != null) {
        //3. Update registed device with this user
        await _update_DeviceTable_With_Phone(fcmDevice, userPhone);

        //4. Check FCMTOPICDEVICE TABLE for unregistered
        dynamic fcmDeviceTopicResult =
            await _check_Unregistered_DeviceId(fcmDevice.id);

        if (fcmDeviceTopicResult != null) {
          //5. Update to registered
          FcmDeviceTopic fcmDeviceTopic = fcmDeviceTopicResult;
          await _update_FcmDeviceTopic_With_Registered_Topic(fcmDeviceTopic.id);
        }
      } else {
        //3. Create both deviceId with phone and create fcm device phone

        await _create_Device_And_Create_FcmDeviceTopic_With_Phone(
            _deviceToken, userPhone);
      }
    }
  }

  Future<void> _when_Not_Logged_In(String deviceToken) async {
    //1. if this deviceId exist in the device table

    dynamic fcmDevice =
        await _check_if_DeviceId_exist_in_fcmDeviceTable(deviceToken);

    if (fcmDevice != null) {
      //2. DO NOTHING...

    } else {
      //2. CREATE DEVICEID IN DEVICE TABLE AND CREATE FCMDEVICETOPICTABLE
      FirebaseMessaging.instance
          .subscribeToTopic(AppConstants.UNREGISTERED_USER_TOPIC);

      await _create_Device_And_Create_FcmDeviceTopic_WithOut_Phone(deviceToken);
    }
  }

  Future<dynamic> _check_if_phone_exist_in_fcmDeviceTable(String phone) async {
    final getFcmDeviceByPhoneRequest = GraphQLRequest(
      document: getFcmDeviceByPhone,
      variables: <String, dynamic>{
        'baseType': AppConstants.FCM_DEVICE_TYPE,
        "userPhone": {
          "eq": phone,
        },
      },
    );

    try {
      final GraphQLResponse resp = await Amplify.API
          .query(
            request: getFcmDeviceByPhoneRequest,
          )
          .response;

      var data = json.decode(resp.data);

      print(data);

      List<dynamic> items = data["getFcmDeviceByPhone"]["items"];
      if (items.length > 0) {
        FcmDevice fcmDevice =
            FcmDevice.fromJson(data["getFcmDeviceByPhone"]["items"][0]);
        return fcmDevice;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<dynamic> _check_if_DeviceId_exist_in_fcmDeviceTable(
      String deviceToken) async {
    final getFcmDeviceByDeviceIdRequest = GraphQLRequest(
      document: getFcmDeviceByDeviceId,
      variables: <String, dynamic>{
        'baseType': AppConstants.FCM_DEVICE_TYPE,
        "phoneNumber": {
          "eq": deviceToken,
        },
      },
    );

    try {
      final GraphQLResponse resp = await Amplify.API
          .query(
            request: getFcmDeviceByDeviceIdRequest,
          )
          .response;

      var data = json.decode(resp.data);

      List<dynamic> items = data["getFcmDeviceByDeviceIdRequest"]["items"];
      if (items.length > 0) {
        FcmDevice fcmDevice = FcmDevice.fromJson(
            data["getFcmDeviceByDeviceIdRequest"]["items"][0]);
        return fcmDevice;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> _update_DeviceTable_With_NewDeviceId(
    FcmDevice fcmDevice,
    String deviceToken,
  ) async {
    final fcmDeviceWithNewDeviceId = fcmDevice.copyWith(
      deviceId: deviceToken,
    );

    final request = ModelMutations.update(
      fcmDeviceWithNewDeviceId,
    );

    final apiResponse2 = await Amplify.API
        .mutate(
          request: request,
        )
        .response;
  }

  Future<dynamic> _check_if_deviceID_exist_in_fcmDeviceTable(
      String deviceID) async {
    final getFcmDeviceByPhoneRequest = GraphQLRequest(
      document: getFcmDeviceByDeviceId,
      variables: <String, dynamic>{
        'baseType': AppConstants.FCM_DEVICE_TYPE,
        "deviceId": {
          "eq": deviceID,
        },
      },
    );

    try {
      final GraphQLResponse resp = await Amplify.API
          .query(
            request: getFcmDeviceByPhoneRequest,
          )
          .response;

      var data = json.decode(resp.data);
      //  "id": data['cartSortByPhoneNumber']["id"],
      //       "items": data['cartSortByPhoneNumber']['items'][0]["items"]
      List<dynamic> items = data["getFcmDeviceByDeviceId"]["items"];
      if (items.length > 0) {
        FcmDevice fcmDevice =
            FcmDevice.fromJson(data["getFcmDeviceByDeviceId"]["items"][0]);
        return fcmDevice;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> _update_DeviceTable_With_Phone(
      FcmDevice fcmDevice, String phone) async {
    final fcmDeviceWithNewDeviceId = fcmDevice.copyWith(
      userPhone: phone,
    );

    final request = ModelMutations.update(
      fcmDeviceWithNewDeviceId,
    );

    final apiResponse2 = await Amplify.API
        .mutate(
          request: request,
        )
        .response;
  }

  Future<dynamic> _check_Unregistered_DeviceId(String devicePrimaryId) async {
    final getByFcmDeviceRequest = GraphQLRequest(
      document: byFcmDevice,
      variables: <String, dynamic>{
        'fcmDeviceID': devicePrimaryId,
        "deviceId": {
          "eq": AppConstants.UNREGISTERED_USER_TOPIC_ID,
        },
      },
    );

    try {
      final GraphQLResponse resp = await Amplify.API
          .query(
            request: getByFcmDeviceRequest,
          )
          .response;

      var data = json.decode(resp.data);

      List<dynamic> items = data["byFcmDevice"]["items"];
      if (items.length > 0) {
        FcmDeviceTopic fcmDeviceTopic =
            FcmDeviceTopic.fromJson(data["byFcmDevice"]["items"][0]);
        return fcmDeviceTopic;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> _update_FcmDeviceTopic_With_Registered_Topic(
      String fcmDeviceTopicId) async {
    final updateFcmDeviceTopicRequest = GraphQLRequest(
      document: updateFcmDeviceTopic,
      variables: <String, dynamic>{
        "input": {
          'id': fcmDeviceTopicId,
          "fcmTopicID": AppConstants.REGISTERED_USER_TOPIC_ID,
        }
      },
    );

    try {
      final GraphQLResponse resp = await Amplify.API
          .mutate(
            request: updateFcmDeviceTopicRequest,
          )
          .response;
      print('updated');
    } catch (e) {
      print(e);
    }
  }

  Future<void> _create_Device_And_Create_FcmDeviceTopic_With_Phone(
      deviceToken, userPhone) async {
    dynamic fcmDeviceID =
        await _create_Fcm_Device_With_Phone_Get_Id(deviceToken, userPhone);

    if (fcmDeviceID != null) {
      await _create_FcmDeviceTopic(
        fcmDeviceID,
        AppConstants.REGISTERED_USER_TOPIC_ID,
      );
    }
  }

  Future<void> _create_Device_And_Create_FcmDeviceTopic_WithOut_Phone(
      String deviceToken) async {
    dynamic fcmDeviceID =
        await _create_Fcm_Device_Without_Phone_Get_Id(deviceToken);

    if (fcmDeviceID != null) {
      await _create_FcmDeviceTopic(
        fcmDeviceID,
        AppConstants.UNREGISTERED_USER_TOPIC_ID,
      );
    }
  }

  Future<dynamic> _create_Fcm_Device_With_Phone_Get_Id(
    String deviceToken,
    String userPhone,
  ) async {
    try {
      final fcmDevice = FcmDevice(
        deviceId: deviceToken,
        userPhone: userPhone,
        baseType: AppConstants.FCM_DEVICE_TYPE,
      );
      final request = ModelMutations.create(fcmDevice);
      final response = await Amplify.API.mutate(request: request).response;

      final createdFcmDevice = response.data;
      if (createdFcmDevice == null) {
        print('errors: ${response.errors}');
        return null;
      }

      print('Mutation result: ${createdFcmDevice.userPhone}');
      return createdFcmDevice.id;
    } on ApiException catch (e) {
      print('Mutation failed: $e');
      return null;
    }
  }

  Future<dynamic> _create_Fcm_Device_Without_Phone_Get_Id(
    String deviceToken,
  ) async {
    try {
      final fcmDevice = FcmDevice(
        deviceId: deviceToken,
        userPhone: 'notRegistered',
        baseType: AppConstants.FCM_DEVICE_TYPE,
      );

      final request = ModelMutations.create(fcmDevice);
      final response = await Amplify.API.mutate(request: request).response;

      final createdFcmDevice = response.data;
      if (createdFcmDevice == null) {
        print('errors: ${response.errors}');
        return null;
      }

      print('Mutation result: ${createdFcmDevice.userPhone}');
      return createdFcmDevice.id;
    } on ApiException catch (e) {
      print('Mutation failed: $e');
      return null;
    }
  }

  Future<void> _create_FcmDeviceTopic(
      String fcmDeviceID, String topicID) async {
    final createFcmDeviceTopicRequest = GraphQLRequest(
      document: createFcmDeviceTopic,
      variables: <String, dynamic>{
        "input": {
          'fcmDeviceID': fcmDeviceID,
          "fcmTopicID": topicID,
          "baseType": AppConstants.FCM_DEVICE_TOPIC_TYPE,
        }
      },
    );

    try {
      final GraphQLResponse resp = await Amplify.API
          .mutate(
            request: createFcmDeviceTopicRequest,
          )
          .response;
      print('created');
    } catch (e) {
      print(e);
    }
  }

  // for  user token
  // Future<void> saveUserToken(String token) async {
  //   dioClient.updateHeader(token, null);

  //   try {
  //     await sharedPreferences.setString(AppConstants.TOKEN, token);
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  Future<void> saveUserLogin(bool isSignIn) async {
    // dioClient.updateHeader(token, null);

    try {
      if (isSignIn) {
        await sharedPreferences!.setString(
          AppConstants.IS_SIGNED_IN,
          AppConstants.SIGNED_IN,
        );
      } else {
        await sharedPreferences!.setString(
          AppConstants.IS_SIGNED_IN,
          AppConstants.NOT_SIGNED_IN,
        );
      }
    } catch (e) {
      throw e;
    }
  }

  String getUserToken() {
    return sharedPreferences!.getString(AppConstants.TOKEN) ?? "";
  }

  //auth token
  // for  user token
  Future<void> saveAuthToken(String token) async {
    dioClient!.token = token;
    dioClient!.dio!.options.headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };

    try {
      await sharedPreferences!.setString(AppConstants.TOKEN, token);
    } catch (e) {
      throw e;
    }
  }

  String getAuthToken() {
    return sharedPreferences!.getString(AppConstants.TOKEN) ?? "";
  }

  Future<bool> isLoggedIn() async {
    // return sharedPreferences.containsKey(AppConstants.TOKEN);
    // String is_Signed_in =
    //     sharedPreferences.getString(AppConstants.IS_SIGNED_IN);
    // if (is_Signed_in == AppConstants.SIGNED_IN) {
    //   return true;
    // } else {
    //   return false;
    // }

    try {
      final session = await Amplify.Auth.fetchAuthSession();

      return session.isSignedIn;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> isSignedIn() async {
    try {
      final AuthSession session = await Amplify.Auth.fetchAuthSession();

      if (session.isSignedIn) {
        await sharedPreferences!
            .setString(AppConstants.IS_SIGNED_IN, AppConstants.SIGNED_IN);
      } else {
        await sharedPreferences!
            .setString(AppConstants.IS_SIGNED_IN, AppConstants.NOT_SIGNED_IN);
      }
    } catch (e) {
      print(e);
      await sharedPreferences!
          .setString(AppConstants.IS_SIGNED_IN, AppConstants.NOT_SIGNED_IN);
    }

    // if (session.isSignedIn) {
    //   sharedPreferences.setString(
    //       AppConstants.IS_SIGNED_IN, enumToString(isSignedInOrNot.TRUE));
    // } else {}
  }

  Future<bool> clearSharedData() async {
    //sharedPreferences.remove(AppConstants.CART_LIST);
    sharedPreferences!.remove(AppConstants.CURRENCY);
    sharedPreferences!.remove(AppConstants.TOKEN);
    sharedPreferences!.remove(AppConstants.USER);
    FirebaseMessaging.instance.unsubscribeFromTopic(AppConstants.TOPIC);
    return true;
  }

  // for verify Email
  Future<ApiResponse> checkEmail(String email, String temporaryToken) async {
    try {
      Response response = await dioClient!.post(AppConstants.CHECK_EMAIL_URI,
          data: {"email": email, "temporary_token": temporaryToken});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> verifyEmail(
      String email, String token, String tempToken) async {
    try {
      Response response = await dioClient!.post(AppConstants.VERIFY_EMAIL_URI,
          data: {"email": email, "token": token, 'temporary_token': tempToken});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  //verify phone number

  // Future<ApiResponse> checkPhone(String phone, String temporaryToken) async {
  //   try {
  //     // Response response = await dioClient.post(AppConstants.CHECK_PHONE_URI,
  //     //     data: {"phone": phone, "temporary_token": temporaryToken});
  //     ResendSignUpCodeResult resendSignUpCodeResult =
  //         await Amplify.Auth.resendSignUpCode(username: phone);

  //     Response response = Response(
  //       requestOptions: RequestOptions(path: ''),
  //       data: resendSignUpCodeResult,
  //       statusCode: 200,
  //     );

  //     return ApiResponse.withSuccess(response);
  //   } catch (e) {
  //     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
  //   }
  // }

  Future<ApiResponse> resendCode(String phone) async {
    try {
      // Response response = await dioClient.post(AppConstants.CHECK_PHONE_URI,
      //     data: {"phone": phone, "temporary_token": temporaryToken});
      ResendSignUpCodeResult resendSignUpCodeResult =
          await Amplify.Auth.resendSignUpCode(username: phone);

      Response response = Response(
        requestOptions: RequestOptions(path: ''),
        data: resendSignUpCodeResult,
        statusCode: 200,
      );

      return ApiResponse.withSuccess(response);
    } on AuthException catch (e) {
      return ApiResponse.withError(e.message);
    }
  }

  Future<ApiResponse> verifyPhone(
      String phone, String token, String otp) async {
    try {
      Response response = await dioClient!.post(AppConstants.VERIFY_PHONE_URI,
          data: {"phone": phone.trim(), "temporary_token": token, "otp": otp});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> verifyOtp(String identity, String otp) async {
    print(
        'verifiy opttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt');
    try {
      // Response response = await dioClient.post(AppConstants.VERIFY_OTP_URI,
      //     data: {"identity": identity.trim(), "otp": otp});
      SignUpResult signUpResult = await Amplify.Auth.confirmSignUp(
          username: identity.trim(), confirmationCode: otp);

      Response response = Response(
        requestOptions: RequestOptions(path: ''),
        data: signUpResult,
        statusCode: 200,
      );
      print('Success');
      return ApiResponse.withSuccess(response);
    } on AuthException catch (e) {
      print('Errorrrrrr');
      print(e);
      return ApiResponse.withError(e.message);
    }
  }

  Future<ApiResponse> resetPassword(String identity, String otp,
      String password, String confirmPassword) async {
    print('======Password====>$password');
    try {
      // Response response =
      //     await dioClient.post(AppConstants.RESET_PASSWORD_URI, data: {
      //   "_method": "put",
      //   "identity": identity.trim(),
      //   "otp": otp,
      //   "password": password,
      //   "confirm_password": confirmPassword
      // });

      UpdatePasswordResult data = await Amplify.Auth.confirmResetPassword(
        username: identity,
        newPassword: confirmPassword,
        confirmationCode: otp,
      );

      Response response = Response(
        requestOptions: RequestOptions(path: ''),
        data: data,
        statusCode: 200,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // for  Remember Email
  Future<void> saveUserPhoneAndPassword(String phone, String password) async {
    try {
      await sharedPreferences!.setString(AppConstants.USER_PASSWORD, password);
      await sharedPreferences!.setString(AppConstants.USER_PHONE, phone);
    } catch (e) {
      throw e;
    }
  }

  // String getUserEmail() {
  //   return sharedPreferences.getString(AppConstants.USER_EMAIL) ?? "";
  // }

  String getUserPhone() {
    return sharedPreferences!.getString(AppConstants.USER_PHONE) ?? "";
  }

  String getUserPassword() {
    return sharedPreferences!.getString(AppConstants.USER_PASSWORD) ?? "";
  }

  Future<bool> clearUserPhoneAndPassword() async {
    await sharedPreferences!.remove(AppConstants.USER_PASSWORD);
    return await sharedPreferences!.remove(AppConstants.USER_PHONE);
  }

  Future<ApiResponse> forgetPassword(String identity) async {
    try {
      // Response response = await dioClient
      //     .post(AppConstants.FORGET_PASSWORD_URI, data: {"identity": identity});

      ResetPasswordResult data =
          await Amplify.Auth.resetPassword(username: identity);

      Response response = Response(
        requestOptions: RequestOptions(path: ''),
        data: data,
        statusCode: 200,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
