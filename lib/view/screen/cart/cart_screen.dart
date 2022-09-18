import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/cart_model.dart';
import 'package:flutter_sixvalley_ecommerce/helper/price_converter.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/models/ModelProvider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/auth_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/cart_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/profile_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/splash_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/cart_utils.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/animated_custom_dialog.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/custom_app_bar.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/guest_dialog.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/no_internet_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/show_custom_snakbar.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/cart/widget/cart_widget.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/checkout/checkout_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/checkout/widget/shipping_method_bottom_sheet.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  final bool fromBuyNow;
  final int sellerId;
  CartScreen({this.fromBuyNow = false, this.sellerId = 1});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Future<void> _loadData(context) async {
    if (await Provider.of<AuthProvider>(context, listen: false)
        .isLoggedIn(context)) {
      String? userPhone =
          Provider.of<ProfileProvider>(context).userInfoModel!.phone;
      Provider.of<CartProvider>(context, listen: false)
          .getCartDataAPI(context, userPhone);
      Provider.of<CartProvider>(context, listen: false).setCartData();

      // if (Provider.of<SplashProvider>(context, listen: false)
      //         .configModel
      //         .shippingMethod !=
      //     'sellerwise_shipping') {
      //   Provider.of<CartProvider>(context, listen: false)
      //       .getAdminShippingMethodList(context);
      // }
    }
  }

  @override
  void initState() {
    _loadData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cartProvider, child) {
      // double grandTotal = 0.0;
      // double shippingAmount = 0.0;
      // double totalPrice = 0.0;
      // double discount = 0.0;
      // double tax = 0.0;
      // List<ProductInfo> cartList = [];
      // cartList.addAll(cart.cart.items);

      //TODO: seller

      // List<String> orderTypeShipping = [];
      // List<String> sellerList = ["One Seller", "Two Seller"];
      // List<TestOne> sellerGroupList = [TestOne(), TestOne()];
      // List<List<TestOne>> cartProductList = [];
      // List<List<int>> cartProductIndexList = [];
      // cartList.forEach((cart) {
      //   if (!sellerList.contains(cart.cartGroupId)) {
      //     sellerList.add(cart.cartGroupId);
      //     sellerGroupList.add(cart);
      //   }
      // });

      // sellerList.forEach((seller) {
      //   List<CartModel> cartLists = [];
      //   List<int> indexList = [];
      //   cartList.forEach((cart) {
      //     if (seller == cart.cartGroupId) {
      //       cartLists.add(cart);
      //       indexList.add(cartList.indexOf(cart));
      //     }
      //   });
      //   cartProductList.add(cartLists);
      //   cartProductIndexList.add(indexList);
      // });

      // sellerGroupList.forEach((seller) {
      //   if (seller.shippingType == 'order_wise') {
      //     orderTypeShipping.add(seller.shippingType);
      //   }
      // });

      // if (cartProvider.getData &&
      //     Provider.of<AuthProvider>(context, listen: false).isLoggedIn(context) &&
      //     Provider.of<SplashProvider>(context, listen: false)
      //             .configModel
      //             .shippingMethod ==
      //         'sellerwise_shipping') {
      // Provider.of<CartProvider>(context, listen: false)
      //     .getShippingMethod(context, cartList);
      // }

      // for (int i = 0; i < cart.cartList.length; i++) {
      // grandTotal +=
      //     cart.cartList[i].sumOfQty + cart.cartList[i].sumOfShipping;
      // totalPrice += cart.cartList[i].sumOfQty;
      // shippingAmount += cart.cartList[i].sumOfShipping;
      // discount += cart.cartList[i].discount * cart.cartList[i].quantity;
      // tax += cart.cartList[i].tax * cart.cartList[i].quantity;
      // }
      // for (int i = 0; i < cart.chosenShippingList.length; i++) {
      //   shippingAmount += cart.chosenShippingList[i].shippingCost;
      // }
      // for (int j = 0; j < cartList.length; j++) {
      //   shippingAmount += cart.cartList[j].shippingCost ?? 0;
      // }

      return Scaffold(
        bottomNavigationBar: (!widget.fromBuyNow && !cartProvider.isLoading)
            ? Container(
                height: 80,
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.PADDING_SIZE_LARGE,
                    vertical: Dimensions.PADDING_SIZE_DEFAULT),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10)),
                ),
                child: cartProvider.cart!.items!.isNotEmpty
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Row(
                                      children: [
                                        Text(
                                          '${getTranslated('total_price', context)}',
                                          style: titilliumRegular.copyWith(
                                              fontSize: Dimensions
                                                  .FONT_SIZE_EXTRA_SMALL),
                                        ),
                                        Text(
                                          PriceConverter.convertPrice(
                                            context,
                                            CartUtils.getTotalItemCost(
                                                cartProvider.cart!),
                                          ),
                                          style: titilliumRegular.copyWith(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontSize: Dimensions
                                                  .FONT_SIZE_EXTRA_SMALL),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Row(
                                      children: [
                                        Text(
                                          'Total Shipping Cost : ',
                                          style: titilliumRegular.copyWith(
                                              fontSize: Dimensions
                                                  .FONT_SIZE_EXTRA_SMALL),
                                        ),
                                        Text(
                                          PriceConverter.convertPrice(
                                              context,
                                              CartUtils.getTotalShippingCost(
                                                  cartProvider.cart!)),
                                          style: titilliumRegular.copyWith(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontSize: Dimensions
                                                  .FONT_SIZE_EXTRA_SMALL),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Row(
                                      children: [
                                        Text(
                                          'Grand Total : ',
                                          style: titilliumSemiBold.copyWith(
                                              fontSize:
                                                  Dimensions.FONT_SIZE_LARGE),
                                        ),
                                        Container(
                                          width: 80,
                                          child: FittedBox(
                                            child: Text(
                                              PriceConverter.convertPrice(
                                                context,
                                                CartUtils.getGrandTotal(
                                                    cartProvider.cart!),
                                              ),
                                              style: titilliumSemiBold.copyWith(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontSize: Dimensions
                                                      .FONT_SIZE_LARGE),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Builder(
                              builder: (context) => InkWell(
                                onTap: () async {
                                  // print('===asd=>${orderTypeShipping.length}');
                                  if (await Provider.of<AuthProvider>(context,
                                          listen: false)
                                      .isLoggedIn(context)) {
                                    if (cartProvider.cart!.items!.length == 0) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(getTranslated(
                                            'select_at_least_one_product',
                                            context)!),
                                        backgroundColor: Colors.red,
                                      ));
                                      // } else if (cart.chosenShippingList.length <
                                      //         orderTypeShipping.length &&
                                      //     Provider.of<SplashProvider>(context,
                                      //                 listen: false)
                                      //             .configModel
                                      //             .shippingMethod ==
                                      //         'sellerwise_shipping') {
                                      //   ScaffoldMessenger.of(context)
                                      //       .showSnackBar(SnackBar(
                                      //           content: Text(getTranslated(
                                      //               'select_all_shipping_method',
                                      //               context)),
                                      //           backgroundColor: Colors.red));
                                      // } else if (cart.chosenShippingList.length <
                                      //         1 &&
                                      //     Provider.of<SplashProvider>(context,
                                      //                 listen: false)
                                      //             .configModel
                                      //             .shippingMethod !=
                                      //         'sellerwise_shipping' &&
                                      //     Provider.of<SplashProvider>(context,
                                      //                 listen: false)
                                      //             .configModel
                                      //             .inHouseSelectedShippingType ==
                                      //         'order_wise') {
                                      //   ScaffoldMessenger.of(context)
                                      //       .showSnackBar(SnackBar(
                                      //           content: Text(getTranslated(
                                      //               'select_all_shipping_method',
                                      //               context)),
                                      //           backgroundColor: Colors.red));
                                    } else {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => CheckoutScreen(
                                              cartReceived: cartProvider.cart,
                                              userInfo:
                                                  Provider.of<ProfileProvider>(
                                                          context)
                                                      .userInfoModel
                                              // totalOrderAmount: totalPrice,
                                              // shippingFee: shippingAmount,
                                              // discount: discount,
                                              // tax: tax,
                                              ),
                                        ),
                                      );
                                    }
                                  } else {
                                    showAnimatedDialog(context, GuestDialog(),
                                        isFlip: true);
                                  }
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.PADDING_SIZE_SMALL),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: Dimensions
                                              .PADDING_SIZE_EXTRA_LARGE,
                                          vertical: Dimensions.FONT_SIZE_SMALL),
                                      child: Text(
                                          getTranslated('checkout', context)!,
                                          style: titilliumSemiBold.copyWith(
                                            fontSize:
                                                Dimensions.FONT_SIZE_DEFAULT,
                                            color: Theme.of(context).cardColor,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ])
                    : SizedBox(),
              )
            : null,
        body: Column(children: [
          CustomAppBar(title: getTranslated('CART', context)),
          cartProvider.isLoading
              ? Text('isloadin')
              : cartProvider.cart!.items!.length != 0
                  ? Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        margin: EdgeInsets.only(top: 20),
                        child: Card(
                          child: Column(
                            children: [
                              Expanded(
                                child: RefreshIndicator(
                                  onRefresh: () async {
                                    if (await Provider.of<AuthProvider>(context,
                                            listen: false)
                                        .isLoggedIn(context)) {
                                      await Provider.of<CartProvider>(context,
                                              listen: false)
                                          .getCartDataAPI(
                                        context,
                                        cartProvider.cart!.phoneNumber,
                                      );
                                    }
                                  },
                                  child: ListView.builder(
                                    itemCount: cartProvider.cart!.items!.length,
                                    padding: EdgeInsets.all(0),
                                    // physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.only(
                                            bottom:
                                                Dimensions.PADDING_SIZE_SMALL),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              // sellerGroupList[index]
                                              //         .shopInfo
                                              //         .isNotEmpty
                                              //     ? Padding(
                                              //         padding:
                                              //             const EdgeInsets.all(
                                              //                 8.0),
                                              //         child: Text(
                                              //             sellerGroupList[index]
                                              //                 .shopInfo,
                                              //             textAlign:
                                              //                 TextAlign.end,
                                              //             style: titilliumSemiBold
                                              //                 .copyWith(
                                              //               fontSize: Dimensions
                                              //                   .FONT_SIZE_LARGE,
                                              //             )),
                                              //       )
                                              //     : SizedBox(),

                                              Container(
                                                padding: EdgeInsets.only(
                                                    bottom: Dimensions
                                                        .PADDING_SIZE_LARGE),
                                                decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .highlightColor,
                                                ),
                                                child: Column(
                                                  children: [
                                                    CartWidget(
                                                      cart: cartProvider.cart,
                                                      cartModel: cartProvider
                                                          .cart!.items![index],
                                                      index: index,
                                                      fromBuyNow:
                                                          widget.fromBuyNow,
                                                    ),

                                                    //Provider.of<SplashProvider>(context,listen: false).configModel.shippingMethod =='sellerwise_shipping'?
                                                    // Provider.of<SplashProvider>(
                                                    //                     context,
                                                    //                     listen:
                                                    //                         false)
                                                    //                 .configModel
                                                    //                 .shippingMethod ==
                                                    //             'sellerwise_shipping' &&
                                                    //         sellerGroupList[
                                                    //                     index]
                                                    //                 .shippingType ==
                                                    //             'order_wise'
                                                    // true
                                                    //     ? Padding(
                                                    //         padding: const EdgeInsets
                                                    //                 .symmetric(
                                                    //             horizontal:
                                                    //                 Dimensions
                                                    //                     .PADDING_SIZE_DEFAULT),
                                                    //         child: InkWell(
                                                    // onTap: () {
                                                    // if (Provider.of<
                                                    //             AuthProvider>(
                                                    //         context,
                                                    //         listen:
                                                    //             false)
                                                    //     .isLoggedIn()) {
                                                    //   showModalBottomSheet(
                                                    //     context:
                                                    //         context,
                                                    //     isScrollControlled:
                                                    //         true,
                                                    //     backgroundColor:
                                                    //         Colors
                                                    //             .transparent,
                                                    //     builder: (context) => ShippingMethodBottomSheet(
                                                    //         groupId:
                                                    //             sellerGroupList[index]
                                                    //                 .cartGroupId,
                                                    //         sellerIndex:
                                                    //             index,
                                                    //         sellerId:
                                                    //             sellerGroupList[index].id),
                                                    //   );
                                                    // } else {
                                                    //   showCustomSnackBar(
                                                    //       'not_logged_in',
                                                    //       context);
                                                    // }
                                                    // },

                                                    // child: Text(
                                                    //     "Free Shipping")
                                                    // child: Container(
                                                    //   decoration:
                                                    //       BoxDecoration(
                                                    //     border: Border.all(
                                                    //         width:
                                                    //             0.5,
                                                    //         color: Colors
                                                    //             .grey),
                                                    //     borderRadius:
                                                    //         BorderRadius.all(
                                                    //             Radius.circular(
                                                    //                 10)),
                                                    //   ),
                                                    //   child: Padding(
                                                    //     padding:
                                                    //         const EdgeInsets
                                                    //                 .all(
                                                    //             8.0),
                                                    //     child: Row(
                                                    //         mainAxisAlignment:
                                                    //             MainAxisAlignment
                                                    //                 .spaceBetween,
                                                    //         children: [
                                                    //           Text(
                                                    //               getTranslated('SHIPPING_PARTNER',
                                                    //                   context),
                                                    //               style:
                                                    //                   titilliumRegular),
                                                    //           Row(
                                                    //               mainAxisAlignment:
                                                    //                   MainAxisAlignment.end,
                                                    //               children: [
                                                    //                 Text(
                                                    //                   (cart.shippingList == null || cart.shippingList[index].shippingMethodList == null || cart.chosenShippingList.length == 0 || cart.shippingList[index].shippingIndex == -1) ? '' : '${cart.shippingList[index].shippingMethodList[cart.shippingList[index].shippingIndex].title.toString()}',
                                                    //                   style: titilliumSemiBold.copyWith(color: ColorResources.getPrimary(context)),
                                                    //                   maxLines: 1,
                                                    //                   overflow: TextOverflow.ellipsis,
                                                    //                 ),
                                                    //                 SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                                    //                 Icon(Icons.keyboard_arrow_down, color: Theme.of(context).primaryColor),
                                                    //               ]),
                                                    //         ]),
                                                    //   ),
                                                    // ),
                                                    // ),
                                                    // )
                                                    // : SizedBox(),
                                                  ],
                                                ),
                                              ),
                                            ]),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Provider.of<SplashProvider>(context,
                                                  listen: false)
                                              .configModel!
                                              .shippingMethod !=
                                          'sellerwise_shipping' &&
                                      Provider.of<SplashProvider>(context,
                                                  listen: false)
                                              .configModel!
                                              .inHouseSelectedShippingType ==
                                          'order_wise'
                                  ? InkWell(
                                      onTap: () async {
                                        if (await Provider.of<AuthProvider>(
                                                context,
                                                listen: false)
                                            .isLoggedIn(context)) {
                                          showModalBottomSheet(
                                            context: context,
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            builder: (context) =>
                                                ShippingMethodBottomSheet(
                                                    groupId: 'all_cart_group',
                                                    sellerIndex: 0,
                                                    sellerId: 1),
                                          );
                                        } else {
                                          showCustomSnackBar(
                                              'not_logged_in', context);
                                        }
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 0.5, color: Colors.grey),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                    getTranslated(
                                                        'SHIPPING_PARTNER',
                                                        context)!,
                                                    style: titilliumRegular),
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        (cartProvider.shippingList ==
                                                                    null ||
                                                                cartProvider.chosenShippingList
                                                                        .length ==
                                                                    0 ||
                                                                cartProvider
                                                                        .shippingList!
                                                                        .length ==
                                                                    0 ||
                                                                cartProvider
                                                                        .shippingList![
                                                                            0]
                                                                        .shippingMethodList ==
                                                                    null ||
                                                                cartProvider
                                                                        .shippingList![
                                                                            0]
                                                                        .shippingIndex ==
                                                                    -1)
                                                            ? ''
                                                            : '${cartProvider.shippingList![0].shippingMethodList![cartProvider.shippingList![0].shippingIndex!].title.toString()}',
                                                        style: titilliumSemiBold
                                                            .copyWith(
                                                                color: ColorResources
                                                                    .getPrimary(
                                                                        context)),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                      SizedBox(
                                                          width: Dimensions
                                                              .PADDING_SIZE_EXTRA_SMALL),
                                                      Icon(
                                                          Icons
                                                              .keyboard_arrow_down,
                                                          color: Theme.of(
                                                                  context)
                                                              .primaryColor),
                                                    ]),
                                              ]),
                                        ),
                                      ),
                                    )
                                  : SizedBox(),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Expanded(
                      child: NoInternetOrDataScreen(isNoInternet: false)),
        ]),
      );
    });
  }
}
