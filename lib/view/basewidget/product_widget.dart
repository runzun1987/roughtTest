import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/product_model.dart';
import 'package:flutter_sixvalley_ecommerce/helper/price_converter.dart';
import 'package:flutter_sixvalley_ecommerce/provider/splash_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/rating_bar.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/product/product_details_screen.dart';
import 'package:provider/provider.dart';

import '../../provider/price_formula_provider.dart';

class ProductWidget extends StatelessWidget {
  final Product productModel;
  ProductWidget({required this.productModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 1000),
              pageBuilder: (context, anim1, anim2) =>
                  ProductDetails(productId: productModel.id),
            ));
      },
      child: Container(
        height: MediaQuery.of(context).size.width / 1.6,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).highlightColor,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 5)
          ],
        ),
        child: Stack(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            // Product Image
            Container(
              decoration: BoxDecoration(
                color: ColorResources.getIconBg(context),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: FadeInImage.assetNetwork(
                  placeholder: Images.placeholder,
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.width / 2.45,
                  image: productModel.thumbnail!,
                  imageErrorBuilder: (c, o, s) => Image.asset(
                      Images.placeholder_1x1,
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.width / 2.45),
                ),
              ),
            ),

            // Product Details
            Padding(
              padding: EdgeInsets.only(
                  top: Dimensions.PADDING_SIZE_SMALL,
                  bottom: 5,
                  left: 10,
                  right: 10),
              child: Container(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(productModel.name ?? '',
                          textAlign: TextAlign.left,
                          style: robotoRegular.copyWith(
                              fontSize: Dimensions.FONT_SIZE_DEFAULT,
                              fontWeight: FontWeight.w500),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                      Text(
                        PriceConverter.convertPrice(
                          context,
                          productModel.unitPrice,
                        ),
                        style: titilliumSemiBold.copyWith(
                            color: ColorResources.BLACK.withAlpha(400),
                            fontSize: 18),
                      ),
                      Row(
                        children: [
                          Text(
                            productModel.totalOrders.toString() + " sold ",
                            style: titilliumSemiBold.copyWith(
                                color: ColorResources.BLACK.withAlpha(700),
                                fontSize: 10),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          productModel.averageRating != null
                              ? Icon(
                                  color: ColorResources.RED,
                                  Icons.star,
                                  size: 15,
                                )
                              : SizedBox(),
                          Text(
                            productModel.averageRating != null
                                ? ' ' + productModel.averageRating.toString()
                                : "",
                            style: titilliumSemiBold.copyWith(
                                color: ColorResources.BLACK.withAlpha(700),
                                fontSize: 10),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ]),
      ),
    );
  }
}
