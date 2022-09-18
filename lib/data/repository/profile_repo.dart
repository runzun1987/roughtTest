import 'dart:io';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/datasource/remote/dio/dio_client.dart';
import 'package:flutter_sixvalley_ecommerce/data/datasource/remote/exception/api_error_handler.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/address_model.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/base/api_response.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/user_info_model.dart';
import 'package:flutter_sixvalley_ecommerce/utill/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProfileRepo {
  final DioClient? dioClient;
  final SharedPreferences? sharedPreferences;
  ProfileRepo({required this.dioClient, required this.sharedPreferences});

  Future<ApiResponse> getAddressTypeList() async {
    try {
      List<String> addressTypeList = [
        'Select Address type',
        'Permanent',
        'Home',
        'Office',
      ];
      Response response = Response(
          requestOptions: RequestOptions(path: ''),
          data: addressTypeList,
          statusCode: 200);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getUserInfo() async {
    Map<String, dynamic> userData = {};
    try {
      final result = await Amplify.Auth.fetchUserAttributes();

      for (final element in result) {
        print('key: ${element.userAttributeKey}; value: ${element.value}');
        userData[element.userAttributeKey.toString()] = element.value;
      }

      // final response = await dioClient.get(AppConstants.CUSTOMER_URI);

      Response response = Response(
        requestOptions: RequestOptions(path: ''),
        data: userData,
        statusCode: 200,
      );
      return ApiResponse.withSuccess(response);
    } on AuthException catch (e) {
      if (e.message == "User not found in the system.") {
        Amplify.Auth.signOut();
      }

      return ApiResponse.withError(e.message);
    }
  }

  Future<ApiResponse> getAllAddress() async {
    try {
      final response = await dioClient!.get(AppConstants.ADDRESS_LIST_URI);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> removeAddressByID(int? id) async {
    try {
      final response =
          await dioClient!.delete('${AppConstants.REMOVE_ADDRESS_URI}$id');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> addAddress(AddressModel addressModel) async {
    try {
      Response response = await dioClient!.post(
        AppConstants.ADD_ADDRESS_URI,
        data: addressModel.toJson(),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> updateProfile(UserInfoModel userInfoModel) async {
    print(
        '1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111');
    // http.MultipartRequest request = http.MultipartRequest(
    //     'POST',
    //     Uri.parse(
    //         '${AppConstants.BASE_URL}${AppConstants.UPDATE_PROFILE_URI}'));
    // request.headers.addAll(<String, String>{'Authorization': 'Bearer $token'});
    // if (file != null) {
    //   request.files.add(http.MultipartFile(
    //       'image', file.readAsBytes().asStream(), file.lengthSync(),
    //       filename: file.path.split('/').last));
    // }

    // CognitoUserAttributeKey.custom("firstName"): register.fName,
    //     CognitoUserAttributeKey.custom("lastName"): register.lName,
    //     CognitoUserAttributeKey.custom("deviceId"):

    try {
      List<AuthUserAttribute> attributes = [
        AuthUserAttribute(
          userAttributeKey: CognitoUserAttributeKey.custom("firstName"),
          value: userInfoModel.firstName!,
        ),
        AuthUserAttribute(
          userAttributeKey: CognitoUserAttributeKey.custom("lastName"),
          value: userInfoModel.lastName!,
        ),
        AuthUserAttribute(
          userAttributeKey: CognitoUserAttributeKey.custom("street"),
          value: userInfoModel.street,
        ),
        AuthUserAttribute(
          userAttributeKey: CognitoUserAttributeKey.custom("town"),
          value: userInfoModel.town,
        ),
        AuthUserAttribute(
          userAttributeKey: CognitoUserAttributeKey.custom("country"),
          value: "Nepal",
        ),
      ];

      Map<UserAttributeKey, UpdateUserAttributeResult> cognitoUser =
          await Amplify.Auth.updateUserAttributes(attributes: attributes);

      Response response = Response(
        requestOptions: RequestOptions(path: ''),
        data: cognitoUser,
        statusCode: 200,
      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // for save home address
  Future<void> saveHomeAddress(String homeAddress) async {
    try {
      await sharedPreferences!.setString(AppConstants.HOME_ADDRESS, homeAddress);
    } catch (e) {
      throw e;
    }
  }

  String getHomeAddress() {
    return sharedPreferences!.getString(AppConstants.HOME_ADDRESS) ?? "";
  }

  Future<bool> clearHomeAddress() async {
    return sharedPreferences!.remove(AppConstants.HOME_ADDRESS);
  }

  // for save office address
  Future<void> saveOfficeAddress(String officeAddress) async {
    try {
      await sharedPreferences!.setString(
          AppConstants.OFFICE_ADDRESS, officeAddress);
    } catch (e) {
      throw e;
    }
  }

  String getOfficeAddress() {
    return sharedPreferences!.getString(AppConstants.OFFICE_ADDRESS) ?? "";
  }

  Future<bool> clearOfficeAddress() async {
    return sharedPreferences!.remove(AppConstants.OFFICE_ADDRESS);
  }
}
