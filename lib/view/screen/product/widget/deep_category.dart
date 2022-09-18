import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_sixvalley_ecommerce/data/model/body/order_place_model.dart';
// import 'package:flutter_sixvalley_ecommerce/data/model/response/cart_model.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/product_model.dart';
// import 'package:flutter_sixvalley_ecommerce/models/ModelProvider.dart';
// import 'package:flutter_sixvalley_ecommerce/models/ModelProvider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/auth_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/cart_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/product_details_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/product_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/show_custom_snakbar.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/title_row.dart';

import 'package:nb_utils/nb_utils.dart';

import 'package:provider/provider.dart';

import '../../../../data/model/response/base/cities.dart';
import '../../../../data/model/response/user_info_model.dart';
import '../../../../provider/location_provider.dart';
import '../../../../provider/profile_provider.dart';
import '../../../../utill/shipping_cost_and_estimated_delivery.dart';
import '../../address/saved_address_list_screen.dart';
import '../../auth/auth_screen.dart';
import '../../cart/cart_screen.dart';
import '../../checkout/checkout_screen.dart';
import '../product_image_screen.dart';
import '/models/Details.dart';
import '/models/ProductInfo.dart';
import '/models/Cart.dart';

// import 'package:prokit_flutter/themes/theme2/utils/T2Colors.dart';
// import 'package:prokit_flutter/themes/theme2/utils/T2Strings.dart';

// import '../../../main.dart';

class DeepCategory {
  static void _route(
    bool isRoute,
    String message,
    BuildContext context,
    GlobalKey<ScaffoldMessengerState> scaffoldKey,
  ) async {
    if (message == '') {
      Navigator.pop(context);
    } else {
      if (isRoute) {
        if (scaffoldKey != null) {
          scaffoldKey.currentState!.showSnackBar(
              SnackBar(content: Text(message), backgroundColor: Colors.green));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message), backgroundColor: Colors.green));
        }

