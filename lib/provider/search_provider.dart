import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/base/api_response.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/product_model.dart';
import 'package:flutter_sixvalley_ecommerce/data/repository/api/zapex_repo.dart';
import 'package:flutter_sixvalley_ecommerce/data/repository/search_repo.dart';
import 'package:flutter_sixvalley_ecommerce/helper/api_checker.dart';

class SearchProvider with ChangeNotifier {
  final SearchRepo? searchRepo;
  final ZapexRepo? zapexRepo;
  SearchProvider({required this.searchRepo, required this.zapexRepo});

  int _filterIndex = 0;
  List<String> _historyList = [];

  int _moreForYouPage = 0;
  bool _moreForYouLoading = false;

  bool get moreForYouLoading => _moreForYouLoading;

  int get filterIndex => _filterIndex;
  List<String> get historyList => _historyList;
  int get moreForYouPage => _moreForYouPage;

  void setFilterIndex(int index) {
    _filterIndex = index;
    notifyListeners();
  }

  void sortSearchList(double startingPrice, double endingPrice) {
    _searchProductList = [];
    if (startingPrice > 0 && endingPrice > startingPrice) {
      _searchProductList!.addAll(_filterProductList!
          .where((product) =>
              product.unitPrice! > startingPrice &&
              product.unitPrice! < endingPrice)
          .toList());
    } else {
      _searchProductList!.addAll(_filterProductList!);
    }

    if (_filterIndex == 0) {
    } else if (_filterIndex == 1) {
      _searchProductList!.sort(
          (a, b) => a.name!.toLowerCase().compareTo(b.name!.toLowerCase()));
    } else if (_filterIndex == 2) {
      _searchProductList!.sort(
          (a, b) => a.name!.toLowerCase().compareTo(b.name!.toLowerCase()));
      Iterable iterable = _searchProductList!.reversed;
      _searchProductList = iterable.toList() as List<Product>?;
    } else if (_filterIndex == 3) {
      _searchProductList!.sort((a, b) => a.unitPrice!.compareTo(b.unitPrice!));
    } else if (_filterIndex == 4) {
      _searchProductList!.sort((a, b) => a.unitPrice!.compareTo(b.unitPrice!));
      Iterable iterable = _searchProductList!.reversed;
      _searchProductList = iterable.toList() as List<Product>?;
    }

    notifyListeners();
  }

  List<Product>? _moreForYou = [];
  List<Product>? _searchProductList = [];
  int? _totalSize;
  List<Product>? _filterProductList = [];
  bool _isClear = true;
  String _searchText = '';

  List<String>? _cameraImageBottomSheet = [];

  List<Product>? get moreForYou => _moreForYou;
  List<Product>? get searchProductList => _searchProductList;
  List<Product>? get filterProductList => _filterProductList;
  int? get totalSize => _totalSize;
  bool get isClear => _isClear;
  String get searchText => _searchText;

  void setSearchText(String text) {
    _searchText = text;
    notifyListeners();
  }

  void cleanSearchProduct() {
    _searchProductList = [];
    _isClear = true;
    _searchText = '';
    notifyListeners();
  }

