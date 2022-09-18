import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/base/cities.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/user_info_model.dart';
import 'package:flutter_sixvalley_ecommerce/helper/product_type.dart';
import 'package:flutter_sixvalley_ecommerce/provider/auth_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/location_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/rating_bar.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/products_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/product/widget/promise_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/product/widget/seller_view.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/product_model.dart';

import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/provider/product_details_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/product_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/theme_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/wishlist_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/no_internet_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/title_row.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/product/widget/bottom_cart_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/product/widget/product_image_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/product/widget/product_specification_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/product/widget/product_title_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/product/widget/related_product_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/product/widget/review_widget.dart';
import 'package:provider/provider.dart';

import '../../../provider/profile_provider.dart';
import '../../../utill/shipping_cost_and_estimated_delivery.dart';
import '../../basewidget/shimmer_loading.dart';
import '../address/saved_address_list_screen.dart';
import 'faq_and_review_screen.dart';

class ProductDetails extends StatefulWidget {
  // final Product? product;
  final int? productId;

  ProductDetails({
    required this.productId,
    // required this.product,
  });
  // final Product product;
  // ProductDetails({
  //   @required this.product,
  // });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      new GlobalKey<ScaffoldMessengerState>();

  bool? isGuestMode;

  @override
  void initState() {
    Provider.of<ProductDetailsProvider>(context, listen: false)
        .getProductDetail(widget.productId, context);

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  _asyncMethod() async {
    bool _isGuestMode = !await Provider.of<AuthProvider>(context, listen: false)
        .isLoggedIn(context);

    setState(() {
      isGuestMode = _isGuestMode;
    });

    if (!_isGuestMode) {
      Provider.of<WishListProvider>(context, listen: false).checkWishList(
        widget.productId.toString(),
        context,
        Provider.of<ProfileProvider>(context).userInfoModel!.phone,
      );
    }
  }

  // void _loadData(BuildContext context) async {
  // Provider.of<ProductDetailsProvider>(context, listen: false)
  //     .removePrevReview();
  // Provider.of<ProductDetailsProvider>(context, listen: false)
  //     .initProduct(widget.product, context);
  // Provider.of<ProductProvider>(context, listen: false)
  //     .removePrevRelatedProduct();
  // Provider.of<ProductProvider>(context, listen: false)
  //     .initRelatedProductList(widget.product.id.toString(), context);
  // Provider.of<ProductDetailsProvider>(context, listen: false)
  //     .getCount(widget.product.id.toString(), context);
  // Provider.of<ProductDetailsProvider>(context, listen: false).getSharableLink(
  //     widget.product.slug.toString(), widget.product.provider, context);

  // if (Provider.of<AuthProvider>(context, listen: false).isLoggedIn(context)) {
  //   Provider.of<WishListProvider>(context, listen: false).checkWishList(
  //     widget.productId.toString(),
  //     context,
  //     Provider.of<ProfileProvider>(context).userInfoModel.phone,
  //   );
  // }
  // Provider.of<ProductProvider>(context, listen: false)
  //     .initSellerProductList(widget.product.userId.toString(), 1, context);
  // }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Container(
    //     height: 200,
    //     color: Colors.red,
    //   ),
    // );

    // String ratting = widget.product.averageRating != null
    //     ? widget.product.averageRating.toString()
    //     : "0";
    // _loadData(context);
    bool isFirstTime = true;
    return Consumer<ProductDetailsProvider>(
      builder: (context, details, child) {
        if (!details.isLoading && isFirstTime) {
          Provider.of<ProductDetailsProvider>(context)
              .createEmptyArray(details.product!.prop_obj!.keys.length);
          isFirstTime = false;
        }
        return details.hasConnection
            ? ScaffoldMessenger(
                key: _scaffoldKey,
                //TODO: TEST THIS Future builder RUNZUN
                child: Scaffold(
                  backgroundColor: Theme.of(context).cardColor,
                  appBar: AppBar(
                    title: Row(children: [
                      InkWell(
                        child: Icon(Icons.arrow_back_ios,
                            color: Theme.of(context).cardColor, size: 20),
                        onTap: () => Navigator.pop(context),
                      ),
                      SizedBox(
                        width: Dimensions.PADDING_SIZE_SMALL,
                      ),
                      Text(
                        getTranslated('product_details', context)!,
                        style: robotoRegular.copyWith(
                          fontSize: 20,
                          color: Theme.of(context).cardColor,
                        ),
                      ),
                    ]),
                    automaticallyImplyLeading: false,
                    elevation: 0,
                    backgroundColor:
                        Provider.of<ThemeProvider>(context).darkTheme
                            ? Colors.black
                            : null,
                  ),
                  bottomNavigationBar: BottomCartView(
                    product: details.product,
                    scaffoldKey: _scaffoldKey,
                    isLoggedin: isGuestMode != null ? !isGuestMode! : false,
                  ),
                  body: !details.isLoading
                      ? SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              details.product != null
                                  ? ProductImageView(
                                      productModel: details.product,
                                      scaffoldKey: _scaffoldKey,
                                    )
                                  : SizedBox(),
                              Container(
                                transform:
                                    Matrix4.translationValues(0.0, -25.0, 0.0),
                                padding: EdgeInsets.only(
                                  top: Dimensions.FONT_SIZE_DEFAULT,
                                ),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).canvasColor,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                      Dimensions.PADDING_SIZE_EXTRA_LARGE,
                                    ),
                                    topRight: Radius.circular(
                                      Dimensions.PADDING_SIZE_EXTRA_LARGE,
                                    ),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    ProductTitleView(
                                      productModel: details.product,
                                      scaffoldKey: _scaffoldKey,
                                      isLoggedin: !isGuestMode!,
                                    ),
                                    //
                                    SizedBox(
                                      height: 5,
                                    ),

                                    //Shipping Calculation Cart -----------------------------------------------------------------------------------------------
                                    InkWell(
                                      onTap: () async {
                                        bool isLoggedIn =
                                            await Provider.of<AuthProvider>(
                                                    context,
                                                    listen: false)
                                                .isLoggedIn(context);
                                        UserInfoModel? userInfoModel =
                                            Provider.of<ProfileProvider>(
                                                    context,
                                                    listen: false)
                                                .userInfoModel;
                                        LocationProvider locationProvider =
                                            Provider.of<LocationProvider>(
                                                context,
                                                listen: false);
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                SavedAddressListScreen(
                                              userInfo: userInfoModel,
                                              locationProvider:
                                                  locationProvider,
                                              isLoggedIn: isLoggedIn,
                                            ),
                                          ),
                                        );
                                      },
                                      // onTap: () {
                                      // Navigator.of(context).push(
                                      //   MaterialPageRoute(
                                      //     builder: (BuildContext context) =>
                                      //         SavedAddressListScreen(
                                      //             userInfo: widget.userInfo,
                                      //             locationProvider:
                                      //                 locationProvider),
                                      //   ),
                                      // );
                                      // },
                                      child: Card(
                                        elevation: 10,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(
                                                Dimensions.PADDING_SIZE_DEFAULT,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .circular(Dimensions
                                                        .PADDING_SIZE_DEFAULT),
                                                color:
                                                    Theme.of(context).cardColor,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Delivery",
                                                    style: titilliumRegular
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: Dimensions
                                                                .FONT_SIZE_EXTRA_LARGE),
                                                  ),
                                                  Row(
                                                    // crossAxisAlignment:
                                                    //     CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        child: Icon(
                                                          IconData(0xe3ac,
                                                              fontFamily:
                                                                  'MaterialIcons'),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: Dimensions
                                                            .PADDING_SIZE_SMALL,
                                                      ),
                                                      Text(
                                                        "To " +
                                                            "${isGuestMode! ? Cities.allCities[0] : Provider.of<ProfileProvider>(context).userInfoModel!.town}",
                                                        // "To Kathmandu",
                                                        style: titilliumRegular
                                                            .copyWith(
                                                          fontWeight:
                                                              FontWeight.w200,
                                                          fontSize: Dimensions
                                                              .FONT_SIZE_DEFAULT,
                                                        ),
                                                      ),

                                                      // Container(
                                                      //   child: Column(
                                                      //     crossAxisAlignment:
                                                      //         CrossAxisAlignment
                                                      //             .start,
                                                      //     children: [

                                                      //     ],
                                                      //   ),
                                                      // ),
                                                      Container(
                                                        child: Icon(
                                                          IconData(0xeb16,
                                                              fontFamily:
                                                                  'MaterialIcons'),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                left: Dimensions
                                                    .PADDING_SIZE_DEFAULT,
                                                right: Dimensions
                                                    .PADDING_SIZE_DEFAULT,
                                                top: 0,
                                                bottom: 0,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .circular(Dimensions
                                                        .PADDING_SIZE_DEFAULT),
                                                color:
                                                    Theme.of(context).cardColor,
                                              ),
                                              // child: Text(
                                              //   'Rs. ${double.parse(details.product.sumOfShipping.toString()).toStringAsFixed(2)}',
                                              //   style: robotoRegular.copyWith(
                                              //     fontSize:
                                              //         Dimensions.FONT_SIZE_SMALL,
                                              //     color: Theme.of(context)
                                              //         .disabledColor,
                                              //   ),
                                              // ),

                                              child: Text(
                                                "Shipping : " +
                                                    "Rs. " +
                                                    double.parse(
                                                            ShippingCostAndEstimatedDelivery
                                                                .sumOfShipping(
                                                      details.product!.provider,
                                                      details.product!
                                                          .shippingCost!
                                                          .ceil(),
                                                      details
                                                          .product!.unitPrice!
                                                          .ceil(),
                                                      details.shippingType,
                                                      isGuestMode!
                                                          ? 1
                                                          : Cities.getTier(Provider
                                                                  .of<ProfileProvider>(
                                                                      context)
                                                              .userInfoModel!
                                                              .town),
                                                      details.quantity,
                                                    ).toString())
                                                        .toStringAsFixed(2),
                                                style:
                                                    titilliumRegular.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: Dimensions
                                                      .FONT_SIZE_DEFAULT,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                left: Dimensions
                                                    .PADDING_SIZE_DEFAULT,
                                                right: Dimensions
                                                    .PADDING_SIZE_DEFAULT,
                                                top: 5,
                                                bottom: Dimensions
                                                    .PADDING_SIZE_DEFAULT,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .circular(Dimensions
                                                        .PADDING_SIZE_DEFAULT),
                                                color:
                                                    Theme.of(context).cardColor,
                                              ),
                                              child: Text(
                                                "Estimated delivery : " +
                                                    ShippingCostAndEstimatedDelivery
                                                        .estimatedDelivery(
                                                      details.shippingType,
                                                      isGuestMode!
                                                          ? 1
                                                          : Cities.getTier(Provider
                                                                  .of<ProfileProvider>(
                                                                      context)
                                                              .userInfoModel!
                                                              .town),
                                                    ),
                                                style:
                                                    titilliumRegular.copyWith(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: Dimensions
                                                            .FONT_SIZE_DEFAULT,
                                                        color: Colors.grey),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    // Specification -----------------------------------------------------------------------------------------------
                                    (details.product!.details != null &&
                                            details
                                                .product!.details!.isNotEmpty)
                                        ? Container(
                                            // height: 158,
                                            margin: EdgeInsets.only(
                                              top:
                                                  Dimensions.PADDING_SIZE_SMALL,
                                            ),
                                            padding: EdgeInsets.all(
                                              Dimensions.PADDING_SIZE_SMALL,
                                            ),
                                            child: details.product!.details!
                                                    .isNotEmpty
                                                ? SingleChildScrollView(
                                                    child: Html(
                                                        data: details
                                                            .product!.details))
                                                : Center(
                                                    child: Text(
                                                        'No specification')),
                                            // child: ProductSpecification(
                                            //   productSpecification:
                                            //       details.product.details ?? '',
                                            // ),
                                          )
                                        : SizedBox(),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      : LoadingPage(),
                ),
              )
            : Scaffold(
                body: NoInternetOrDataScreen(
                  isNoInternet: true,
                  child: ProductDetails(
                    productId: details.product?.id,
                    // product: details.product,
                  ),
                ),
              );
      },
    );
  }
}
