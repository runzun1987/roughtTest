import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/user_info_model.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/provider/location_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/order_provider.dart';
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
import '../../../utill/app_constants.dart';
import '../../basewidget/dialog/single_text_alertdialog.dart';
import '../../basewidget/my_dialog.dart';
import '../../basewidget/not_loggedin_widget.dart';
import '../../basewidget/show_custom_modal_dialog.dart';
import '../../basewidget/textfield/custom_textfield.dart';
import '../auth/widget/code_picker_widget.dart';
import 'add_new_address_screen.dart';

class SavedAddressListScreen extends StatefulWidget {
  final UserInfoModel? userInfo;
  final LocationProvider? locationProvider;
  final bool? isLoggedIn;
  const SavedAddressListScreen(
      {Key? key,
      UserInfoModel? userInfo,
      LocationProvider? locationProvider,
      bool? isLoggedIn})
      : this.userInfo = userInfo,
        this.locationProvider = locationProvider,
        this.isLoggedIn = isLoggedIn,
        super(key: key);

  @override
  State<SavedAddressListScreen> createState() => _SavedAddressListScreenState();
}

class _SavedAddressListScreenState extends State<SavedAddressListScreen> {
  GoogleMapController? _controller;

  String? _town;
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _streetController = TextEditingController();
  TextEditingController _countryController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.isLoggedIn!) {
      if (widget.userInfo!.town != null) {
        _town = widget.userInfo!.town;
      } else {
        _town = widget.locationProvider!.selectedTown;
      }

      if (widget.userInfo!.firstName != null) {
        _firstNameController.text = widget.userInfo!.firstName!;
      }

      if (widget.userInfo!.lastName != null) {
        _lastNameController.text = widget.userInfo!.lastName!;
      }

      if (widget.userInfo!.email != null) {
        _emailController.text = widget.userInfo!.email;
      }

      if (widget.userInfo!.phone != null) {
        _phoneController.text = widget.userInfo!.phone.substring(4);
      }

      if (widget.userInfo!.phone != null) {
        _streetController.text = widget.userInfo!.street;
      } else {
        _streetController.text =
            widget.locationProvider!.locationController.text;
      }

      if (widget.userInfo!.country != null) {
        _countryController.text = widget.userInfo!.country;
      } else {
        _countryController.text = widget.locationProvider!.country!;
      }
    }

    // Provider.of<LocationProvider>(context, listen: false)
    //     .getCurrentLocation(context, true, mapController: _controller);
    // if (widget.userInfo.latitude != null) {
    //   CameraPosition cameraPosition = CameraPosition(
    //       target: LatLng(double.parse(widget.userInfo.latitude),
    //           double.parse(widget.userInfo.longitude)),
    //       zoom: 14);

    //   widget.locationProvider
    //       .updatePosition(cameraPosition, true, null, context);
    // }
  }

  void saveUser() {
    widget.userInfo!.firstName = _firstNameController.text;
    widget.userInfo!.lastName = _lastNameController.text;
    widget.userInfo!.street = _streetController.text;
    widget.userInfo!.town = _town;

    if (_firstNameController.text == null ||
        _lastNameController.text == null ||
        _streetController.text == null ||
        _town == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text("SAVE ERROR: Please fill all details"),
            backgroundColor: Colors.red),
      );
    } else {
      Provider.of<ProfileProvider>(context, listen: false)
          .updateUserInfo(widget.userInfo!, context);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Successfully Saved"),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    
    bool isEnableUpdate = false;
    // GoogleMapController _controller;
    CameraPosition _cameraPosition;

    FocusNode _phoneNode = FocusNode();
    FocusNode _passNode = FocusNode();
    FocusNode _fNameFocus = FocusNode();
    FocusNode _lNameFocus = FocusNode();
    FocusNode _emailFocus = FocusNode();
    FocusNode _streetFocus = FocusNode();
    FocusNode _townFocus = FocusNode();
    FocusNode _countryFocus = FocusNode();
    final FocusNode _addressNode = FocusNode();
    bool _updateAddress = true;

    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => Navigator.of(context).push(
      //     MaterialPageRoute(
      //       builder: (BuildContext context) => AddNewAddressScreen(
      //         isBilling: false,
      //       ),
      //     ),
      //   ),
      //   // onPressed: () {
      //   //   _checkPermission(
      //   //       () => Provider.of<LocationProvider>(context, listen: false)
      //   //           .getCurrentLocation(context, true,
      //   //               mapController: _controller),
      //   //       context);
      //   //   Provider.of<LocationProvider>(context, listen: false).updatePosition(
      //   //       CameraPosition(
      //   //           target: LatLng(double.parse(widget.address.latitude),
      //   //               double.parse(widget.address.longitude))),
      //   //       true,
      //   //       widget.address.address,
      //   //       context);
      //   // },
      //   child: Icon(Icons.add, color: Theme.of(context).highlightColor),
      //   backgroundColor: ColorResources.getPrimary(context),
      // ),
      appBar: AppBar(
        title: Text(getTranslated('SHIPPING_ADDRESS_LIST', context)!),
      ),
      body: !widget.isLoggedIn!
          ? NotLoggedInWidget()
          : SafeArea(child: Consumer<ProfileProvider>(
              builder: (context, profile, child) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      profile.userInfoModel != null
                          ? profile.userInfoModel != null
                              ? SizedBox(
                                  child: InkWell(
                                      onTap: () {
                                        // Provider.of<OrderProvider>(context, listen: false)
                                        //     .setAddressIndex(index);
                                        // Navigator.pop(context);
                                      },
                                      child: Column(
                                        children: [
                                          //1. Contact Information
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: Dimensions
                                                    .PADDING_SIZE_DEFAULT),
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  top: Dimensions
                                                      .PADDING_SIZE_SMALL),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: ColorResources.getIconBg(
                                                    context),
                                                // border: index ==
                                                //         Provider.of<OrderProvider>(context)
                                                //             .addressIndex
                                                //     ? Border.all(
                                                //         width: 2,
                                                //         color: Theme.of(context).primaryColor)
                                                //     : null,
                                              ),
                                              child: Card(
                                                elevation: 10,
                                                child: Padding(
                                                  padding: EdgeInsets.all(10),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Contact Information",
                                                        style: titilliumBold
                                                            .copyWith(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        // margin: EdgeInsets.only(
                                                        //     left: Dimensions
                                                        //         .MARGIN_SIZE_DEFAULT,
                                                        //     right: Dimensions
                                                        //         .MARGIN_SIZE_DEFAULT),
                                                        child: Row(
                                                          children: [
                                                            Expanded(
                                                                child:
                                                                    CustomTextField(
                                                              hintText:
                                                                  getTranslated(
                                                                      'FIRST_NAME',
                                                                      context),
                                                              textInputType:
                                                                  TextInputType
                                                                      .name,
                                                              focusNode:
                                                                  _fNameFocus,
                                                              nextNode:
                                                                  _lNameFocus,
                                                              isPhoneNumber:
                                                                  false,
                                                              capitalization:
                                                                  TextCapitalization
                                                                      .words,
                                                              controller:
                                                                  _firstNameController,
                                                            )),
                                                            SizedBox(width: 15),
                                                            Expanded(
                                                                child:
                                                                    CustomTextField(
                                                              hintText:
                                                                  getTranslated(
                                                                      'LAST_NAME',
                                                                      context),
                                                              focusNode:
                                                                  _lNameFocus,
                                                              nextNode:
                                                                  _emailFocus,
                                                              capitalization:
                                                                  TextCapitalization
                                                                      .words,
                                                              controller:
                                                                  _lastNameController,
                                                            )),
                                                          ],
                                                        ),
                                                      ),
                                                      Row(children: [
                                                        CodePickerWidget(
                                                          // onChanged: (CountryCode countryCode) {
                                                          //   _countryDialCode = countryCode.dialCode;
                                                          // },
                                                          initialSelection:
                                                              "+977",
                                                          // favorite: [_countryDialCode],
                                                          showDropDownButton:
                                                              false,
                                                          padding:
                                                              EdgeInsets.zero,

                                                          showFlagMain: true,
                                                          enabled: false,
                                                          textStyle: TextStyle(
                                                              color: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .headline1!
                                                                  .color),
                                                        ),
                                                        Expanded(
                                                            child:
                                                                CustomTextField(
                                                          readOnly: true,
                                                          hintText: getTranslated(
                                                              'ENTER_MOBILE_NUMBER',
                                                              context),
                                                          controller:
                                                              _phoneController,
                                                          focusNode: _phoneNode,
                                                          nextNode: _passNode,
                                                          isPhoneNumber: true,
                                                          textInputAction:
                                                              TextInputAction
                                                                  .next,
                                                          textInputType:
                                                              TextInputType
                                                                  .phone,
                                                        )),
                                                      ]),
                                                      CustomTextField(
                                                        hintText: "EMAIL",
                                                        readOnly: true,
                                                        textInputType:
                                                            TextInputType
                                                                .emailAddress,
                                                        focusNode: _emailFocus,
                                                        nextNode: _streetFocus,
                                                        isPhoneNumber: false,
                                                        capitalization:
                                                            TextCapitalization
                                                                .words,
                                                        controller:
                                                            _emailController,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          //2. Shipping Address

                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: Dimensions
                                                    .PADDING_SIZE_DEFAULT),
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  top: Dimensions
                                                      .PADDING_SIZE_SMALL),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: ColorResources.getIconBg(
                                                    context),
                                                // border: index ==
                                                //         Provider.of<OrderProvider>(context)
                                                //             .addressIndex
                                                //     ? Border.all(
                                                //         width: 2,
                                                //         color: Theme.of(context).primaryColor)
                                                //     : null,
                                              ),
                                              child: Card(
                                                elevation: 10,
                                                child: Padding(
                                                  padding: EdgeInsets.all(10),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Shipping Address",
                                                        style: titilliumBold
                                                            .copyWith(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        // margin: EdgeInsets.only(
                                                        //     left: Dimensions
                                                        //         .MARGIN_SIZE_DEFAULT,
                                                        //     right: Dimensions
                                                        //         .MARGIN_SIZE_DEFAULT),
                                                        child: CustomTextField(
                                                          hintText: "STREET*",
                                                          textInputType:
                                                              TextInputType
                                                                  .name,
                                                          focusNode:
                                                              _streetFocus,
                                                          nextNode: _townFocus,
                                                          isPhoneNumber: false,
                                                          capitalization:
                                                              TextCapitalization
                                                                  .words,
                                                          controller:
                                                              _streetController,
                                                        ),
                                                      ),
                                                      Container(
                                                          margin: EdgeInsets.only(
                                                              left: Dimensions
                                                                  .MARGIN_SIZE_DEFAULT,
                                                              right: Dimensions
                                                                  .MARGIN_SIZE_DEFAULT),
                                                          child: DropdownButton<
                                                              String>(
                                                            hint: Text("TOWN*"),
                                                            value: _town,
                                                            items: Cities
                                                                .allCities
                                                                .map((String
                                                                    value) {
                                                              return DropdownMenuItem<
                                                                  String>(
                                                                value: value,
                                                                child:
                                                                    Text(value),
                                                              );
                                                            }).toList(),
                                                            onChanged: (val) {
                                                              setState(() {
                                                                _town = val;
                                                              });
                                                            },
                                                          )),
                                                      CustomTextField(
                                                        hintText: "COUNTRY*",
                                                        readOnly: true,
                                                        textInputType:
                                                            TextInputType.name,
                                                        focusNode:
                                                            _countryFocus,
                                                        // nextNode: _streetFocus,
                                                        isPhoneNumber: false,
                                                        capitalization:
                                                            TextCapitalization
                                                                .words,
                                                        controller:
                                                            _countryController,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.90,
                                            height: 50,
                                            child: TextButton(
                                              onPressed: saveUser,
                                              style: TextButton.styleFrom(
                                                backgroundColor:
                                                    Theme.of(context)
                                                        .primaryColor,
                                              ),
                                              child: Text(
                                                "SAVE",
                                                style:
                                                    titilliumSemiBold.copyWith(
                                                        color: Colors.white,
                                                        fontSize: 14),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                )
                              : Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(
                                      bottom: Dimensions.PADDING_SIZE_LARGE),
                                  child: NoInternetOrDataScreen(
                                      isNoInternet: false))
                          : Center(
                              child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Theme.of(context).primaryColor))),
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
