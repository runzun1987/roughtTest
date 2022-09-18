import 'dart:convert';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/base/api_response.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/product_model.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/user_info_model.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/wishlist_model.dart';
import 'package:flutter_sixvalley_ecommerce/data/repository/product_details_repo.dart';
import 'package:flutter_sixvalley_ecommerce/data/repository/wishlist_repo.dart';
import 'package:flutter_sixvalley_ecommerce/helper/api_checker.dart';
import 'package:flutter_sixvalley_ecommerce/models/ModelProvider.dart'
    as ModelProvider;

import '../data/graphql/queries.dart';
import '../models/UserWishList.dart';

class WishListProvider extends ChangeNotifier {
  final WishListRepo? wishListRepo;
  final ProductDetailsRepo? productDetailsRepo;
  WishListProvider(
      {required this.wishListRepo, required this.productDetailsRepo});

  bool _wish = false;
  String _searchText = "";
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool get isWish => _wish;
  String get searchText => _searchText;

  String? _isPublic;
  String? get isPublic => _isPublic;

  clearSearchText() {
    _searchText = '';
    notifyListeners();
  }

  List<ModelProvider.UserWishList>? _wishList;
  List<ModelProvider.UserWishList>? _allWishList;

  List<ModelProvider.UserWishList>? get wishList => _wishList;
  List<ModelProvider.UserWishList>? get allWishList => _allWishList;

  Future<void> updatePublic(
      ModelProvider.UserWishList userWishList, String isPublic) async {
    ApiResponse apiResponse =
        await wishListRepo!.updatePublic(userWishList, isPublic);

    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      // Map map = apiResponse.response.data;
      // String message = map['message'];
      _isPublic = 'true';
      notifyListeners();
    } else {}
    notifyListeners();
  }

  void searchWishList(String query) async {
    _wishList = [];
    _searchText = query;

    if (query.isNotEmpty) {
      List<ModelProvider.UserWishList> products = _allWishList!.where((product) {
        return product.title!.toLowerCase().contains(query.toLowerCase());
      }).toList();
      _wishList!.addAll(products);
    } else {
      _wishList!.addAll(_allWishList!);
    }
    notifyListeners();
  }

  void addWishList(UserInfoModel userInfo, Product product,
      {Function? feedbackMessage}) async {
    ModelProvider.UserWishList wishList = ModelProvider.UserWishList(
        productId: product.id.toString(),
        userPhone: userInfo.phone,
        provider: product.provider,
        title: product.name,
        price: product.unitPrice.toString(),
        image: product.thumbnail,
        isPublic: "true",
        baseType: "wishListType");

    final getUserWishListByProductIdRequest = GraphQLRequest(
      document: UserWishListByProductId,
      variables: <String, dynamic>{
        "userPhone": userInfo.phone.trim(),
        "productId": {
          "eq": product.id.toString().trim(),
        },
      },
    );

    final GraphQLResponse resp = await Amplify.API
        .query(
          request: getUserWishListByProductIdRequest,
        )
        .response;

    var data = json.decode(resp.data);

    if (data['UserWishListByProductId']["items"].length > 0) {
    } else {
      ApiResponse apiResponse = await wishListRepo!.addWishList(wishList);
      if (apiResponse.response != null &&
          apiResponse.response!.statusCode == 200) {
        // Map map = apiResponse.response.data;
        // String message = map['message'];
        feedbackMessage!("Added to your wishlist");
        _wish = true;
        notifyListeners();
      } else {
        _wish = false;
        feedbackMessage!('${apiResponse.error.toString()}');
      }
    }

    notifyListeners();
  }

  void removeWishList(
    UserInfoModel userInfo,
    String? productId, {
    int? index,
    Function? feedbackMessage,
  }) async {
    _isLoading = true;
    ApiResponse apiResponse = await wishListRepo!.removeWishList(
      userInfo.phone,
      productId.toString(),
    );
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      // Map map = apiResponse.response.data;
      // String message = map['message'];
      if (feedbackMessage != null) {
        feedbackMessage("Removed from wishlist");
      }
      if (index != null) {
        _wishList!.removeAt(index);
        _allWishList!.removeAt(index);
        notifyListeners();
      }
    } else {
      print('${apiResponse.error.toString()}');
      feedbackMessage!('${apiResponse.error.toString()}');
    }
    _wish = false;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> initWishList(
      BuildContext context, String? languageCode, String? userPhone) async {
    _isLoading = true;
    ApiResponse apiResponse = await wishListRepo!.getWishList(userPhone);
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      _wishList = [];
      _allWishList = [];
      for (int i = 0; i < apiResponse.response!.data.length; i++) {
        // ApiResponse productResponse = await productDetailsRepo.getProduct(
        //   ModelProvider.UserWishList.fromJson(apiResponse.response.data[i])
        //       .productId
        //       .toString(),
        //   languageCode,
        // );
        // if (productResponse.response != null &&
        //     productResponse.response.statusCode == 200) {
        // Product _product = Product.fromJson(productResponse.response.data);
        UserWishList _userWishList =
            ModelProvider.UserWishList.fromJson(apiResponse.response!.data[i]);
        _wishList!.add(_userWishList);
        _allWishList!.add(_userWishList);

        _isLoading = false;
        notifyListeners();
      }
      if (apiResponse.response!.data.length > 0) {
        notifyListeners();
      }
    } else {
      notifyListeners();
      ApiChecker.checkApi(context, apiResponse);
    }
  }

  void checkWishList(
      String productId, BuildContext context, String? userPhone) async {
    ApiResponse apiResponse = await wishListRepo!.getWishList(userPhone);
    List<List> productIdList = [];
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      // _wishList = [];
      apiResponse.response!.data.forEach((wishList) async {
        UserWishList wishListModel = UserWishList.fromJson(wishList);

        productIdList
            .add([wishListModel.productId.toString(), wishListModel.isPublic]);
      });
      // productIdList.contains(productId) ? _wish = true : _wish = false;

      for (var list in productIdList) {
        if (productId == list[0]) {
          _wish = true;
          _isPublic = list[1];
          break;
        } else {
          _wish = false;
        }
      }

      // productIdList.forEach((List element) {

      // });
    } else {
      ApiChecker.checkApi(context, apiResponse);
    }
    notifyListeners();
  }
}
