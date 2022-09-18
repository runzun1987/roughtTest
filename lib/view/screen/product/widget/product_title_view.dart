import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/product_model.dart';
import 'package:flutter_sixvalley_ecommerce/helper/price_converter.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/provider/product_details_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/theme_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/rating_bar.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/product/widget/product_category.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class ProductTitleView extends StatelessWidget {
  final Product? productModel;
  final bool isLoggedin;
  final GlobalKey<ScaffoldMessengerState> scaffoldKey;
  ProductTitleView({
    required this.productModel,
    required this.scaffoldKey,
    required this.isLoggedin,
  });

  @override
  Widget build(BuildContext context) {
    double? _startingPrice = 0;
    double? _endingPrice;

    if (productModel!.skus_json != null && productModel!.skus_json!.length != 0) {
      List<double?> _priceList = [];

      productModel!.skus_json!.forEach((sku_json) => _priceList.add(sku_json[2]));
      _priceList.sort((a, b) => a!.compareTo(b!));
      _startingPrice = _priceList[0];
      if (_priceList[0]! < _priceList[_priceList.length - 1]!) {
        _endingPrice = _priceList[_priceList.length - 1];
      }
    } else {
      _startingPrice = productModel!.unitPrice;
    }

    return productModel != null
        ? Container(
            child: Consumer<ProductDetailsProvider>(
              builder: (context, details, child) {
                return Container(
                  margin:
                      EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 0),
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.only(
                    //   topLeft: Radius.circular(10),
                    //   topRight: Radius.circular(10),
                    // ),
                    boxShadow: [
                      // so here your custom shadow goes:
                      BoxShadow(
                        color: Colors.black.withAlpha(
                            50), // the color of a shadow, you can adjust it
                        spreadRadius:
                            10, //also play with this two values to achieve your ideal result
                        blurRadius: 10,
                        offset: Offset(0,
                            40), // changes position of shadow, negative value on y-axis makes it appering only on the top of a container
                      ),
                    ],
                  ),
                  child: Card(
                    margin: EdgeInsets.zero,
                    elevation: 0,
                    child: Container(
                      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  productModel!.discount != null &&
                                          productModel!.discount! > 0
                                      ? Text(
                                          '${PriceConverter.convertPrice(context, _startingPrice)}'
                                          '${_endingPrice != null ? ' - ${PriceConverter.convertPrice(context, _endingPrice)}' : ''}',
                                          style: titilliumRegular.copyWith(
                                              color: Colors.black,
                                              decoration:
                                                  TextDecoration.lineThrough),
                                        )
                                      : SizedBox(),
                                  SizedBox(
                                      height: Dimensions
                                          .PADDING_SIZE_EXTRA_EXTRA_SMALL),
                                  Text(
                                    '${_startingPrice != null ? PriceConverter.convertPrice(context, _startingPrice, discount: productModel!.discount, discountType: productModel!.discountType) : ''}'
                                    '${_endingPrice != null ? ' - ${PriceConverter.convertPrice(context, _endingPrice, discount: productModel!.discount, discountType: productModel!.discountType)}' : ''}',
                                    style: titilliumBold.copyWith(
                                        color: ColorResources.BLACK,
                                        fontSize:
                                            Dimensions.FONT_SIZE_EXTRA_LARGE),
                                  ),
                                  SizedBox(
                                      height: Dimensions.PADDING_SIZE_DEFAULT),
                                  Text(
                                    productModel!.name ?? '',
                                    style: titleRegular.copyWith(
                                      fontSize: Dimensions.FONT_SIZE_LARGE,
                                    ),
                                    maxLines: 2,
                                  ),
                                ]),

                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),

                            Row(children: [
                              // Icon(
                              //   Icons.star,
                              //   color: Colors.orange,
                              // ),
                              RatingBar(
                                rating: details.product!.averageRating,
                                size: 18,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                  '${details.product!.averageRating != null ? details.product!.averageRating : 0} | ',
                                  style: titilliumRegular.copyWith(
                                    color: Theme.of(context).hintColor,
                                    fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                  )),
                              Text('${details.product!.totalOrders} orders  ',
                                  style: titilliumRegular.copyWith(
                                    color: Theme.of(context).hintColor,
                                    fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                  )),
                              // Text('${details.wishCount} wish',
                              //     style: titilliumRegular.copyWith(
                              //       color: Theme.of(context).hintColor,
                              //       fontSize: Dimensions.FONT_SIZE_DEFAULT,
                              //     )),
                              // Expanded(child: SizedBox.shrink()),
                              // SizedBox(width: 5),
                              // Row(
                              //   children: [
                              //     Icon(
                              //       Icons.star,
                              //       color: Colors.orange,
                              //     ),
                              //     Text(
                              //         '${details.product.averageRating != null ? details.product.averageRating : 0.0}')
                              //   ],
                              // ),
                            ]),

                            SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                            details.product!.skus_json!.length == null ||
                                    details.product!.skus_json!.length == 0
                                ? SizedBox()
                                : ProductCategory(details.product, scaffoldKey,isLoggedin),
                            // Variant
                            // productModel.colors.length > 0
                            //     ? Row(children: [
                            //         Text(
                            //             '${getTranslated('select_variant', context)} : ',
                            //             style: titilliumRegular.copyWith(
                            //                 fontSize: Dimensions.FONT_SIZE_LARGE)),
                            //         SizedBox(
                            //           height: 40,
                            //           child: ListView.builder(
                            //             itemCount: productModel.colors.length,
                            //             shrinkWrap: true,
                            //             scrollDirection: Axis.horizontal,
                            //             itemBuilder: (context, index) {
                            //               String colorString = '0xff' +
                            //                   productModel.colors[index].code
                            //                       .substring(1, 7);
                            //               return Container(
                            //                 decoration: BoxDecoration(
                            //                   borderRadius: BorderRadius.circular(
                            //                       Dimensions
                            //                           .PADDING_SIZE_EXTRA_SMALL),
                            //                 ),
                            //                 child: Padding(
                            //                   padding: const EdgeInsets.all(Dimensions
                            //                       .PADDING_SIZE_EXTRA_SMALL),
                            //                   child: Container(
                            //                     height: 30,
                            //                     width: 30,
                            //                     padding: EdgeInsets.all(Dimensions
                            //                         .PADDING_SIZE_EXTRA_SMALL),
                            //                     alignment: Alignment.center,
                            //                     decoration: BoxDecoration(
                            //                       color:
                            //                           Color(int.parse(colorString)),
                            //                       borderRadius:
                            //                           BorderRadius.circular(5),
                            //                     ),
                            //                     //child: details.variantIndex == index ? Icon(Icons.done_all, color: ColorResources.WHITE, size: 12) : null,
                            //                   ),
                            //                 ),
                            //               );
                            //             },
                            //           ),
                            //         ),
                            //       ])
                            //     : SizedBox(),
                            // productModel.colors.length > 0
                            //     ? SizedBox(height: Dimensions.PADDING_SIZE_SMALL)
                            //     : SizedBox(),

                            // Variation
                            // productModel.choiceOptions != null &&
                            //         productModel.choiceOptions.length > 0
                            //     ? ListView.builder(
                            //         shrinkWrap: true,
                            //         itemCount: productModel.choiceOptions.length,
                            //         physics: NeverScrollableScrollPhysics(),
                            //         itemBuilder: (context, index) {
                            //           return Row(
                            //               crossAxisAlignment:
                            //                   CrossAxisAlignment.center,
                            //               children: [
                            //                 Text(
                            //                     '${getTranslated('available', context)}' +
                            //                         ' ' +
                            //                         '${productModel.choiceOptions[index].title} :',
                            //                     style: titilliumRegular.copyWith(
                            //                         fontSize:
                            //                             Dimensions.FONT_SIZE_LARGE)),
                            //                 SizedBox(
                            //                     width: Dimensions
                            //                         .PADDING_SIZE_EXTRA_SMALL),
                            //                 Expanded(
                            //                   child: GridView.builder(
                            //                     gridDelegate:
                            //                         SliverGridDelegateWithFixedCrossAxisCount(
                            //                       crossAxisCount: 4,
                            //                       crossAxisSpacing: 5,
                            //                       mainAxisSpacing: 5,
                            //                       childAspectRatio: (1 / .7),
                            //                     ),
                            //                     shrinkWrap: true,
                            //                     physics:
                            //                         NeverScrollableScrollPhysics(),
                            //                     itemCount: productModel
                            //                         .choiceOptions[index]
                            //                         .options
                            //                         .length,
                            //                     itemBuilder: (context, i) {
                            //                       return Center(
                            //                         child: Text(
                            //                             productModel
                            //                                 .choiceOptions[index]
                            //                                 .options[i],
                            //                             maxLines: 1,
                            //                             overflow:
                            //                                 TextOverflow.ellipsis,
                            //                             style:
                            //                                 titilliumRegular.copyWith(
                            //                               fontSize: Dimensions
                            //                                   .FONT_SIZE_DEFAULT,
                            //                             )),
                            //                       );
                            //                     },
                            //                   ),
                            //                 ),
                            //               ]);
                            //         },
                            //       )
                            //     : SizedBox(),
                          ]),
                    ),
                  ),
                );
              },
            ),
          )
        : SizedBox();
  }
}
