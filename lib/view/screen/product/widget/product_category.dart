import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_sixvalley_ecommerce/provider/product_details_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/title_row.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/product/widget/deep_category.dart';
import 'package:provider/provider.dart';

import '../../../../models/Details.dart';
import '/data/model/response/product_model.dart';

class ProductCategory extends StatelessWidget {
  final Product? product;
  final bool isLoggedin;
  final GlobalKey<ScaffoldMessengerState> scaffoldKey;
  ProductCategory(
    this.product,
    this.scaffoldKey,
    this.isLoggedin,
  );

  @override
  Widget build(BuildContext context) {
    void onTap() {
      DeepCategory.popUpCategory(
        context,
        product!.prop_obj!,
        product!.images![0],
        product,
        null,
        scaffoldKey,
        isLoggedin,
      );
      // PageView.custom(childrenDelegate: childrenDelegate)
      // _controller.animateToPage(index,
      //     duration: Duration(microseconds: 300),
      //     curve: Curves.easeInOut);
    }

    ;

    return Consumer<ProductDetailsProvider>(
      builder: (context, details, value) => Container(
        margin: EdgeInsets.only(top: Dimensions.PADDING_SIZE_SMALL),
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              child: TitleRow(
                title: details.varient_detail_string,
                isDetailsPage: true,
                isNext: true,
                onTap: onTap,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            details.images.length != 0
                ? Container(
                    height: 65,
                    child: ListView.separated(
                      separatorBuilder: (context, _) => SizedBox(
                        width: 5,
                      ),
                      itemCount: details.images.length <= 4
                          ? details.images.length
                          : 5,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: onTap,
                          child: index <= 3
                              ? Consumer<ProductDetailsProvider>(
                                  builder: (context, details, value) {
                                    List emptyList = details.emptyList!;

                                    String? id;
                                    for (var list in emptyList) {
                                      if (list[2] != null) {
                                        id = list[0];
                                        break;
                                      }
                                    }
                                    // [image, keys, valueName, ind]
                                    int pageIndex = details.images.indexWhere(
                                        (element) => element[1] == id);
                                    return Container(
                                      width: 65,
                                      margin: EdgeInsets.only(right: 1),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        border: pageIndex == index
                                            ? Border.all(
                                                color: Colors.red,
                                                width: 3,
                                              )
                                            : Border.all(
                                                color: Colors.grey,
                                              ),

                                        // color: Theme.of(context).accentColor,
                                      ),
                                      //                         ClipRRect(
                                      //   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
                                      //   child: Image.asset(
                                      //     Images.toolbar_background, fit: BoxFit.fill,
                                      //     height: 50+MediaQuery.of(context).padding.top, width: MediaQuery.of(context).size.width,
                                      //     color: Provider.of<ThemeProvider>(context).darkTheme ? Colors.black : Colors.white,
                                      //   ),
                                      // ),
                                      child: Card(
                                        margin: EdgeInsets.all(0),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          child: Padding(
                                            padding: EdgeInsets.all(0),
                                            child: FadeInImage.assetNetwork(
                                              placeholder: Images.placeholder,
                                              image: details.images[index][0],
                                              imageErrorBuilder: (c, o, s) =>
                                                  Image.asset(
                                                      Images.placeholder),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                )
                              : Center(
                                  child: Text(
                                    '...',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                        );
                      },
                    ),
                  )
                : details.varients.length != 0
                    ? Container(
                        height: 30,
                        child: ListView.builder(
                          itemCount: details.images.length != 0
                              ? (details.images.length <= 4
                                  ? details.images.length
                                  : 5)
                              : (details.varients.length <= 4
                                  ? details.varients.length
                                  : 5),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: onTap,
                              child: index <= 3
                                  ? Container(
                                      width: 85,

                                      margin: EdgeInsets.only(right: 1),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),

                                        // color: Theme.of(context).accentColor,
                                      ),
                                      //                         ClipRRect(
                                      //   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
                                      //   child: Image.asset(
                                      //     Images.toolbar_background, fit: BoxFit.fill,
                                      //     height: 50+MediaQuery.of(context).padding.top, width: MediaQuery.of(context).size.width,
                                      //     color: Provider.of<ThemeProvider>(context).darkTheme ? Colors.black : Colors.white,
                                      //   ),
                                      // ),
                                      child: Card(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          child: Padding(
                                            padding: EdgeInsets.all(0),
                                            child:
                                                Text(details.varients[index]),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Center(
                                      child: Text(
                                        '...',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                            );
                          },
                        ),
                      )
                    : SizedBox(),
          ],

          // children: product.prop_obj.entries.map(
          //   (val) {
          //     Map dvv = val.value;
          //     List valu = dvv.values.toList();

          //     return Card(
          //       child: Column(
          //         children: [
          //           Text(valu[0]['name']),
          //           Container(
          //             height: 60,
          //             margin: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
          //             alignment: Alignment.center,
          //             child: ListView.builder(
          //               itemCount: dvv.entries.length,
          //               scrollDirection: Axis.horizontal,
          //               shrinkWrap: true,
          //               itemBuilder: (context, index) {
          //                 print(dvv.values.toList()[index]['pic_url']);
          //                 return GestureDetector(
          //                   onTap: () {
          //                     DeepCategory.popUpCategory(
          //                       context,
          //                       product.prop_obj,
          //                       product.images[0],
          //                     );
          //                     // PageView.custom(childrenDelegate: childrenDelegate)
          //                     // _controller.animateToPage(index,
          //                     //     duration: Duration(microseconds: 300),
          //                     //     curve: Curves.easeInOut);
          //                   },
          //                   child: Container(
          //                     width: 60,
          //                     margin: EdgeInsets.symmetric(horizontal: 5),
          //                     decoration: BoxDecoration(
          //                       borderRadius: BorderRadius.circular(5),
          //                       color: Theme.of(context).accentColor,
          //                       border: Provider.of<ProductDetailsProvider>(
          //                                       context)
          //                                   .imageSliderIndex ==
          //                               index
          //                           ? Border.all(
          //                               color: ColorResources.getPrimary(context),
          //                               width: 2)
          //                           : null,
          //                     ),
          //                     child: Padding(
          //                       padding:
          //                           EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
          //                       child: dvv.values
          //                                   .toList()[index]['pic_url']
          //                                   .length !=
          //                               0
          //                           ? FadeInImage.assetNetwork(
          //                               placeholder: Images.placeholder,
          //                               image: dvv.values.toList()[index]
          //                                   ['pic_url'],
          //                               imageErrorBuilder: (c, o, s) =>
          //                                   Image.asset(Images.placeholder),
          //                             )
          //                           : Card(
          //                               child: Text(
          //                                   dvv.values.toList()[index]['value'])),
          //                     ),
          //                   ),
          //                 );
          //               },
          //             ),
          //           ),
          //         ],
          //       ),
          //     );
          //   },
          // ).toList(),
        ),
      ),
    );

    // return Container(
    //   height: 60,
    //   margin: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
    //   alignment: Alignment.center,
    //   child: ListView.builder(
    //     itemCount: 15,
    //     scrollDirection: Axis.horizontal,
    //     shrinkWrap: true,
    //     itemBuilder: (context, index) {
    //       return GestureDetector(
    //         onTap: () {
    //           // _controller.animateToPage(index,
    //           //     duration: Duration(microseconds: 300),
    //           //     curve: Curves.easeInOut);
    //         },
    //         child: Container(
    //           width: 60,
    //           margin: EdgeInsets.symmetric(horizontal: 5),
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(5),
    //             color: Theme.of(context).accentColor,
    //             border: Provider.of<ProductDetailsProvider>(context)
    //                         .imageSliderIndex ==
    //                     index
    //                 ? Border.all(
    //                     color: ColorResources.getPrimary(context), width: 2)
    //                 : null,
    //           ),
    //           child: Padding(
    //             padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
    //             child: FadeInImage.assetNetwork(
    //               placeholder: Images.placeholder,
    //               image: 'https://tinyjpg.com/images/social/website.jpg',
    //               imageErrorBuilder: (c, o, s) =>
    //                   Image.asset(Images.placeholder),
    //             ),
    //           ),
    //         ),
    //       );
    //     },
    //   ),
    // );
    // return Container(
    //   margin: EdgeInsets.only(top: Dimensions.PADDING_SIZE_SMALL),
    //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    //   color: ColorResources.WHITE,
    //   child: Column(
    //       children: product.props.entries.map((val) {
    //     Map dvv = val.value;
    //     List valu = dvv.values.toList();
    //     return Card(
    //       child: Column(
    //         children: [
    //           Text(valu[0]['name']),
    //           Row(
    //             children: dvv.entries.map((val2) {
    //               return Card(child: Text(val2.value['value']));
    //             }).toList(),
    //           ),
    //         ],
    //       ),
    //     );
    //   }).toList()),
    // );
  }
}
