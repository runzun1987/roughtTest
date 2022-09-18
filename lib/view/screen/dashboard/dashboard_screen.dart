import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/category.dart';
import 'package:flutter_sixvalley_ecommerce/helper/network_info.dart';
import 'package:flutter_sixvalley_ecommerce/provider/splash_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/account/account.screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/cart/cart_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/category/all_category_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/chat/inbox_screen.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/home_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/category_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/more/more_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/notification/notification_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/order/order_screen.dart';
import 'package:provider/provider.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  PageController _pageController = PageController();
  int _pageIndex = 0;

  late List<Widget> _screens;

  GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey();

  bool singleVendor = false;
  @override
  void initState() {
    super.initState();
    singleVendor = Provider.of<SplashProvider>(context, listen: false)
            .configModel!
            .businessMode ==
        "single";

    _screens = [
      HomePage(),
      singleVendor ? OrderScreen(isBacButtonExist: false) : AllCategoryScreen(),
      singleVendor
          ? NotificationScreen(isBacButtonExist: false)
          : NotificationScreen(),
      singleVendor ? MoreScreen() : CartScreen(),
      singleVendor ? SizedBox() : AccountScreen(),
    ];

    NetworkInfo.checkConnectivity(context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_pageIndex != 0) {
          _setPage(0);
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        extendBody: true,
        bottomNavigationBar: CurvedNavigationBar(
          height: 50,
          // selectedItemColor: Theme.of(context).primaryColor,
          // unselectedItemColor: Theme.of(context).textTheme.bodyText1!.color,
          // showUnselectedLabels: true,
          // type: BottomNavigationBarType.fixed,
          color: Theme.of(context).primaryColor,
          // buttonBackgroundColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          index: _pageIndex,
          items: _getBottomWidget(singleVendor),
          onTap: (int index) {
            _setPage(index);
          },
        ),
        body: PageView.builder(
          controller: _pageController,
          itemCount: _screens.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return _screens[index];
          },
        ),
      ),
    );
  }

  Widget _barItem(String icon, String? label, int index) {
    return Image.asset(
      icon,
      color: index == _pageIndex ? ColorResources.BLACK : ColorResources.BLACK,
      height: 25,
      width: 25,
    );
  }

  void _setPage(int pageIndex) {
    setState(() {
      _pageController.animateToPage(pageIndex,
          duration: Duration(milliseconds: 400), curve: Curves.easeInExpo);
      _pageIndex = pageIndex;
    });
  }

  List<Widget> _getBottomWidget(bool isSingleVendor) {
    List<Widget> _list = [];
    _list.add(_barItem(Images.tortoise, getTranslated('home', context), 0));
    if (!isSingleVendor) {
      _list.add(_barItem(Images.category, getTranslated('inbox', context), 1));
    }
    _list.add(
        _barItem(Images.notification, getTranslated('orders', context), 2));
    _list.add(
        _barItem(Images.cart_image, getTranslated('notification', context), 3));
    _list.add(_barItem(Images.more_image, getTranslated('more', context), 4));
    return _list;
  }
}
