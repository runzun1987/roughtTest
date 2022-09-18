import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/helper/date_converter.dart';
import 'package:flutter_sixvalley_ecommerce/provider/localization_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/splash_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/app_constants.dart';
import 'package:flutter_sixvalley_ecommerce/utill/cart_utils.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/shimmer_loading.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/chat/chat_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/seller/seller_screen.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/order_details.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/order_model.dart';

import 'package:flutter_sixvalley_ecommerce/helper/price_converter.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/provider/order_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/profile_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/seller_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/amount_widget.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/button/custom_button.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/custom_app_bar.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/show_custom_snakbar.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/title_row.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/order/widget/order_details_widget.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/payment/payment_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/support/support_ticket_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/tracking/tracking_screen.dart';
import 'package:provider/provider.dart';

import '../../../models/Order.dart';
import '../../../provider/auth_provider.dart';
import '../../../provider/payment_provider.dart';
import '../../../utill/payment_setting.dart';
import '../payment/payment_screen_list.dart';

class OrderDetailsScreen extends StatelessWidget {
  final Order? orderModel;
  final String? orderId;
  // final String? orderType;
  // final double? extraDiscount;
  // final String? extraDiscountType;
  OrderDetailsScreen({
    this.orderModel,
    required this.orderId,
    // required this.orderType,
    // this.extraDiscount,
    // this.extraDiscountType,
  });

  void _loadData(BuildContext context) async {
    var x = orderModel;
    print(x);
    // await Provider.of<OrderProvider>(context, listen: false).initTrackingInfo(
    //   orderId.toString(),
    //   orderModel,
    //   true,
    //   context,
    // );
    // if (orderModel == null) {
    //   await Provider.of<SplashProvider>(context, listen: false)
    //       .initConfig(context);
    // }
    // Provider.of<SellerProvider>(context, listen: false).removePrevOrderSeller();
    // await Provider.of<ProfileProvider>(context, listen: false)
    //     .initAddressList(context);
    // if (Provider.of<SplashProvider>(context, listen: false)
    //         .configModel!
    //         .shippingMethod ==
    //     'sellerwise_shipping') {
    // await Provider.of<OrderProvider>(context, listen: false).initShippingList(
    //   context,
    //   Provider.of<OrderProvider>(context, listen: false)
    //       .trackingModel!
    //       .sellerId,
    // );
    // } else {
    // await Provider.of<OrderProvider>(context, listen: false)
    //     .initShippingList(context, 1);
    // }
    // Provider.of<OrderProvider>(context, listen: false).getOrderDetails(
    //   orderId.toString(),
    //   context,
    //   Provider.of<LocalizationProvider>(context, listen: false)
    //       .locale
    //       .countryCode,
    // );
  }

