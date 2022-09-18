import 'dart:convert';

import 'package:amplify_api/model_queries.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/datasource/remote/dio/dio_client.dart';
import 'package:flutter_sixvalley_ecommerce/data/datasource/remote/exception/api_error_handler.dart';
import 'package:flutter_sixvalley_ecommerce/data/graphql/queries.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/base/api_response.dart';
import 'package:flutter_sixvalley_ecommerce/models/ModelProvider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/app_constants.dart';

class BannerRepo {
  final DioClient? dioClient;
  BannerRepo({required this.dioClient});

  Future<ApiResponse> getBannerList() async {
    // try {
    //   final response = await dioClient!.get(AppConstants.MAIN_BANNER_URI);
    //   return ApiResponse.withSuccess(response);
    // } catch (e) {
    //   return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    // }

    try {
      final listQuickSalesRequest = GraphQLRequest(document: listQuickSales);

      final GraphQLResponse resp = await Amplify.API
          .query(
            request: listQuickSalesRequest,
          )
          .response;

      var data = json.decode(resp.data);

      Response response2 = Response(
        requestOptions: RequestOptions(path: ''),
        data: data["listQuickSales"]["items"],
        statusCode: 200,
      );

      return ApiResponse.withSuccess(response2);
    } on ApiException catch (e) {
      print('Query failed: $e');
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getFooterBannerList() async {
    try {
      final response = await dioClient!.get(AppConstants.FOOTER_BANNER_URI);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getMainSectionBannerList() async {
    try {
      final response =
          await dioClient!.get(AppConstants.MAIN_SECTION_BANNER_URI);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getProductDetails(String productID) async {
    try {
      final response =
          await dioClient!.get('${AppConstants.PRODUCT_DETAILS_URI}$productID');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
