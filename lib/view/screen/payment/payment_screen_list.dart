import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/user_info_model.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/provider/location_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/order_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/payment_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/profile_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/no_internet_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/address/select_location_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/address/widget/address_list_screen.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../../data/model/response/address_model.dart';
import '../../../data/model/response/base/cities.dart';
import '../../../data/model/response/base/payment.dart';
import '../../../utill/app_constants.dart';
import '../../basewidget/dialog/single_text_alertdialog.dart';
import '../../basewidget/my_dialog.dart';
import '../../basewidget/show_custom_modal_dialog.dart';
import '../../basewidget/textfield/custom_textfield.dart';
import '../auth/widget/code_picker_widget.dart';

class PaymentListScreen extends StatefulWidget {
  const PaymentListScreen({Key? key}) : super(key: key);

  @override
  State<PaymentListScreen> createState() => _PaymentListScreenState();
}

class _PaymentListScreenState extends State<PaymentListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PAYMENT METHODS"),
      ),
      body: SafeArea(child: Consumer<ProfileProvider>(
        builder: (context, profile, child) {
          return Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  profile.userInfoModel != null
                      ? profile.userInfoModel != null
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Consumer<PaymentProvider>(
                                builder: (context, paymentProvider, value) =>
                                    Card(
                                  elevation: 10,
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Card(
                                          child: Container(
                                            height: 40,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                opacity: 0.1,
                                                image: AssetImage(
                                                    "assets/images/esewa.jpg"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'E-SEWA',
                                                style: titilliumBold.copyWith(
                                                    color: Color(0xff5CB246),
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                            ),
                                          ),
                                        ),
                                        leading: Radio<PaymentList>(
                                          value: PaymentList.ESEWA,
                                          groupValue: paymentProvider.character,
                                          onChanged: (PaymentList? value) {
                                            paymentProvider
                                                .changePayment(value);
                                          },
                                        ),
                                      ),
                                      ListTile(
                                        title: Card(
                                          child: Container(
                                            height: 40,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                opacity: 0.1,
                                                image: AssetImage(
                                                    "assets/images/khalti.jpg"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'KHALTI',
                                                style: titilliumBold.copyWith(
                                                    color: Color(0xff5D2E8E),
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                            ),
                                          ),
                                        ),
                                        leading: Radio<PaymentList>(
                                          value: PaymentList.KHALTI,
                                          groupValue: paymentProvider.character,
                                          onChanged: (PaymentList? value) {
                                            paymentProvider
                                                .changePayment(value);
                                          },
                                        ),
                                      ),
                                      ListTile(
                                        title: Card(
                                          child: Container(
                                            height: 40,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                opacity: 0.1,
                                                image: AssetImage(
                                                    "assets/images/transfer.jpg"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'E-BANKING',
                                                style: titilliumBold.copyWith(
                                                    color: Color(0xffED192E),
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                            ),
                                          ),
                                        ),
                                        leading: Radio<PaymentList>(
                                          value: PaymentList.EBANKING,
                                          groupValue: paymentProvider.character,
                                          onChanged: (PaymentList? value) {
                                            paymentProvider
                                                .changePayment(value);
                                          },
                                        ),
                                      ),

                                      ListTile(
                                        title: Card(
                                          child: Container(
                                            height: 40,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                opacity: 0.1,
                                                image: AssetImage(
                                                    "assets/images/transfer.jpg"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'MOBILE-BANKING',
                                                style: titilliumBold.copyWith(
                                                    color: Color(0xffED192E),
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                            ),
                                          ),
                                        ),
                                        leading: Radio<PaymentList>(
                                          value: PaymentList.MOBILEBANKING,
                                          groupValue: paymentProvider.character,
                                          onChanged: (PaymentList? value) {
                                            paymentProvider
                                                .changePayment(value);
                                          },
                                        ),
                                      ),
                                      ListTile(
                                        title: Card(
                                          child: Container(
                                            height: 40,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                opacity: 0.1,
                                                image: AssetImage(
                                                    "assets/images/transfer.jpg"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'SCT',
                                                style: titilliumBold.copyWith(
                                                    color: Color(0xffED192E),
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                            ),
                                          ),
                                        ),
                                        leading: Radio<PaymentList>(
                                          value: PaymentList.SCT,
                                          groupValue: paymentProvider.character,
                                          onChanged: (PaymentList? value) {
                                            paymentProvider
                                                .changePayment(value);
                                          },
                                        ),
                                      ),

                                      ListTile(
                                        title: Card(
                                          child: Container(
                                            height: 40,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                opacity: 0.1,
                                                image: AssetImage(
                                                    "assets/images/transfer.jpg"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'CONNECT IPS',
                                                style: titilliumBold.copyWith(
                                                    color: Color(0xffED192E),
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                            ),
                                          ),
                                        ),
                                        leading: Radio<PaymentList>(
                                          value: PaymentList.CONNECTIPS,
                                          groupValue: paymentProvider.character,
                                          onChanged: (PaymentList? value) {
                                            paymentProvider
                                                .changePayment(value);
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      // SizedBox(
                                      //   width:
                                      //       MediaQuery.of(context).size.width *
                                      //           0.90,
                                      //   height: 50,
                                      //   child: TextButton(
                                      //     onPressed: saveHandler,
                                      //     style: TextButton.styleFrom(
                                      //       backgroundColor:
                                      //           Theme.of(context).primaryColor,
                                      //     ),
                                      //     child: Text(
                                      //       "SAVE",
                                      //       style: titilliumSemiBold.copyWith(
                                      //           color: Colors.white,
                                      //           fontSize: 14),
                                      //     ),
                                      //   ),
                                      // ),
                                      // SizedBox(
                                      //   height: 10,
                                      // )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(
                                  bottom: Dimensions.PADDING_SIZE_LARGE),
                              child:
                                  NoInternetOrDataScreen(isNoInternet: false))
                      : Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Theme.of(context).primaryColor),
                          ),
                        ),
                ],
              ),
              // child: Column(
              //   children: [
              //     profile.addressList != null
              //         ? profile.addressList.length != 0
              //             ? SizedBox(
              //                 child: ListView.builder(
              //                   physics: NeverScrollableScrollPhysics(),
              //                   itemCount: profile.addressList.length,
              //                   shrinkWrap: true,
              //                   itemBuilder: (context, index) {
              //                     return InkWell(
              //                       onTap: () {
              //                         Provider.of<OrderProvider>(context,
              //                                 listen: false)
              //                             .setAddressIndex(index);
              //                         Navigator.pop(context);
              //                       },
              //                       child: Padding(
              //                         padding: const EdgeInsets.symmetric(
              //                             horizontal:
              //                                 Dimensions.PADDING_SIZE_DEFAULT),
              //                         child: Container(
              //                           margin: EdgeInsets.only(
              //                               top: Dimensions.PADDING_SIZE_SMALL),
              //                           decoration: BoxDecoration(
              //                             borderRadius: BorderRadius.circular(10),
              //                             color:
              //                                 ColorResources.getIconBg(context),
              //                             border: index ==
              //                                     Provider.of<OrderProvider>(
              //                                             context)
              //                                         .addressIndex
              //                                 ? Border.all(
              //                                     width: 2,
              //                                     color: Theme.of(context)
              //                                         .primaryColor)
              //                                 : null,
              //                           ),
              //                           child: AddressListPage(
              //                               address: profile.addressList[index]),
              //                         ),
              //                       ),
              //                     );
              //                   },
              //                 ),
              //               )
              //             : Container(
              //                 alignment: Alignment.center,
              //                 margin: EdgeInsets.only(
              //                     bottom: Dimensions.PADDING_SIZE_LARGE),
              //                 child: NoInternetOrDataScreen(isNoInternet: false))
              //         : Center(
              //             child: CircularProgressIndicator(
              //                 valueColor: AlwaysStoppedAnimation<Color>(
              //                     Theme.of(context).primaryColor))),
              //   ],
              // ),
            ),
          );
        },
      )),
    );
  }

  void _checkPermission(Function callback, BuildContext context) async {
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.whileInUse) {
      InkWell(
          onTap: () async {
            Navigator.pop(context);
            await Geolocator.requestPermission();
            _checkPermission(callback, context);
          },
          child: AlertDialog(
              content: MyDialog(
                  icon: Icons.location_on_outlined,
                  title: '',
                  description: getTranslated('you_denied', context))));
    } else if (permission == LocationPermission.deniedForever) {
      InkWell(
          onTap: () async {
            Navigator.pop(context);
            await Geolocator.openAppSettings();
            _checkPermission(callback, context);
          },
          child: AlertDialog(
              content: MyDialog(
                  icon: Icons.location_on_outlined,
                  title: '',
                  description: getTranslated('you_denied', context))));
    } else {
      callback();
    }
  }
}
