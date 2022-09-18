import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/product_model.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/user_info_model.dart';
import 'package:flutter_sixvalley_ecommerce/models/ModelProvider.dart'
    as ModelProvider;
import 'package:flutter_sixvalley_ecommerce/provider/auth_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/profile_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/wishlist_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/animated_custom_dialog.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/guest_dialog.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/show_custom_snakbar.dart';
import 'package:provider/provider.dart';

import '../../wishlist/wishlist_screen.dart';
import '../product_details_screen.dart';

class FavouriteButton extends StatefulWidget {
  final Color backgroundColor;
  final Color favColor;
  final bool isSelected;
  final Product? product;
  final GlobalKey<ScaffoldMessengerState>? scaffoldKey;

  FavouriteButton({
    this.backgroundColor = Colors.black,
    this.favColor = Colors.white,
    this.isSelected = false,
    this.product,
    this.scaffoldKey,
  });

  @override
  State<FavouriteButton> createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  late bool isGuestMode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  _asyncMethod() async {
    isGuestMode = !await Provider.of<AuthProvider>(context, listen: false)
        .isLoggedIn(context);
  }

  @override
  Widget build(BuildContext context) {
    // bool isGuestMode =
    //     !Provider.of<AuthProvider>(context, listen: false).isLoggedIn(context);

    feedbackMessage(String message) {
      if (message != '') {
        showCustomSnackBar(
          message,
          context,
          scaffoldKey: widget.scaffoldKey,
          isError: false,
          label: "GO TO WISHLIST",
          onPress: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => WishListScreen(),
            ),
          ),
        );
      }
    }

    return GestureDetector(
      onTap: () {
        if (isGuestMode) {
          showAnimatedDialog(context, GuestDialog(), isFlip: true);
        } else {
          UserInfoModel? userInfo =
              Provider.of<ProfileProvider>(context, listen: false)
                  .userInfoModel;

          Provider.of<WishListProvider>(context, listen: false).isWish
              ? Provider.of<WishListProvider>(context, listen: false)
                  .removeWishList(userInfo!, widget.product!.id.toString(),
                      feedbackMessage: feedbackMessage)
              : Provider.of<WishListProvider>(context, listen: false)
                  .addWishList(userInfo!, widget.product!,
                      feedbackMessage: feedbackMessage);
        }
      },
      child: Consumer<WishListProvider>(
        builder: (context, wishListProvider, child) => Card(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          color: Theme.of(context).cardColor,
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Image.asset(
              wishListProvider.isWish ? Images.wish_image : Images.wishlist,
              color: widget.favColor,
              height: 16,
              width: 16,
            ),
          ),
        ),
      ),
    );
  }
}