        Navigator.pop(context);
      } else {
        // Navigator.pop(context);
        if (scaffoldKey != null) {
          scaffoldKey.currentState!.showSnackBar(
              SnackBar(content: Text(message), backgroundColor: Colors.green));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message), backgroundColor: Colors.green));
        }
      }
    }
  }

  static Future<void> processAddToCart({
    required BuildContext context,
    required Product product,
    bool? isRoute,
    SelectionBuyNowOrAddToCart? selection,
    GlobalKey<ScaffoldMessengerState>? scaffoldKey,
  }) async {
    bool isGuestMode = !await Provider.of<AuthProvider>(context, listen: false)
        .isLoggedIn(context);
    int _qty =
        Provider.of<ProductDetailsProvider>(context, listen: false).quantity;

    int _price = Provider.of<ProductDetailsProvider>(context, listen: false)
        .getSkuPriceOnly()!
        .ceil();

    String _skuId =
        Provider.of<ProductDetailsProvider>(context, listen: false).getSkuId();

    List<Details> _details =
        Provider.of<ProductDetailsProvider>(context, listen: false)
            .getDetailArray() as List<Details>;

    int? _productId = product.id;
    String? _bigImageUrl = product.thumbnail;
    String? _title = product.name;
    double _sellerShippingPrice = product.shippingCost!;
    String? _provider = product.provider;

    int _sellingPrice = product.shippingCost!.ceil();
    int _ourPureShipping = 0;
    String _shippingStatus = 'Waiting to be confirmed';
    int _shippingcode = 0;
    bool _purchased = false;
    String _note = 'deliver asap';

    String _shippingType = "express";
    String _baseType = 'cartType';

    String? _city =
        await Provider.of<ProductDetailsProvider>(context, listen: false)
            .town(context);

    int _tier =
        await Provider.of<ProductDetailsProvider>(context, listen: false)
            .tier(context);

    int _shippingCost = ShippingCostAndEstimatedDelivery.sumOfShipping(
      _provider,
      _sellerShippingPrice.ceil(),
      _price,
      _shippingType,
      _tier,
      _qty,
    );

    String? _userPhone;
    String? _userName;
    UserInfoModel? _userInfo;

    if (!isGuestMode) {
      _userInfo =
          Provider.of<ProfileProvider>(context, listen: false).userInfoModel;
      _userPhone = _userInfo!.phone;
      _userName = _userInfo.id;
      _city = _userInfo.town;

      _tier = Cities.getTier(_userInfo.town);
      ;
      _shippingCost = ShippingCostAndEstimatedDelivery.sumOfShipping(
        _provider,
        _sellerShippingPrice.ceil(),
        _price,
        _shippingType,
        _tier,
        _qty,
      );
    }

    ProductInfo cart = ProductInfo(
      detail: _details,
      image: _bigImageUrl,
      price: _price,
      productId: _productId.toString(),
      qty: _qty,
      skuId: _skuId,
      sum: _price * _qty,
      title: _title,
      bigImageUrl: _bigImageUrl,
      city: _city,
      tier: _tier,
      shippingType: _shippingType,
      shippingCost: _shippingCost,
      sellerPrice: _sellingPrice,
      ourPureShipping: _ourPureShipping,
      shippingStatus: _shippingStatus,
      shippingCode: _shippingcode,
      purchased: _purchased,
      note: _note,
      provider: _provider,
    );

    void _routeToTrack(UserInfoModel userModel, BuildContext context) {
      // print('8888888888888888cccccccccccccccccccccccccccccccccccccc');
      // Cart _cart = Cart(
      //   userName: userModel.id,
      //   phoneNumber: userModel.phone,
      //   items: [cart],
      // );

      // Provider.of<CartProvider>(context, listen: false).setCartForBuyNow(_cart);
      // Timer(Duration(seconds: 10), () {
      //   print('4444444444444444');
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => CheckoutScreen(userInfo: userModel
      //           // totalOrderAmount: totalPrice,
      //           // shippingFee: shippingAmount,
      //           // discount: discount,
      //           // tax: tax,
      //           ),
      //     ),
      //   );
      // });

      Cart _cart = Cart(
        userName: userModel.id,
        phoneNumber: userModel.phone,
        items: [cart],
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => CheckoutScreen(
            cartReceived: _cart, userInfo: userModel, fromBuyNow: true,
            // totalOrderAmount: totalPrice,
            // shippingFee: shippingAmount,
            // discount: discount,
            // tax: tax,
          ),
        ),
      );
    }

    if (selection == SelectionBuyNowOrAddToCart.BUY_NOW) {
      if (isGuestMode) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AuthScreen(outRoute: _routeToTrack),
          ),
        );
      } else {
        //*********************************** */
        _routeToTrack(_userInfo!, context);
      }
    } else {
      int stock = Provider.of<ProductDetailsProvider>(context, listen: false)
          .getSkuStockOnly()!;

      if (stock > 0) {
        if (!isGuestMode) {
          Provider.of<CartProvider>(context, listen: false).addToCartAPI(
            cart,
            _route,
            _userInfo!,
            isRoute,
            context,
            scaffoldKey,
          );
        } else {
          List<dynamic> isAddedInCart =
              Provider.of<CartProvider>(context, listen: false)
                  .isAddedInCart(_productId.toString(), _skuId);

          if (!isAddedInCart[0]) {
            Provider.of<CartProvider>(context, listen: false).addToCart(cart);

            Navigator.pop(context);
            showCustomSnackBar('added_to_cart', context, isError: false);
          } else {
            Provider.of<CartProvider>(context, listen: false)
                .replaceCartListItem(cart, isAddedInCart[1]);
            Navigator.pop(context);
            showCustomSnackBar('already added', context, isError: false);
          }
        }
      } else {
        const String OUT_OF_STOCK_MESSAGE = "This product is out of stock";

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text(OUT_OF_STOCK_MESSAGE),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  static popUpCategory(
    BuildContext context,
    Map<String?, dynamic> prop_obj,
    String image,
    Product? product,
    SelectionBuyNowOrAddToCart? selection,
    GlobalKey<ScaffoldMessengerState> scaffoldKey,
    bool isLoggedin,
  ) {
    List images =
        Provider.of<ProductDetailsProvider>(context, listen: false).images;

    void valueHandler(
      String id,
      int position,
      String name,
      String imageUrl,
      bool isInt,
    ) {
      List emptyList =
          Provider.of<ProductDetailsProvider>(context, listen: false)
              .emptyList!;

      List clonedList = [...emptyList[position]];

      if (isInt) {
        var clonedList = [
          id,
          name,
          (imageUrl == null || imageUrl == '') ? null : imageUrl
        ];
        emptyList[position] = clonedList;
      } else {
        if (emptyList[position][0] == id) {
          clonedList = ['', '', null];
          emptyList[position] = clonedList;
        } else {
          var clonedList = [
            id,
            name,
            (imageUrl == null || imageUrl == '') ? null : imageUrl
          ];
          emptyList[position] = clonedList;
        }
      }

      Provider.of<ProductDetailsProvider>(context, listen: false)
          .setEmptyList(emptyList);

      // Map emptyMap =
      //     Provider.of<ProductDetailsProvider>(context, listen: false).emptyMap;

      // List availableKeys = emptyMap.keys.toList();

      // if ((availableKeys.contains(firstId)) & (emptyMap[firstId] == secondId)) {
      //   emptyMap.remove(firstId);

      //   Provider.of<ProductDetailsProvider>(context, listen: false).emptyMap = {
      //     ...emptyMap
      //   };
      // } else {
      //   emptyMap[firstId] = secondId;

      //   Provider.of<ProductDetailsProvider>(context, listen: false).emptyMap = {
      //     ...emptyMap
      //   };
      // }
    }

    //Auto select if only one selection

    var entries = prop_obj.entries.toList().asMap();
    entries.forEach((index, e) {
      var valus = e.value;

      if (valus.entries.length == 1) {
        valueHandler(
            "${valus.values.toList()[0].prop_key}:${valus.keys.toList()[0]}",
            index,
            "${valus.values.toList()[0].value}",
            "${valus.values.toList()[0].pic_url}",
            true);
      }
    });

    void addToCart(
      SelectionBuyNowOrAddToCart selection1,
      BuildContext context,
      Product? product,
      GlobalKey<ScaffoldMessengerState> _scaffoldKey,
    ) {
      List userVarientChoice =
          Provider.of<ProductDetailsProvider>(context, listen: false)
              .emptyList!;

      if (userVarientChoice[0].contains('')) {
        String cart_warning_message = 'Please select product option first!';
        // showCustomSnackBar(cart_warning_message, context, isError: false);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Container(
                decoration: BoxDecoration(
                    color: Colors.red,
                    border: Border.all(width: 2.0, color: Colors.black),
                    borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.fromLTRB(0, 0, 0, 55),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 20,
                    child: Center(
                      child: Text(
                        cart_warning_message,
                      ),
                    ),
                  ),
                )),
            backgroundColor: Colors.transparent,
            elevation: 1000,
          ),
        );
      } else {
        processAddToCart(
          context: context,
          product: product!,
          isRoute: true,
          selection: selection1,
          scaffoldKey: _scaffoldKey,
        );
      }
    }

    void onTap() {
      print('shipping Screen');
    }

    secondSheet(BuildContext aContext) {
      showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          isScrollControlled: true,
          enableDrag: false,
          builder: (BuildContext context) {
            return Scaffold(
              backgroundColor: Colors.transparent,
              body: DraggableScrollableSheet(
                initialChildSize: 0.90,
                maxChildSize: 1,
                minChildSize: 0.5,
                builder: (BuildContext ctx, ScrollController scrollController) {
                  dynamic price = Provider.of<ProductDetailsProvider>(
                    context,
                  ).getConditionalPrice();

                  return Container(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          child: Padding(
                            padding: EdgeInsets.only(top: 22),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(0, 30, 0, 20),
                              // color: t2_bg_bottom_sheet,
                              width: MediaQuery.of(context).size.width,
                              // height: 150,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(24),
                                  topRight: Radius.circular(24),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.35,
                                        child: FittedBox(
                                          fit: BoxFit.contain,
                                          child: Row(
                                            children: [
                                              Text(
                                                "Rs.",
                                                style: TextStyle(
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                              Text(
                                                price.toString(),
                                                style: boldTextStyle(
                                                  color: Colors.black,
                                                  fontStyle: FontStyle.normal,
                                                ),
                                              ),
                                              Text(
                                                "/piece",
                                                style: TextStyle(
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 10),
                                                // style: TextStyle(fontSize: 0.5),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.14,
                                      ),
                                      GestureDetector(
                                        onTap: () => finish(context),
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          child: FloatingActionButton(
                                            onPressed: () {
                                              // finish(context);
                                              _route(
                                                true,
                                                '',
                                                context,
                                                scaffoldKey,
                                              );
                                            },
                                            child: Icon(
                                              Icons.close,
                                              color: Colors.black,
                                            ),
                                            backgroundColor: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Expanded(
                                    child: ListView.builder(
                                      itemCount: prop_obj.entries.length + 1,
                                      itemBuilder: (ctx, idx) {
                                        bool isLast =
                                            idx == prop_obj.entries.length;
                                        late Map dvv;

                                        late List<Details> valus;
                                        late List keys;
                                        String? name;
                                        if (!isLast) {
                                          name = Provider.of<
                                              ProductDetailsProvider>(
                                            context,
                                          ).emptyList![idx][1];
                                        }

                                        if (!isLast) {
                                          var product =
                                              prop_obj.entries.toList()[idx];
                                          dvv = product.value;
                                          List<dynamic> dynamicList =
                                              dvv.values.toList();
                                          valus = dynamicList.cast<Details>();

                                          keys = dvv.keys.toList();
                                        }

                                        return !isLast
                                            ? Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.symmetric(
                                                        horizontal: Dimensions
                                                            .PADDING_SIZE_SMALL,
                                                        vertical: 0),
                                                    child: TitleRow(
                                                      title:
                                                          "${valus[0].name} : $name",
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.all(
                                                      Dimensions
                                                          .PADDING_SIZE_SMALL,
                                                    ),
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: GridView.builder(
                                                      physics:
                                                          NeverScrollableScrollPhysics(),
                                                      shrinkWrap: true,
                                                      gridDelegate:
                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: valus[0]
                                                                        .pic_url ==
                                                                    null ||
                                                                valus[0].pic_url ==
                                                                    ''
                                                            ? 3
                                                            : 5,
                                                        crossAxisSpacing: 5.0,
                                                        mainAxisSpacing: 5.0,
                                                        childAspectRatio: valus[
                                                                            0]
                                                                        .pic_url ==
                                                                    null ||
                                                                valus[0].pic_url ==
                                                                    ''
                                                            ? 5 / 1.5
                                                            : 3 / 2.6,
                                                      ),
                                                      itemCount:
                                                          dvv.entries.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return InkWell(
                                                          onTap: () {
                                                            valueHandler(
                                                              "${valus[index].prop_key}:${keys[index]}",
                                                              idx,
                                                              "${valus[index].value}",
                                                              "${valus[index].pic_url}",
                                                              false,
                                                            );
                                                          },
                                                          child: Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                              right: 7,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xffF5F5F5),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              // color: Theme.of(
                                                              //         context)
                                                              //     .accentColor,
                                                              // border: Provider.of<ProductDetailsProvider>(context)
                                                              //             .imageSliderIndex ==
                                                              //         index
                                                              //     ? Border
                                                              //         .all(
                                                              //         color: ColorResources.getPrimary(
                                                              //             context),
                                                              //         width:
                                                              //             2,
                                                              //       )
                                                              //     : null,
                                                            ),
                                                            child: Consumer<
                                                                ProductDetailsProvider>(
                                                              builder: (context,
                                                                  details,
                                                                  child) {
                                                                String
                                                                    selectedArr =
                                                                    details.emptyList![
                                                                        idx][0];

                                                                String
                                                                    currentValue =
                                                                    "${valus[index].prop_key}:${keys[index]}";

                                                                return Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              0),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    border: selectedArr.contains(
                                                                            currentValue)
                                                                        ? Border
                                                                            .all(
                                                                            color:
                                                                                Colors.red,
                                                                            width:
                                                                                2,
                                                                          )
                                                                        : Border.all(
                                                                            color:
                                                                                Colors.grey),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .all(
                                                                      Radius
                                                                          .circular(
                                                                        10,
                                                                      ),
                                                                    ),
                                                                    image:
                                                                        DecorationImage(
                                                                      image:
                                                                          NetworkImage(
                                                                        valus[index]
                                                                            .pic_url!,
                                                                      ),
                                                                      fit: BoxFit
                                                                          .fill,
                                                                    ),
                                                                  ),
                                                                  child: valus[index]
                                                                              .pic_url!
                                                                              .length <=
                                                                          0
                                                                      ? FittedBox(
                                                                          child:
                                                                              Container(
                                                                            padding:
                                                                                EdgeInsets.all(5),
                                                                            alignment:
                                                                                Alignment.center,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              borderRadius: BorderRadius.all(
                                                                                Radius.circular(5),
                                                                              ),
                                                                              color: Color(0x0FFF5F5F5),
                                                                            ),
                                                                            margin:
                                                                                EdgeInsets.all(0),
                                                                            child:
                                                                                Text(
                                                                              valus[index].value!,
                                                                              style: TextStyle(
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      : null,
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                ],
                                              )
                                            : Consumer<ProductDetailsProvider>(
                                                builder:
                                                    (context, details, child) =>
                                                        Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    // Quantity
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        // borderRadius: BorderRadius.only(
                                                        //   topLeft: Radius.circular(10),
                                                        //   topRight: Radius.circular(10),
                                                        // ),
                                                        boxShadow: [
                                                          // so here your custom shadow goes:
                                                          BoxShadow(
                                                            color: Colors.black
                                                                .withAlpha(
                                                                    50), // the color of a shadow, you can adjust it
                                                            spreadRadius:
                                                                3, //also play with this two values to achieve your ideal result
                                                            blurRadius: 10,
                                                            offset: Offset(0,
                                                                20), // changes position of shadow, negative value on y-axis makes it appering only on the top of a container
                                                          ),
                                                        ],
                                                      ),
                                                      child: Card(
                                                        elevation: 0,
                                                        margin:
                                                            EdgeInsets.all(0),
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.all(
                                                            Dimensions
                                                                .PADDING_SIZE_SMALL,
                                                          ),
                                                          child: Row(children: [
                                                            Text('Quantity'),
                                                            QuantityButton(
                                                              isIncrement:
                                                                  false,
                                                              quantity: details
                                                                  .quantity,
                                                              stock: details
                                                                  .getConditionalStock(),
                                                            ),
                                                            Text(
                                                                details.quantity
                                                                    .toString(),
                                                                style:
                                                                    titilliumSemiBold),
                                                            QuantityButton(
                                                              isIncrement: true,
                                                              quantity: details
                                                                  .quantity,
                                                              stock: details
                                                                  .getConditionalStock(),
                                                            ),
                                                            Text(
                                                              "${details.getConditionalStock().toString()} available",
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .grey),
                                                            )
                                                          ]),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        // borderRadius: BorderRadius.only(
                                                        //   topLeft: Radius.circular(10),
                                                        //   topRight: Radius.circular(10),
                                                        // ),
                                                        boxShadow: [
                                                          // so here your custom shadow goes:
                                                          BoxShadow(
                                                            color: Colors.black
                                                                .withAlpha(
                                                                    50), // the color of a shadow, you can adjust it
                                                            spreadRadius:
                                                                3, //also play with this two values to achieve your ideal result
                                                            blurRadius: 10,
                                                            offset: Offset(0,
                                                                0), // changes position of shadow, negative value on y-axis makes it appering only on the top of a container
                                                          ),
                                                        ],
                                                      ),
                                                      child: Card(
                                                        margin: EdgeInsets.zero,
                                                        elevation: 0,
                                                        child: Container(
                                                          padding: EdgeInsets
                                                              .all(Dimensions
                                                                  .PADDING_SIZE_SMALL),
                                                          child: Consumer<
                                                              ProductDetailsProvider>(
                                                            builder: (context,
                                                                    details,
                                                                    value) =>
                                                                //TODO: Check this future build RUNZUN
                                                                Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                  InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      bool isLoggedIn = await Provider.of<AuthProvider>(
                                                                              context,
                                                                              listen:
                                                                                  false)
                                                                          .isLoggedIn(
                                                                              context);

                                                                      UserInfoModel?
                                                                          userInfoModel =
                                                                          Provider.of<ProfileProvider>(context, listen: false)
                                                                              .userInfoModel;
                                                                      LocationProvider
                                                                          locationProvider =
                                                                          Provider.of<LocationProvider>(
                                                                              context,
                                                                              listen: false);
                                                                      Navigator.of(
                                                                              context)
                                                                          .push(
                                                                        MaterialPageRoute(
                                                                          builder: (BuildContext context) =>
                                                                              SavedAddressListScreen(
                                                                            userInfo:
                                                                                userInfoModel,
                                                                            locationProvider:
                                                                                locationProvider,
                                                                            isLoggedIn:
                                                                                isLoggedIn,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        details.product!.provider ==
                                                                                "freeShipping"
                                                                            ? Text('Free Shipping',
                                                                                style: titilliumBold.copyWith(
                                                                                  // color: Theme.of(context)
                                                                                  //     .hintColor,
                                                                                  fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                                                                ))
                                                                            : Text(
                                                                                'Shipping : Rs .' +
                                                                                    double.parse(ShippingCostAndEstimatedDelivery.sumOfShipping(
                                                                                      details.product!.provider,
                                                                                      details.product!.shippingCost!.ceil(),
                                                                                      details.product!.unitPrice!.ceil(),
                                                                                      details.shippingType,
                                                                                      !isLoggedin ? 1 : Cities.getTier(Provider.of<ProfileProvider>(context).userInfoModel!.town),
                                                                                      details.quantity,
                                                                                    ).toString())
                                                                                        .toStringAsFixed(2),
                                                                                style: titilliumBold.copyWith(
                                                                                  // color: Theme.of(context)
                                                                                  //     .hintColor,
                                                                                  fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                                                                )),
                                                                        Container(
                                                                          child:
                                                                              Icon(
                                                                            IconData(0xeb16,
                                                                                fontFamily: 'MaterialIcons'),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),

                                                                  SizedBox(
                                                                      height: Dimensions
                                                                          .PADDING_SIZE_SMALL),

                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                          'From ',
                                                                          style:
                                                                              titilliumRegular.copyWith(
                                                                            // color: Theme.of(context)
                                                                            //     .hintColor,
                                                                            fontSize:
                                                                                Dimensions.FONT_SIZE_DEFAULT,
                                                                          )),
                                                                      Text(
                                                                          "China ",
                                                                          style:
                                                                              titilliumBold.copyWith(
                                                                            // color: Theme.of(context)
                                                                            //     .hintColor,
                                                                            fontSize:
                                                                                Dimensions.FONT_SIZE_DEFAULT,
                                                                          )),
                                                                      Text(
                                                                          'to ',
                                                                          style:
                                                                              titilliumRegular.copyWith(
                                                                            // color: Theme.of(context)
                                                                            //     .hintColor,
                                                                            fontSize:
                                                                                Dimensions.FONT_SIZE_DEFAULT,
                                                                          )),
                                                                      Text(
                                                                          "${!isLoggedin ? Cities.allCities[0] : Provider.of<ProfileProvider>(context).userInfoModel!.town}",
                                                                          style:
                                                                              titilliumBold.copyWith(
                                                                            // color: Theme.of(context)
                                                                            //     .hintColor,
                                                                            fontSize:
                                                                                Dimensions.FONT_SIZE_DEFAULT,
                                                                          )),
                                                                      Text(
                                                                          ' Via ',
                                                                          style:
                                                                              titilliumRegular.copyWith(
                                                                            // color: Theme.of(context)
                                                                            //     .hintColor,
                                                                            fontSize:
                                                                                Dimensions.FONT_SIZE_DEFAULT,
                                                                          )),
                                                                      Text(
                                                                          " Kachuwa Express",
                                                                          style:
                                                                              titilliumBold.copyWith(
                                                                            // color: Theme.of(context)
                                                                            //     .hintColor,
                                                                            fontSize:
                                                                                Dimensions.FONT_SIZE_DEFAULT,
                                                                          )),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                      height: Dimensions
                                                                          .PADDING_SIZE_SMALL),

                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                          'Estimated delivery on ',
                                                                          style:
                                                                              titilliumRegular.copyWith(
                                                                            // color: Theme.of(context)
                                                                            //     .hintColor,
                                                                            fontSize:
                                                                                Dimensions.FONT_SIZE_DEFAULT,
                                                                          )),
                                                                      Text(
                                                                          ShippingCostAndEstimatedDelivery
                                                                              .estimatedDelivery(
                                                                            details.shippingType,
                                                                            !isLoggedin
                                                                                ? 1
                                                                                : Cities.getTier(Provider.of<ProfileProvider>(context).userInfoModel!.town),
                                                                          ),
                                                                          style:
                                                                              titilliumBold.copyWith(
                                                                            // color: Theme.of(context)
                                                                            //     .hintColor,
                                                                            fontSize:
                                                                                Dimensions.FONT_SIZE_DEFAULT,
                                                                          )),
                                                                    ],
                                                                  ),

                                                                  SizedBox(
                                                                    height: 50,
                                                                  )

                                                                  // Variant
                                                                  // productModel.colors.length > 0
                                                                  //     ? Row(children: [
                                                                  //         Text(
                                                                  //             '${getTranslated('select_variant', context)} : ',
                                                                  //             style: titilliumRegular.copyWith(
                                                                  //                 fontSize: Dimensions.FONT_SIZE_LARGE)),
                                                                  //         SizedBox(
                                                                  //           height: 40,
                                                                  //           child: ListView.builder(
                                                                  //             itemCount: productModel.colors.length,
                                                                  //             shrinkWrap: true,
                                                                  //             scrollDirection: Axis.horizontal,
                                                                  //             itemBuilder: (context, index) {
                                                                  //               String colorString = '0xff' +
                                                                  //                   productModel.colors[index].code
                                                                  //                       .substring(1, 7);
                                                                  //               return Container(
                                                                  //                 decoration: BoxDecoration(
                                                                  //                   borderRadius: BorderRadius.circular(
                                                                  //                       Dimensions
                                                                  //                           .PADDING_SIZE_EXTRA_SMALL),
                                                                  //                 ),
                                                                  //                 child: Padding(
                                                                  //                   padding: const EdgeInsets.all(Dimensions
                                                                  //                       .PADDING_SIZE_EXTRA_SMALL),
                                                                  //                   child: Container(
                                                                  //                     height: 30,
                                                                  //                     width: 30,
                                                                  //                     padding: EdgeInsets.all(Dimensions
                                                                  //                         .PADDING_SIZE_EXTRA_SMALL),
                                                                  //                     alignment: Alignment.center,
                                                                  //                     decoration: BoxDecoration(
                                                                  //                       color:
                                                                  //                           Color(int.parse(colorString)),
                                                                  //                       borderRadius:
                                                                  //                           BorderRadius.circular(5),
                                                                  //                     ),
                                                                  //                     //child: details.variantIndex == index ? Icon(Icons.done_all, color: ColorResources.WHITE, size: 12) : null,
                                                                  //                   ),
                                                                  //                 ),
                                                                  //               );
                                                                  //             },
                                                                  //           ),
                                                                  //         ),
                                                                  //       ])
                                                                  //     : SizedBox(),
                                                                  // productModel.colors.length > 0
                                                                  //     ? SizedBox(height: Dimensions.PADDING_SIZE_SMALL)
                                                                  //     : SizedBox(),

                                                                  // Variation
                                                                  // productModel.choiceOptions != null &&
                                                                  //         productModel.choiceOptions.length > 0
                                                                  //     ? ListView.builder(
                                                                  //         shrinkWrap: true,
                                                                  //         itemCount: productModel.choiceOptions.length,
                                                                  //         physics: NeverScrollableScrollPhysics(),
                                                                  //         itemBuilder: (context, index) {
                                                                  //           return Row(
                                                                  //               crossAxisAlignment:
                                                                  //                   CrossAxisAlignment.center,
                                                                  //               children: [
                                                                  //                 Text(
                                                                  //                     '${getTranslated('available', context)}' +
                                                                  //                         ' ' +
                                                                  //                         '${productModel.choiceOptions[index].title} :',
                                                                  //                     style: titilliumRegular.copyWith(
                                                                  //                         fontSize:
                                                                  //                             Dimensions.FONT_SIZE_LARGE)),
                                                                  //                 SizedBox(
                                                                  //                     width: Dimensions
                                                                  //                         .PADDING_SIZE_EXTRA_SMALL),
                                                                  //                 Expanded(
                                                                  //                   child: GridView.builder(
                                                                  //                     gridDelegate:
                                                                  //                         SliverGridDelegateWithFixedCrossAxisCount(
                                                                  //                       crossAxisCount: 4,
                                                                  //                       crossAxisSpacing: 5,
                                                                  //                       mainAxisSpacing: 5,
                                                                  //                       childAspectRatio: (1 / .7),
                                                                  //                     ),
                                                                  //                     shrinkWrap: true,
                                                                  //                     physics:
                                                                  //                         NeverScrollableScrollPhysics(),
                                                                  //                     itemCount: productModel
                                                                  //                         .choiceOptions[index]
                                                                  //                         .options
                                                                  //                         .length,
                                                                  //                     itemBuilder: (context, i) {
                                                                  //                       return Center(
                                                                  //                         child: Text(
                                                                  //                             productModel
                                                                  //                                 .choiceOptions[index]
                                                                  //                                 .options[i],
                                                                  //                             maxLines: 1,
                                                                  //                             overflow:
                                                                  //                                 TextOverflow.ellipsis,
                                                                  //                             style:
                                                                  //                                 titilliumRegular.copyWith(
                                                                  //                               fontSize: Dimensions
                                                                  //                                   .FONT_SIZE_DEFAULT,
                                                                  //                             )),
                                                                  //                       );
                                                                  //                     },
                                                                  //                   ),
                                                                  //                 ),
                                                                  //               ]);
                                                                  //         },
                                                                  //       )
                                                                  //     : SizedBox(),
                                                                ]),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                      },
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      // addToCartHandler();
                                      print('gesture dication');
                                    },
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      padding: EdgeInsets.all(0),
                                      margin:
                                          EdgeInsets.fromLTRB(10, 20, 10, 0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                        color: Colors.red,
                                      ),
                                      child: selection != null
                                          ? Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20),
                                                    bottomLeft:
                                                        Radius.circular(20),
                                                    topRight:
                                                        Radius.circular(20),
                                                    bottomRight:
                                                        Radius.circular(20),
                                                  ),
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Colors.blue,
                                                      Colors.lightBlueAccent
                                                    ],
                                                  ),
                                                ),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.8,
                                                height: 50,
                                                child: TextButton(
                                                  onPressed: () {
                                                    if (selection ==
                                                        SelectionBuyNowOrAddToCart
                                                            .ADD_TO_CART) {
                                                      addToCart(
                                                        SelectionBuyNowOrAddToCart
                                                            .ADD_TO_CART,
                                                        context,
                                                        product,
                                                        scaffoldKey,
                                                      );
                                                    } else {
                                                      print(
                                                          'CONTINUE with buy now');

                                                      addToCart(
                                                        SelectionBuyNowOrAddToCart
                                                            .BUY_NOW,
                                                        context,
                                                        product,
                                                        scaffoldKey,
                                                      );
                                                    }
                                                  },
                                                  child: Text(
                                                    'Continue',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          : Row(children: [
                                              Expanded(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(20),
                                                      bottomLeft:
                                                          Radius.circular(20),
                                                    ),
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Colors.blue,
                                                        Colors.lightBlueAccent
                                                      ],
                                                    ),
                                                  ),
                                                  width: 50,
                                                  height: 50,
                                                  child: TextButton(
                                                    onPressed: () => addToCart(
                                                      SelectionBuyNowOrAddToCart
                                                          .ADD_TO_CART,
                                                      context,
                                                      product,
                                                      scaffoldKey,
                                                    ),
                                                    child: Text(
                                                      'Add To Cart',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(20),
                                                      bottomRight:
                                                          Radius.circular(20),
                                                    ),
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Colors.redAccent,
                                                        Colors.orangeAccent
                                                      ],
                                                    ),
                                                  ),
                                                  child: TextButton(
                                                    onPressed: () => addToCart(
                                                      SelectionBuyNowOrAddToCart
                                                          .BUY_NOW,
                                                      context,
                                                      product,
                                                      scaffoldKey,
                                                    ),
                                                    child: Text(
                                                      'Buy Now',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Consumer<ProductDetailsProvider>(
                          builder: (context, detailsProvider, value) {
                            dynamic selectedImage = null;

                            for (var list in detailsProvider.emptyList!) {
                              if (list[2] != null) {
                                selectedImage = list[2];
                                break;
                              }
                            }

                            return InkWell(
                                onTap: () {
                                  // print(images);
                                  // print('9999999999999999999999');

                                  // detailsProvider.setEmptyList([
                                  //   [
                                  //     "14:771",
                                  //     "Green-E",
                                  //     "https://ae01.alicdn.com/kf/Sf05f86378cb64128b4efec5a84c27c2bH.jpg_640x640.jpg_.webp"
                                  //   ],
                                  //   ["", "", null]
                                  // ]);

                                  // print(detailsProvider.emptyList);
                                  // print('777777777777777777777777');

                                  // var products = prop_obj.entries.toList();
                                  // print(products);
                                  // print('11111111111111111111111111111111111');
                                  // dvv = product.value;
                                  // List<dynamic> dynamicList = dvv.values.toList();
                                  // valus = dynamicList.cast<Details>();

                                  // keys = dvv.keys.toList();
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          ProductImageScreen(
                                        title: "Please Select",
                                        imageList: images,
                                        isDefault: false,
                                        valueHandler: valueHandler,
                                      ),
                                    ),
                                  );

                                  // Provider.of<ProductDetailsProvider>(context,
                                  //     listen: false);
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(width: 3),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: CachedNetworkImage(
                                        imageUrl: selectedImage != null
                                            ? selectedImage
                                            : image,
                                        fit: BoxFit.fill,
                                        height: 100,
                                        width: 100,
                                        progressIndicatorBuilder:
                                            ((context, url, progress) => Center(
                                                child: CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(Theme.of(
                                                                context)
                                                            .primaryColor)))),
                                      ).cornerRadiusWithClipRRect(20.0),
                                    ),
                                  ),
                                ));
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          });
    }

    secondSheet(
      context,
    );
  }
}

class QuantityButton extends StatelessWidget {
  final bool isIncrement;
  final int quantity;
  final bool isCartWidget;
  final int? stock;

  QuantityButton({
    required this.isIncrement,
    required this.quantity,
    required this.stock,
    this.isCartWidget = false,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (!isIncrement && quantity > 1) {
          Provider.of<ProductDetailsProvider>(context, listen: false)
              .setQuantity(quantity - 1);
        } else if (isIncrement && quantity < stock!) {
          Provider.of<ProductDetailsProvider>(context, listen: false)
              .setQuantity(quantity + 1);
        }
      },
      icon: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border:
                Border.all(width: 1, color: Theme.of(context).primaryColor)),
        child: Icon(
          isIncrement ? Icons.add : Icons.remove,
          color: isIncrement
              ? quantity >= stock!
                  ? ColorResources.getLowGreen(context)
                  : ColorResources.getPrimary(context)
              : quantity > 1
                  ? ColorResources.getPrimary(context)
                  : ColorResources.getTextTitle(context),
          size: isCartWidget ? 26 : 20,
        ),
      ),
    );
  }
}
