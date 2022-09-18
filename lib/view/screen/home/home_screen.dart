import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;

// import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_flutter/amplify_flutter.dart' as Amp;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:edge_detection/edge_detection.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_js/flutter_js.dart';
import 'package:flutter_js/javascript_runtime.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/user_info_model.dart';

import 'package:flutter_sixvalley_ecommerce/helper/product_type.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/provider/auth_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/banner_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/brand_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/cart_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/category_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/featured_deal_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/flash_deal_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/home_category_product_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/product_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/splash_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/theme_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/top_seller_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/title_row.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/brand/all_brand_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/cart/cart_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/category/all_category_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/featureddeal/featured_deal_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/announcement.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/banners_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/brand_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/category_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/custom_banner.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/featured_deal_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/featured_product_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/flash_deals_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/footer_banner.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/home_category_product_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/latest_product_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/main_section_banner.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/products_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/flashdeal/flash_deal_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/recommended_product_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/top_seller_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/product/view_all_product_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/search/search_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/topSeller/all_top_seller_screen.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:path_provider/path_provider.dart';

import 'package:provider/provider.dart';

import '../../../notification/my_notification.dart';
import '../../../provider/price_formula_provider.dart';
import '../../../provider/profile_provider.dart';
import '../../../provider/search_provider.dart';
import '../../basewidget/no_internet_screen.dart';
import '../../basewidget/product_shimmer.dart';
import '../image_search_screen/image_search_screen.dart';
import '../search/widget/search_product_widget.dart';
import 'widget/custom_freeshipping.dart';
import 'widget/custom_product_view.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();

  double _scrollControllerOffset = 1.0;

  _scrollListener() {
    setState(() {
      var _off = _scrollController.offset;

      print(_off);
      if (_off == 0.0) {
        _scrollControllerOffset = 1.0;
      } else if (_off <= 1.72) {
        _scrollControllerOffset = 0.8;
      } else if (_off <= 10.5) {
        _scrollControllerOffset = 0.6;
      } else if (_off <= 15.0) {
        _scrollControllerOffset = 0.4;
      } else if (_off <= 20.0) {
        _scrollControllerOffset = 0.2;
      } else {
        _scrollControllerOffset = 0.0;
      }
    });
  }

  ui.Image? bgImage;

  Future<ui.Image> loadImage(Uint8List img) async {
    final Completer<ui.Image> completer = Completer();
    ui.decodeImageFromList(img, (ui.Image img) {
      return completer.complete(img);
    });
    return completer.future;
  }

  Future<void> getImage() async {
    WidgetsFlutterBinding.ensureInitialized();
    var bytes = await rootBundle.load('assets/images/3.png');
    var uint8List = bytes.buffer.asUint8List();
    ui.Image myBackground = await loadImage(uint8List);

    setState(() {
      bgImage = myBackground;
    });
  }

  Future<void> _loadData(BuildContext context, bool reload) async {
    Provider.of<PriceFormulaProvider>(context, listen: false)
        .initPriceFormula(context);
    await Provider.of<BannerProvider>(context, listen: false)
        .getBannerList(reload, context);
    Provider.of<BannerProvider>(context, listen: false)
        .getFooterBannerList(context);
    Provider.of<BannerProvider>(context, listen: false)
        .getMainSectionBanner(context);
    Provider.of<CategoryProvider>(context, listen: false)
        .getCategoryList(reload, context);
    Provider.of<HomeCategoryProductProvider>(context, listen: false)
        .getHomeCategoryProductList(reload, context);
    Provider.of<TopSellerProvider>(context, listen: false)
        .getTopSellerList(reload, context);
    await Provider.of<FlashDealProvider>(context, listen: false)
        .getMegaDealList(reload, context, true);
    Provider.of<BrandProvider>(context, listen: false)
        .getBrandList(reload, context);
    Provider.of<ProductProvider>(context, listen: false)
        .getLatestProductList(1, context, reload: reload);
    Provider.of<ProductProvider>(context, listen: false)
        .getFeaturedProductList('1', context, reload: reload);
    Provider.of<FeaturedDealProvider>(context, listen: false)
        .getFeaturedDealList(reload, context);
    Provider.of<ProductProvider>(context, listen: false)
        .getLProductList('1', context, reload: reload);
    Provider.of<ProductProvider>(context, listen: false)
        .getRecommendedProduct(context);
    await Provider.of<SearchProvider>(context, listen: false)
        .initUserInterest(context);
  }

  void passData(int index, String title) {
    index = index;
    title = title;
  }

  bool singleVendor = false;
  @override
  void initState() {
    super.initState();

    getImage();

    singleVendor = Provider.of<SplashProvider>(context, listen: false)
            .configModel!
            .businessMode ==
        "single";
    Provider.of<FlashDealProvider>(context, listen: false)
        .getMegaDealList(true, context, true);

    _loadData(context, false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
    _scrollController.addListener(_scrollListener);
  }

  _asyncMethod() async {
    if (await Provider.of<AuthProvider>(context, listen: false)
        .isLoggedIn(context)) {
      String? userPhone =
          await Provider.of<ProfileProvider>(context, listen: false)
              .userInfoModel!
              .phone;
      UserInfoModel? _userInfo =
          Provider.of<ProfileProvider>(context, listen: false).userInfoModel;

      await Provider.of<CartProvider>(context, listen: false)
          .uploadToServer(context, _userInfo);
      Provider.of<CartProvider>(context, listen: false).getCartDataAPI(
        context,
        userPhone,
      );
    } else {
      Provider.of<CartProvider>(context, listen: false).getCartData();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double outer_height = MediaQuery.of(context).size.height * 0.18;
    // double inner_height = MediaQuery.of(context).size.height * 0.18;
    double fourty_width = MediaQuery.of(context).size.width * 0.40;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List<String?> types = [
      getTranslated('new_arrival', context),
      getTranslated('top_product', context),
      getTranslated('best_selling', context),
      getTranslated('discounted_product', context)
    ];
    return Scaffold(
      backgroundColor: ColorResources.getHomeBg(context),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        bottom: false,
        child: RefreshIndicator(
          backgroundColor: Theme.of(context).primaryColor,
          onRefresh: () async {
            await _loadData(context, true);
            await Provider.of<FlashDealProvider>(context, listen: false)
                .getMegaDealList(true, context, false);

            // return true;
          },
          child: Container(
            decoration: BoxDecoration(color: ColorResources.WHITE
                // image: DecorationImage(
                //   opacity: 0.1,
                //   scale: 0.1,
                //   image: AssetImage(
                //     "assets/images/2.png",
                //   ),
                //   fit: BoxFit.cover,
                // ),
                ),
            child: Stack(
              children: [
                CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: SliverDelegate(
                        child: InkWell(
                          onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => SearchScreen(),
                            ),
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.HOME_PAGE_PADDING,
                                vertical: 0),
                            // height: 40,
                            color: ColorResources.getHomeBg(context),
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                    left: Dimensions.HOME_PAGE_PADDING,
                                    right: 1.0,
                                    // top: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                                    // bottom: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                                  ),
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.82,
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Theme.of(context).primaryColor,
                                      width: 3,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey[
                                              Provider.of<ThemeProvider>(
                                                          context)
                                                      .darkTheme
                                                  ? 900
                                                  : 200]!,
                                          spreadRadius: 1,
                                          blurRadius: 1)
                                    ],
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.PADDING_SIZE_EXTRA_LARGE),
                                  ),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            getTranslated(
                                                'SEARCH_HINT', context)!,
                                            style: robotoRegular.copyWith(
                                                color: Theme.of(context)
                                                    .hintColor)),
                                        Container(
                                          width: 60,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).primaryColor,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                Dimensions.PADDING_SIZE_LARGE,
                                              ),
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.search,
                                            color: Theme.of(context).cardColor,
                                            size: Dimensions.ICON_SIZE_SMALL,
                                          ),
                                        ),
                                      ]),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            ImageSearchScreen(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    // width: 60,
                                    height: 40,
                                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                    decoration: BoxDecoration(
                                      // color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          Dimensions.PADDING_SIZE_LARGE,
                                        ),
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.camera_alt_outlined,
                                      color: Colors.black,
                                      size: Dimensions.ICON_SIZE_LARGE,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: CustomBannerView(),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 15,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: BrandView(isHomePage: true),
                    ),
                    SliverToBoxAdapter(
                      child: FreeShippingWidget(),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            Dimensions.HOME_PAGE_PADDING,
                            Dimensions.HOME_PAGE_PADDING,
                            Dimensions.PADDING_SIZE_DEFAULT,
                            Dimensions.PADDING_SIZE_SMALL),
                        child: Column(
                          children: [
                            //Category filter
                            Consumer<ProductProvider>(
                                builder: (ctx, prodProvider, child) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal:
                                        Dimensions.PADDING_SIZE_EXTRA_SMALL,
                                    vertical:
                                        Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                child: Row(children: [
                                  Expanded(
                                      child: Text("More to love",
                                          style: titleHeader)),
                                ]),
                              );
                            }),
                            CustomProductView(
                                isHomePage: false,
                                productType: ProductType.NEW_ARRIVAL,
                                scrollController: _scrollController),
                            SizedBox(height: Dimensions.HOME_PAGE_PADDING),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SliverDelegate extends SliverPersistentHeaderDelegate {
  Widget child;
  SliverDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 70;

  @override
  double get minExtent => 70;

  @override
  bool shouldRebuild(SliverDelegate oldDelegate) {
    return oldDelegate.maxExtent != 70 ||
        oldDelegate.minExtent != 70 ||
        child != oldDelegate.child;
  }
}

class AddImage extends CustomPainter {
  final ui.Image? myBackground;

  const AddImage(this.myBackground);
  @override
  void paint(Canvas canvas, Size size) {
    if (myBackground != null) {
      canvas.scale(1);

      canvas.drawImage(myBackground!, Offset(20, -40), Paint());
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
