import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:provider/provider.dart';

import '../../../provider/auth_provider.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/custom_themes.dart';
import '../../../utill/dimensions.dart';
import '../../basewidget/button/custom_button.dart';
import '../../basewidget/custom_app_bar.dart';
import '../../basewidget/textfield/custom_textfield.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  var _currentPasswordController = TextEditingController();
  var _newPasswordController = TextEditingController();
  var _confirmNewPasswordController = TextEditingController();

  var _currentPasswordNode = FocusNode();
  var _newPasswordNode = FocusNode();
  var _confirmNewPasswordNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.lightBlue.withAlpha(
            10,
          ),
          margin: EdgeInsets.all(8),
          child: Stack(
            children: [
              Positioned.fill(
                child: FloatingBubbles(
                  noOfBubbles: 10,
                  colorsOfBubbles: [
                    Color.fromARGB(255, 92, 165, 224).withAlpha(30),
                    Color.fromARGB(255, 52, 240, 247),
                  ],
                  sizeFactor: 0.10,
                  duration: 400, // 120 seconds.
                  opacity: 85,
                  paintingStyle: PaintingStyle.stroke,
                  strokeWidth: 1,
                  shape: BubbleShape
                      .circle, // circle is the default. No need to explicitly mention if its a circle.
                ),
              ),
              Column(
                children: [
                  CustomAppBar(
                    title: "Security",
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: height * 0.20,
                    width: width,
                    child: Image.asset(
                      Images.security,
                      scale: 0.5,
                    ),
                  ),
                  Container(
                    width: width,
                    height: height * 0.35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      color: ColorResources.LIGHT_SKY_BLUE.withAlpha(
                        80,
                      ),
                    ),
                    child: Column(children: [
                      // for current password
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(
                              left: Dimensions.MARGIN_SIZE_DEFAULT,
                              right: Dimensions.MARGIN_SIZE_DEFAULT,
                              top: Dimensions.MARGIN_SIZE_SMALL),
                          child: CustomTextField(
                            hintText: "Current Password",
                            focusNode: _currentPasswordNode,
                            nextNode: _newPasswordNode,
                            textInputType: TextInputType.text,
                            controller: _currentPasswordController,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(
                              left: Dimensions.MARGIN_SIZE_DEFAULT,
                              right: Dimensions.MARGIN_SIZE_DEFAULT,
                              top: Dimensions.MARGIN_SIZE_SMALL),
                          child: CustomTextField(
                            hintText: "New Password",
                            focusNode: _currentPasswordNode,
                            nextNode: _newPasswordNode,
                            textInputType: TextInputType.text,
                            controller: _currentPasswordController,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(
                              left: Dimensions.MARGIN_SIZE_DEFAULT,
                              right: Dimensions.MARGIN_SIZE_DEFAULT,
                              top: Dimensions.MARGIN_SIZE_SMALL),
                          child: CustomTextField(
                            hintText: "Retype new Password",
                            focusNode: _currentPasswordNode,
                            nextNode: _newPasswordNode,
                            textInputType: TextInputType.text,
                            controller: _currentPasswordController,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: 20, right: 20, bottom: 15, top: 20),
                        child: Provider.of<AuthProvider>(context).isLoading
                            ? Center(
                                child: CircularProgressIndicator(
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                    Theme.of(context).primaryColor,
                                  ),
                                ),
                              )
                            : CustomButton(
                                onTap: () {}, buttonText: "Change Password"),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: height * 0.10,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
