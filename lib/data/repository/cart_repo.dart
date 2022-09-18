import 'dart:convert';

import 'dart:developer' as developer;

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/datasource/remote/dio/dio_client.dart';
import 'package:flutter_sixvalley_ecommerce/data/datasource/remote/exception/api_error_handler.dart';
import 'package:flutter_sixvalley_ecommerce/data/graphql/queries.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/base/api_response.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/cart_model.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/product_model.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/user_info_model.dart';
import 'package:flutter_sixvalley_ecommerce/helper/product_type.dart';

import 'package:flutter_sixvalley_ecommerce/models/Cart.dart';

import 'package:flutter_sixvalley_ecommerce/utill/app_constants.dart';
import 'package:phone_number/phone_number.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/ProductInfo.dart';

class CartRepo {
  final DioClient? dioClient;
  final SharedPreferences? sharedPreferences;
  CartRepo({required this.dioClient, required this.sharedPreferences});

  List<ProductInfo> getCartList() {
    // final cartList = await Amplify.DataStore.query(Cart.classType);

    List<String> carts =
        sharedPreferences!.getStringList(AppConstants.CART_LIST)!;

    print(carts);
    print(
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxXXXXXXXXXXXXXXXXXXXXXXyyyyyyyyyyyyyyyyyyyYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY');

    List<ProductInfo> cartList = [];
    // Cart.fromJson(apiResponse.response.data);

    // carts.forEach((cart) => cartList.add(CartModel.fromJson(jsonDecode(cart))));

    carts.forEach(
        (cart) => cartList.add(ProductInfo.fromJson(jsonDecode(cart))));

    ;
    return cartList;
  }

  void addToCartList(List<ProductInfo> cartProductList) {
    List<String> carts = [];
    cartProductList
        .forEach((ProductInfo cartModel) => carts.add(jsonEncode(cartModel)));

    sharedPreferences!.setStringList(AppConstants.CART_LIST, carts);
  }

  Future<ApiResponse> getCartListData(String? userPhone) async {
    final getCartSortByPhoneNumberRequest = GraphQLRequest(
      document: cartSortByPhoneNumber,
      variables: <String, dynamic>{
        'baseType': 'cartType',
        "phoneNumber": {
          "eq": userPhone,
        },
      },
    );

    try {
      final GraphQLResponse resp = await Amplify.API
          .query(
            request: getCartSortByPhoneNumberRequest,
          )
          .response;

      var data = json.decode(resp.data);
      //  "id": data['cartSortByPhoneNumber']["id"],
      //       "items": data['cartSortByPhoneNumber']['items'][0]["items"]
      Response response = Response(
        requestOptions: RequestOptions(path: ''),
        data: data['cartSortByPhoneNumber']['items'].length > 0
            ? data['cartSortByPhoneNumber']['items'][0]
            : null,
        statusCode: 200,
      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      print(e);
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }

    // try {
    //   final response = await dioClient.get(AppConstants.GET_CART_DATA_URI);
    //   return ApiResponse.withSuccess(response);
    // } catch (e) {
    //   return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    // }
  }

  Future<ApiResponse> addToCartListData(
      UserInfoModel user, ProductInfo productInfo) async {
    try {
      ApiResponse apiResponse = await getCartListData(user.phone);

      if (apiResponse.response != null &&
          apiResponse.response!.statusCode == 200) {
        Cart cart = Cart(
          userName: user.id,
          phoneNumber: user.phone,
          baseType: "cartType",
          items: [productInfo],
        );

        final request = ModelMutations.create(cart);
        final response = await Amplify.API.mutate(request: request).response;

        final createdCart = response.data;
        if (createdCart == null) {
          return ApiResponse.withError("Error creating order");
        }
        Response madeResponse = Response(
            requestOptions: RequestOptions(path: ''),
            data: createdCart,
            statusCode: 200);
        return ApiResponse.withSuccess(madeResponse);
      } else {
        Cart newCart = Cart.fromJson(apiResponse.response!.data);

        int _index;

        if (productInfo.skuId != null) {
          _index = newCart.items!.indexWhere(
              (ProductInfo item) => item.skuId == productInfo.skuId);
        } else {
          _index = newCart.items!.indexWhere(
              (ProductInfo item) => item.productId == productInfo.productId);
        }

        if (_index < 0) {
          newCart.items!.add(productInfo);
        } else {
          newCart.items![_index] = productInfo;
        }

        final cartWithNewProductInfo = newCart.copyWith(items: newCart.items);

        final request = ModelMutations.update(cartWithNewProductInfo);

        final apiResponse2 =
            await Amplify.API.mutate(request: request).response;

        Response madeResponse = Response(
            requestOptions: RequestOptions(path: ''),
            data: apiResponse2.data,
            statusCode: 200);
        return ApiResponse.withSuccess(madeResponse);
      }

      // final request = ModelMutations.create(cart);
      // final GraphQLResponse<Cart> response =
      //     await Amplify.API.mutate(request: request).response;

      // final Cart createdCart = response.data;
      // if (createdCart == null) {
      //   return ApiResponse.withError(
      //       ApiErrorHandler.getMessage(response.errors));
      // }

      // Response madeResponse = Response(
      //     requestOptions: RequestOptions(path: ''),
      //     data: createdCart,
      //     statusCode: 200);
      // return ApiResponse.withSuccess(madeResponse);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> updateQuantity(
    Cart updateCart,
    // int index,
    // ProductInfo cartModel,
    // bool isIncrease,
    // List<ProductInfo> cartList,
  ) async {
    // print('Body: ${{'_method': 'put', 'key': id, 'quantity': quantity}}');

    try {
      final request = ModelMutations.update(updateCart);
      final GraphQLResponse<Cart> cartResponse =
          await Amplify.API.mutate(request: request).response;

      Response response = Response(
        requestOptions: RequestOptions(path: ''),
        data: cartResponse.data,
        statusCode: 200,
      );
      // final response = await dioClient.post(
      //     AppConstants.UPDATE_CART_QUANTITY_URI,
      //     data: {'_method': 'put', 'key': id, 'quantity': quantity});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> removeFromCart(Cart cart, int index) async {
    try {
      // final response = await dioClient.post(AppConstants.REMOVE_FROM_CART_URI,
      //     data: {'_method': 'delete', 'key': key});
      // return ApiResponse.withSuccess(response);

      // final cartItemWithNewQtyPrice = cartModel.copyWith(
      //   qty: qty,
      //   sum: cartModel.price * qty,
      // );

      List<ProductInfo> _items = [...cart.items!];
      _items.removeAt(index);

      final cartWithNewItem = cart.copyWith(items: _items);

      final request = ModelMutations.update(cartWithNewItem);
      final GraphQLResponse<Cart> cartResponse =
          await Amplify.API.mutate(request: request).response;

      Response response = Response(
        requestOptions: RequestOptions(path: ''),
        data: cartResponse.data,
        statusCode: 200,
      );
      // final response = await dioClient.post(
      //     AppConstants.UPDATE_CART_QUANTITY_URI,
      //     data: {'_method': 'put', 'key': id, 'quantity': quantity});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getShippingMethod(int sellerId, String type) async {
    try {
      final response = await dioClient!
          .get('${AppConstants.GET_SHIPPING_METHOD}/$sellerId/$type');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> addShippingMethod(int? id, String? cartGroupId) async {
    print('===>${{"id": id, "cart_group_id": cartGroupId}}');
    try {
      final response = await dioClient!.post(
          AppConstants.CHOOSE_SHIPPING_METHOD,
          data: {"id": id, "cart_group_id": cartGroupId});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getChosenShippingMethod() async {
    try {
      final response =
          await dioClient!.get(AppConstants.CHOSEN_SHIPPING_METHOD_URI);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getSelectedShippingType(
      int sellerId, String sellerType) async {
    try {
      final response = await dioClient!.get(
          '${AppConstants.GET_SELECTED_SHIPPING_TYPE_URI}?seller_id=$sellerId&seller_is=$sellerType');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
