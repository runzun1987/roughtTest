import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/order_details.dart';
import 'package:flutter_sixvalley_ecommerce/helper/price_converter.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/models/ModelProvider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/order_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/product_details_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/splash_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/app_constants.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/order/widget/refunded_status_bottom_sheet.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/product/review_dialog.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/product/widget/refund_request_bottom_sheet.dart';

import 'package:provider/provider.dart';

import '../../../../data/model/response/base/cities.dart';
import '../../../../data/model/response/base/shipping_type.dart';
import '../../../../utill/shipping_cost_and_estimated_delivery.dart';
import '../../tracking/IconStepper/IconStepper.dart';
import '../../tracking/hr.dart';
import '../../tracking/tracking_result_screen.dart';
import '../../tracking/tracking_screen.dart';

class OrderDetailsWidget extends StatefulWidget {
  // final ProductInfo? eachProdOrder;
  // final Order? order;
  final eachProductOrder? eachProdOrder;
  final String? orderType;
  final Function? callback;
  OrderDetailsWidget({
    // this.productInfo,
    this.callback,
    this.orderType,
    this.eachProdOrder,
    // this.order,
  });

  @override
  State<OrderDetailsWidget> createState() => _OrderDetailsWidgetState();
}

class _OrderDetailsWidgetState extends State<OrderDetailsWidget> {
  int activeStep = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    String? currentState =
        widget.eachProdOrder!.shippingStatus == AppConstants.COMPLETE
            ? widget.eachProdOrder!.shippingStatus
            : widget.eachProdOrder!.shipNepalOrderStatus ==
                    AppConstants.RECEIVED_AT_KTM
                ? widget.eachProdOrder!.shipNepalOrderStatus
                : widget.eachProdOrder!.shipNepalOrder != null
                    ? widget.eachProdOrder!.shipNepalOrder!.products![0]
                                .order_status!
                                .trim() ==
                            AppConstants.TO_BE_RECEIVED
                        ? AppConstants.PURCHASED
                        : widget.eachProdOrder!.shipNepalOrder!.products![0]
                            .order_status!
                            .trim()
                    : null;
    dynamic finalState;
    if (currentState == AppConstants.RECEIVED_AT_KTM) {
      finalState = AppConstants.RECEIVEDNP;
    } else if (currentState == AppConstants.COMPLETE) {
      finalState = AppConstants.DELIVERED;
    } else {
      finalState = currentState;
    }


