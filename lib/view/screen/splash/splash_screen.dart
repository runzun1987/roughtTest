import 'dart:async';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/provider/auth_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/splash_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/theme_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/no_internet_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/auth/auth_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/dashboard/dashboard_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/maintenance/maintenance_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/onboarding/onboarding_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/order/order_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/splash/widget/splash_painter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../../provider/profile_provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  GlobalKey<ScaffoldMessengerState> _globalKey = GlobalKey();
  late StreamSubscription<ConnectivityResult> _onConnectivityChanged;

  @override
  void initState() {
    super.initState();

    bool _firstTime = true;
    _onConnectivityChanged = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (!_firstTime) {
        bool isNotConnected = result != ConnectivityResult.wifi &&
            result != ConnectivityResult.mobile;
        isNotConnected
            ? SizedBox()
            : ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: isNotConnected ? Colors.red : Colors.green,
          duration: Duration(seconds: isNotConnected ? 6000 : 3),
          content: Text(
            isNotConnected
                ? getTranslated('no_connection', context)!
                : getTranslated('connected', context)!,
            textAlign: TextAlign.center,
          ),
        ));
        if (!isNotConnected) {
          _route();
        }
      }
      _firstTime = false;
    });

    _route();
  }

  @override
  void dispose() {
    super.dispose();

    _onConnectivityChanged.cancel();
  }

  void _route() {
    Provider.of<SplashProvider>(context, listen: false)
        .initConfig(context)
        .then((bool isSuccess) {
      if (isSuccess) {
        Provider.of<SplashProvider>(context, listen: false)
            .initSharedPrefData();
        Timer(Duration(seconds: 1), () async {
          if (Provider.of<SplashProvider>(context, listen: false)
              .configModel!
              .maintenanceMode!) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => MaintenanceScreen()));
          } else {
            if (await Provider.of<AuthProvider>(context, listen: false)
                .isLoggedIn(context)) {
              String userPhone =
                  await Provider.of<ProfileProvider>(context, listen: false)
                      .userInfoModel!
                      .phone;

              Provider.of<AuthProvider>(context, listen: false)
                  .updateToken(userPhone, context);
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (BuildContext context) => DashBoardScreen(),
                ),
              );
            } else {
              Provider.of<AuthProvider>(context, listen: false)
                  .updateToken(null, context);
              if (Provider.of<SplashProvider>(context, listen: false)
                  .showIntro()!) {
                // if (true) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) => OnBoardingScreen(
                      indicatorColor: ColorResources.GREY,
                      selectedIndicatorColor: Theme.of(context).primaryColor,
                    ),
                  ),
                );
              } else {
                // Navigator.of(context).pushReplacement(MaterialPageRoute(
                //     builder: (BuildContext context) => AuthScreen()));
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) => DashBoardScreen(),
                  ),
                );
              }
            }
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body: Provider.of<SplashProvider>(context).hasConnection
          ? Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Provider.of<ThemeProvider>(context).darkTheme
                      ? Colors.black
                      : ColorResources.LIGHT_SKY_BLUE.withAlpha(10),
                  child: CustomPaint(
                    painter: SplashPainter(),
                  ),
                ),
                // Center(
                //   child: Column(
                //     mainAxisSize: MainAxisSize.min,
                //     children: [
                //       Image.asset(
                //         Images.logo_with_name_image,
                //         height: 250.0,
                //         fit: BoxFit.scaleDown,
                //         width: 250.0,
                //         color: Theme.of(context).cardColor,
                //       ),
                //     ],
                //   ),
                // ),
                AnimatedSplashScreen(
                  duration: 1000,
                  animationDuration: Duration(seconds: 1),
                  splash: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      gradient: LinearGradient(
                        begin: Alignment.topRight, end: Alignment.bottomLeft,
                        // colors: [
                        //   Colors.blue,
                        //   Color.fromARGB(255, 11, 218, 200),
                        // ],
                        colors: [
                          Color(0xFFFCB941),
                          ColorResources.getCustomGreen(context)
                        ],
                      ),
                    ),
                    height: 300,
                    width: 300,
                    child: Image.asset(
                      Images.intro_logo,
                      scale: 0.5,
                      width: 900,
                      height: 900,
                    ),
                  ),
                  splashIconSize: 300,
                  disableNavigation: true,
                  nextScreen: Text("hii"),
                  splashTransition: SplashTransition.scaleTransition,
                  pageTransitionType: PageTransitionType.scale,
                  backgroundColor: Colors.transparent,
                )
              ],
            )
          : NoInternetOrDataScreen(isNoInternet: true, child: SplashScreen()),
    );
  }
}
