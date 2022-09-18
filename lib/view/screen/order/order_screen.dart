import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/order_model.dart';

import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/provider/auth_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/order_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/custom_app_bar.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/not_loggedin_widget.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/order/widget/order_widget.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../models/Order.dart';
import '../../../provider/profile_provider.dart';

// ignore: must_be_immutable
class OrderScreen extends StatefulWidget {
  final bool isBacButtonExist;
  OrderScreen({this.isBacButtonExist = true});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  bool isFirstTime = true;
  bool isGuestMode = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  _asyncMethod() async {
    isGuestMode = !await Provider.of<AuthProvider>(context, listen: false)
        .isLoggedIn(context);
  }

  @override
  Widget build(BuildContext context) {
    var _scrollController = ScrollController();
    // bool isGuestMode =
    //     !Provider.of<AuthProvider>(context, listen: false).isLoggedIn(context);

    if (isFirstTime) {
      if (!isGuestMode) {
        String phone = Provider.of<ProfileProvider>(context, listen: false)
            .userInfoModel
            ?.phone;
        Provider.of<OrderProvider>(context, listen: false)
            .initOrderList(phone, context);
      }

      isFirstTime = false;
    }

    return Scaffold(
      backgroundColor: ColorResources.getIconBg(context),
      body: Container(
        color: Color(0xffF5F5F5),
        child: Column(
          children: [
            CustomAppBar(
                scrollController: _scrollController,
                title: getTranslated('ORDER', context),
                isBackButtonExist: widget.isBacButtonExist),
            isGuestMode
                ? SizedBox()
                : Provider.of<OrderProvider>(context).allList != null
                    ? Consumer<OrderProvider>(
                        builder: (context, orderProvider, child) => Card(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            height: 40,
                            child: ListView(
                              controller: _scrollController,
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                OrderTypeButton(
                                    text: "All",
                                    index: 0,
                                    orderList: orderProvider.allList),
                                SizedBox(width: 10),
                                OrderTypeButton(
                                    text: "Unpaid",
                                    index: 1,
                                    orderList: orderProvider.upaidList),
                                SizedBox(width: 10),
                                OrderTypeButton(
                                    text: "Processing",
                                    index: 2,
                                    orderList: orderProvider.processingList),
                                SizedBox(width: 10),
                                OrderTypeButton(
                                    text: "Shipped",
                                    index: 3,
                                    orderList: orderProvider.shippedList),
                                SizedBox(width: 10),
                                OrderTypeButton(
                                    text: "Review",
                                    index: 4,
                                    orderList: orderProvider.reviewList),
                                SizedBox(width: 10),
                                OrderTypeButton(
                                    text: getTranslated('CANCELED', context),
                                    index: 5,
                                    orderList: orderProvider.canceledList),
                                SizedBox(width: 10),
                                OrderTypeButton(
                                    text: "Search Result",
                                    index: 6,
                                    orderList: orderProvider.searchResultList),
                              ],
                            ),
                          ),
                        ),
                      )
                    : SizedBox(),
            isGuestMode
                ? Expanded(child: NotLoggedInWidget())
                : Provider.of<OrderProvider>(context).allList != null
                    ? Consumer<OrderProvider>(
                        builder: (context, order, child) {
                          List<Order>? orderList = [];
                          if (Provider.of<OrderProvider>(context, listen: false)
                                  .orderTypeIndex ==
                              0) {
                            orderList = order.allList;
                          } else if (Provider.of<OrderProvider>(context,
                                      listen: false)
                                  .orderTypeIndex ==
                              1) {
                            orderList = order.upaidList;
                          } else if (Provider.of<OrderProvider>(context,
                                      listen: false)
                                  .orderTypeIndex ==
                              2) {
                            orderList = order.processingList;
                          } else if (Provider.of<OrderProvider>(context,
                                      listen: false)
                                  .orderTypeIndex ==
                              3) {
                            orderList = order.shippedList;
                          } else if (Provider.of<OrderProvider>(context,
                                      listen: false)
                                  .orderTypeIndex ==
                              4) {
                            orderList = order.reviewList;
                          } else if (Provider.of<OrderProvider>(context,
                                      listen: false)
                                  .orderTypeIndex ==
                              5) {
                            orderList = order.canceledList;
                          } else if (Provider.of<OrderProvider>(context,
                                      listen: false)
                                  .orderTypeIndex ==
                              6) {
                            final double offset = _scrollController!.offset;

                            _scrollController!.animateTo(
                              (1000).toDouble(),
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                            orderList = order.searchResultList;
                          }
                          return Expanded(
                            child: RefreshIndicator(
                              backgroundColor: Theme.of(context).primaryColor,
                              onRefresh: () async {
                                String phone = Provider.of<ProfileProvider>(
                                        context,
                                        listen: false)
                                    .userInfoModel
                                    ?.phone;
                                print(phone);
                                await Provider.of<OrderProvider>(context,
                                        listen: false)
                                    .initOrderList(phone, context);

                                final double offset = _scrollController!.offset;

                                _scrollController!.animateTo(
                                  (0).toDouble(),
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                              },
                              child: ListView.builder(
                                itemCount: orderList!.length,
                                padding: EdgeInsets.all(0),
                                itemBuilder: (context, index) =>
                                    OrderWidget(orderModel: orderList![index]),
                              ),
                            ),
                          );
                        },
                      )
                    : Expanded(child: OrderShimmer()),
          ],
        ),
      ),
    );
  }
}

class OrderShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      padding: EdgeInsets.all(0),
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: Dimensions.MARGIN_SIZE_DEFAULT),
          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
          color: Theme.of(context).highlightColor,
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 10, width: 150, color: ColorResources.WHITE),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(child: Container(height: 45, color: Colors.white)),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Container(height: 20, color: ColorResources.WHITE),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Container(
                                  height: 10, width: 70, color: Colors.white),
                              SizedBox(width: 10),
                              Container(
                                  height: 10, width: 20, color: Colors.white),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class OrderTypeButton extends StatelessWidget {
  final String? text;
  final int index;
  final List<Order>? orderList;

  OrderTypeButton(
      {required this.text, required this.index, required this.orderList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: () =>
            Provider.of<OrderProvider>(context, listen: false).setIndex(index),
        style: TextButton.styleFrom(padding: EdgeInsets.all(0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 20,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                // color: Provider.of<OrderProvider>(context, listen: false)
                //             .orderTypeIndex ==
                //         index
                //     ? ColorResources.getPrimary(context)
                //     : Theme.of(context).highlightColor,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                // text! + '(${orderList!.length})',
                text!,
                style: Provider.of<OrderProvider>(context, listen: false)
                            .orderTypeIndex ==
                        index
                    ? TextStyle(
                        fontFamily: 'Ubuntu',
                        fontSize: Dimensions.FONT_SIZE_LARGE,
                        fontWeight: FontWeight.w700,
                      )
                    : TextStyle(
                        fontFamily: 'Ubuntu',
                        fontSize: Dimensions.FONT_SIZE_DEFAULT,
                        fontWeight: FontWeight.w600,
                      ),
              ),
            ),
            Container(
                width: 20,
                height: 5,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  // color: Provider.of<OrderProvider>(context, listen: false)
                  //             .orderTypeIndex ==
                  //         index
                  //     ? ColorResources.getPrimary(context)
                  //     : Theme.of(context).highlightColor,
                  borderRadius: BorderRadius.circular(6),
                  color: Provider.of<OrderProvider>(context, listen: false)
                              .orderTypeIndex ==
                          index
                      ? ColorResources.getPrimary(context)
                      : Theme.of(context).highlightColor,
                )

                // borderRadius: BorderRadius.circular(6)
                )
          ],
        ),
      ),
    );
  }
}
