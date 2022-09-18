import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:flutter/material.dart';

import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/provider/auth_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/profile_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/theme_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/auth/widget/sign_in_widget.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/auth/widget/sign_up_widget.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatelessWidget {
  final int initialPage;
  final Function? outRoute;

  AuthScreen({
    this.initialPage = 0,
    this.outRoute,
  });

  @override
  Widget build(BuildContext context) {
    Provider.of<ProfileProvider>(context, listen: false)
        .initAddressTypeList(context);
    Provider.of<AuthProvider>(context, listen: false).isRemember;
    PageController _pageController = PageController(initialPage: initialPage);

    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          // background
          Provider.of<ThemeProvider>(context).darkTheme
              ? SizedBox()
              : Image.asset(Images.background,
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width),

          Consumer<AuthProvider>(
            builder: (context, auth, child) => SafeArea(
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 30),

                      // for logo with text
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200),
                          gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Colors.blue,
                              Color.fromARGB(255, 11, 218, 200),
                            ],
                          ),
                        ),
                        height: 150,
                        width: 150,
                        child: Image.asset(
                          Images.intro_logo,
                          scale: 0.5,
                          width: 200,
                          height: 200,
                        ),
                      ),
                      // Image.asset(Images.intro_logo, height: 150, width: 200),

                      // for decision making section like sign in or register section
                      Padding(
                        padding: EdgeInsets.all(Dimensions.MARGIN_SIZE_LARGE),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              bottom: 0,
                              right: Dimensions.MARGIN_SIZE_EXTRA_SMALL,
                              left: 0,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                //margin: EdgeInsets.only(right: Dimensions.FONT_SIZE_LARGE),
                                height: 1,
                                color: ColorResources.getGainsBoro(context),
                              ),
                            ),
                            Consumer<AuthProvider>(
                              builder: (context, authProvider, child) => Row(
                                children: [
                                  InkWell(
                                    onTap: () => _pageController.animateToPage(
                                        0,
                                        duration: Duration(seconds: 1),
                                        curve: Curves.easeInOut),
                                    child: Column(
                                      children: [
                                        Text(getTranslated('SIGN_IN', context)!,
                                            style:
                                                authProvider.selectedIndex == 0
                                                    ? titilliumSemiBold
                                                    : titilliumRegular),
                                        Container(
                                          height: 1,
                                          width: 40,
                                          margin: EdgeInsets.only(top: 8),
                                          color: authProvider.selectedIndex == 0
                                              ? Theme.of(context).primaryColor
                                              : Colors.transparent,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 25),
                                  InkWell(
                                    onTap: () => _pageController.animateToPage(
                                        1,
                                        duration: Duration(seconds: 1),
                                        curve: Curves.easeInOut),
                                    child: Column(
                                      children: [
                                        Text(getTranslated('SIGN_UP', context)!,
                                            style:
                                                authProvider.selectedIndex == 1
                                                    ? titilliumSemiBold
                                                    : titilliumRegular),
                                        Container(
                                            height: 1,
                                            width: 50,
                                            margin: EdgeInsets.only(top: 8),
                                            color: authProvider.selectedIndex ==
                                                    1
                                                ? Theme.of(context).primaryColor
                                                : Colors.transparent),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // show login or register widget
                      Expanded(
                        child: Consumer<AuthProvider>(
                          builder: (context, authProvider, child) =>
                              PageView.builder(
                            itemCount: 2,
                            controller: _pageController,
                            itemBuilder: (context, index) {
                              if (authProvider.selectedIndex == 0) {
                                return SignInWidget(outRoute: outRoute);
                              } else {
                                return SignUpWidget(outRoute: outRoute);
                              }
                            },
                            onPageChanged: (index) {
                              authProvider.updateSelectedIndex(index);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
