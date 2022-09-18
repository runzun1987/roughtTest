import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/body/selected_shipping_type.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/base/api_response.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/base/error_response.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/cart_model.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/chosen_shipping_method.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/product_model.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/response_model.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/shipping_method_model.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/shipping_model.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/user_info_model.dart';
import 'package:flutter_sixvalley_ecommerce/data/repository/cart_repo.dart';
import 'package:flutter_sixvalley_ecommerce/helper/api_checker.dart';
import 'package:flutter_sixvalley_ecommerce/provider/profile_provider.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as developer;

import '../models/Cart.dart';
import '../models/Details.dart';
import '../models/ProductInfo.dart';
import '../utill/shipping_cost_and_estimated_delivery.dart';
import 'auth_provider.dart';

class CartProvider extends ChangeNotifier {
  final CartRepo? cartRepo;
  CartProvider({required this.cartRepo});
  // String _cartId;

  // List<ProductInfo> _cartList = [];
  List<ChosenShippingMethodModel> _chosenShippingList = [];
  List<ChosenShippingMethodModel> get chosenShippingList => _chosenShippingList;
  List<ShippingModel>? _shippingList;
  List<ShippingModel>? get shippingList => _shippingList;
  List<bool> _isSelectedList = [];
  double _amount = 0.0;
  bool _isSelectAll = true;
  bool _isLoading = false;
  Cart? _cart;
  String? _updateQuantityErrorText;
  String? get addOrderStatusErrorText => _updateQuantityErrorText;
  bool _getData = true;

  // List<ProductInfo> get cartList => _cartList;
  // List<ShippingMethodModel> get shippingMethodList => _shippingMethodList;
  List<bool> get isSelectedList => _isSelectedList;
  // String get cartId => _cartId;
  double get amount => _amount;
  bool get isAllSelect => _isSelectAll;
  bool get isLoading => _isLoading;
  bool get getData => _getData;
  Cart? get cart => _cart;

  List<int> _chosenShippingMethodIndex = [];
  List<int> get chosenShippingMethodIndex => _chosenShippingMethodIndex;

  // double get getGrandTotal {
  //   int grandTotal = 0;

  //   for (int i = 0; i < _cart.items.length; i++) {
  //     grandTotal += (_cart.items[i].price * _cart.items[i].qty) +
  //         ShippingCostAndEstimatedDelivery.sumOfShipping(
  //           _cart.items[i].provider,
  //           _cart.items[i].sellerPrice,
  //           _cart.items[i].price,
  //           _cart.items[i].shippingType,
  //           _cart.items[i].tier,
  //           _cart.items[i].qty,
  //         );
  //   }

  //   return double.parse(grandTotal.toString());
  // }

  // double get getTotalItemCost {
  //   int grandTotal = 0;

  //   for (int i = 0; i < _cart.items.length; i++) {
  //     grandTotal += (_cart.items[i].price * _cart.items[i].qty);
  //   }

  //   return double.parse(grandTotal.toString());
  // }

  // double get getTotalShippingCost {
  //   int grandTotal = 0;

  //   for (int i = 0; i < _cart.items.length; i++) {
  //     grandTotal += ShippingCostAndEstimatedDelivery.sumOfShipping(
  //       _cart.items[i].provider,
  //       _cart.items[i].sellerPrice,
  //       _cart.items[i].price,
  //       _cart.items[i].shippingType,
  //       _cart.items[i].tier,
  //       _cart.items[i].qty,
  //     );
  //   }

  //   return double.parse(grandTotal.toString());
  // }

  void getCartData() {
    // _cartList = [];
    // _isSelectedList = [];
    // _isSelectAll = true;

    print(cartRepo!.getCartList());

    _cart = Cart(items: cartRepo!.getCartList(), userName: "unKnown");
    // _cartList.addAll();
    // _cartList.forEach((cart) {
    //   _isSelectedList.add(true);
    //   _amount = _amount + (cart.discountedPrice * cart.quantity);
    // });
  }

  void addToCart(ProductInfo cart) {
    List<ProductInfo> _items = [..._cart!.items!];

    _items.add(cart);
    // _isSelectedList.add(true);
    cartRepo!.addToCartList(_items);
    _cart = Cart(items: cartRepo!.getCartList(), userName: "unKnown");

    // _amount = _amount + (cart.discountedPrice * cart.quantity);
    notifyListeners();
  }

  void replaceCartListItem(ProductInfo cart, int index) {
    List<ProductInfo> _cloned = [..._cart!.items!];
    _cloned[index] = cart;
    cartRepo!.addToCartList(_cloned);
    notifyListeners();
  }

