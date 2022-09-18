import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/provider/theme_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/order/order_details_screen.dart';
import 'package:provider/provider.dart';

import '../../provider/auth_provider.dart';
import '../../provider/order_provider.dart';
import '../../provider/profile_provider.dart';
import '../../utill/color_resources.dart';

class CustomAppBar extends StatelessWidget {
  final String? title;
  final isBackButtonExist;
  final IconData? icon;
  final Function? onActionPressed;
  final Function? onBackPressed;
  final ScrollController? scrollController;

  CustomAppBar({
    required this.title,
    this.isBackButtonExist = true,
    this.icon,
    this.onActionPressed,
    this.onBackPressed,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    void startSearching(context) async {
      if (_controller.text != null) {
        bool isGuestMode =
            !await Provider.of<AuthProvider>(context, listen: false)
                .isLoggedIn(context);

        if (!isGuestMode) {
          String? phone = Provider.of<ProfileProvider>(context, listen: false)
              .userInfoModel!
              .phone;

          await Provider.of<OrderProvider>(context, listen: false)
              .getOrderDetails(
            phone!,
            _controller.text,
            context,
          );
        }
      }
    }

    return Card(
      child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
          child: Image.asset(
            Images.toolbar_background,
            fit: BoxFit.fill,
            height: 50 + MediaQuery.of(context).padding.top,
            width: MediaQuery.of(context).size.width,
            color: Provider.of<ThemeProvider>(context).darkTheme
                ? Colors.black
                : Colors.white,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          height: 50,
          alignment: Alignment.center,
          child: Row(children: [
            isBackButtonExist
                ? IconButton(
                    icon: Icon(Icons.arrow_back_ios,
                        size: 20,
                        color: Provider.of<ThemeProvider>(context).darkTheme
                            ? Colors.white
                            : Colors.black),
                    onPressed: () => onBackPressed != null
                        ? onBackPressed!()
                        : Navigator.of(context).pop(),
                  )
                : SizedBox.shrink(),
            SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
            // Expanded(
            //   child: Text(
            //     title!,
            //     style: titilliumRegular.copyWith(
            //       fontSize: 20,
            //       color: Provider.of<ThemeProvider>(context).darkTheme
            //           ? Colors.white
            //           : Colors.black,
            //     ),
            //     maxLines: 1,
            //     overflow: TextOverflow.ellipsis,
            //   ),
            // ),

            Expanded(
              child: Container(
                // padding: EdgeInsets.all(10),
                child: Row(children: [
                  // InkWell(
                  //   onTap: () {
                  //     // Provider.of<SearchProvider>(context, listen: false)
                  //     //     .saveSearchAddress(_controller.text.toString());
                  //     // Provider.of<SearchProvider>(context, listen: false)
                  //     //     .searchProduct(_controller.text.toString(), 1, context);
                  //   },
                  //   child: Container(
                  //     width: 55,
                  //     height: 55,
                  //     decoration: BoxDecoration(
                  //         color: Theme.of(context).primaryColor,
                  //         borderRadius: BorderRadius.only(
                  //             topLeft:
                  //                 Radius.circular(Dimensions.PADDING_SIZE_SMALL),
                  //             bottomLeft: Radius.circular(
                  //                 Dimensions.PADDING_SIZE_SMALL))),
                  //     child: Icon(Icons.search,
                  //         color: Theme.of(context).cardColor,
                  //         size: Dimensions.ICON_SIZE_SMALL),
                  //   ),
                  // ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextFormField(
                        controller: _controller,
                        onFieldSubmitted: (query) {
                          startSearching(context);
                        },
                        onChanged: (query) {
                          // onTextChanged!(query);
                        },
                        textInputAction: TextInputAction.search,
                        maxLines: 1,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          hintText: "Order ID ...",
                          isDense: true,
                          hintStyle: robotoRegular.copyWith(
                              color: Theme.of(context).hintColor),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          contentPadding: EdgeInsets.all(16),

                          prefixIcon: InkWell(
                            onTap: () async {
                              startSearching(context);
                            },
                            child: Icon(Icons.search,
                                color: ColorResources.getColombiaBlue(context),
                                size: Dimensions.ICON_SIZE_DEFAULT),
                          ),

                          // suffixIcon: Provider.of<SearchProvider>(context)
                          //         .searchText
                          //         .isNotEmpty
                          //     ? IconButton(
                          //         icon: Icon(Icons.clear, color: Colors.black),
                          //         onPressed: () {
                          //           onClearPressed();
                          //           _controller.clear();
                          //         },
                          //       )
                          //     : _controller.text.isNotEmpty
                          //         ? IconButton(
                          //             icon: Icon(Icons.clear,
                          //                 color: ColorResources.getChatIcon(
                          //                     context)),
                          //             onPressed: () {
                          //               onClearPressed();
                          //               _controller.clear();
                          //             },
                          //           )
                          //         : null,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                ]),
              ),
            ),
            icon != null
                ? IconButton(
                    icon: Icon(
                      icon,
                      size: Dimensions.ICON_SIZE_LARGE,
                      color: Provider.of<ThemeProvider>(context).darkTheme
                          ? Colors.white
                          : Colors.black,
                    ),
                    onPressed: onActionPressed as void Function()?,
                  )
                : SizedBox.shrink(),
          ]),
        ),
      ]),
    );
  }
}
