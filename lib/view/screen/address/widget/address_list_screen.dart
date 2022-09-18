import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/address_model.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/user_info_model.dart';
import 'package:flutter_sixvalley_ecommerce/provider/profile_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';

class AddressListPage extends StatelessWidget {
  final UserInfoModel? userInfo;
  AddressListPage({Key? key, this.userInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('ccccccccccccccccccccccccccccccccccccccccccccccc');
    return ListTile(
      leading: Image.asset(
        Images.home_image,
        color: ColorResources.getSellerTxt(context),
        height: 30,
        width: 30,
      ),
      title: Text(
        userInfo!.town != null ? userInfo!.town : "dsdfasdf",
        style: titilliumRegular,
      ),
    );
  }
}