  void removeFromCart(int index) {
    // if(_isSelectedList[index]) {
    //   _amount = _amount - (_cartList[index].discountedPrice * _cartList[index].quantity);
    // }
    List<ProductInfo> _items = [..._cart!.items!];
    _items.removeAt(index);
    // _isSelectedList.removeAt(index);
    cartRepo!.addToCartList(_items);
    _cart = Cart(items: _items, userName: "unKnown");
    notifyListeners();
  }

  List<dynamic> isAddedInCart(String id, String skuId) {
    for (int i = 0; i < _cart!.items!.length; i++) {
      if (_cart!.items![i].productId == id) {
        if (_cart!.items![i].skuId == skuId) {
          return [true, i];
        }
      }
    }
    return [false, -1];
    // for (ProductInfo cartModel in _cartList) {
    //   if (cartModel.productId == id) {
    //     if (cartModel.skuId == skuId) {
    //       return true;
    //     }
    //   }
    // }
    // return false;
  }

  void removeCheckoutProduct(List<CartModel> carts) {
    // carts.forEach((cart) {
    //   _amount = _amount - (cart.discountedPrice * cart.quantity);
    //   _cartList.removeWhere((cartModel) => cartModel.id == cart.id);
    //   _isSelectedList.removeWhere((selected) => selected);
    // });
    // cartRepo.addToCartList(_cartList);
    // notifyListeners();
  }

  void setCartData() {
    _getData = true;
  }

  Future<void> getCartDataAPI(BuildContext? context, String? userPhone) async {
    // print(Provider.of<ProfileProvider>(context, listen: false));
    // String userPhone = Provider.of<ProfileProvider>(context, listen: false)
    //     .userInfoModel
    //     .phone;
    _isLoading = true;

    notifyListeners();
    ApiResponse apiResponse = await cartRepo!.getCartListData(userPhone);
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      _cart = Cart.fromJson(apiResponse.response!.data);

      // _cartList = [];
      // _cartId = apiResponse.response.data["id"];

      // apiResponse.response.data["items"].forEach(
      //   (cart) => _cartList.add(
      //     ProductInfo.fromJson(cart),
      //   ),
      // );
    } else {
      ApiChecker.checkApi(context, apiResponse);
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<ResponseModel> updateCartProductQuantity(
    Cart updatedCart,
    BuildContext? context,
  ) async {
    // _isLoading = true;
    notifyListeners();
    ResponseModel responseModel;
    ApiResponse apiResponse;
    apiResponse = await cartRepo!.updateQuantity(
      updatedCart,
    );
    // _isLoading = false;

    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      // String message = apiResponse.response.data['message'].toString();
      String message = "Successful";
      responseModel = ResponseModel(message, true);
      await getCartDataAPI(
        context,
        cart!.phoneNumber,
      );
    } else {
      String? errorMessage = apiResponse.error.toString();
      if (apiResponse.error is String) {
        print(apiResponse.error.toString());
        errorMessage = apiResponse.error.toString();
      } else {
        ErrorResponse errorResponse = apiResponse.error;
        print(errorResponse.errors![0].message);
        errorMessage = errorResponse.errors![0].message;
      }
      _updateQuantityErrorText = errorMessage;
      responseModel = ResponseModel(errorMessage, false);
    }
    notifyListeners();
    return responseModel;
  }

  void setQuantity(bool isIncrement, int index) {
    // if (isIncrement) {
    //   _cartList[index].quantity = _cartList[index].quantity + 1;
    //   _isSelectedList[index] ? _amount = _amount + _cartList[index].discount : _amount = _amount;
    // } else {
    //   _cartList[index].quantity = _cartList[index].quantity - 1;
    //   _isSelectedList[index] ? _amount = _amount - _cartList[index].discount : _amount = _amount;
    // }
    // cartRepo.addToCartList(_cartList);
    // notifyListeners();
  }

  void toggleSelected(int index) {
    // _isSelectedList[index] = !_isSelectedList[index];
    // _amount = 0.0;
    // for (int i = 0; i < _isSelectedList.length; i++) {
    //   if (_isSelectedList[i]) {
    //     _amount = _amount + (_cartList[i].discount * _cartList[index].quantity);
    //   }
    // }

    // _isSelectedList.forEach((isSelect) => isSelect ? null : _isSelectAll = false);

    // notifyListeners();
  }

