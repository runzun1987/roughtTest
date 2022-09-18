// import 'dart:html';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:esewa_flutter_sdk/esewa_config.dart';
import 'package:esewa_flutter_sdk/esewa_flutter_sdk.dart';
import 'package:esewa_flutter_sdk/esewa_payment.dart';
import 'package:esewa_flutter_sdk/esewa_payment_success_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/base/cities.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/base/payment.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/base/shipping_type.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/cart_model.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/user_info_model.dart';
// import 'package:flutter_sixvalley_ecommerce/data/model/body/order_place_model.dart';
// import 'package:flutter_sixvalley_ecommerce/data/model/response/cart_model.dart';
import 'package:flutter_sixvalley_ecommerce/helper/price_converter.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/models/Details.dart';
// import 'package:flutter_sixvalley_ecommerce/provider/cart_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/coupon_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/order_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/product_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/profile_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/splash_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/cart_utils.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/utill/shipping_cost_and_estimated_delivery.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:flutter_sixvalley_ecommerce/utill/payment_setting.dart';
import 'package:flutter_sixvalley_ecommerce/utill/string_casting.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/amount_widget.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/animated_custom_dialog.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/custom_app_bar.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/my_dialog.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/textfield/custom_textfield.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/address/saved_address_list_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/address/saved_billing_Address_list_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/checkout/widget/custom_check_box.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/dashboard/dashboard_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/payment/payment_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/shippingType/shipping_type_screen.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'package:khalti_flutter/khalti_flutter.dart';

// import '../../../data/model/body/order_place_model.dart';
import '../../../models/Cart.dart';
import '../../../models/Order.dart';
import '../../../models/ProductInfo.dart';
import '../../../provider/cart_provider.dart';
import '../../../provider/location_provider.dart';
import '../../../provider/payment_provider.dart';
import '../cart/widget/cart_widget.dart';
import '../payment/payment_screen_list.dart';

class CheckoutScreen extends StatefulWidget {
  final Cart? cartReceived;
  UserInfoModel? userInfo;
  final bool fromProductDetails;
  // final double totalOrderAmount;
  // final double shippingFee;
  final bool fromBuyNow;

  // final double discount;
  // final double tax;
  // final int sellerId;

  CheckoutScreen({
    required this.cartReceived,
    this.userInfo,
    this.fromProductDetails = false,
    // @required this.discount,
    // @required this.tax,
    // required this.totalOrderAmount,
    // required this.shippingFee,
    this.fromBuyNow = false,

    // this.sellerId,
  });

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  // GoogleMapController _controller;

  Cart? cart;

  final TextEditingController _orderNoteController = TextEditingController();

  // String fullName = "Ranjan Raj Shrestha";
  // String phoneNumber = "+977 9843813046";
  // String town = "Kuleswhor";
  // String city = "Kathmandu";
  String paymentOption = "Select Payment";
  String shippingText = "Shipping : ";

  String freeShippingText = "Free Shipping ";
  String estimatedDeliveryText = "Estimated Delivery on ";
  String dateText = "22 July";

  // String NepeleseRupees = "Rs . ";

  // final FocusNode _orderNoteNode = FocusNode();
  // double _order = 0;
  // bool _digitalPayment;
  bool? _cod;
  bool? _billingAddress;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    cart = widget.cartReceived;

    // if (widget.userInfo.town == null ||
    //     widget.userInfo.street == null ||
    //     widget.userInfo.country == null ||
    //     widget.userInfo.latitude == null ||
    //     widget.userInfo.longitude == null ||
    //     widget.userInfo.placeId == null ||
    //     widget.userInfo.fullAddress == null) {
    //   _checkPermission(
    //       () => Provider.of<LocationProvider>(context, listen: false)
    //           .getCurrentLocation(context, true, mapController: _controller),
    //       context);
    //   Provider.of<LocationProvider>(context, listen: false)
    //       .getCurrentLocation(context, true, mapController: _controller);
    // } else {
    //   CameraPosition cameraPosition = CameraPosition(
    //       target: LatLng(double.parse(widget.userInfo.latitude),
    //           double.parse(widget.userInfo.longitude)),
    //       zoom: 14);

    //   Provider.of<LocationProvider>(context, listen: false)
    //       .updatePosition(cameraPosition, true, null, context);
    // }