  @override
  Widget build(BuildContext context) {
    _loadData(context);
    return Scaffold(
      backgroundColor: ColorResources.getIconBg(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(title: getTranslated('ORDER_DETAILS', context)),
          Expanded(
            child: Consumer<OrderProvider>(
              builder: (context, order, child) {
                return order != null
                    ? ListView(
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.all(0),
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withAlpha(50),
                                  spreadRadius: 3,
                                  blurRadius: 10,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: Card(
                              elevation: 0,
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                  vertical:
                                      Dimensions.PADDING_SIZE_EXTRA_EXTRA_SMALL,
                                  horizontal:
                                      Dimensions.PADDING_SIZE_EXTRA_EXTRA_SMALL,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "STATUS : ",
                                      style: titilliumRegular.copyWith(
                                        fontSize: Dimensions.FONT_SIZE_SMALL,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .color,
                                      ),
                                    ),
                                    Text(
                                      orderModel!.status,
                                      style: titilliumRegular.copyWith(
                                        fontSize: Dimensions.FONT_SIZE_SMALL,
                                        color:
                                            ColorResources.getPrimary(context),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 0.5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withAlpha(50),
                                  spreadRadius: 3,
                                  blurRadius: 10,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: Card(
                              elevation: 0,
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: Dimensions.PADDING_SIZE_DEFAULT,
                                    horizontal: Dimensions.PADDING_SIZE_SMALL),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          getTranslated('ORDER_ID', context)!,
                                          style: titilliumRegular.copyWith(
                                            fontSize:
                                                Dimensions.FONT_SIZE_SMALL,
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .color,
                                          ),
                                        ),
                                        Container(
                                          width: 250,
                                          height: 20,
                                          child: FittedBox(
                                            child: Text(
                                              orderId!,
                                              style: titilliumRegular.copyWith(
                                                fontSize:
                                                    Dimensions.FONT_SIZE_LARGE,
                                                color:
                                                    ColorResources.getPrimary(
                                                        context),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    orderModel!.orderId != null
                                        ? Row(
                                            children: [
                                              Text(
                                                "Short ID: ",
                                                style:
                                                    titilliumRegular.copyWith(
                                                  fontSize: Dimensions
                                                      .FONT_SIZE_EXTRA_SMALL,
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1!
                                                      .color,
                                                ),
                                              ),
                                              Container(
                                                // width: 250,
                                                height: 12,
                                                child: FittedBox(
                                                  child: Text(
                                                    orderModel!.orderId!,
                                                    style: titilliumRegular
                                                        .copyWith(
                                                      fontSize: Dimensions
                                                          .FONT_SIZE_LARGE,
                                                      color: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1!
                                                          .color,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : SizedBox(),
                                    Row(
                                      children: [
                                        // Expanded(child: SizedBox()),
                                        Text(
                                          DateConverter
                                              .localDateToIsoStringAMPM(
                                            DateTime.parse(
                                              orderModel!.createdAt.toString(),
                                            ),
                                          ),
                                          style: titilliumRegular.copyWith(
                                            color:
                                                ColorResources.getHint(context),
                                            fontSize:
                                                Dimensions.FONT_SIZE_SMALL,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${getTranslated('SHIPPING_TO', context)} : ',
                                          style: titilliumRegular.copyWith(
                                            fontSize:
                                                Dimensions.FONT_SIZE_SMALL,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            '${orderModel != null && orderModel!.street != null ? orderModel!.street : ''} ,${orderModel != null && orderModel!.town != null ? orderModel!.town : ''}',
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style: titilliumRegular.copyWith(
                                              fontSize:
                                                  Dimensions.FONT_SIZE_SMALL,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    orderModel != null &&
                                            orderModel!.note != null &&
                                            orderModel!.note != ''
                                        ? Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                    text:
                                                        '${getTranslated('order_note', context)} : ',
                                                    style: robotoBold.copyWith(
                                                        fontSize: Dimensions
                                                            .FONT_SIZE_LARGE,
                                                        color: ColorResources
                                                            .getReviewRattingColor(
                                                                context))),
                                                TextSpan(
                                                  text:
                                                      '${orderModel!.note != null ? orderModel!.note ?? '' : ""}',
                                                  style:
                                                      titilliumRegular.copyWith(
                                                    fontSize: Dimensions
                                                        .FONT_SIZE_SMALL,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        : SizedBox(),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),

                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 0),
                            child: ListView.builder(
                              itemCount: orderModel!.cartList.length,
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.all(0),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withAlpha(50),
                                          spreadRadius: 3,
                                          blurRadius: 10,
                                          offset: Offset(0, 0),
                                        ),
                                      ],
                                    ),
                                    child: Card(
                                      elevation: 0,
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                          vertical:
                                              Dimensions.PADDING_SIZE_DEFAULT,
                                          horizontal:
                                              Dimensions.PADDING_SIZE_SMALL,
                                        ),
                                        child: OrderDetailsWidget(
                                          eachProdOrder:
                                              orderModel!.products[index],
                                          // order: orderModel,
                                          callback: () {
                                            showCustomSnackBar(
                                                'Review submitted successfully',
                                                context,
                                                isError: false);
                                          },
                                          // orderType: orderType,
                                        ),
                                      ),
                                    ));
                              },
                            ),
                          ),

                          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),

                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withAlpha(50),
                                  spreadRadius: 3,
                                  blurRadius: 10,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: Card(
                              elevation: 0,
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: Dimensions.PADDING_SIZE_DEFAULT,
                                    horizontal: Dimensions.PADDING_SIZE_SMALL),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TitleRow(
                                          title:
                                              getTranslated('TOTAL', context)),
                                      AmountWidget(
                                        title: getTranslated('ORDER', context),
                                        amount: PriceConverter.convertPrice(
                                          context,
                                          (double.parse(
                                                orderModel!.grandTotal
                                                    .toString(),
                                              ) -
                                              double.parse(
                                                orderModel!.shippingPrice
                                                    .toString(),
                                              )),
                                        ),
                                      ),
                                      AmountWidget(
                                        title: "Shipping : ",
                                        amount: PriceConverter.convertPrice(
                                            context,
                                            double.parse(
                                              orderModel!.shippingPrice
                                                  .toString(),
                                            )),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: Dimensions
                                                .PADDING_SIZE_EXTRA_SMALL),
                                        child: Divider(
                                            height: 2,
                                            color:
                                                ColorResources.HINT_TEXT_COLOR),
                                      ),
                                      AmountWidget(
                                          title: getTranslated(
                                              'TOTAL_PAYABLE', context),
                                          amount: PriceConverter.convertPrice(
                                            context,
                                            double.parse(
                                              orderModel!.grandTotal.toString(),
                                            ),
                                          )),
                                    ]),
                              ),
                            ),
                          ),

                          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),

                          // Payment

                          (orderModel!.payment != null &&
                                  orderModel!.payment == "notPaid")
                              ? Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withAlpha(50),
                                        spreadRadius: 3,
                                        blurRadius: 10,
                                        offset: Offset(0, 0),
                                      ),
                                    ],
                                  ),
                                  child: Card(
                                    elevation: 0,
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical:
                                              Dimensions.PADDING_SIZE_DEFAULT,
                                          horizontal:
                                              Dimensions.PADDING_SIZE_SMALL),
                                      child: Consumer<PaymentProvider>(
                                        builder:
                                            (context, paymentProvider, value) =>
                                                Row(
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
                                                  width: Dimensions
                                                      .PADDING_SIZE_SMALL,
                                                ),
                                                Text(
                                                  PaymentSetting
                                                      .paymentSelection(
                                                    paymentProvider:
                                                        paymentProvider,
                                                    context: context,
                                                  )[1],
                                                  style:
                                                      titilliumRegular.copyWith(
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
                                                    builder: (BuildContext
                                                            context) =>
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
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withAlpha(50),
                                        spreadRadius: 3,
                                        blurRadius: 10,
                                        offset: Offset(0, 0),
                                      ),
                                    ],
                                  ),
                                  child: Card(
                                    elevation: 0,
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical:
                                              Dimensions.PADDING_SIZE_DEFAULT,
                                          horizontal:
                                              Dimensions.PADDING_SIZE_SMALL),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                getTranslated(
                                                    'PAYMENT', context)!,
                                                style: robotoBold),
                                            SizedBox(
                                                height: Dimensions
                                                    .MARGIN_SIZE_EXTRA_SMALL),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                      getTranslated(
                                                          'PAYMENT_STATUS',
                                                          context)!,
                                                      style: titilliumRegular
                                                          .copyWith(
                                                              fontSize: Dimensions
                                                                  .FONT_SIZE_SMALL)),
                                                  Text(
                                                    orderModel!.payment != null
                                                        ? orderModel!.payment!
                                                        : "COD",
                                                    style: titilliumRegular
                                                        .copyWith(
                                                            fontSize: Dimensions
                                                                .FONT_SIZE_SMALL),
                                                  ),
                                                ]),
                                            SizedBox(
                                                height: Dimensions
                                                    .MARGIN_SIZE_EXTRA_SMALL),
                                          ]),
                                    ),
                                  ),
                                ),
                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          //Payment Button
                          (orderModel!.payment != null &&
                                  orderModel!.payment == "notPaid")
                              ? PaymentSetting.paymentSelection(
                                  paymentProvider:
                                      Provider.of<PaymentProvider>(context),
                                  context: context,
                                )[2]
                              : SizedBox(),
                        ],
                      )
                    : LoadingPage(); //Center(child: CustomLoader(color: Theme.of(context).primaryColor));
              },
            ),
          )
        ],
      ),
    );
  }
}
