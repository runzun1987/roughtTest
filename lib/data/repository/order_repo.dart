import 'dart:convert';
import 'dart:typed_data';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/datasource/remote/dio/dio_client.dart';
import 'package:flutter_sixvalley_ecommerce/data/datasource/remote/exception/api_error_handler.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/base/api_response.dart';
import 'package:flutter_sixvalley_ecommerce/utill/app_constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:path/path.dart';
import 'package:http_parser/http_parser.dart';
import 'package:flutter/foundation.dart';

import '../../models/Order.dart';
import '../graphql/queries.dart';

class OrderRepo {
  final DioClient? dioClient;

  OrderRepo({required this.dioClient});

  Future<ApiResponse> getOrderList(String phone) async {
    try {
      // final response = await dioClient!.get(AppConstants.ORDER_URI);

      List responses = await Future.wait([
        getAllOrderList(phone),
        getUnPaidOrderList(phone),
        getProcessingList(phone),
        getShippedList(phone),
        getReviewList(phone),
        getCancelList(phone),
      ]);

      var getAllOrderListResponse = responses[0];
      var getUnPaidOrderListResponse = responses[1];
      var getProcessingListResponse = responses[2];
      var getShippedListResponse = responses[3];
      var getReviewListResponse = responses[4];
      var getCancelListResponse = responses[5];

      List allResponse = [
        getAllOrderListResponse,
        getUnPaidOrderListResponse,
        getProcessingListResponse,
        getShippedListResponse,
        getReviewListResponse,
        getCancelListResponse
      ];

      final response = Response(
          requestOptions: RequestOptions(path: ''),
          data: allResponse,
          statusCode: 200);

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<dynamic> getAllOrderList(String phone) async {
    final dDay = DateTime.utc(
        DateTime.now().year, DateTime.now().month, DateTime.now().day);
    final localDay = dDay.toLocal(); // e.g. 1944-06-06 02:00:00.000

    final utcFromLocal = localDay.toUtc();

    var Iso8601String = utcFromLocal.toIso8601String();

    try {
      final orderPhoneSearchSortByDateRequest = GraphQLRequest(
        document: orderPhoneSearchSortByDate,
        variables: <String, dynamic>{
          'phone': phone,
          "createdAt": {
            "le": Iso8601String,
          },
          "sortDirection": 'DESC',
        },
      );

      final GraphQLResponse resp = await Amplify.API
          .query(
            request: orderPhoneSearchSortByDateRequest,
          )
          .response;

      var data = json.decode(resp.data);

      List<dynamic> items = data["orderPhoneSearchSortByDate"]["items"];

      if (items.length > 0) {
        List<Order> _orders = [];

        items.forEach((item) {
          print(item);
          var order = Order.fromJson(item);
          _orders.add(order);
        });

        return _orders;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<dynamic> getUnPaidOrderList(String phone) async {
    try {
      final orderPaymentByPhoneRequest = GraphQLRequest(
        document: orderPaymentByPhone,
        variables: <String, dynamic>{
          'phone': phone,
          "payment": {
            "eq": AppConstants.NOT_PAID,
          },
          "filter": {
            "and": [
              {
                "status": {"ne": AppConstants.SHIPPED}
              },
              {
                "status": {"ne": AppConstants.CANCELLED}
              },
              {
                "status": {"ne": AppConstants.COMPLETE}
              },
            ]
          }
          // "sortDirection": 'DESC',
        },
      );

      final GraphQLResponse resp = await Amplify.API
          .query(
            request: orderPaymentByPhoneRequest,
          )
          .response;

      var data = json.decode(resp.data);

      List<dynamic> items = data["orderPaymentByPhone"]["items"];

      if (items.length > 0) {
        List<Order> _orders = [];

        items.forEach((item) {
          print(item);
          var order = Order.fromJson(item);
          _orders.add(order);
        });
        return _orders;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<dynamic> getProcessingList(phone) async {
    try {
      final dDay = DateTime.utc(
          DateTime.now().year, DateTime.now().month, DateTime.now().day);
      final localDay = dDay.toLocal(); // e.g. 1944-06-06 02:00:00.000
      print(localDay.isUtc); // false

      final utcFromLocal = localDay.toUtc();

      print(utcFromLocal);
      var Iso8601String = utcFromLocal.toIso8601String();

      final orderPhoneSearchSortByDateRequest = GraphQLRequest(
        document: orderPhoneSearchSortByDate,
        variables: <String, dynamic>{
          'phone': phone,
          "createdAt": {
            "le": Iso8601String,
          },
          "filter": {
            "and": [
              {
                "status": {"ne": AppConstants.SHIPPED}
              },
              {
                "status": {"ne": AppConstants.CANCELLED}
              },
              {
                "status": {"ne": AppConstants.COMPLETE}
              },
            ]
          }
        },
      );

      final GraphQLResponse resp = await Amplify.API
          .query(
            request: orderPhoneSearchSortByDateRequest,
          )
          .response;

      var data = json.decode(resp.data);

      List<dynamic> items = data["orderPhoneSearchSortByDate"]["items"];

      if (items.length > 0) {
        List<Order> _orders = [];

        items.forEach((item) {
          print(item);
          var order = Order.fromJson(item);
          _orders.add(order);
        });
        return _orders;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<dynamic> getOrderById(String phone, String orderId) async {
    final dDay = DateTime.utc(
        DateTime.now().year, DateTime.now().month, DateTime.now().day);
    final localDay = dDay.toLocal(); // e.g. 1944-06-06 02:00:00.000
    print(localDay.isUtc); // false

    final utcFromLocal = localDay.toUtc();

    print(utcFromLocal);
    var Iso8601String = utcFromLocal.toIso8601String();
    try {
      final orderPhoneSearchSortByDateRequest = GraphQLRequest(
        document: orderPhoneSearchSortByDate,
        variables: <String, dynamic>{
          'phone': phone,
          "createdAt": {
            "le": Iso8601String,
          },
          "filter": {
            "id": {
              "contains": orderId,
            }
          }
        },
      );

      final GraphQLResponse resp = await Amplify.API
          .query(
            request: orderPhoneSearchSortByDateRequest,
          )
          .response;

      print('dddddddddddddddddddddddddddddddddddddddd');

      var data = json.decode(resp.data);
      print(data);

      List<dynamic> items = data["orderPhoneSearchSortByDate"]["items"];
      print('3333333333333333333333333333333333333');
      print(items);

      if (items.length > 0) {
        List<Order> _orders = [];

        items.forEach((item) {
          print(item);
          var order = Order.fromJson(item);
          _orders.add(order);
        });
        return _orders;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<dynamic> getOrderByShortId(String phone, String shortId) async {
    final dDay = DateTime.utc(
        DateTime.now().year, DateTime.now().month, DateTime.now().day);
    final localDay = dDay.toLocal(); // e.g. 1944-06-06 02:00:00.000
    print(localDay.isUtc); // false

    final utcFromLocal = localDay.toUtc();

    print(utcFromLocal);
    var Iso8601String = utcFromLocal.toIso8601String();
    try {
      final orderPhoneSearchSortByDateRequest = GraphQLRequest(
        document: orderPhoneSearchSortByDate,
        variables: <String, dynamic>{
          'phone': phone,
          "createdAt": {
            "le": Iso8601String,
          },
          "filter": {
            "orderId": {
              "contains": shortId,
            }
          }
        },
      );

      final GraphQLResponse resp = await Amplify.API
          .query(
            request: orderPhoneSearchSortByDateRequest,
          )
          .response;

      var data = json.decode(resp.data);

      List<dynamic> items = data["orderPhoneSearchSortByDate"]["items"];

      if (items.length > 0) {
        List<Order> _orders = [];

        items.forEach((item) {
          print(item);
          var order = Order.fromJson(item);
          _orders.add(order);
        });
        return _orders;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<dynamic> getShippedList(phone) async {
    try {
      final orderStatusByPhoneRequest = GraphQLRequest(
        document: orderStatusByPhone,
        variables: <String, dynamic>{
          'phone': phone,
          "status": {"eq": AppConstants.SHIPPED},
        },
      );

      final GraphQLResponse resp = await Amplify.API
          .query(
            request: orderStatusByPhoneRequest,
          )
          .response;

      var data = json.decode(resp.data);

      List<dynamic> items = data["orderStatusByPhone"]["items"];

      if (items.length > 0) {
        List<Order> _orders = [];

        items.forEach((item) {
          print(item);
          var order = Order.fromJson(item);
          _orders.add(order);
        });
        return _orders;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<dynamic> getReviewList(phone) async {
    final dDay = DateTime.utc(
        DateTime.now().year, DateTime.now().month, DateTime.now().day);
    final localDay = dDay.toLocal(); // e.g. 1944-06-06 02:00:00.000
    print(localDay.isUtc); // false

    final utcFromLocal = localDay.toUtc();

    print(utcFromLocal);
    var Iso8601String = utcFromLocal.toIso8601String();
    try {
      final orderPhoneSearchSortByDateRequest = GraphQLRequest(
        document: orderPhoneSearchSortByDate,
        variables: <String, dynamic>{
          'phone': phone,
          "createdAt": {
            "le": Iso8601String,
          },
          "filter": {
            "and": [
              {
                "payment": {"ne": AppConstants.NOT_PAID},
              },
              {
                "payment_verified": {"eq": false},
              },
              {
                "status": {"ne": AppConstants.CANCELLED}
              }
            ]
          }
        },
      );

      final GraphQLResponse resp = await Amplify.API
          .query(
            request: orderPhoneSearchSortByDateRequest,
          )
          .response;

      var data = json.decode(resp.data);

      List<dynamic> items = data["orderPhoneSearchSortByDate"]["items"];

      if (items.length > 0) {
        List<Order> _orders = [];

        items.forEach((item) {
          print(item);
          var order = Order.fromJson(item);
          _orders.add(order);
        });
        return _orders;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<dynamic> getCancelList(phone) async {
    try {
      final orderStatusByPhoneRequest = GraphQLRequest(
        document: orderStatusByPhone,
        variables: <String, dynamic>{
          'phone': phone,
          "status": {"eq": AppConstants.CANCELLED},
        },
      );

      final GraphQLResponse resp = await Amplify.API
          .query(
            request: orderStatusByPhoneRequest,
          )
          .response;

      var data = json.decode(resp.data);

      List<dynamic> items = data["orderStatusByPhone"]["items"];

      if (items.length > 0) {
        List<Order> _orders = [];

        items.forEach((item) {
          print(items);
          var order = Order.fromJson(item);
          _orders.add(order);
        });
        return _orders;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<ApiResponse> getOrderDetails(String phone, String orderID) async {
    try {
      // final response = await dioClient!.get(
      //   AppConstants.ORDER_DETAILS_URI + orderID,
      //   options: Options(headers: {AppConstants.LANG_KEY: languageCode}),
      // );

      dynamic orders = await getOrderById(phone, orderID);

      Response response = Response(
        requestOptions: RequestOptions(path: ''),
        data: orders,
        statusCode: 200,
      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getShippingList() async {
    try {
      final response = await dioClient!.get(AppConstants.SHIPPING_URI);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> placeOrder(String addressID, String couponCode,
      String billingAddressId, String orderNote) async {
    try {
      final response = await dioClient!.get(AppConstants.ORDER_PLACE_URI +
          '?address_id=$addressID&coupon_code=$couponCode&billing_address_id=$billingAddressId&order_note=$orderNote');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getTrackingInfo(String orderID) async {
    try {
      final response =
          await dioClient!.get(AppConstants.TRACKING_URI + orderID);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getShippingMethod(int? sellerId) async {
    try {
      final response = sellerId == 1
          ? await dioClient!
              .get('${AppConstants.GET_SHIPPING_METHOD}/$sellerId/admin')
          : await dioClient!
              .get('${AppConstants.GET_SHIPPING_METHOD}/$sellerId/seller');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<http.StreamedResponse> refundRequest(
      int? orderDetailsId,
      double? amount,
      String refundReason,
      List<XFile?> file,
      String token) async {
    http.MultipartRequest request = http.MultipartRequest(
        'POST',
        Uri.parse(
            '${AppConstants.BASE_URL}${AppConstants.REFUND_REQUEST_URI}'));
    request.headers.addAll(<String, String>{'Authorization': 'Bearer $token'});
    for (int i = 0; i < file.length; i++) {
      if (file != null) {
        print('bangladesh======');
        Uint8List _list = await file[i]!.readAsBytes();
        var part = http.MultipartFile(
            'images[]', file[i]!.readAsBytes().asStream(), _list.length,
            filename: basename(file[i]!.path),
            contentType: MediaType('image', 'jpg'));
        request.files.add(part);
      }
    }
    Map<String, String> _fields = Map();
    _fields.addAll(<String, String>{
      'order_details_id': orderDetailsId.toString(),
      'amount': amount.toString(),
      'refund_reason': refundReason
    });
    request.fields.addAll(_fields);
    http.StreamedResponse response = await request.send();
    return response;
  }

  Future<ApiResponse> getRefundInfo(int? orderDetailsId) async {
    try {
      final response = await dioClient!.get(
          '${AppConstants.REFUND_REQUEST_PRE_REQ_URI}?order_details_id=$orderDetailsId');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getRefundResult(int? orderDetailsId) async {
    try {
      final response = await dioClient!
          .get('${AppConstants.REFUND_RESULT_URI}?id=$orderDetailsId');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> cancelOrder(int? orderId) async {
    try {
      final response = await dioClient!
          .get('${AppConstants.CANCEL_ORDER_URI}?order_id=$orderId');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
