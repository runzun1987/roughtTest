import 'package:flutter/material.dart';
// import 'package:flutter_sixvalley_ecommerce/22222/ModelProvider.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/cart_model.dart';
import 'package:flutter_sixvalley_ecommerce/helper/price_converter.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/models/ModelProvider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/auth_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/cart_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/profile_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/splash_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/cart_utils.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';

import 'package:provider/provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/string_casting.dart';

import '../../../../utill/shipping_cost_and_estimated_delivery.dart';

class CartWidget extends StatefulWidget {
  final Cart? cart;
  final ProductInfo? cartModel;
  final int index;

  final bool fromBuyNow;

  const CartWidget({
    Key? key,
    this.cart,
    this.cartModel,
    required this.index,
    required this.fromBuyNow,
  });

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  late bool isLoggedin;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
    //  isLoggedin =  Provider.of<AuthProvider>(context, listen: false).isLoggedIn(context);
  }

  _asyncMethod() async {
    bool result = await Provider.of<AuthProvider>(context, listen: false)
        .isLoggedIn(context);

    setState(() {
      isLoggedin = result;
    });
  }

  void update({
    required BuildContext context,
    required Cart updatedCart,
  }) {
    Provider.of<CartProvider>(context, listen: false)
        .updateCartProductQuantity(
      updatedCart,
      context,
    )
        .then((value) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(value.message!),
        backgroundColor: value.isSuccess ? Colors.green : Colors.red,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.PADDING_SIZE_SMALL),
      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
      decoration: BoxDecoration(
        color: Theme.of(context).highlightColor,
      ),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      Dimensions.PADDING_SIZE_EXTRA_SMALL),
                  border: Border.all(
                      color: Theme.of(context).primaryColor.withOpacity(.20),
                      width: 1)),
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                child: FadeInImage.assetNetwork(
                  placeholder: Images.placeholder,
                  height: 60,
                  width: 60,
                  image: widget.cartModel!.image!,
                  imageErrorBuilder: (c, o, s) => Image.asset(
                      Images.placeholder,
                      fit: BoxFit.cover,
                      height: 60,
                      width: 60),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.cartModel!.title!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: titilliumBold.copyWith(
                              fontSize: Dimensions.FONT_SIZE_DEFAULT,
                              color:
                                  ColorResources.getReviewRattingColor(context),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Dimensions.PADDING_SIZE_SMALL,
                        ),
                        !widget.fromBuyNow
                            ? InkWell(
                                onTap: () async {
                                  if (await Provider.of<AuthProvider>(context,
                                          listen: false)
                                      .isLoggedIn(context)) {
                                    String? userPhone =
                                        Provider.of<ProfileProvider>(context,
                                                listen: false)
                                            .userInfoModel!
                                            .phone;
                                    Provider.of<CartProvider>(context,
                                            listen: false)
                                        .removeFromCartAPI(
                                      widget.cart!,
                                      widget.index,
                                      userPhone,
                                      context,
                                    );
                                  } else {
                                    Provider.of<CartProvider>(context,
                                            listen: false)
                                        .removeFromCart(widget.index);
                                  }
                                },
                                child: Container(
                                    width: 20,
                                    height: 20,
                                    child: Image.asset(
                                      Images.delete,
                                      scale: .5,
                                    )),
                              )
                            : SizedBox.shrink(),
                      ],
                    ),

                    //variation
                    Padding(
                      padding: EdgeInsets.only(
                        top: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                      ),
                      child: Row(children: [
                        //Text('${getTranslated('variations', context)}: ', style: titilliumSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL)),
                        Flexible(
                          child: Text(
                            widget.cartModel!.detail!
                                .map((d) {
                                  return "${d!.name} ${d.value}";
                                })
                                .toList()
                                .join(','),
                            style: robotoRegular.copyWith(
                              fontSize: 10,
                              color:
                                  ColorResources.getReviewRattingColor(context),
                            ),
                          ),
                        ),
                      ]),
                    ),

                    // Text(
                    //   cartModel.getDetailToString(cartModel.detail),
                    //   maxLines: 1,
                    //   overflow: TextOverflow.ellipsis,
                    //   style: titilliumBold.copyWith(
                    //     fontSize: 10,
                    //     color: ColorResources.getReviewRattingColor(context),
                    //   ),
                    // ),

                    SizedBox(
                      height: Dimensions.PADDING_SIZE_SMALL,
                    ),
                    Row(
                      children: [
                        // cartModel.discount > 0
                        //     ? Text(
                        //         PriceConverter.convertPrice(
                        //             context, cartModel.price),
                        //         maxLines: 1,
                        //         overflow: TextOverflow.ellipsis,
                        //         style: titilliumSemiBold.copyWith(
                        //           color: ColorResources.getRed(context),
                        //           decoration: TextDecoration.lineThrough,
                        //         ),
                        //       )
                        //     : SizedBox(),
                        SizedBox(
                          width: Dimensions.FONT_SIZE_DEFAULT,
                        ),
                        Text(
                          PriceConverter.convertPrice(
                            context,
                            double.parse(
                              (widget.cartModel!.price! * widget.cartModel!.qty!)
                                  .toString(),
                            ),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: titilliumRegular.copyWith(
                              color: ColorResources.getPrimary(context),
                              fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE),
                        ),
                        // Text(
                        //   PriceConverter.convertPrice(context, cartModel.price,
                        //       discount: cartModel.discount,
                        //       discountType: 'amount'),
                        //   maxLines: 1,
                        //   overflow: TextOverflow.ellipsis,
                        //   style: titilliumRegular.copyWith(
                        //       color: ColorResources.getPrimary(context),
                        //       fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE),
                        // ),
                      ],
                    ),

                    SizedBox(width: Dimensions.PADDING_SIZE_SMALL),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        widget.cartModel!.shippingType != 'order_wise' &&
                                isLoggedin
                            // true
                            ? Padding(
                                padding: EdgeInsets.only(
                                    top: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                child: Row(children: [
                                  Text(
                                      '${getTranslated('shipping_cost', context)}: ',
                                      style: titilliumSemiBold.copyWith(
                                          fontSize:
                                              Dimensions.FONT_SIZE_DEFAULT,
                                          color: ColorResources
                                              .getReviewRattingColor(context))),
                                  Text(
                                      '${double.parse(ShippingCostAndEstimatedDelivery.sumOfShipping(
                                        widget.cartModel!.provider,
                                        widget.cartModel!.sellerPrice,
                                        widget.cartModel!.price,
                                        widget.cartModel!.shippingType,
                                        widget.cartModel!.tier,
                                        widget.cartModel!.qty,
                                      ).toString()).toStringAsFixed(2)}',
                                      style: robotoRegular.copyWith(
                                        fontSize: Dimensions.FONT_SIZE_SMALL,
                                        color: Theme.of(context).disabledColor,
                                      )),
                                ]),
                              )
                            : SizedBox(),
                        widget.cartModel!.shippingType != 'order_wise' &&
                                isLoggedin
                            // true
                            ? Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        right: Dimensions.PADDING_SIZE_SMALL),
                                    child: QuantityButton(
                                      cart: widget.cart,
                                      isIncrement: false,
                                      index: widget.index,
                                      quantity: widget.cartModel!.qty,
                                      maxQty: 20,
                                      callBack: (Cart updatedCart) {
                                        update(
                                          context: context,
                                          updatedCart: updatedCart,
                                        );
                                      },
                                      // cartModel: cartModel,
                                    ),
                                  ),
                                  Text(widget.cartModel!.qty.toString(),
                                      style: titilliumSemiBold),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: Dimensions.PADDING_SIZE_SMALL),
                                    child: QuantityButton(
                                      cart: widget.cart,
                                      isIncrement: true,
                                      index: widget.index,
                                      quantity: widget.cartModel!.qty,
                                      maxQty: 20,
                                      callBack: (Cart updatedCart) {
                                        update(
                                          context: context,
                                          updatedCart: updatedCart,
                                        );
                                      },
                                      // cartModel: cartModel,
                                    ),
                                  ),
                                ],
                              )
                            : SizedBox.shrink(),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          print('Open shipping Screen');
                        },
                        child: Text(
                          widget.cartModel!.shippingType!.toCapitalized() +
                              " " +
                              'Shipping',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: titilliumRegular.copyWith(
                              color: ColorResources.getPrimary(context),
                              fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
    );
  }
}

