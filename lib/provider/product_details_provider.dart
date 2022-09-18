import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/body/review_body.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/base/api_response.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/base/cities.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/product_model.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/response_model.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/review_model.dart';
import 'package:flutter_sixvalley_ecommerce/data/repository/api/zapex_repo.dart';
import 'package:flutter_sixvalley_ecommerce/data/repository/product_details_repo.dart';
import 'package:flutter_sixvalley_ecommerce/helper/api_checker.dart';
import 'package:flutter_sixvalley_ecommerce/models/Details.dart';
import 'package:flutter_sixvalley_ecommerce/provider/banner_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../data/model/response/base/shipping_type.dart';
import 'auth_provider.dart';
import 'profile_provider.dart';

enum SelectionBuyNowOrAddToCart {
  ADD_TO_CART,
  BUY_NOW,
}

class ProductDetailsProvider extends ChangeNotifier {
  final ProductDetailsRepo? productDetailsRepo;
  final ZapexRepo? zapexRepo;
  ProductDetailsProvider(
      {required this.productDetailsRepo, required this.zapexRepo});

  List<ReviewModel>? _reviewList;
  int? _imageSliderIndex;
  bool _wish = false;
  int _quantity = 0;
  int? _variantIndex;
  List<int>? _variationIndex;
  double? _rating = 0;
  bool _isLoading = false;
  int? _orderCount;
  int? _wishCount;
  String? _sharableLink;
  String? _errorText;
  bool _hasConnection = true;
  Product? _product;
  Map _emptyMap = {};
  List? _emptyList;
  List<List<dynamic>> _images = [];
  List<String> _varients = [];
  // Selection _selection;
  // String _town;
  // int _tier;
  String? _shippingType;
  String? _varient_detail_string;

  List<ReviewModel>? get reviewList => _reviewList;
  int? get imageSliderIndex => _imageSliderIndex;
  bool get isWished => _wish;
  int get quantity => _quantity;
  int? get variantIndex => _variantIndex;
  List<int>? get variationIndex => _variationIndex;
  double? get rating => _rating;
  bool get isLoading => _isLoading;
  int? get orderCount => _orderCount;
  int? get wishCount => _wishCount;
  String? get sharableLink => _sharableLink;
  String? get errorText => _errorText;
  bool get hasConnection => _hasConnection;
  Product? get product => _product;
  Map get emptyMap => _emptyMap;
  List? get emptyList => _emptyList;
  String? get shippingType => _shippingType;
  List get images => _images;
  List get varients => _varients;
  String? get varient_detail_string => _varient_detail_string;
  // Selection get selection => _selection;

  // set selection(Selection sel) {
  //   _selection = sel;
  //   notifyListeners();
  // }

  // int get tier => _tier;
  Future<String?> town(BuildContext context) async {

    bool isGuestMode = !await Provider.of<AuthProvider>(context, listen: false)
        .isLoggedIn(context);
  
    if (!isGuestMode) {
  
      String? town = Provider.of<ProfileProvider>(context, listen: false)
          .userInfoModel!
          .town;

  

      if (town == null) {
        return Cities.allCities[0];
      } else {
        return Provider.of<ProfileProvider>(context, listen: false)
            .userInfoModel!
            .town;
      }
    } else {
      return Cities.allCities[0];
    }
  }

  Future<int> tier(BuildContext context) async {
    // print(
    //     '666666666666666666666666666666666666666666666666666666666666666666666666666666');
    // print(
    //     '7777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777');
    bool isGuestMode = !await Provider.of<AuthProvider>(context, listen: false)
        .isLoggedIn(context);
    // print(isGuestMode);
    // print('5555555555555555555555555555555555555555555555555555555');

    if (!isGuestMode) {
      print('check check check check');
      print('00000000000cxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxvvvvvvvvvvvv');

      print(Provider.of<ProfileProvider>(context, listen: false).userInfoModel);
      print('4444444444444444444444444444');

      String? town = Provider.of<ProfileProvider>(context, listen: false)
          .userInfoModel!
          .town;

      print(town);
      print('complet complete complete complete');
      if (Cities.citiesTier1.contains(town)) {
        return 1;
      } else if (Cities.citiesTier2.contains(town)) {
        return 2;
      } else if (Cities.citiesTier3.contains(town)) {
        return 3;
      } else {
        return 1;
      }
      // return Provider.of<ProfileProvider>(context, listen: false)
      //     .userInfoModel
      //     .town;
    } else {
      return 1;
    }
  }

