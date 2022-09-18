import 'dart:convert';

import 'package:amplify_api/model_queries.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../models/Price.dart';
import '../../datasource/remote/exception/api_error_handler.dart';
import '../../model/response/base/api_response.dart';
import '/data/datasource/remote/dio/dio_client.dart';

class GetPriceForumulaRepo {
  Future<ApiResponse> getFormula() async {
    try {
      final request = ModelQueries.get(
          Price.classType, "da7ec697-0a62-4cad-8bfb-9a56d11ca685");
      final GraphQLResponse<Price> amplifyResponse =
          await Amplify.API.query(request: request).response;
      final Price? priceFormula = amplifyResponse.data;
      if (priceFormula == null) {
        print('errors: ${amplifyResponse.errors}');
      }
      Response response = Response(
        requestOptions: RequestOptions(path: ''),
        data: priceFormula,
        statusCode: 200,
      );

      return ApiResponse.withSuccess(response);
    } on ApiException catch (e) {
      print('Query failed: $e');
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