  void toggleAllSelect() {
    // _isSelectAll = !_isSelectAll;

    // if (_isSelectAll) {
    //   _amount = 0.0;
    //   for (int i = 0; i < _isSelectedList.length; i++) {
    //     _isSelectedList[i] = true;
    //     _amount = _amount + (_cartList[i].discount * _cartList[i].quantity);
    //   }
    // } else {
    //   _amount = 0.0;
    //   for (int i = 0; i < _isSelectedList.length; i++) {
    //     _isSelectedList[i] = false;
    //   }
    // }

    // notifyListeners();
  }

  Future<void> addToCartAPI(
    ProductInfo cart,
    Function callback,
    UserInfoModel user,
    bool? isRoute,
    BuildContext context,
    GlobalKey<ScaffoldMessengerState>? scaffoldKey,
  ) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await cartRepo!.addToCartListData(user, cart);

    _isLoading = false;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Cart? cart = apiResponse.response!.data;

      _cart = cart;

      String message = 'Successfully added';

      if (isRoute!) {
        print(callback);
        print('9999999999999999999999999999999');
        callback(true, message, context, scaffoldKey);
      } else {
        callback(false, message, context, scaffoldKey);
      }
      // getCartDataAPI(context);
      notifyListeners();
    } else {
      String? errorMessage;
      if (apiResponse.error is String) {
        print(apiResponse.error.toString());
        errorMessage = apiResponse.error.toString();
      } else {
        ErrorResponse errorResponse = apiResponse.error;
        print(errorResponse.errors![0].message);
        errorMessage = errorResponse.errors![0].message;
      }
      callback(false, errorMessage);
      notifyListeners();
    }
  }

  Future<ResponseModel> removeFromCartAPI(
    Cart cart,
    int index,
    String? userPhone,
    BuildContext context,
  ) async {
    _isLoading = true;
    notifyListeners();
    ResponseModel responseModel;
    ApiResponse apiResponse;
    apiResponse = await cartRepo!.removeFromCart(cart, index);
    getCartDataAPI(context, userPhone);
    _isLoading = false;

    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      String message = apiResponse.response!.data.toString();
      responseModel = ResponseModel(message, true);
      getCartDataAPI(context, userPhone);
      // getChosenShippingMethod(context);
    } else {
      String? errorMessage = apiResponse.error.toString();
      if (apiResponse.error is String) {
        print(apiResponse.error.toString());
        errorMessage = apiResponse.error.toString();
      } else {
        ErrorResponse errorResponse = apiResponse.error;
        print(errorResponse.errors![0].message);
        errorMessage = errorResponse.errors![0].message;
      }
      _updateQuantityErrorText = errorMessage;
      responseModel = ResponseModel(errorMessage, false);
    }
    notifyListeners();
    return responseModel;
  }

  void getShippingMethod(
      BuildContext context, List<List<CartModel>> cartProdList) async {
    // print('-------$_getData');
    // _isLoading = true;
    // _getData = false;
    // List<int> sellerIdList = [];
    // List<String> sellerTypeList = [];
    // List<String> groupList = [];
    // _shippingList = [];
    // cartProdList.forEach((element) {
    //   sellerIdList.add(element[0].sellerId);
    //   sellerTypeList.add(element[0].sellerIs);
    //   groupList.add(element[0].cartGroupId);
    //   _shippingList.add(ShippingModel(-1, element[0].cartGroupId, []));
    // });
    // await getChosenShippingMethod(context);
    // for(int i=0; i<sellerIdList.length; i++) {
    //   ApiResponse apiResponse = await cartRepo.getShippingMethod(sellerIdList[i],sellerTypeList[i] );

    //   if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
    //     List<ShippingMethodModel> _shippingMethodList =[];
    //     apiResponse.response.data.forEach((shipping) => _shippingMethodList.add(ShippingMethodModel.fromJson(shipping)));

    //     _shippingList[i].shippingMethodList =[];
    //     _shippingList[i].shippingMethodList.addAll(_shippingMethodList);
    //     int _index = -1;
    //     int _shipId = -1;
    //     for(ChosenShippingMethodModel cs in _chosenShippingList) {
    //       if(cs.cartGroupId == groupList[i]) {
    //         _shipId = cs.shippingMethodId;
    //         break;
    //       }
    //     }
    //     if(_shipId != -1) {
    //       for(int j=0; j<_shippingList[i].shippingMethodList.length; j++) {
    //         if(_shippingList[i].shippingMethodList[j].id == _shipId) {
    //           _index = j;
    //           break;
    //         }
    //       }
    //     }
    //     _shippingList[i].shippingIndex = _index;
    //   } else {
    //     ApiChecker.checkApi(context, apiResponse);
    //   }
    //   _isLoading = false;
    //   notifyListeners();
    // }
  }

  void getAdminShippingMethodList(BuildContext context) async {
    _isLoading = true;
    _getData = false;
    _shippingList = [];
    await getChosenShippingMethod(context);
    ApiResponse apiResponse = await cartRepo!.getShippingMethod(1, 'admin');
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      _shippingList!.add(ShippingModel(-1, '', []));
      List<ShippingMethodModel> _shippingMethodList = [];
      apiResponse.response!.data.forEach((shipping) =>
          _shippingMethodList.add(ShippingMethodModel.fromJson(shipping)));

      _shippingList![0].shippingMethodList = [];
      _shippingList![0].shippingMethodList!.addAll(_shippingMethodList);
      int _index = -1;

      if (_chosenShippingList.length > 0) {
        for (int j = 0; j < _shippingList![0].shippingMethodList!.length; j++) {
          if (_shippingList![0].shippingMethodList![j].id ==
              _chosenShippingList[0].shippingMethodId) {
            _index = j;
            break;
          }
        }
      }

      _shippingList![0].shippingIndex = _index;
    } else {
      ApiChecker.checkApi(context, apiResponse);
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> getChosenShippingMethod(BuildContext context) async {
    ApiResponse apiResponse = await cartRepo!.getChosenShippingMethod();
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      _chosenShippingList = [];
      apiResponse.response!.data.forEach((shipping) => _chosenShippingList
          .add(ChosenShippingMethodModel.fromJson(shipping)));
      notifyListeners();
    } else {
      ApiChecker.checkApi(context, apiResponse);
    }
    notifyListeners();
  }

  void setSelectedShippingMethod(int? index, int sellerIndex) {
    _shippingList![sellerIndex].shippingIndex = index;
    notifyListeners();
  }

  void initShippingMethodIndexList(int length) {
    _shippingList = [];
    for (int i = 0; i < length; i++) {
      _shippingList!.add(ShippingModel(0, '', null));
    }
  }

  Future addShippingMethod(BuildContext context, int? id, String? cartGroupId,
      Function callback) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse =
        await cartRepo!.addShippingMethod(id, cartGroupId);
    _isLoading = false;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      //Map map = await jsonDecode(apiResponse.response.data);
      //json.decode(apiResponse.response.data);

      getChosenShippingMethod(context);
      //String message = map["message"];
      callback(true, '');
      notifyListeners();
    } else {
      String? errorMessage;
      if (apiResponse.error is String) {
        print(apiResponse.error.toString());
        errorMessage = apiResponse.error.toString();
      } else {
        ErrorResponse errorResponse = apiResponse.error;
        print(errorResponse.errors![0].message);
        errorMessage = errorResponse.errors![0].message;
      }
      callback(false, errorMessage);
      notifyListeners();
    }
  }

  Future<void> uploadToServer(
    BuildContext context,
    UserInfoModel? userInfo,
  ) async {
    if (cartRepo!.getCartList().length > 0) {
      for (int index = 0; index < cartRepo!.getCartList().length; index++) {
        // await addToCartAPI(
        //   cartRepo.getCartList()[index], (success, message) {}, context,
        //   cartRepo.getCartList()[index].choiceOptions, cartRepo.getCartList()[index].variationIndexes,
        // );

        ProductInfo _cart = cartRepo!.getCartList()[index];
        print(_cart);

        await addToCartAPI(
          _cart,
          (bool, message, context, scaffoldKey) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                duration: Duration(milliseconds: 2),
                content: Text("Cart updated"),
                backgroundColor: Colors.green));
          },
          userInfo!,
          false,
          context,
          null,
        );
        if (index == cartRepo!.getCartList().length - 1) {
          // _cartList = [];
          cartRepo!.addToCartList([]);
          notifyListeners();
        }
      }
    }
  }

  String? _selectedShippingType;
  String? get selectedShippingType => _selectedShippingType;

  List<SelectedShippingType> _selectedShippingTypeList = [];
  List<SelectedShippingType> get selectedShippingTypeList =>
      _selectedShippingTypeList;

  Future<void> getSelectedShippingType(
      BuildContext context, int sellerId, String sellerType) async {
    ApiResponse apiResponse =
        await cartRepo!.getSelectedShippingType(sellerId, sellerType);
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      _selectedShippingType = apiResponse.response!.data['shipping_type'];
      _selectedShippingTypeList.add(SelectedShippingType(
          sellerId: sellerId, selectedShippingType: _selectedShippingType));
    } else {
      ApiChecker.checkApi(context, apiResponse);
    }
    notifyListeners();
  }
}