  bool hasAllBeenSelected() {
    bool emptyFound = false;
    emptyList!.forEach((e) {
      if (!emptyFound) {
        if (e[0] == '') {
          emptyFound = true;
        }
      }
    });
    return emptyFound;
  }

  void createEmptyArray(int length) {
    List createdList = List.filled(length, ['', '', null]);
    _emptyList = createdList;
  }

  void setEmptyList(List list) {
    _emptyList = list;

    notifyListeners();
  }

  int? getSkuStockOnly() {
    //find matching sku
    if (product!.skus_json!.length == 0) {
      return product!.currentStock;
    } else {
      List onlyIdList = [];
      emptyList!.forEach((e) {
        onlyIdList.add(e[0]);
      });

      String fullId = onlyIdList.join(";");

      List found = product!.skus_json!.firstWhere((sku) => (sku[1] == fullId));

      return int.parse(found[3].toString());
    }
    ;
  }

  String getSkuId() {
    List onlyIdList = [];

    if (emptyList!.length == 0) {
      return product!.id.toString();
    } else {
      emptyList!.forEach((e) {
        onlyIdList.add(e[0]);
      });
      return onlyIdList.join(";");
    }
  }

  List getDetailArray() {
    List<Details?> detailsArr = [];
    emptyList!.forEach((element) {
      List splited = element[0].split(':');
      detailsArr.add(product!.prop_obj![splited[0]]![splited[1]]);
    });

    return detailsArr;
  }

  double? getSkuPriceOnly() {
    if (product!.skus_json!.length == 0) {
      return product!.unitPrice;
    } else {
      List onlyIdList = [];
      emptyList!.forEach((e) {
        onlyIdList.add(e[0]);
      });
      String fullId = onlyIdList.join(";");

      List found = product!.skus_json!.firstWhere((sku) => (sku[1] == fullId));

      return double.parse(found[2].toString());
    }
  }

  dynamic getConditionalPrice() {
    bool emptyFound = hasAllBeenSelected();
    if (!emptyFound) {
      return getSkuPriceOnly();
    } else {
      List priceArr = [];

      if (product!.skus_json != null && product!.skus_json!.length != 0) {
        for (int i = 0; i < product!.skus_json!.length; i++) {
          if (priceArr.length != 0 ||
              !priceArr.contains(product!.skus_json![i][2])) {
            priceArr.add(product!.skus_json![i][2]);
          }
        }

        if (priceArr.length > 1) {
          double? maxPrice =
              priceArr.reduce((curr, next) => curr > next ? curr : next);
          double? minPrice =
              priceArr.reduce((curr, next) => curr < next ? curr : next);
          String price = minPrice.toString() + ' - ' + maxPrice.toString();

          return price;
        } else {
          return priceArr[0];
        }
      } else {
        return product!.unitPrice;
      }
    }
  }

  int? getConditionalStock() {
    bool emptyFound = hasAllBeenSelected();

    if (!emptyFound) {
      return getSkuStockOnly();
    } else {
      return product!.currentStock;
    }
  }

