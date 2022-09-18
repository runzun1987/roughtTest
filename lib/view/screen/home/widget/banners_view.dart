import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/product_model.dart';
import 'package:flutter_sixvalley_ecommerce/provider/banner_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/brand_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/category_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/splash_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/top_seller_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/product/brand_and_category_product_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/product/product_details_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/topSeller/top_seller_product_screen.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../utill/custom_themes.dart';
import '../../../../utill/dimensions.dart';

class BannersView extends StatelessWidget {
  _clickBannerRedirect(
      BuildContext context, int? id, Product? product, String? type) {
    final cIndex = Provider.of<CategoryProvider>(context, listen: false)
        .categoryList
        .indexWhere((element) => element.id == id);
    final bIndex = Provider.of<BrandProvider>(context, listen: false)
        .brandList
        .indexWhere((element) => element.id == id);
    final tIndex = Provider.of<TopSellerProvider>(context, listen: false)
        .topSellerList
        .indexWhere((element) => element.id == id);

    if (type == 'category') {
      if (Provider.of<CategoryProvider>(context, listen: false)
              .categoryList[cIndex]
              .name !=
          null) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => BrandAndCategoryProductScreen(
                      isBrand: false,
                      id: id.toString(),
                      name:
                          '${Provider.of<CategoryProvider>(context, listen: false).categoryList[cIndex].name}',
                    )));
      }
    } else if (type == 'product') {
      //TODO:banner page product detial
      // Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetails(
      //   product: product,
      // )));

    } else if (type == 'brand') {
      if (Provider.of<BrandProvider>(context, listen: false)
              .brandList[bIndex]
              .name !=
          null) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => BrandAndCategoryProductScreen(
                      isBrand: true,
                      id: id.toString(),
                      name:
                          '${Provider.of<BrandProvider>(context, listen: false).brandList[bIndex].name}',
                    )));
      }
    } else if (type == 'shop') {
      if (Provider.of<TopSellerProvider>(context, listen: false)
              .topSellerList[tIndex]
              .name !=
          null) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => TopSellerProductScreen(
                      topSellerId: id,
                      topSeller:
                          Provider.of<TopSellerProvider>(context, listen: false)
                              .topSellerList[tIndex],
                    )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<BannerProvider>(
          builder: (context, bannerProvider, child) {
            double _width = MediaQuery.of(context).size.width;
            return Container(
              width: _width,
              height: MediaQuery.of(context).size.width / 1.5,
              child: bannerProvider.moreToLoveTop != null
                  ? bannerProvider.moreToLoveTop!.length != 0
                      ? Stack(
                          fit: StackFit.expand,
                          children: [
                            CarouselSlider.builder(
                              options: CarouselOptions(
                                autoPlayInterval: const Duration(seconds: 4),
                                autoPlayAnimationDuration:
                                    const Duration(milliseconds: 500),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                viewportFraction: 1,
                                autoPlay: true,
                                enlargeCenterPage: true,
                                disableCenter: true,
                                onPageChanged: (index, reason) {
                                  Provider.of<BannerProvider>(context,
                                          listen: false)
                                      .setCurrentIndex(index);
                                },
                              ),
                              itemCount:
                                  bannerProvider.moreToLoveTop.length == 0
                                      ? 1
                                      : bannerProvider.moreToLoveTop.length,
                              itemBuilder: (context, index, _) {
                                return InkWell(
                                  onTap: () {
                                    //   Provider.of<BannerProvider>(context, listen: false).getProductDetails(context, bannerProvider.mainBannerList![index].resourceId.toString());
                                    //   _clickBannerRedirect(context, bannerProvider.mainBannerList![index].resourceType =='product'? bannerProvider.mainBannerList![index].product!.id : bannerProvider.mainBannerList![index].resourceId, bannerProvider.mainBannerList![index].resourceType =='product'? bannerProvider.mainBannerList![index].product : null, bannerProvider.mainBannerList![index].resourceType);
                                  },
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: FadeInImage.assetNetwork(
                                            placeholder: Images.placeholder,
                                            fit: BoxFit.cover,
                                            image: bannerProvider
                                                .moreToLoveTop[index]['image'],
                                            imageErrorBuilder: (c, o, s) =>
                                                Image.asset(
                                                    Images.placeholder_3x1,
                                                    fit: BoxFit.cover),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 40,
                                        left: 0,
                                        right: 0,
                                        child: Container(
                                          padding: EdgeInsets.all(15),
                                          child: Text(
                                            bannerProvider.moreToLoveTop[
                                                        bannerProvider
                                                            .currentIndex!]
                                                    ['title'] ??
                                                '',
                                            textAlign: TextAlign.center,
                                            style: robotoRegular.copyWith(
                                              fontSize: Dimensions
                                                  .FONT_SIZE_EXTRA_LARGE,
                                              fontWeight: FontWeight.w900,
                                              color: ColorResources.WHITE,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 5,
                                        left: 0,
                                        right: 0,
                                        child: Container(
                                          margin: EdgeInsets.all(10),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: ColorResources
                                                  .WHITE, //button's fill color

                                              //specify the button's disabled text, icon, and fill color
                                              shadowColor: Colors
                                                  .black, //specify the button's elevation color
                                              elevation:
                                                  4.0, //buttons Material shadow
                                              textStyle: TextStyle(
                                                fontFamily: 'roboto',
                                              ), //specify the button's text TextStyle
                                              padding: const EdgeInsets.only(
                                                  top: 4.0,
                                                  bottom: 4.0,
                                                  right: 8.0,
                                                  left:
                                                      8.0), //specify the button's Padding
                                              minimumSize: Size(20,
                                                  30), //specify the button's first: width and second: height
                                              side: BorderSide(
                                                  width: 2.0,
                                                  style: BorderStyle
                                                      .solid), //set border for the button
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          35.0)), // set the buttons shape. Make its birders rounded etc
                                              enabledMouseCursor: MouseCursor
                                                  .defer, //used to construct ButtonStyle.mouseCursor
                                              disabledMouseCursor: MouseCursor
                                                  .uncontrolled, //used to construct ButtonStyle.mouseCursor
                                              visualDensity: VisualDensity(
                                                  horizontal: 0.0,
                                                  vertical:
                                                      0.0), //set the button's visual density
                                              tapTargetSize: MaterialTapTargetSize
                                                  .padded, // set the MaterialTapTarget size. can set to: values, padded and shrinkWrap properties
                                              animationDuration: Duration(
                                                  milliseconds:
                                                      100), //the buttons animations duration
                                              enableFeedback:
                                                  true, //to set the feedback to true or false
                                              alignment: Alignment
                                                  .center, //set the button's child Alignment
                                            ),
                                            onPressed: () {},
                                            child: Container(
                                              child: Text(
                                                "Shop Now",
                                                textAlign: TextAlign.center,
                                                style: robotoRegular.copyWith(
                                                  fontSize: Dimensions
                                                      .FONT_SIZE_LARGE,
                                                  fontWeight: FontWeight.w800,
                                                  color: ColorResources.BLACK,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            Positioned(
                              bottom: 5,
                              left: 0,
                              right: 0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:
                                    bannerProvider.moreToLoveTop.map((banner) {
                                  int index = bannerProvider.moreToLoveTop
                                      .indexOf(banner);
                                  return TabPageSelectorIndicator(
                                    backgroundColor:
                                        index == bannerProvider.currentIndex
                                            ? ColorResources.WHITE
                                            : ColorResources.getGrey(context)
                                                .withAlpha(100),
                                    borderColor:
                                        index == bannerProvider.currentIndex
                                            ? ColorResources.WHITE
                                            : Colors.grey,
                                    size: 5,
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        )
                      : Center(child: Text('No banner available'))
                  : Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      enabled: bannerProvider.mainBannerList == null,
                      child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ColorResources.WHITE,
                          )),
                    ),
            );
          },
        ),

        SizedBox(height: 5),

        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 9.0),
        //   child: Consumer<BannerProvider>(
        //     builder: (context, footerBannerProvider, child) {
        //
        //       return footerBannerProvider.footerBannerList!=null && footerBannerProvider.footerBannerList.length != 0 ? GridView.builder(
        //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //           crossAxisCount: 3,
        //           childAspectRatio: (2/1),
        //         ),
        //         itemCount: footerBannerProvider.footerBannerList.length,
        //         shrinkWrap: true,
        //         physics: NeverScrollableScrollPhysics(),
        //         itemBuilder: (BuildContext context, int index) {
        //
        //           return InkWell(
        //             onTap: () {
        //               Provider.of<BannerProvider>(context, listen: false).getProductDetails(context, footerBannerProvider.mainBannerList[index].resourceId.toString());
        //               _clickBannerRedirect(context, footerBannerProvider.mainBannerList[index].resourceType=='product'?footerBannerProvider.mainBannerList[index].product.id :footerBannerProvider.mainBannerList[index].resourceId,footerBannerProvider.mainBannerList[index].resourceType =='product'?footerBannerProvider.mainBannerList[index].product : null, footerBannerProvider.mainBannerList[index].resourceType);
        //             },
        //             child: Padding(
        //               padding: const EdgeInsets.symmetric(horizontal: 2.0),
        //               child: Container(
        //                 decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5))),
        //                 child: ClipRRect(
        //                   borderRadius: BorderRadius.all(Radius.circular(5)),
        //                   child: FadeInImage.assetNetwork(
        //                     placeholder: Images.placeholder, fit: BoxFit.cover,
        //                     image: '${Provider.of<SplashProvider>(context,listen: false).baseUrls.bannerImageUrl}'
        //                         '/${footerBannerProvider.footerBannerList[index].photo}',
        //                     imageErrorBuilder: (c, o, s) => Image.asset(Images.placeholder, fit: BoxFit.cover),
        //                   ),
        //                 ),
        //               ),
        //             ),
        //           );
        //
        //         },
        //       )
        //
        //           : Shimmer.fromColors(
        //       baseColor: Colors.grey[300],
        //       highlightColor: Colors.grey[100],
        //       enabled: footerBannerProvider.footerBannerList == null,
        //       child: Container(margin: EdgeInsets.symmetric(horizontal: 10), decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(10),
        //       color: ColorResources.WHITE,
        //       )),
        //       );
        //
        //     },
        //   ),
        // )
      ],
    );
  }
}
