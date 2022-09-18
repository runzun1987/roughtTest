import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/provider/order_provider.dart';

import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/utill/app_constants.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/custom_app_bar.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/custom_loader.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/dashboard/dashboard_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/tracking/painter/line_dashed_painter.dart';
import 'package:provider/provider.dart';
import 'package:status_change/status_change.dart';

class TrackingResultScreen extends StatelessWidget {
  final String orderID;
  TrackingResultScreen({required this.orderID});

  @override
  Widget build(BuildContext context) {
    // Provider.of<OrderProvider>(context, listen: false).initTrackingInfo(orderID, null, false, context);
    List<String> _processes = [
      'pending',
      'confirmed',
      'processing',
      'out_for_delivery',
      'delivered'
    ];

    Color getColor(index) {
      return Colors.red;
    }

    int _processIndex = 0;

    return Scaffold(
      backgroundColor: ColorResources.getIconBg(context),
      body: Column(
        children: [
          CustomAppBar(title: getTranslated('DELIVERY_STATUS', context)),

          Container(
            color: Colors.black,
            width: double.infinity,
            height: 20,
            child: StatusChange.tileBuilder(
              theme: StatusChangeThemeData(
                direction: Axis.vertical,
                connectorTheme: ConnectorThemeData(space: 1.0, thickness: 1.0),
              ),
              builder: StatusChangeTileBuilder.connected(
                itemWidth: (_) =>
                    MediaQuery.of(context).size.width / _processes.length,
                contentWidgetBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'add content here',
                      style: TextStyle(
                        color: Colors
                            .blue, // change color with dynamic color --> can find it with example section
                      ),
                    ),
                  );
                },
                nameWidgetBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      'your text ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: getColor(index),
                      ),
                    ),
                  );
                },
                indicatorWidgetBuilder: (_, index) {
                  if (index <= _processIndex) {
                    return DotIndicator(
                      size: 35.0,
                      border: Border.all(color: Colors.green, width: 1),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    );
                  } else {
                    return OutlinedDotIndicator(
                      size: 30,
                      borderWidth: 1.0,
                      color: Colors.green,
                    );
                  }
                },
                lineWidgetBuilder: (index) {
                  if (index > 0) {
                    if (index == _processIndex) {
                      final prevColor = getColor(index - 1);
                      final color = getColor(index);
                      var gradientColors;
                      gradientColors = [
                        prevColor,
                        Color.lerp(prevColor, color, 0.5)
                      ];
                      return DecoratedLineConnector(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: gradientColors,
                          ),
                        ),
                      );
                    } else {
                      return SolidLineConnector(
                        color: getColor(index),
                      );
                    }
                  } else {
                    return null;
                  }
                },
                itemCount: _processes.length,
              ),
            ),
          ),

          // for footer button
          Container(
            height: 45,
            margin: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
            decoration: BoxDecoration(
                color: ColorResources.getImageBg(context),
                borderRadius: BorderRadius.circular(6)),
            child: TextButton(
              style: TextButton.styleFrom(padding: EdgeInsets.all(0)),
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => DashBoardScreen()),
                    (route) => false);
              },
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  getTranslated('ORDER_MORE', context)!,
                  style: titilliumSemiBold.copyWith(
                      fontSize: Dimensions.FONT_SIZE_LARGE,
                      color: ColorResources.getPrimary(context)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomStepper extends StatelessWidget {
  final String? title;
  final Color color;
  final bool isLastItem;
  CustomStepper(
      {required this.title, required this.color, this.isLastItem = false});

  @override
  Widget build(BuildContext context) {
    Color myColor;
    if (title == getTranslated('processing', context) ||
        title == getTranslated('pending', context)) {
      myColor = ColorResources.GREY;
    } else {
      myColor = color;
    }
    return Container(
      width: isLastItem ? 50 : 100,
      padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL),
      child: Container(
        child: Column(
          children: [
            FittedBox(
              child: Container(
                child: Text(title!, style: titilliumRegular),
              ),
            ),
            Row(
              children: [
                CircleAvatar(backgroundColor: myColor, radius: 10.0),
                isLastItem
                    ? SizedBox.shrink()
                    : CustomPaint(
                        painter: LineDashedPainter(myColor),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
