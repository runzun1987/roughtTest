import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/datasource/remote/exception/api_error_handler.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/base/api_response.dart';

import '/data/datasource/remote/dio/dio_client.dart';

class ZapexRepo {
  DioClient? dioClient;
  ZapexRepo({required this.dioClient});

  final String _ZAPEX_BASE_URL = "https://api.zapiex.com";
  final String _ZAPEX_KEYWORD_SEARCH_URL = "/v3/search";
  final String _ZAPEX_PRODUCT_DETAIL_URL = "/v3/product/details";
  final String _ZAPEX_IMAGE_UPLOAD_URL = "/v3/image/upload";
  final String _ZAPEX_IMAGE_SEARCH_URL = "/v3/image/search";

  final Options _options = Options(
    headers: {
      'x-api-key': "A1uHUq8clsaDvWsLK4aHg17CvkQko7x79JXAcqmk",
      'content-type': 'application/json',
    },
  );

  Future<ApiResponse> searchKeyword(String text, int page) async {
    Map<String, dynamic> data = {
      "text": text,
      "currecy": "USD",
      "sort": "BEST_MATCH",
      "page": page
    };

    try {
      Response response = await dioClient!.post(
        _ZAPEX_BASE_URL + _ZAPEX_KEYWORD_SEARCH_URL,
        data: data,
        options: _options,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(
        ApiErrorHandler.getMessage(e),
      );
    }
  }

  Future<ApiResponse> searchImage(
    String imagePath, {
    String imageType = "64",
  }) async {
    String type = imageType == '64' ? 'BASE64' : 'URL';

    Map<String, dynamic> data = {
      "type": type,
      "image": imagePath,
    };

    try {
      Response response = await dioClient!.post(
        _ZAPEX_BASE_URL + _ZAPEX_IMAGE_UPLOAD_URL,
        data: data,
        options: _options,
      );
      if (response.statusCode == 200) {
        var _data = response.data;
        return await searchImageFromUploadKey(_data["data"]["uploadKey"]);
      } else {
        return ApiResponse.withError(
          ApiErrorHandler.getMessage("There was an error uploading image"),
        );
      }
    } catch (e) {
      print(e);
      return ApiResponse.withError(
        ApiErrorHandler.getMessage(e),
      );
    }
  }

  Future<ApiResponse> searchImageFromUploadKey(uploadKey) async {
    Map<String, dynamic> data = {
      "uploadKey": uploadKey,
      "sort": 'BEST_MATCH',
      "filter": 'AUTO',
    };
    try {
      Response response = await dioClient!.post(
        _ZAPEX_BASE_URL + _ZAPEX_IMAGE_SEARCH_URL,
        data: data,
        options: _options,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      print(e);
      return ApiResponse.withError(
        ApiErrorHandler.getMessage(e),
      );
    }
  }

  Future<ApiResponse> getProductDetail(int? productId) async {
    Map<String, dynamic> data = {
      "productId": productId.toString(),
      "getShipping": true,
      "quantity": 1,
      "getHtmlDescription": true,
      "locale": 'en_US',
      "shipFrom": 'CN',
      "shipTo": "US"
    };
    try {
      Response response = await dioClient!.post(
        _ZAPEX_BASE_URL + _ZAPEX_PRODUCT_DETAIL_URL,
        data: data,
        options: _options,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(
        ApiErrorHandler.getMessage(e),
      );
    }
  }
}