class QuantityButton extends StatelessWidget {
  final Cart? cart;
  // final ProductInfo cartModel;
  final bool isIncrement;
  final int? quantity;
  final int index;
  final int maxQty;

  final Function(Cart updatedCart) callBack;

  QuantityButton({
    required this.isIncrement,
    required this.cart,
    required this.quantity,
    required this.index,
    required this.maxQty,

    // @required this.cartModel,
    required this.callBack,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!isIncrement && quantity! > 1) {
          // Provider.of<CartProvider>(context, listen: false).setQuantity(false, index);
          Cart updatedCart = CartUtils.updateQty(isIncrement, cart!, index);
          callBack(updatedCart);
          // if (isServerUpdate) {
          // Provider.of<CartProvider>(context, listen: false)
          //     .updateCartProductQuantity(
          //   cart,
          //   context,
          // )
          //     .then((value) {
          //   // callBack(false,updatedCart);
          //   if (value.isSuccess) {
          //     callBack(false, updatedCart);
          //   }
          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //     content: Text(value.message),
          //     backgroundColor: value.isSuccess ? Colors.green : Colors.red,
          //   ));
          // });
          // } else {
          //   updatedCart;
          //   callBack(false);
          // }
        } else if (isIncrement && quantity! < maxQty) {
          Cart updatedCart = CartUtils.updateQty(isIncrement, cart!, index);
          callBack(updatedCart);
          // Provider.of<CartProvider>(context, listen: false).setQuantity(true, index);

          // if (isServerUpdate) {
          //   Provider.of<CartProvider>(context, listen: false)
          //       .updateCartProductQuantity(
          //     updatedCart,
          //     context,
          //   )
          //       .then((value) {
          //     callBack(false);
          //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //       content: Text(value.message),
          //       backgroundColor: value.isSuccess ? Colors.green : Colors.red,
          //     ));
          //   });
          // } else {
          //   callBack(false);
          // }
        }
      },
      child: Icon(
        isIncrement ? Icons.add_circle : Icons.remove_circle,
        color: isIncrement
            ? quantity! >= maxQty
                ? ColorResources.getGrey(context)
                : ColorResources.getPrimary(context)
            : quantity! > 1
                ? ColorResources.getPrimary(context)
                : ColorResources.getGrey(context),
        size: 30,
      ),
    );
  }
}
