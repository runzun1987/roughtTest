import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_sixvalley_ecommerce/data/model/response/product_model.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/user_info_model.dart';
import 'package:flutter_sixvalley_ecommerce/helper/price_converter.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/provider/profile_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/splash_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/wishlist_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/product/product_details_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/product/widget/cart_bottom_sheet.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../models/UserWishList.dart';

class WishListWidget extends StatefulWidget {
  final UserWishList? wishlist;
  final int? index;
  WishListWidget({this.wishlist, this.index});

  @override
  State<WishListWidget> createState() => _WishListWidgetState();
}

class _WishListWidgetState extends State<WishListWidget> {
  @override
  void initState() {
    super.initState();
    if (widget.wishlist!.isPublic == 'true') {
      setState(() {
        _selected = pokemonsMap[0];
        isLoading = false;
      });
    } else {
      setState(() {
        _selected = pokemonsMap[1];
        isLoading = false;
      });
    }
  }

  bool isLoading = false;
  late Map _selected;
  List<Map> pokemonsMap = [
    {
      'label': 'Public',
      'value': 'Public',
      'icon': Container(
        height: 25,
        width: 25,
        child: Icon(Icons.public),
      ),
    },
    {
      'label': 'Private',
      'value': 'Private',
      'icon': Container(
        height: 25,
        width: 25,
        child: Icon(
          Icons.privacy_tip,
        ),
      ),
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.only(top: Dimensions.PADDING_SIZE_SMALL),
        margin: EdgeInsets.only(top: Dimensions.MARGIN_SIZE_SMALL),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => ProductDetails(
                productId: int.parse(widget.wishlist!.productId!),
              ),
            ));
          },
          child: Padding(
            padding: const EdgeInsets.only(
                left: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                right: Dimensions.PADDING_SIZE_DEFAULT),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            border: Border.all(
                                width: .5,
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(.25)),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            child: FadeInImage.assetNetwork(
                              placeholder: Images.placeholder,
                              fit: BoxFit.scaleDown,
                              width: 80,
                              height: 80,
                              image: '${widget.wishlist!.image}',
                              imageErrorBuilder: (c, o, s) => Image.asset(
                                  Images.placeholder,
                                  fit: BoxFit.scaleDown,
                                  width: 80,
                                  height: 80),
                            ),
                          ),
                        ),
                        widget.wishlist!.price != null
                            ? Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                  height: 20,
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(Dimensions
                                              .PADDING_SIZE_EXTRA_SMALL),
                                          bottomRight: Radius.circular(
                                              Dimensions
                                                  .PADDING_SIZE_EXTRA_SMALL)),
                                      color: Theme.of(context).primaryColor),
                                  child: Text(
                                    widget.wishlist!.price != null
                                        ? PriceConverter.percentageCalculation(
                                            context,
                                            double.parse(
                                                widget.wishlist!.price!),
                                            0.0,
                                            "0")
                                        : '',
                                    style: titilliumRegular.copyWith(
                                        fontSize:
                                            Dimensions.FONT_SIZE_EXTRA_SMALL,
                                        color: Theme.of(context).cardColor),
                                  ),
                                ),
                              )
                            : SizedBox(),
                      ],
                    ),
                    SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  widget.wishlist!.title ?? '',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: titilliumSemiBold.copyWith(
                                    color: ColorResources.getReviewRattingColor(
                                        context),
                                    fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                              InkWell(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (_) =>
                                            new CupertinoAlertDialog(
                                              title: new Text(getTranslated(
                                                  'ARE_YOU_SURE_WANT_TO_REMOVE_WISH_LIST',
                                                  context)!),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: Text(getTranslated(
                                                      'YES', context)!),
                                                  onPressed: () {
                                                    UserInfoModel userInfo =
                                                        Provider.of<ProfileProvider>(
                                                                context,
                                                                listen: false)
                                                            .userInfoModel!;
                                                    // UserWishList wishList =
                                                    //     UserWishList(
                                                    //         productId: product.id
                                                    //             .toString(),
                                                    //         userPhone: userInfo
                                                    //             .phone,
                                                    //         provider:
                                                    //             product.provider,
                                                    //         title: product.name,
                                                    //         price: product
                                                    //             .unitPrice
                                                    //             .toString(),
                                                    //         image:
                                                    //             product.thumbnail,
                                                    //         isPublic: "true",
                                                    //         baseType:
                                                    //             "wishListType");

                                                    Provider.of<WishListProvider>(
                                                            context,
                                                            listen: false)
                                                        .removeWishList(
                                                            userInfo,
                                                            widget.wishlist!
                                                                .productId,
                                                            index:
                                                                widget.index);
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                                TextButton(
                                                  child: Text(getTranslated(
                                                      'NO', context)!),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ],
                                            ));
                                  },
                                  child: Image.asset(
                                    Images.delete,
                                    scale: 3,
                                    color: ColorResources.getRed(context)
                                        .withOpacity(.90),
                                  )),
                            ],
                          ),
                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  // product.discount != null && product.discount > 0
                                  //     ? Text(
                                  //         product.unitPrice != null
                                  //             ? PriceConverter.convertPrice(
                                  //                 context, product.unitPrice)
                                  //             : '',
                                  //         style: titilliumSemiBold.copyWith(
                                  //             color: ColorResources.getRed(context),
                                  //             decoration: TextDecoration.lineThrough),
                                  //       )
                                  //     : SizedBox(),
                                  // product.discount != null && product.discount > 0
                                  //     ? SizedBox(
                                  //         width: Dimensions.PADDING_SIZE_DEFAULT)
                                  //     : SizedBox(),
                                  Text(
                                    "Rs ." + widget.wishlist!.price!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: titilliumRegular.copyWith(
                                        color:
                                            ColorResources.getPrimary(context),
                                        fontSize: Dimensions.FONT_SIZE_LARGE),
                                  ),
                                ],
                              ),
                              isLoading
                                  ? SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          valueColor:
                                              new AlwaysStoppedAnimation<Color>(
                                            Theme.of(context).primaryColor,
                                          )),
                                    )
                                  : Consumer<WishListProvider>(
                                      builder:
                                          (context, wishListProvider, value) =>
                                              Container(
                                        width: 30,
                                        height: 30,
                                        // color: Colors.red,
                                        child: CoolDropdown(
                                          dropdownList: pokemonsMap,
                                          dropdownItemPadding: EdgeInsets.zero,
                                          onChange: (dropdownItem) async {
                                            if (dropdownItem['label'] ==
                                                'Private') {
                                              setState(() {
                                                isLoading = true;
                                              });

                                              await wishListProvider
                                                  .updatePublic(
                                                      widget.wishlist!,
                                                      "false");
                                              setState(() {
                                                _selected = {...pokemonsMap[1]};
                                                isLoading = false;
                                              });
                                            } else {
                                              setState(() {
                                                isLoading = true;
                                              });
                                              await wishListProvider
                                                  .updatePublic(
                                                      widget.wishlist!, "true");
                                              setState(() {
                                                _selected = {...pokemonsMap[0]};
                                                isLoading = false;
                                              });
                                            }
                                            ;
                                          },
                                          resultHeight: 50,
                                          resultWidth: 50,
                                          dropdownWidth: 50,
                                          dropdownHeight: 100,
                                          dropdownItemHeight: 30,
                                          dropdownItemGap: 10,
                                          resultIcon: Container(
                                            width: 25,
                                            height: 25,
                                            child: Container(
                                              width: 25,
                                              height: 25,
                                              child: _selected['icon'],
                                            ),
                                          ),
                                          resultIconLeftGap: 0,
                                          resultPadding: EdgeInsets.zero,
                                          resultIconRotation: true,
                                          resultIconRotationValue: 1,
                                          isDropdownLabel: false,
                                          isResultLabel: false,
                                          isResultIconLabel: false,
                                          dropdownPadding: EdgeInsets.zero,
                                          resultAlign: Alignment.center,
                                          resultMainAxis:
                                              MainAxisAlignment.center,
                                          dropdownItemMainAxis:
                                              MainAxisAlignment.center,
                                          selectedItemBD: BoxDecoration(
                                              border: Border(
                                                  left: BorderSide(
                                                      color: Colors.black
                                                          .withOpacity(0.7),
                                                      width: 3))),
                                          triangleWidth: 10,
                                          triangleHeight: 10,
                                          triangleAlign: 'center',
                                          dropdownAlign: 'center',
                                          gap: 20,
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                          // Row(
                          //   children: [
                          //     Text(
                          //       '${getTranslated('qty', context)}:' +
                          //           ' ' +
                          //           '${product.minQty}',
                          //       style: titleRegular.copyWith(
                          //           color: ColorResources.getReviewRattingColor(
                          //               context)),
                          //       textAlign: TextAlign.center,
                          //     ),
                          //     Spacer(),
                          //     InkWell(
                          //       onTap: () {
                          //         showModalBottomSheet(
                          //             context: context,
                          //             isScrollControlled: true,
                          //             backgroundColor: Colors.transparent,
                          //             builder: (con) =>
                          //                 CartBottomSheet(product: product));
                          //       },
                          //       child: Container(
                          //         height: 30,
                          //         margin: EdgeInsets.only(
                          //             left: Dimensions.PADDING_SIZE_SMALL),
                          //         padding: EdgeInsets.symmetric(
                          //             horizontal: Dimensions.PADDING_SIZE_SMALL),
                          //         alignment: Alignment.center,
                          //         decoration: BoxDecoration(
                          //             boxShadow: [
                          //               BoxShadow(
                          //                 color: Colors.grey.withOpacity(0.2),
                          //                 spreadRadius: 1,
                          //                 blurRadius: 7,
                          //                 offset: Offset(
                          //                     0, 1), // changes position of shadow
                          //               ),
                          //             ],
                          //             gradient: LinearGradient(colors: [
                          //               Theme.of(context).primaryColor,
                          //               Theme.of(context).primaryColor,
                          //               Theme.of(context).primaryColor,
                          //             ]),
                          //             borderRadius: BorderRadius.circular(
                          //                 Dimensions.PADDING_SIZE_EXTRA_SMALL)),
                          //         child: Row(
                          //           mainAxisAlignment: MainAxisAlignment.center,
                          //           children: [
                          //             Icon(Icons.shopping_cart,
                          //                 color: Colors.white, size: 15),
                          //             SizedBox(
                          //               width:
                          //                   Dimensions.PADDING_SIZE_EXTRA_SMALL,
                          //             ),
                          //             FittedBox(
                          //               child: Text(
                          //                   getTranslated('add_to_cart', context),
                          //                   style: titleRegular.copyWith(
                          //                       fontSize:
                          //                           Dimensions.FONT_SIZE_DEFAULT,
                          //                       color: Colors.white)),
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                Divider()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