  Future<void> getProductDetail(int? productId, BuildContext context) async {
    _hasConnection = true;
    _isLoading = true;
    ApiResponse apiResponse = await zapexRepo!.getProductDetail(productId);

    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      _product = ProductModel.fromZapexProductDetailJson(
              apiResponse.response!.data, context)
          .product;
      _rating = _product!.averageRating;
      _quantity = 1;
      _imageSliderIndex = 0;

      _shippingType = ShippingType.express;
      // _tier = 1;
      _isLoading = false;

      _images = [];
      _varients = [];

      _product!.prop_obj!.entries.toList().asMap().forEach((index, val) {
        Map dvv = val.value;
        List<dynamic> dynamicList = dvv.values.toList();
        List<Details> valu = dynamicList.cast<Details>();
        valu.forEach((Details v) {
          String image = v.pic_url!.trim();
          String variantText = v.value!.trim();

          if (image != '' && image != null) {
            String keys = "${v.prop_key! + ":" + v.prop_val!}";
            String? valueName = v.value;
            int ind = index;

            _images.add([image, keys, valueName, ind]);
          }

          if (variantText != '' && variantText != null) {
            _varients.add(variantText);
          }
        });
      });

      _varient_detail_string = _product!.prop_obj!.entries
          .map((val) {
            Map dvv = val.value;
            List<dynamic> dynamicList = dvv.values.toList();
            List<Details> valu = dynamicList.cast<Details>();
            String? categoryName = valu[0].name;

            return '${valu.length} ${categoryName}${valu.length > 0 ? 's' : ''}';
          })
          .toList()
          .join(',');
      _images = images as List<List<dynamic>>;
      _varients = varients as List<String>;

      if (_product!.provider == 'quickSales' ||
          _product!.provider == "freeShipping") {
        // https://kachuwa.com/free-shipping/ccf727ca-4b57-4219-8a60-e6caf63d6d5d/
        _sharableLink =
            "${AppConstants.BASE_URL_NEW}/${_product!.provider}/${_product!.id}";
      } else {
        _sharableLink =
            "${AppConstants.BASE_URL_NEW}/product/${_product!.id}-${_product!.provider != null ? _product!.provider : 'old'}";
      }
    } else {
      ApiChecker.checkApi(context, apiResponse);
      if (apiResponse.error.toString() ==
          'Connection to API server failed due to internet connection') {
        _hasConnection = false;
      }
      _isLoading = false;
    }
    notifyListeners();
  }

  Future<void> initProduct(Product product, BuildContext context) async {
    _hasConnection = true;
    _variantIndex = 0;
    ApiResponse reviewResponse =
        await productDetailsRepo!.getReviews(product.id.toString());
    if (reviewResponse.response != null &&
        reviewResponse.response!.statusCode == 200) {
      Provider.of<BannerProvider>(context, listen: false)
          .getProductDetails(context, product.slug.toString());
      _reviewList = [];
      reviewResponse.response!.data.forEach(
          (reviewModel) => _reviewList!.add(ReviewModel.fromJson(reviewModel)));
      _imageSliderIndex = 0;
      _quantity = 1;
    } else {
      ApiChecker.checkApi(context, reviewResponse);
      if (reviewResponse.error.toString() ==
          'Connection to API server failed due to internet connection') {
        _hasConnection = false;
      }
    }
    notifyListeners();
  }

  void initData(Product product) {
    _variantIndex = 0;
    _quantity = 1;
    _variationIndex = [];
    product.choiceOptions!.forEach((element) => _variationIndex!.add(0));
  }

  void removePrevReview() {
    _reviewList = null;
    _sharableLink = null;
  }

  void getCount(String productID, BuildContext context) async {
    ApiResponse apiResponse = await productDetailsRepo!.getCount(productID);
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      _orderCount = apiResponse.response!.data['order_count'];
      _wishCount = apiResponse.response!.data['wishlist_count'];
    } else {
      ApiChecker.checkApi(context, apiResponse);
    }
    notifyListeners();
  }

  // void getSharableLink(
  //     String productID, String provider, BuildContext context) async {
  //   // ApiResponse apiResponse =
  //   //     await productDetailsRepo.getSharableLink(productID);
  //   // if (apiResponse.response != null &&
  //   //     apiResponse.response.statusCode == 200) {
  //   //   _sharableLink = apiResponse.response.data;
  //   // } else {
  //   //   ApiChecker.checkApi(context, apiResponse);
  //   // }

  //   print(_sharableLink);
  //   print('99999999999999999999999999999999999');
  // }

  void setErrorText(String? error) {
    _errorText = error;
    notifyListeners();
  }

  void removeData() {
    _errorText = null;
    _rating = 0;
    notifyListeners();
  }

  void setImageSliderSelectedIndex(int selectedIndex) {
    _imageSliderIndex = selectedIndex;
    notifyListeners();
  }

  void changeWish() {
    _wish = !_wish;
    notifyListeners();
  }

  void setQuantity(int value) {
    _quantity = value;
    notifyListeners();
  }

  void setCartVariantIndex(int index) {
    _variantIndex = index;
    _quantity = 1;
    notifyListeners();
  }

  void setCartVariationIndex(int index, int i) {
    _variationIndex![index] = i;
    _quantity = 1;
    notifyListeners();
  }

  void setRating(double rate) {
    _rating = rate;
    notifyListeners();
  }

  Future<ResponseModel> submitReview(
      ReviewBody reviewBody, List<File> files, String token) async {
    _isLoading = true;
    notifyListeners();

    http.StreamedResponse response =
        await productDetailsRepo!.submitReview(reviewBody, files, token);
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      _rating = 0;
      responseModel = ResponseModel('Review submitted successfully', true);
      _errorText = null;
      notifyListeners();
    } else {
      print('${response.statusCode} ${response.reasonPhrase}');
      responseModel = ResponseModel(
          '${response.statusCode} ${response.reasonPhrase}', false);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }
}