    if (finalState == AppConstants.IN_REVIEW) {
      setState(() {
        activeStep = 0;
      });
    } else if (finalState == AppConstants.PURCHASED) {
      setState(() {
        activeStep = 1;
      });
    } else if (finalState == AppConstants.RECEIVED) {
      setState(() {
        activeStep = 2;
      });
    } else if (finalState == AppConstants.SHIPPED) {
      setState(() {
        activeStep = 3;
      });
    } else if (finalState == AppConstants.RECEIVED_AT_KTM) {
      setState(() {
        activeStep = 4;
      });
    } else if (finalState == AppConstants.COMPLETE) {
      setState(() {
        activeStep = 5;
      });
    } else {
      setState(() {
        activeStep = -1;
      });
    }
  }

  int upperBound = 6;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius:
                    BorderRadius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL),

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    Dimensions.PADDING_SIZE_DEFAULT,
                  ),
                  child: FadeInImage.assetNetwork(
                    placeholder: Images.placeholder,
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100,
                    image: '${widget.eachProdOrder!.image!}',
                    imageErrorBuilder: (c, o, s) => Image.asset(
                        Images.placeholder,
                        fit: BoxFit.cover,
                        width: 50,
                        height: 50),
                  ),
                ),
                // child: FadeInImage.assetNetwork(
                //   placeholder: Images.placeholder,
                //   fit: BoxFit.scaleDown,
                //   width: 60,
                //   height: 60,
                //   image: '${widget.productInfo!.image!}',
                //   imageErrorBuilder: (c, o, s) => Image.asset(
                //       Images.placeholder,
                //       fit: BoxFit.scaleDown,
                //       width: 50,
                //       height: 50),
                // ),
              ),
              SizedBox(width: Dimensions.MARGIN_SIZE_DEFAULT),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.eachProdOrder!.title!,
                            style: titilliumRegular.copyWith(
                              fontSize: Dimensions.FONT_SIZE_DEFAULT,
                              color: ColorResources.getPrimary(context),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                        Provider.of<OrderProvider>(context).orderTypeIndex ==
                                    1 &&
                                widget.orderType != "POS"
                            ? InkWell(
                                onTap: () {
                                  if (Provider.of<OrderProvider>(context,
                                              listen: false)
                                          .orderTypeIndex ==
                                      1) {
                                    Provider.of<ProductDetailsProvider>(context,
                                            listen: false)
                                        .removeData();
                                    showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        builder: (context) => ReviewBottomSheet(
                                            productID: widget
                                                .eachProdOrder!.productId
                                                .toString(),
                                            callback: widget.callback));
                                  }
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: Dimensions.PADDING_SIZE_SMALL),
                                  padding: EdgeInsets.symmetric(
                                      vertical:
                                          Dimensions.PADDING_SIZE_EXTRA_SMALL,
                                      horizontal:
                                          Dimensions.PADDING_SIZE_SMALL),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.PADDING_SIZE_DEFAULT),
                                    border: Border.all(
                                        width: 1,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  child: Text(getTranslated('review', context)!,
                                      style: titilliumRegular.copyWith(
                                        fontSize:
                                            Dimensions.FONT_SIZE_EXTRA_SMALL,
                                        color: ColorResources.getTextTitle(
                                            context),
                                      )),
                                ),
                              )
                            : SizedBox.shrink(),

                        // Consumer<OrderProvider>(
                        //   builder: (context, refund, _) {
                        //     return refund.orderTypeIndex == 1 &&
                        //             widget.orderDetailsModel!.refundReq == 0 &&
                        //             widget.orderType != "POS"
                        //         ? InkWell(
                        //             onTap: () {
                        //               Provider.of<ProductDetailsProvider>(
                        //                       context,
                        //                       listen: false)
                        //                   .removeData();
                        //               refund
                        //                   .getRefundReqInfo(context,
                        //                       widget.orderDetailsModel!.id)
                        //                   .then((value) {
                        //                 if (value.response!.statusCode == 200) {
                        //                   Navigator.push(
                        //                       context,
                        //                       MaterialPageRoute(
                        //                           builder: (_) => RefundBottomSheet(
                        //                               product: widget
                        //                                   .orderDetailsModel!
                        //                                   .productDetails,
                        //                               orderDetailsId: widget
                        //                                   .orderDetailsModel!
                        //                                   .id)));
                        //                 }
                        //               });
                        //             },
                        //             child: refund.isLoading
                        //                 ? Center(
                        //                     child: CircularProgressIndicator(
                        //                         color: Theme.of(context)
                        //                             .primaryColor))
                        //                 : Container(
                        //                     margin: EdgeInsets.only(
                        //                         left: Dimensions
                        //                             .PADDING_SIZE_SMALL),
                        //                     padding: EdgeInsets.symmetric(
                        //                         vertical: Dimensions
                        //                             .PADDING_SIZE_EXTRA_SMALL,
                        //                         horizontal: Dimensions
                        //                             .PADDING_SIZE_SMALL),
                        //                     decoration: BoxDecoration(
                        //                       color: ColorResources.getPrimary(
                        //                           context),
                        //                       borderRadius: BorderRadius
                        //                           .circular(Dimensions
                        //                               .PADDING_SIZE_DEFAULT),
                        //                     ),
                        //                     child: Text(
                        //                         getTranslated(
                        //                             'refund_request', context)!,
                        //                         style:
                        //                             titilliumRegular.copyWith(
                        //                           fontSize: Dimensions
                        //                               .FONT_SIZE_EXTRA_SMALL,
                        //                           color: Theme.of(context)
                        //                               .highlightColor,
                        //                         )),
                        //                   ),
                        //           )
                        //         : SizedBox();
                        //   },
                        // ),
                        // Consumer<OrderProvider>(
                        //   builder: (context, refund, _) {
                        //     return Provider.of<OrderProvider>(context)
                        //                     .orderTypeIndex ==
                        //                 1 &&
                        //             widget.orderDetailsModel!.refundReq != 0 &&
                        //             widget.orderType != "POS"
                        //         ? InkWell(
                        //             onTap: () {
                        //               Provider.of<ProductDetailsProvider>(
                        //                       context,
                        //                       listen: false)
                        //                   .removeData();
                        //               refund
                        //                   .getRefundReqInfo(context,
                        //                       widget.orderDetailsModel!.id)
                        //                   .then((value) {
                        //                 if (value.response!.statusCode == 200) {
                        //                   Navigator.push(
                        //                       context,
                        //                       MaterialPageRoute(
                        //                           builder: (_) =>
                        //                               RefundResultBottomSheet(
                        //                                   product: widget
                        //                                       .orderDetailsModel!
                        //                                       .productDetails,
                        //                                   orderDetailsId: widget
                        //                                       .orderDetailsModel!
                        //                                       .id,
                        //                                   orderDetailsModel: widget
                        //                                       .orderDetailsModel)));
                        //                 }
                        //               });
                        //             },
                        //             child: refund.isLoading
                        //                 ? Center(
                        //                     child: CircularProgressIndicator(
                        //                         color: Theme.of(context)
                        //                             .primaryColor))
                        //                 : Container(
                        //                     margin: EdgeInsets.only(
                        //                         left: Dimensions
                        //                             .PADDING_SIZE_SMALL),
                        //                     padding: EdgeInsets.symmetric(
                        //                         vertical: Dimensions
                        //                             .PADDING_SIZE_EXTRA_SMALL,
                        //                         horizontal: Dimensions
                        //                             .PADDING_SIZE_SMALL),
                        //                     decoration: BoxDecoration(
                        //                       color: ColorResources.getPrimary(
                        //                           context),
                        //                       borderRadius: BorderRadius
                        //                           .circular(Dimensions
                        //                               .PADDING_SIZE_DEFAULT),
                        //                     ),
                        //                     child: Text(
                        //                         getTranslated(
                        //                             'refund_status_btn',
                        //                             context)!,
                        //                         style:
                        //                             titilliumRegular.copyWith(
                        //                           fontSize: Dimensions
                        //                               .FONT_SIZE_EXTRA_SMALL,
                        //                           color: Theme.of(context)
                        //                               .highlightColor,
                        //                         )),
                        //                   ),
                        //           )
                        //         : SizedBox();
                        //   },
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.MARGIN_SIZE_EXTRA_SMALL,
                    ),
                    widget.eachProdOrder!.detail != null
                        ? Text(
                            widget.eachProdOrder!.detail!
                                .map((d) {
                                  return "${d!.name} ${d.value}";
                                })
                                .toList()
                                .join(','),
                            // .detailsToString,
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          )
                        : SizedBox(),
                    SizedBox(height: Dimensions.MARGIN_SIZE_EXTRA_SMALL),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          PriceConverter.convertPrice(
                            context,
                            double.parse(
                              (widget.eachProdOrder!.sum!).toString(),
                            ),
                          ),
                          style: titilliumSemiBold.copyWith(
                              color: ColorResources.getPrimary(context)),
                        ),
                        Text('x${widget.eachProdOrder!.qty}',
                            style: titilliumSemiBold.copyWith(
                                color: ColorResources.getPrimary(context))),
                        // widget.orderDetailsModel!.discount! > 0
                        //     ? Container(
                        //         height: 20,
                        //         alignment: Alignment.center,
                        //         padding: EdgeInsets.symmetric(
                        //             horizontal:
                        //                 Dimensions.PADDING_SIZE_EXTRA_SMALL),
                        //         decoration: BoxDecoration(
                        //             borderRadius: BorderRadius.circular(16),
                        //             border: Border.all(
                        //                 color: ColorResources.getPrimary(
                        //                     context))),
                        //         child: Text(
                        //           PriceConverter.percentageCalculation(
                        //               context,
                        //               (widget.orderDetailsModel!.price! *
                        //                   widget.orderDetailsModel!.qty!),
                        //               widget.orderDetailsModel!.discount,
                        //               'amount'),
                        //           style: titilliumRegular.copyWith(
                        //               fontSize:
                        //                   Dimensions.FONT_SIZE_EXTRA_SMALL,
                        //               color:
                        //                   ColorResources.getPrimary(context)),
                        //         ),
                        //       )
                        //     : SizedBox(),
                      ],
                    ),
                    Row(children: [
                      Text(
                        'Shipping :',
                        style: robotoRegular.copyWith(
                          fontSize: Dimensions.FONT_SIZE_SMALL,
                          color: Theme.of(context).disabledColor,
                        ),
                      ),
                      Text(
                        PriceConverter.convertPrice(
                          context,
                          double.parse(
                            ShippingCostAndEstimatedDelivery.sumOfShipping(
                              widget.eachProdOrder!.provider != null
                                  ? widget.eachProdOrder!.provider
                                  : "old",
                              widget.eachProdOrder!.sellerPrice != null
                                  ? widget.eachProdOrder!.sellerPrice
                                  : 0,
                              widget.eachProdOrder!.price!,
                              ShippingType.express,
                              widget.eachProdOrder!.city != null
                                  ? Cities.getTier(widget.eachProdOrder!.city!)
                                  : 1,
                              widget.eachProdOrder!.qty!,
                            ).toString(),
                          ),
                        ),
                        style: robotoRegular.copyWith(
                          fontSize: Dimensions.FONT_SIZE_SMALL,
                          color: Theme.of(context).disabledColor,
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
            ],
          ),

          activeStep != -1
              ? IconStepper(
                  enableNextPreviousButtons: false,
                  enableStepTapping: false,
                  stepRadius: 10.0,
                  lineLength: 30.0,
                  activeStepBorderPadding: 0,
                  icons: [
                    Icon(Icons.preview),
                    Icon(Icons.shopping_bag),
                    Icon(Icons.call_received),
                    Icon(Icons.local_shipping),
                    Icon(Icons.flag),
                    Icon(Icons.delivery_dining),
                  ],
                  texts: [
                    Text("In Review"),
                    Text("Purchased"),
                    Text("Received(CN)"),
                    Text("Shipped"),
                    Text("Received(NP)"),
                    Text("Delivered"),
                  ],

                  // activeStep property set to activeStep variable defined above.
                  activeStep: activeStep,

                  // This ensures step-tapping updates the activeStep.
                  onStepReached: (index) {
                    setState(() {
                      activeStep = index;
                    });
                  },

                  // child: Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Column(
                  //     children: [
                  //       IconStepper(
                  //         icons: [
                  //           Icon(Icons.supervised_user_circle),
                  //           Icon(Icons.flag),
                  //           Icon(Icons.access_alarm),
                  //           Icon(Icons.supervised_user_circle),
                  //           Icon(Icons.flag),
                  //           Icon(Icons.access_alarm),
                  //           Icon(Icons.supervised_user_circle),
                  //         ],

                  //         // activeStep property set to activeStep variable defined above.
                  //         activeStep: 1,

                  //         // This ensures step-tapping updates the activeStep.
                  //         onStepReached: (index) {
                  //           // setState(() {
                  //           //   activeStep = index;
                  //           // });
                  //         },
                  //       ),
                  //       // header(),
                  //       Expanded(
                  //         child: FittedBox(
                  //           child: Center(
                  //             child: Text('1'),
                  //           ),
                  //         ),
                  //       ),
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           // previousButton(),
                  //           // nextButton(),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
                )
              : SizedBox()

          // (widget.orderDetailsModel!.variant != null &&
          //         widget.orderDetailsModel!.variant!.isNotEmpty)
          //     ? Padding(
          //         padding: EdgeInsets.only(
          //             left: Dimensions.PADDING_SIZE_SMALL,
          //             top: Dimensions.PADDING_SIZE_EXTRA_SMALL),
          //         child: Row(children: [
          //           SizedBox(width: 65),
          //           Text('${getTranslated('variations', context)}: ',
          //               style: titilliumSemiBold.copyWith(
          //                   fontSize: Dimensions.FONT_SIZE_SMALL)),
          //           Flexible(
          //               child: Text(widget.orderDetailsModel!.variant!,
          //                   style: robotoRegular.copyWith(
          //                     fontSize: Dimensions.FONT_SIZE_SMALL,
          //                     color: Theme.of(context).disabledColor,
          //                   ))),
          //         ]),
          //       )
          //     : SizedBox(),
          // Divider(),
        ],
      ),
    );
  }
}