  Future<void> searchProduct(
      String query, int page, BuildContext context) async {
    _searchText = query;
    _isClear = false;
    _totalSize = 0;
    if (page == 1) {
      _searchProductList = null;
      _filterProductList = null;
    }

    notifyListeners();

    // ApiResponse apiResponse = await searchRepo.getSearchProductList(query);
    ApiResponse apiResponse = await zapexRepo!.searchKeyword(query, page);
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      if (query.isEmpty) {
        if (page == 1) {
          _searchProductList = [];
          _filterProductList = [];
        }
      } else {
        if (page == 1) {
          _searchProductList = [];
          _filterProductList = [];
        }

        ProductModel productModel = ProductModel.fromZapexKeywordSearchJson(
            apiResponse.response!.data, context);

        _totalSize = productModel.totalSize;

        _searchProductList!.addAll(productModel.products!);

        _filterProductList!.addAll(productModel.products!);

        print(_searchProductList);
      }
    } else {
      ApiChecker.checkApi(context, apiResponse);
    }
    notifyListeners();
  }

  Future<void> searchImage(String imagePath, BuildContext context) async {
    _searchProductList = null;
    _filterProductList = null;

    notifyListeners();

    ApiResponse apiResponse =
        await zapexRepo!.searchImage(imagePath, imageType: "URL");
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      _searchProductList = [];
      _filterProductList = [];
      ProductModel productModel = ProductModel.fromZapexImageSearchJson(
          apiResponse.response!.data, context);

      _totalSize = productModel.totalSize;

      _searchProductList!.addAll(productModel.products!);

      _filterProductList!.addAll(productModel.products!);
    } else {
      ApiChecker.checkApi(context, apiResponse);
    }
    notifyListeners();

    // if (response.statusCode == 200) {
    //   var _data = response.data;

    //   var innerData = _data["data"];

    //   var totalCount = _data['data']['totalCount'];
    //   var items = _data['data']['items'];
    // }
    // print('gggggggggggggggggggggggggggg');
  }

  void initHistoryList() {
    _historyList = [];
    _historyList.addAll(searchRepo!.getSearchAddress());
    notifyListeners();
  }

  void saveSearchAddress(String searchAddress) async {
    searchRepo!.saveSearchAddress(searchAddress);
    if (!_historyList.contains(searchAddress)) {
      _historyList.add(searchAddress);
    }
    notifyListeners();
  }

  void clearSearchAddress() async {
    searchRepo!.clearSearchAddress();
    _historyList = [];
    notifyListeners();
  }

  void initCameraBottomSheet(BuildContext context) async {
    ApiResponse apiResponse = await searchRepo!.getAllCameraBottomSheet();

    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      _cameraImageBottomSheet = [];

      ProductModel productModel = ProductModel.fromZapexImageSearchJson(
          apiResponse.response!.data, context);

      _totalSize = productModel.totalSize;

      _searchProductList!.addAll(productModel.products!);

      _filterProductList!.addAll(productModel.products!);
    } else {
      ApiChecker.checkApi(context, apiResponse);
    }
  }

  Future<List<Product>> getMoreForYou(int page, BuildContext context) async {
    print(page);
    initHistoryList();
    var _histroy = _historyList;
    List<Product> _moreForYouInside = [];
    if (_histroy.length >= 3) {
      String _first = _histroy[0];
      String _second = _histroy[1];
      String _third = _histroy[3];

      List<ApiResponse> apiResponses = await Future.wait([
        zapexRepo!.searchKeyword(_first, page),
        zapexRepo!.searchKeyword(_second, page),
        zapexRepo!.searchKeyword(_third, page)
      ]);

      if (apiResponses[0].response != null &&
          apiResponses[0].response!.statusCode == 200) {
        ProductModel productModel = ProductModel.fromZapexImageSearchJson(
            apiResponses[0].response!.data, context);
        _moreForYouInside.addAll(productModel.products!);
      }

      if (apiResponses[1].response != null &&
          apiResponses[1].response!.statusCode == 200) {
        ProductModel productModel = ProductModel.fromZapexImageSearchJson(
            apiResponses[1].response!.data, context);
        _moreForYouInside.addAll(productModel.products!);
      }

      if (apiResponses[2].response != null &&
          apiResponses[2].response!.statusCode == 200) {
        ProductModel productModel = ProductModel.fromZapexImageSearchJson(
            apiResponses[2].response!.data, context);
        _moreForYouInside.addAll(productModel.products!);
      }
    } else if (_historyList.length == 2) {
      String _first = _histroy[0];
      String _second = _histroy[1];
      List<ApiResponse> apiResponses = await Future.wait([
        zapexRepo!.searchKeyword(_first, page),
        zapexRepo!.searchKeyword(_second, page),
      ]);

      if (apiResponses[0].response != null &&
          apiResponses[0].response!.statusCode == 200) {
        ProductModel productModel = ProductModel.fromZapexImageSearchJson(
            apiResponses[0].response!.data, context);
        _moreForYouInside.addAll(productModel.products!);
      }

      if (apiResponses[1].response != null &&
          apiResponses[1].response!.statusCode == 200) {
        ProductModel productModel = ProductModel.fromZapexImageSearchJson(
            apiResponses[1].response!.data, context);
        _moreForYouInside.addAll(productModel.products!);
      }
    } else if (_historyList.length == 1) {
      String _first = _histroy[0];
      ApiResponse apiResponse = await zapexRepo!.searchKeyword(_first, page);

      if (apiResponse.response != null &&
          apiResponse.response!.statusCode == 200) {
        ProductModel productModel = ProductModel.fromZapexImageSearchJson(
            apiResponse.response!.data, context);
        _moreForYouInside.addAll(productModel.products!);
      }
    } else {
      String _first = "Nepal";
      ApiResponse apiResponse = await zapexRepo!.searchKeyword(_first, page);

      if (apiResponse.response != null &&
          apiResponse.response!.statusCode == 200) {
        ProductModel productModel = ProductModel.fromZapexImageSearchJson(
            apiResponse.response!.data, context);
        _moreForYouInside.addAll(productModel.products!);
      }
    }

    return _moreForYouInside;
  }

  Future<void> initUserInterest(BuildContext context) async {
    _moreForYouLoading = true;
    notifyListeners();
    var _moreForYouInside = await getMoreForYou(1, context);
    _moreForYou = _moreForYouInside..shuffle();
    _moreForYouPage = 1;
    _moreForYouLoading = false;
    notifyListeners();
  }

  Future<void> addMoreForYou(BuildContext context) async {
    _moreForYouLoading = true;
    var _moreForYouInside = await getMoreForYou(_moreForYouPage++, context);
    _moreForYou!.addAll(_moreForYouInside..shuffle());

    _moreForYouPage = _moreForYouPage++;
    _moreForYouLoading = false;
    notifyListeners();
  }
}
