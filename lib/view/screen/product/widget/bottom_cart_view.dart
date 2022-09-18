import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/base/cities.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/product_model.dart'
    as ProductModel;
import 'package:flutter_sixvalley_ecommerce/data/model/response/user_info_model.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/provider/cart_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/profile_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/theme_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/show_custom_snakbar.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/cart/cart_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/product/widget/cart_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../../../models/Details.dart';
import '../../../../models/ModelProvider.dart';
import '../../../../provider/auth_provider.dart';
import '../../../../provider/product_details_provider.dart';
import '../../../../utill/shipping_cost_and_estimated_delivery.dart';
import 'deep_category.dart';

class BottomCartView extends StatefulWidget {
  final ProductModel.Product? product;
  final GlobalKey<ScaffoldMessengerState> scaffoldKey;
  final bool isLoggedin;

  BottomCartView({
    required this.product,
    required this.scaffoldKey,
    required this.isLoggedin,
  });

  @override
  State<BottomCartView> createState() => _BottomCartViewState();
}

class _BottomCartViewState extends State<BottomCartView> {
  route(bool isRoute, String message) async {
    if (isRoute) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message), backgroundColor: Colors.green));
      Navigator.pop(context);
    } else {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message), backgroundColor: Colors.red));
    }
  }

  void addToCart(
    fromBuyNow,
    BuildContext context,
    GlobalKey<ScaffoldMessengerState> scaffoldKey,
    bool isLoggedIn,
  ) {
    List? userVarientChoice =
        Provider.of<ProductDetailsProvider>(context, listen: false).emptyList;
    // Provider.of<ProductDetailsProvider>(context, listen: false).selection =
    //     Selection.ADD_TO_CART;

    if (widget.product!.skus_json!.length == null ||
        widget.product!.skus_json!.length == 0) {
      DeepCategory.processAddToCart(
        context: context,
        product: widget.product!,
        isRoute: false,
        selection: fromBuyNow
            ? SelectionBuyNowOrAddToCart.BUY_NOW
            : SelectionBuyNowOrAddToCart.ADD_TO_CART,
        scaffoldKey: scaffoldKey,
      );
    } else {
      DeepCategory.popUpCategory(
        context,
        widget.product!.prop_obj!,
        widget.product!.images![0],
        widget.product,
        fromBuyNow
            ? SelectionBuyNowOrAddToCart.BUY_NOW
            : SelectionBuyNowOrAddToCart.ADD_TO_CART,
        scaffoldKey,
        isLoggedIn,
      );
    }

    // if (userVarientChoice[0].contains('')) {

    // } else {
    //   int stock = Provider.of<ProductDetailsProvider>(context, listen: false)
    //       .getSkuStockOnly();
    //   if (stock > 0) {
    //     print('product added to cart');
    //     int qty = Provider.of<ProductDetailsProvider>(context, listen: false)
    //         .quantity;

    //     int price = Provider.of<ProductDetailsProvider>(context, listen: false)
    //         .getSkuPriceOnly()
    //         .ceil();

    //     String skuId =
    //         Provider.of<ProductDetailsProvider>(context, listen: false)
    //             .getSkuId();
    //     print(skuId);

    //     List<Details> details =
    //         Provider.of<ProductDetailsProvider>(context, listen: false)
    //             .getDetailArray();
    //     UserInfoModel userInfo =
    //         Provider.of<ProfileProvider>(context, listen: false).userInfoModel;

    //     int productId = widget.product.id;
    //     String bigImageUrl = widget.product.thumbnail;
    //     String title = widget.product.name;
    //     double sellerShippingPrice = widget.product.shippingCost;
    //     String provider = widget.product.provider;
    //     String userPhone = userInfo.phone;
    //     String userName = userInfo.id;
    //     String baseType = 'cartType';
    //     String city = userInfo.town;
    //     int tier = Cities.getTier(userInfo.town);
    //     String shippingType = 'express';
    //     int shippingCost = ShippingCostAndEstimatedDelivery.sumOfShipping(
    //       provider,
    //       sellerShippingPrice.ceil(),
    //       price,
    //       shippingType,
    //       tier,
    //       qty,
    //     );
    //     int sellingPrice = price;
    //     int ourPureShipping = 0;
    //     String shippingStatus = 'Waiting to be confirmed';
    //     int shippingcode = 0;
    //     bool purchased = false;
    //     String note = 'deliver asap';

    //     ProductInfo cart = ProductInfo(
    //       detail: details,
    //       image: bigImageUrl,
    //       price: price,
    //       productId: productId.toString(),
    //       qty: qty,
    //       skuId: skuId,
    //       sum: price * qty,
    //       title: title,
    //       bigImageUrl: bigImageUrl,
    //       city: city,
    //       tier: tier,
    //       shippingType: shippingType,
    //       shippingCost: shippingCost,
    //       sellerPrice: sellingPrice,
    //       ourPureShipping: ourPureShipping,
    //       shippingStatus: shippingStatus,
    //       shippingCode: shippingcode,
    //       purchased: purchased,
    //       note: note,
    //       provider: provider,
    //     );

    //     if (Provider.of<AuthProvider>(context, listen: false).isLoggedIn(context)) {
    //       Provider.of<CartProvider>(context, listen: false).addToCartAPI(
    //         cart,
    //         route,
    //         userInfo,
    //         context,
    //       );
    //     } else {
    //       List<dynamic> isAddedInCart =
    //           Provider.of<CartProvider>(context, listen: false)
    //               .isAddedInCart(productId.toString(), skuId);

    //       if (!isAddedInCart[0]) {
    //         Provider.of<CartProvider>(context, listen: false).addToCart(cart);
    //         Navigator.pop(context);
    //         showCustomSnackBar('added_to_cart', context, isError: false);
    //       } else {
    //         Provider.of<CartProvider>(context, listen: false)
    //             .replaceCartListItem(cart, isAddedInCart[1]);
    //         Navigator.pop(context);
    //         showCustomSnackBar('already added', context, isError: false);
    //       }
    //     }
    //   } else {
    //     const String OUT_OF_STOCK_MESSAGE = "This product is out of stock";
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(
    //         behavior: SnackBarBehavior.floating,
    //         content: Text(OUT_OF_STOCK_MESSAGE),
    //         backgroundColor: Colors.red,
    //       ),
    //     );
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).highlightColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
              color: Colors.grey[
                  Provider.of<ThemeProvider>(context).darkTheme ? 700 : 300]!,
              blurRadius: 15,
              spreadRadius: 1)
        ],
      ),
      child: Row(children: [
        Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
              child: Stack(children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => CartScreen()));
                  },
                  child: Image.asset(
                    Images.cart_arrow_down_image,
                    color: ColorResources.getPrimary(context),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 15,
                  child:
                      Consumer<CartProvider>(builder: (context, cart, child) {
                    return Container(
                      height: 17,
                      width: 17,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorResources.getPrimary(context),
                      ),
                      child: Text(
                        cart.cart != null
                            ? cart.cart!.items!.length.toString()
                            : '0',
                        style: titilliumSemiBold.copyWith(
                            fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                            color: Theme.of(context).highlightColor),
                      ),
                    );
                  }),
                )
              ]),
            )),
        Expanded(
            flex: 11,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (con) => CartBottomSheet(
                          product: widget.product,
                          callback: () {
                            showCustomSnackBar(
                                getTranslated('added_to_cart', context),
                                context,
                                isError: false);
                          },
                        ));
              },
              // child: Container(
              //   height: 50,
              //   margin: EdgeInsets.symmetric(horizontal: 5),
              //   alignment: Alignment.center,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     color: ColorResources.getPrimary(context),
              //   ),
              //   child: Text(
              //     getTranslated('add_to_cart', context),
              //     style: titilliumSemiBold.copyWith(
              //         fontSize: Dimensions.FONT_SIZE_LARGE,
              //         color: Theme.of(context).highlightColor),
              //   ),
              // ),
              child: GestureDetector(
                onTap: () {
                  // addToCartHandler();
                  print('gesture dication');
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: Colors.red,
                  ),
                  child: Row(children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                          gradient: LinearGradient(
                            colors: [Colors.blue, Colors.lightBlueAccent],
                          ),
                        ),
                        width: 50,
                        height: 50,
                        child: TextButton(
                          onPressed: () {
                            addToCart(false, context, widget.scaffoldKey,
                                widget.isLoggedin);
                          },
                          child: Text(
                            'Add To Cart',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
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
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          gradient: LinearGradient(
                            colors: [Colors.redAccent, Colors.orangeAccent],
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {
                            print('buying now');
                            addToCart(true, context, widget.scaffoldKey,
                                widget.isLoggedin);
                          },
                          child: Text(
                            'Buy Now',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  ]),
                ),
              ),
            )),
      ]),
    );
  }
}
