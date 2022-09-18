import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/button/custom_button.dart';

List<String> numbers = [
  "9851111111",
  "985222222",
  "985222222",
];

class MyDialog extends StatelessWidget {
  final bool isFailed;
  final double rotateAngle;
  final IconData icon;
  final String? title;
  final String? description;
  final Color? customIconColor;
  MyDialog({
    this.isFailed = false,
    this.customIconColor,
    this.rotateAngle = 0,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Dialog(
      insetPadding: EdgeInsets.all(90),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      backgroundColor: Color(0xFFE4FBFF),
      child: Padding(
        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
        child: Stack(clipBehavior: Clip.none, children: [
          Positioned(
            left: 0,
            right: 0,
            top: -55,
            child: Container(
              height: 80,
              width: 80,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.green,
                      Colors.greenAccent,
                    ],
                  ),
                  color: isFailed
                      ? ColorResources.getRed(context)
                      : customIconColor != null
                          ? customIconColor
                          : Theme.of(context).primaryColor,
                  shape: BoxShape.circle),
              child: Transform.rotate(
                angle: rotateAngle,
                child: Icon(
                  icon,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 0),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              // Text(title!,
              //     style: robotoBold.copyWith(
              //         fontSize: Dimensions.FONT_SIZE_LARGE)),
              // SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
              // Text(description!,
              //     textAlign: TextAlign.center, style: titilliumRegular),
              // SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
              Container(
                height: height * 0.16,
                width: 300,
                child: ListView(
                  children: [
                    ...numbers.map(
                      (number) => ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.transparent,
                          backgroundColor: Colors.transparent,
                          padding: const EdgeInsets.all(0.0),
                          elevation: 5,
                        ),
                        onPressed: () async {
                          bool? res =
                              await FlutterPhoneDirectCaller.callNumber(number);
                        },
                        child: Ink(
                          width: width * .40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color(
                                  0xFFA0D995,
                                ),
                                Color(
                                  0xFF6CC4A1,
                                ),
                              ],
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            constraints: const BoxConstraints(minWidth: 88.0),
                            child: Text(
                              number,
                              style: robotoRegular.copyWith(
                                color: Color(0xFF181818),
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            // child: Text(number,
                            //     textAlign: TextAlign
                            //         .center, ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.symmetric(
              //       horizontal: Dimensions.PADDING_SIZE_LARGE),
              //   child: CustomButton(
              //       buttonText: getTranslated('ok', context),
              //       onTap: () => Navigator.pop(context)),
              // ),
            ]),
          ),
        ]),
      ),
    );
  }
}
