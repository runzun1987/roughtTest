import 'dart:convert';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/datasource/remote/dio/dio_client.dart';
import 'package:flutter_sixvalley_ecommerce/data/datasource/remote/exception/api_error_handler.dart';
import 'package:flutter_sixvalley_ecommerce/data/graphql/queries.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/base/api_response.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/user_info_model.dart';
import 'package:flutter_sixvalley_ecommerce/models/ModelProvider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/app_constants.dart';

class WishListRepo {
  final DioClient? dioClient;

  WishListRepo({required this.dioClient});

  Future<ApiResponse> updatePublic(
      UserWishList userWishList, String isPublic) async {
    try {
      final userWishListWithNewIsPublic =
          userWishList.copyWith(isPublic: isPublic);

      final request = ModelMutations.update(userWishListWithNewIsPublic);
      final amplifyResponse =
          await Amplify.API.mutate(request: request).response;
      Response response = Response(
        requestOptions: RequestOptions(path: ''),
        data: amplifyResponse,
        statusCode: 200,
      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getWishList(String? userPhone) async {
    // try {
    //   final response = await dioClient.get(AppConstants.WISH_LIST_GET_URI);
    //   return ApiResponse.withSuccess(response);
    // } catch (e) {
    //   return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    // }

    final getUserWishListByPhoneNumberRequest = GraphQLRequest(
      document: wishListByUserPhone,
      variables: <String, dynamic>{
        "baseType": "wishListType",
        "userPhone": {
          "eq": userPhone,
        },
      },
    );

    try {
      final GraphQLResponse resp = await Amplify.API
          .query(
            request: getUserWishListByPhoneNumberRequest,
          )
          .response;

      var data = json.decode(resp.data);

      Response response = Response(
        requestOptions: RequestOptions(path: ''),
        data: data['wishListByUserPhone']["items"],
        statusCode: 200,
      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> addWishList(UserWishList wishList) async {
    // try {
    //   final response = await dioClient.post(AppConstants.ADD_WISH_LIST_URI + productID.toString());
    //   return ApiResponse.withSuccess(response);
    // } catch (e) {
    //   return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    // }

    try {
      final request = ModelMutations.create(wishList);
      final GraphQLResponse<UserWishList> response =
          await Amplify.API.mutate(request: request).response;

      final UserWishList? createdWishList = response.data;
      if (createdWishList == null) {
        return ApiResponse.withError(
            ApiErrorHandler.getMessage(response.errors));
      }

      Response madeResponse = Response(
          requestOptions: RequestOptions(path: ''),
          data: createdWishList,
          statusCode: 200);
      return ApiResponse.withSuccess(madeResponse);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> removeWishList(String userPhone, String productId) async {
    // try {
    //   final response = await dioClient
    //       .delete(AppConstants.REMOVE_WISH_LIST_URI + productID.toString());
    //   return ApiResponse.withSuccess(response);
    // } catch (e) {
    //   return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    // }

    final getUserWishListByProductIdRequest = GraphQLRequest(
      document: UserWishListByProductId,
      variables: <String, dynamic>{
        "userPhone": userPhone.trim(),
        "productId": {
          "eq": productId.trim(),
        },
      },
    );

    try {
      final GraphQLResponse resp = await Amplify.API
          .query(
            request: getUserWishListByProductIdRequest,
          )
          .response;

      var data = json.decode(resp.data);

      final request = ModelMutations.deleteById(UserWishList.classType,
          data['UserWishListByProductId']["items"][0]['id']);
      await Amplify.API.mutate(request: request).response;

      //  "id": data['cartSortByPhoneNumber']["id"],
      //       "items": data['cartSortByPhoneNumber']['items'][0]["items"]
      Response response = Response(
        requestOptions: RequestOptions(path: ''),
        data: "Deleted",
        statusCode: 200,
      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      print(e);
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
