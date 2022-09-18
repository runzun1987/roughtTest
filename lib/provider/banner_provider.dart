import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/banner_model.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/base/api_response.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/product_model.dart';
import 'package:flutter_sixvalley_ecommerce/data/repository/banner_repo.dart';
import 'package:flutter_sixvalley_ecommerce/helper/api_checker.dart';
import 'package:flutter_sixvalley_ecommerce/models/ModelProvider.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/show_custom_snakbar.dart';

class BannerProvider extends ChangeNotifier {
  final BannerRepo? bannerRepo;

  BannerProvider({required this.bannerRepo});

  List<quickSale>? _mainBannerList;
  List<quickSale>? _footerBannerList;
  List<quickSale>? _mainSectionBannerList;
  // Product? _product;
  int? _currentIndex;

  List<quickSale>? get mainBannerList => _mainBannerList;
  List<quickSale>? get footerBannerList => _footerBannerList;
  List<quickSale>? get mainSectionBannerList => _mainSectionBannerList;
  // Product? get product => _product;
  int? get currentIndex => _currentIndex;

  List _moreToLove = [
    {
      "title": "Title one sadf asd fas sadf",
      "image":
          "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg",
      "link": ""
    },
    {
      "title": "Title two asdf s dfas df",
      "image":
          "https://preview.redd.it/8khwmgnzk7n71.jpg?auto=webp&s=842f15d7dbcf771c1c191a922eac6f72c4975cdd",
      "link": ""
    },
    {
      "title": "Title three asdf asd sdf",
      "image":
          "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg",
      "link": ""
    },
    {
      "title": "Title four asdf s df",
      "image":
          "https://preview.redd.it/8khwmgnzk7n71.jpg?auto=webp&s=842f15d7dbcf771c1c191a922eac6f72c4975cdd",
      "link": ""
    },
    {
      "title": "Title five sd f",
      "image":
          "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg",
      "link": ""
    },
    {
      "title": "Title six",
      "image":
          "https://preview.redd.it/8khwmgnzk7n71.jpg?auto=webp&s=842f15d7dbcf771c1c191a922eac6f72c4975cdd",
      "link": ""
    }
  ];

  List<dynamic> get moreToLoveTop => _moreToLove;

  Future<void> getBannerList(bool reload, BuildContext context) async {
    // if (_mainBannerList == null || reload) {
    //   ApiResponse apiResponse = await bannerRepo!.getBannerList();
    //   if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
    //     _mainBannerList = [];
    //     apiResponse.response!.data.forEach((quickSale) => _mainBannerList!.add(quickSale.fromJson(quickSale)));
    //     _currentIndex = 0;
    //     notifyListeners();
    //   } else {
    //     ApiChecker.checkApi(context, apiResponse);
    //   }
    // }

    if (_mainBannerList == null || reload) {
      ApiResponse apiResponse = await bannerRepo!.getBannerList();
      if (apiResponse.response != null &&
          apiResponse.response!.statusCode == 200) {
        _mainBannerList = [];
        apiResponse.response!.data
            .forEach((qS) => _mainBannerList!.add(quickSale.fromJson(qS)));

        _currentIndex = 0;
        notifyListeners();
      } else {
        ApiChecker.checkApi(context, apiResponse);
      }
    }
  }

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  Future<void> getFooterBannerList(BuildContext context) async {
    ApiResponse apiResponse = await bannerRepo!.getFooterBannerList();
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      _footerBannerList = [];
      apiResponse.response!.data.forEach(
          (quickSale) => _footerBannerList!.add(quickSale.fromJson(quickSale)));
      notifyListeners();
    } else {
      ApiChecker.checkApi(context, apiResponse);
    }
  }

  Future<void> getMainSectionBanner(BuildContext context) async {
    ApiResponse apiResponse = await bannerRepo!.getMainSectionBannerList();
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      _mainSectionBannerList = [];
      apiResponse.response!.data.forEach((quickSale) =>
          _mainSectionBannerList!.add(quickSale.fromJson(quickSale)));
      notifyListeners();
    } else {
      ApiChecker.checkApi(context, apiResponse);
    }
  }

  void getProductDetails(BuildContext context, String productId) async {
    // ApiResponse apiResponse = await bannerRepo!.getProductDetails(productId);
    // if (apiResponse.response != null &&
    //     apiResponse.response!.statusCode == 200) {
    //   _product = (Product.fromJson(apiResponse.response!.data));
    // } else {
    //   showCustomSnackBar(apiResponse.error.toString(), context);
    // }
  }
}