    // Provider.of<ProfileProvider>(context, listen: false)
    //     .initAddressList(context);
    // Provider.of<ProfileProvider>(context, listen: false)
    //     .initAddressTypeList(context);
    // Provider.of<CouponProvider>(context, listen: false).removePrevCouponData();
    // Provider.of<CartProvider>(context, listen: false).getCartDataAPI(context);
    // Provider.of<CartProvider>(context, listen: false)
    //     .getChosenShippingMethod(context);
    // _digitalPayment = Provider.of<SplashProvider>(context, listen: false)
    //     .configModel
    //     .digitalPayment;
    // _cod = Provider.of<SplashProvider>(context, listen: false).configModel.cod;
    // _billingAddress = Provider.of<SplashProvider>(context, listen: false)
    //         .configModel
    //         .billingAddress ==
    //     1;

    //
    // Provider.of<OrderProvider>(context, listen: false).shippingAddressNull();
    // Provider.of<OrderProvider>(context, listen: false).billingAddressNull();
  }

  void update({
    BuildContext? context,
    Cart? updatedCart,
    required bool fromBuyNow,
  }) {
    if (fromBuyNow) {
      setState(
        () {
          cart = updatedCart;
        },
      );
    } else {
      setState(() {
        _isLoading = true;
      });
      Provider.of<CartProvider>(context!, listen: false)
          .updateCartProductQuantity(
        updatedCart!,
        context,
      )
          .then((value) {
        setState(
          () {
            cart = Provider.of<CartProvider>(context, listen: false).cart;
            _isLoading = false;
          },
        );
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(value.message!),
          backgroundColor: value.isSuccess ? Colors.green : Colors.red,
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // _order = widget.totalOrderAmount + widget.discount;
    setState(() {
      widget.userInfo = Provider.of<ProfileProvider>(context).userInfoModel;
    });
    return Scaffold(
      resizeToAvoidBottomInset: true,
      key: _scaffoldKey,
      bottomNavigationBar: Container(
        height: 80,
        // padding: EdgeInsets.symmetric(
        //     horizontal: Dimensions.PADDING_SIZE_LARGE,
        //     vertical: Dimensions.PADDING_SIZE_DEFAULT),
        // decoration: BoxDecoration(
        //   color: ColorResources.getPrimary(context),
        // ),
        child: Center(
          child: Consumer<OrderProvider>(
            builder: (context, order, child) {
              return !Provider.of<OrderProvider>(context).isLoading
                  ? Builder(
                      builder: (context) => Consumer<PaymentProvider>(
                        builder: (context, paymentProvider, value) => Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.PADDING_SIZE_LARGE,
                                // vertical: Dimensions.PADDING_SIZE_DEFAULT,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Text(
                                  //   'All Total',
                                  //   style: titilliumSemiBold.copyWith(
                                  //     fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                                  //     color: Colors.black,
                                  //   ),
                                  // ),
                                  // Text(
                                  //   NepeleseRupees +
                                  //       Provider.of<CartProvider>(context,
                                  //               listen: false)
                                  //           .getGrandTotal
                                  //           .toString(),
                                  //   style: titilliumSemiBold.copyWith(
                                  //     fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                                  //     color: Colors.black,
                                  //   ),
                                  // )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            PaymentSetting.paymentSelection(
                              paymentProvider: paymentProvider,
                              context: context,
                            )[2]
                          ],
                        ),
                      ),
                    )
                  : Container(
                      height: 30,
                      width: 30,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).highlightColor,
                        ),
                      ),
                    );
            },
          ),
        ),
      ),

      //Body ------------------------------------------------------------------------------------------------------------------------------------------------
      body: Column(
        children: [
          CustomAppBar(title: getTranslated('checkout', context)),
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(0),
              children: [
                Consumer<OrderProvider>(
                  builder: (context, shipping, _) {
                    return Consumer<LocationProvider>(
                      builder: (context, locationProvider, value) {
                        return Container(
                          padding:
                              EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Shipping Details  ---------------------------------------------------------------------------------------------------------
                              InkWell(
                                onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        SavedAddressListScreen(
                                      userInfo: widget.userInfo,
                                      locationProvider: locationProvider,
                                      isLoggedIn: true,
                                    ),
                                  ),
                                ),
                                child: Card(
                                  elevation: 10,
                                  child: Container(
                                    padding: EdgeInsets.all(
                                      Dimensions.PADDING_SIZE_DEFAULT,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.PADDING_SIZE_DEFAULT),
                                      color: Theme.of(context).cardColor,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Icon(
                                                IconData(0xe3ac,
                                                    fontFamily:
                                                        'MaterialIcons'),
                                              ),
                                            ),
                                            SizedBox(
                                              width:
                                                  Dimensions.PADDING_SIZE_SMALL,
                                            ),
                                            Container(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 3.0),
                                                    child: (widget.userInfo!
                                                                    .firstName !=
                                                                null ||
                                                            widget.userInfo!
                                                                    .lastName !=
                                                                null)
                                                        ? Text(
                                                            widget.userInfo!
                                                                    .firstName! +
                                                                " " +
                                                                widget.userInfo!
                                                                    .lastName!,
                                                            style:
                                                                titilliumRegular
                                                                    .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          )
                                                        : Text(
                                                            "Set the name first",
                                                            style:
                                                                titilliumRegular
                                                                    .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                  ),
                                                  Text(
                                                    widget.userInfo!.phone,
                                                    style: titilliumRegular
                                                        .copyWith(
                                                      fontWeight:
                                                          FontWeight.w200,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 0.5,
                                                  ),
                                                  Text(
                                                    widget.userInfo!.email,
                                                    style: titilliumRegular
                                                        .copyWith(
                                                      fontWeight:
                                                          FontWeight.w200,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 0.5,
                                                  ),
                                                  Text(
                                                    widget.userInfo!.street !=
                                                            null
                                                        ? widget.userInfo!.street
                                                        : "Please set street name...",
                                                    style: titilliumRegular
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight.w200,
                                                            color: widget
                                                                        .userInfo!
                                                                        .street ==
                                                                    null
                                                                ? Colors.red
                                                                : Colors.green),
                                                  ),
                                                  SizedBox(
                                                    height: 0.5,
                                                  ),
                                                  Text(
                                                    widget.userInfo!.town != null
                                                        ? widget.userInfo!.town
                                                        : "Please set town..",
                                                    style: titilliumRegular
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight.w200,
                                                            color: widget
                                                                        .userInfo!
                                                                        .town ==
                                                                    null
                                                                ? Colors.red
                                                                : Colors.green),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          child: Icon(
                                            IconData(0xeb16,
                                                fontFamily: 'MaterialIcons'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              //Payment Method  --------------------------------------------------------------------------------------------
                              Consumer<PaymentProvider>(
                                builder: (context, paymentProvider, value) =>
                                    Card(
                                  elevation: 10,
                                  child: Container(
                                    padding: EdgeInsets.all(
                                      Dimensions.PADDING_SIZE_DEFAULT,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        Dimensions.PADDING_SIZE_DEFAULT,
                                      ),
                                      color: Theme.of(context).cardColor,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              child: InkWell(
                                                  onTap: () =>
                                                      Navigator.of(context)
                                                          .push(
                                                        MaterialPageRoute(
                                                          builder: (BuildContext
                                                                  context) =>
                                                              PaymentListScreen(),
                                                        ),
                                                      ),
                                                  child: PaymentSetting
                                                      .paymentSelection(
                                                    paymentProvider:
                                                        paymentProvider,
                                                    context: context,
                                                  )[0]),
                                            ),
                                            SizedBox(
                                              width:
                                                  Dimensions.PADDING_SIZE_SMALL,
                                            ),
                                            Text(
                                              PaymentSetting.paymentSelection(
                                                paymentProvider:
                                                    paymentProvider,
                                                context: context,
                                              )[1],
                                              style: titilliumRegular.copyWith(
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          child: InkWell(
                                            onTap: () =>
                                                Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        PaymentListScreen(),
                                              ),
                                            ),
                                            child: Icon(
                                              IconData(
                                                0xeb16,
                                                fontFamily: 'MaterialIcons',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              // KhaltiButton(
                              //   config: config,
                              //   preferences: [
                              //     // Not providing this will enable all the payment methods.
                              //     PaymentPreference.khalti,
                              //     PaymentPreference.eBanking,
                              //   ],
                              //   onSuccess: (successModel) {
                              //     // Perform Server Verification
                              //   },
                              //   onFailure: (failureModel) {
                              //     // What to do on failure?
                              //   },
                              //   onCancel: () {
                              //     // User manually cancelled the transaction
                              //   },
                              // ),

                              //Order List ----------------------------------------------------------------------------------------------------------------------
                              Container(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.all(0),
                                  itemCount: cart!.items!.length,
                                  itemBuilder: (ctx, index) {
                                    return Container(
                                      padding: EdgeInsets.only(
                                        right: 0,
                                        left: 0,
                                        top: 0,
                                        bottom: Dimensions
                                            .PADDING_SIZE_EXTRA_EXTRA_SMALL,
                                      ),
                                      child: Card(
                                        elevation: 10,
                                        child: Container(
                                          padding: EdgeInsets.all(
                                            Dimensions.PADDING_SIZE_SMALL,
                                          ),
                                          child: Column(
                                            children: [
                                              Row(children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: .5,
                                                        color: Theme.of(context)
                                                            .primaryColor
                                                            .withOpacity(.25)),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      Dimensions
                                                          .PADDING_SIZE_DEFAULT,
                                                    ),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      Dimensions
                                                          .PADDING_SIZE_DEFAULT,
                                                    ),
                                                    child: FadeInImage
                                                        .assetNetwork(
                                                      placeholder:
                                                          Images.placeholder,
                                                      fit: BoxFit.cover,
                                                      width: 100,
                                                      height: 100,
                                                      image: cart!
                                                          .items![index].image!,
                                                      imageErrorBuilder: (c, o,
                                                              s) =>
                                                          Image.asset(
                                                              Images
                                                                  .placeholder,
                                                              fit: BoxFit.cover,
                                                              width: 50,
                                                              height: 50),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                    width: Dimensions
                                                        .MARGIN_SIZE_DEFAULT),
                                                Expanded(
                                                  flex: 3,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              cart!.items![index]
                                                                  .title!,
                                                              style: titilliumRegular.copyWith(
                                                                  fontSize:
                                                                      Dimensions
                                                                          .FONT_SIZE_DEFAULT,
                                                                  color: ColorResources
                                                                      .getPrimary(
                                                                          context)),
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: Dimensions
                                                            .MARGIN_SIZE_EXTRA_SMALL,
                                                      ),
                                                      Text(
                                                        cart!.items![index].detail!
                                                            .map((d) {
                                                              return "${d!.name} ${d.value}";
                                                            })
                                                            .toList()
                                                            .join(','),
                                                        // .detailsToString,
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              _isLoading
                                                                  ? SizedBox(
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        strokeWidth:
                                                                            1,
                                                                        valueColor:
                                                                            new AlwaysStoppedAnimation<Color>(
                                                                          Theme.of(context)
                                                                              .primaryColor,
                                                                        ),
                                                                      ),
                                                                      height:
                                                                          10.0,
                                                                      width:
                                                                          10.0,
                                                                    )
                                                                  : Text(
                                                                      "Rs. " +
                                                                          double.parse((cart!.items![index].price! * cart!.items![index].qty!).toString())
                                                                              .toStringAsFixed(2),
                                                                      style: titilliumSemiBold.copyWith(
                                                                          fontSize:
                                                                              Dimensions.FONT_SIZE_LARGE),
                                                                    ),
                                                              _isLoading
                                                                  ? SizedBox(
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        strokeWidth:
                                                                            1,
                                                                        valueColor:
                                                                            new AlwaysStoppedAnimation<Color>(
                                                                          Theme.of(context)
                                                                              .primaryColor,
                                                                        ),
                                                                      ),
                                                                      height:
                                                                          10.0,
                                                                      width:
                                                                          10.0,
                                                                    )
                                                                  //TODO: Doble check Tier button
                                                                  : Text(
                                                                      'Rs. ${double.parse(ShippingCostAndEstimatedDelivery.sumOfShipping(
                                                                        cart!.items![index]
                                                                            .provider,
                                                                        cart!.items![index]
                                                                            .sellerPrice,
                                                                        cart!.items![index]
                                                                            .price,
                                                                        ShippingType
                                                                            .express,
                                                                        widget.userInfo!.town !=
                                                                                null
                                                                            ? Cities.getTier(widget.userInfo!.town)
                                                                            : 1,
                                                                        cart!.items![index]
                                                                            .qty,
                                                                      ).toString()).toStringAsFixed(2)}',
                                                                      style: robotoRegular
                                                                          .copyWith(
                                                                        fontSize:
                                                                            Dimensions.FONT_SIZE_SMALL,
                                                                        color: Theme.of(context)
                                                                            .disabledColor,
                                                                      ),
                                                                    ),
                                                            ],
                                                          ),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Row(
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsets.only(
                                                                        right: Dimensions
                                                                            .PADDING_SIZE_SMALL),
                                                                    child: QuantityButton(
                                                                        cart: cart,
                                                                        isIncrement: false,
                                                                        index: index,
                                                                        quantity: cart!.items![index].qty,
                                                                        maxQty: 20,
                                                                        callBack: (Cart updatedCart) {
                                                                          update(
                                                                            updatedCart:
                                                                                updatedCart,
                                                                            context:
                                                                                context,
                                                                            fromBuyNow:
                                                                                widget.fromBuyNow,
                                                                          );
                                                                        }),
                                                                  ),
                                                                  _isLoading
                                                                      ? SizedBox(
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            strokeWidth:
                                                                                1,
                                                                            valueColor:
                                                                                new AlwaysStoppedAnimation<Color>(
                                                                              Theme.of(context).primaryColor,
                                                                            ),
                                                                          ),
                                                                          height:
                                                                              10.0,
                                                                          width:
                                                                              10.0,
                                                                        )
                                                                      : Text(
                                                                          cart!.items![index].qty
                                                                              .toString(),
                                                                          style:
                                                                              titilliumSemiBold),
                                                                  Padding(
                                                                    padding: EdgeInsets.only(
                                                                        left: Dimensions
                                                                            .PADDING_SIZE_SMALL),
                                                                    child:
                                                                        QuantityButton(
                                                                      cart:
                                                                          cart,
                                                                      isIncrement:
                                                                          true,
                                                                      index:
                                                                          index,
                                                                      quantity: cart!
                                                                          .items![
                                                                              index]
                                                                          .qty,
                                                                      maxQty:
                                                                          20,
                                                                      callBack:
                                                                          (Cart
                                                                              updatedCart) {
                                                                        update(
                                                                          context:
                                                                              context,
                                                                          updatedCart:
                                                                              updatedCart,
                                                                          fromBuyNow:
                                                                              widget.fromBuyNow,
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                ],
                                                              )

                                                              //  Row(
                                                              //   children: [
                                                              //     Padding(
                                                              //       padding: EdgeInsets.only(
                                                              //           right: Dimensions
                                                              //               .PADDING_SIZE_SMALL),
                                                              //       child: QuantityButton(
                                                              //           isIncrement:
                                                              //               false,
                                                              //           index:
                                                              //               index,
                                                              //           quantity: widget
                                                              //               .cart
                                                              //               .items[
                                                              //                   index]
                                                              //               .qty,
                                                              //           maxQty:
                                                              //               20,
                                                              //           cartModel: widget
                                                              //               .cart
                                                              //               .items[index]),
                                                              //     ),
                                                              //     Text(
                                                              //         widget
                                                              //             .cart
                                                              //             .items[
                                                              //                 index]
                                                              //             .qty
                                                              //             .toString(),
                                                              //         style:
                                                              //             titilliumSemiBold),
                                                              //     Padding(
                                                              //       padding: EdgeInsets.only(
                                                              //           left: Dimensions
                                                              //               .PADDING_SIZE_SMALL),
                                                              //       child: QuantityButton(
                                                              //           index:
                                                              //               index,
                                                              //           isIncrement:
                                                              //               true,
                                                              //           quantity: widget
                                                              //               .cart
                                                              //               .items[
                                                              //                   index]
                                                              //               .qty,
                                                              //           maxQty:
                                                              //               20,
                                                              //           cartModel: widget
                                                              //               .cart
                                                              //               .items[index]),
                                                              //     ),
                                                              //   ],
                                                              // ),

                                                              ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ]),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          ShippingTypeScreen(),
                                                    ),
                                                  );
                                                },
                                                child: Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            shippingText,
                                                            style:
                                                                titilliumSemiBold
                                                                    .copyWith(
                                                              fontSize: Dimensions
                                                                  .FONT_SIZE_DEFAULT,
                                                            ),
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                          SizedBox(
                                                            height: 3,
                                                          ),
                                                          Text(
                                                            cart!.items![index]
                                                                    .shippingType!
                                                                    .toCapitalized() +
                                                                " " +
                                                                'Shipping',
                                                            style: titilliumRegular
                                                                .copyWith(
                                                                    fontSize:
                                                                        Dimensions
                                                                            .FONT_SIZE_DEFAULT,
                                                                    color: Colors
                                                                        .grey),
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                estimatedDeliveryText +
                                                                    " ",
                                                                style:
                                                                    titilliumSemiBold
                                                                        .copyWith(
                                                                  fontSize:
                                                                      Dimensions
                                                                          .FONT_SIZE_DEFAULT,
                                                                ),
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                              SizedBox(
                                                                height: 3,
                                                              ),
                                                              Text(
                                                                ShippingCostAndEstimatedDelivery.estimatedDelivery(
                                                                    ShippingType
                                                                        .express,
                                                                    widget.userInfo!.town !=
                                                                            null
                                                                        ? Cities.getTier(widget
                                                                            .userInfo!
                                                                            .town)
                                                                        : 1),
                                                                style: titilliumRegular.copyWith(
                                                                    fontSize:
                                                                        Dimensions
                                                                            .FONT_SIZE_DEFAULT,
                                                                    color: Colors
                                                                        .grey),
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ],
                                                          ),
                                                          Icon(
                                                            IconData(0xeb16,
                                                                fontFamily:
                                                                    'MaterialIcons'),
                                                          )
                                                        ],
                                                      ),
                                                      // Row(
                                                      //   children: [
                                                      //     FittedBox(
                                                      //       fit:
                                                      //           BoxFit.fitWidth,
                                                      //       child: Text(
                                                      //         estimatedDeliveryText +
                                                      //             " ",
                                                      //         style:
                                                      //             titilliumRegular
                                                      //                 .copyWith(
                                                      //           // fontSize: Dimensions
                                                      //           //     .FONT_SIZE_DEFAULT,
                                                      //           color:
                                                      //               Colors.grey,
                                                      //         ),
                                                      //         maxLines: 1,
                                                      //         overflow:
                                                      //             TextOverflow
                                                      //                 .ellipsis,
                                                      //       ),
                                                      //     ),
                                                      //     FittedBox(
                                                      //       fit:
                                                      //           BoxFit.fitWidth,
                                                      //       child: Text(
                                                      //         estimatedDelivery(
                                                      //             widget
                                                      //                 .cart
                                                      //                 .items[
                                                      //                     index]
                                                      //                 .shippingType,
                                                      //             widget
                                                      //                 .cart
                                                      //                 .items[
                                                      //                     index]
                                                      //                 .tier),
                                                      //         style: titilliumBold
                                                      //             .copyWith(
                                                      //                 // fontSize: Dimensions
                                                      //                 //     .FONT_SIZE_DEFAULT,
                                                      //                 ),
                                                      //         maxLines: 1,
                                                      //         overflow:
                                                      //             TextOverflow
                                                      //                 .ellipsis,
                                                      //       ),
                                                      //     ),
                                                      //     Icon(
                                                      //       IconData(0xeb16,
                                                      //           fontFamily:
                                                      //               'MaterialIcons'),
                                                      //     )
                                                      //   ],
                                                      // )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),

                              //Summary     ----------------------------------------------------------------------------------------------------------------------------
                              Container(
                                width: MediaQuery.of(context).size.width,
                                // height: MediaQuery.of(context).size.height,
                                child: Card(
                                  elevation: 10,
                                  child: Container(
                                    padding: EdgeInsets.all(
                                        Dimensions.PADDING_SIZE_DEFAULT),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.PADDING_SIZE_DEFAULT),
                                      color: Theme.of(context).cardColor,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Summary",
                                          style: titilliumBold,
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Total item costs",
                                              style: titilliumRegular,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Rs. " +
                                                      double.parse(CartUtils
                                                              .getTotalItemCost(
                                                        cart!,
                                                      ).toString())
                                                          .toStringAsFixed(2),
                                                  style: titilliumSemiBold
                                                      .copyWith(
                                                          color:
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                          fontSize: Dimensions
                                                              .FONT_SIZE_LARGE),
                                                ),
                                                // Text(
                                                //   NepeleseRupees +
                                                //       Provider.of<CartProvider>(
                                                //               context,
                                                //               listen: false)
                                                //           .getTotalItemCost
                                                //           .toString(),
                                                //   style: titilliumRegular,
                                                // ),
                                                SizedBox(
                                                  width: 25,
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Promo Code",
                                              style: titilliumRegular,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Enter code here",
                                                  style: titilliumRegular,
                                                ),
                                                Icon(
                                                  IconData(0xeb16,
                                                      fontFamily:
                                                          'MaterialIcons'),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Total shipping",
                                              style: titilliumRegular,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Rs. " +
                                                      double.parse(CartUtils
                                                                  .getTotalShippingCost(
                                                                      cart!)
                                                              .toString())
                                                          .toStringAsFixed(2),
                                                  style:
                                                      titilliumRegular.copyWith(
                                                          color:
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                          fontSize: Dimensions
                                                              .FONT_SIZE_LARGE),
                                                ),
                                                // Text(
                                                //   NepeleseRupees +
                                                //       Provider.of<CartProvider>(
                                                //               context,
                                                //               listen: false)
                                                //           .getTotalShippingCost
                                                //           .toString(),
                                                //   style: titilliumRegular,
                                                // ),
                                                SizedBox(
                                                  width: 25,
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "GrandTotal ",
                                              style: titilliumRegular,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Rs. " +
                                                      double.parse(CartUtils
                                                                  .getGrandTotal(
                                                                      cart!)
                                                              .toString())
                                                          .toStringAsFixed(2),
                                                  style: titilliumSemiBold
                                                      .copyWith(
                                                          color:
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                          fontSize: Dimensions
                                                              .FONT_SIZE_LARGE),
                                                ),
                                                // Text(
                                                //   NepeleseRupees +
                                                //       Provider.of<CartProvider>(
                                                //               context,
                                                //               listen: false)
                                                //           .getTotalItemCost
                                                //           .toString(),
                                                //   style: titilliumRegular,
                                                // ),
                                                SizedBox(
                                                  width: 25,
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _callback(bool isSuccess, String message, String orderID,
      List<ProductInfo> carts) async {
    //   if (isSuccess) {
    //     Provider.of<ProductProvider>(context, listen: false).getLatestProductList(
    //       1,
    //       context,
    //       reload: true,
    //     );
    //     if (Provider.of<OrderProvider>(context, listen: false)
    //             .paymentMethodIndex ==
    //         0) {
    //       Navigator.of(context).pushAndRemoveUntil(
    //           MaterialPageRoute(builder: (_) => DashBoardScreen()),
    //           (route) => false);
    //       showAnimatedDialog(
    //           context,
    //           MyDialog(
    //             icon: Icons.check,
    //             title: getTranslated('order_placed', context),
    //             description: getTranslated('your_order_placed', context),
    //             isFailed: false,
    //           ),
    //           dismissible: false,
    //           isFlip: true);
    //     } else {}
    //     Provider.of<OrderProvider>(context, listen: false).stopLoader();
    //   } else {
    //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //         content: Text(message), backgroundColor: ColorResources.RED));
    //   }
    // }
  }

// class PaymentButton extends StatelessWidget {
//   final String image;
//   final Function onTap;
//   PaymentButton({@required this.image, this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         height: 45,
//         margin: EdgeInsets.symmetric(
//             horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
//         padding: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//           border: Border.all(width: 2, color: ColorResources.getGrey(context)),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Image.asset(image),
//       ),
//     );
//   }

  void _checkPermission(Function callback, BuildContext context) async {
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.whileInUse) {
      InkWell(
        onTap: () async {
          Navigator.pop(context);
          await Geolocator.requestPermission();
          _checkPermission(callback, context);
        },
        child: AlertDialog(
          content: MyDialog(
            icon: Icons.location_on_outlined,
            title: '',
            description: getTranslated(
              'you_denied',
              context,
            ),
          ),
        ),
      );
    } else if (permission == LocationPermission.deniedForever) {
      InkWell(
          onTap: () async {
            Navigator.pop(context);
            await Geolocator.openAppSettings();
            _checkPermission(callback, context);
          },
          child: AlertDialog(
              content: MyDialog(
                  icon: Icons.location_on_outlined,
                  title: '',
                  description: getTranslated('you_denied', context))));
    } else {
      callback();
    }
  }
}
