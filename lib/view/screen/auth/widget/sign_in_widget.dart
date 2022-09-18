import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/body/login_model.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/user_info_model.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/provider/auth_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/cart_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/profile_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/splash_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/button/custom_button.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/textfield/custom_password_textfield.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/textfield/custom_textfield.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/auth/forget_password_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/auth/widget/mobile_verify_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/auth/widget/social_login_widget.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/dashboard/dashboard_screen.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import 'code_picker_widget.dart';
import 'otp_verification_screen.dart';

class SignInWidget extends StatefulWidget {
  final Function? outRoute;
  SignInWidget({this.outRoute});
  @override
  _SignInWidgetState createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  TextEditingController? _phoneController;
  TextEditingController? _passwordController;
  GlobalKey<FormState>? _formKeyLogin;

  @override
  void initState() {
    super.initState();
    _formKeyLogin = GlobalKey<FormState>();

    _phoneController = TextEditingController();
    _passwordController = TextEditingController();

    _phoneController!.text =
        Provider.of<AuthProvider>(context, listen: false).getUserPhone();
  }

  @override
  void dispose() {
    _phoneController!.dispose();
    _passwordController!.dispose();
    super.dispose();
  }

  FocusNode _phoneNode = FocusNode();
  FocusNode _passNode = FocusNode();
  LoginModel loginBody = LoginModel();

  void loginUser() async {
    if (_formKeyLogin!.currentState!.validate()) {
      _formKeyLogin!.currentState!.save();

      // String _phone = _phoneController.text.trim();
      // String _password = _passwordController.text.trim();
      String _phone = "9843813046";
      String _password = "22222222";

      if (_phone.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(getTranslated('PHONE_MUST_BE_REQUIRED', context)!),
          backgroundColor: Colors.red,
        ));
      } else if (_password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(getTranslated('PASSWORD_MUST_BE_REQUIRED', context)!),
          backgroundColor: Colors.red,
        ));
      } else {
        if (Provider.of<AuthProvider>(context, listen: false).isRemember!) {
          Provider.of<AuthProvider>(context, listen: false)
              .saveUserPhone(_phone, _password);
        } else {
          Provider.of<AuthProvider>(context, listen: false)
              .clearUserPhoneAndPassword();
        }

        loginBody.phone = "+977" + _phone;
        loginBody.password = _password;

        await Provider.of<AuthProvider>(context, listen: false)
            .login(loginBody, route);
      }
    }
  }

  route(bool isRoute, bool isSignedIn, String errorMessage) async {
    if (isRoute) {
      if (isSignedIn) {
        await Provider.of<ProfileProvider>(context, listen: false)
            .getUserInfo(context);

        if (widget.outRoute != null) {
          UserInfoModel? userModel =
              Provider.of<ProfileProvider>(context, listen: false)
                  .userInfoModel;

          widget.outRoute!(userModel, context);
        } else {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => DashBoardScreen()),
              (route) => false);
        }
      }
      //   if (token == null || token.isEmpty) {
      //     if (Provider.of<SplashProvider>(context, listen: false)
      //         .configModel
      //         .emailVerification) {
      //       Provider.of<AuthProvider>(context, listen: false)
      //           .checkEmail(_phoneController.text.toString(), temporaryToken)
      //           .then((value) async {
      //         if (value.isSuccess) {
      //           Provider.of<AuthProvider>(context, listen: false)
      //               .updateEmail(_phoneController.text.toString());
      //           Navigator.pushAndRemoveUntil(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (_) => VerificationScreen(temporaryToken, '',
      //                       _phoneController.text.toString())),
      //               (route) => false);
      //         }
      //       });
      //     } else if (Provider.of<SplashProvider>(context, listen: false)
      //         .configModel
      //         .phoneVerification) {
      //       Navigator.pushAndRemoveUntil(
      //           context,
      //           MaterialPageRoute(
      //               builder: (_) => MobileVerificationScreen(temporaryToken)),
      //           (route) => false);
      //     }
      //   } else {
      //     await Provider.of<ProfileProvider>(context, listen: false)
      //         .getUserInfo(context);
      //     Navigator.pushAndRemoveUntil(
      //         context,
      //         MaterialPageRoute(builder: (_) => DashBoardScreen()),
      //         (route) => false);
      //   }
    } else if (errorMessage == "User not confirmed in the system.") {
      Provider.of<AuthProvider>(context, listen: false)
          .resendCode(loginBody.phone!);

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (_) =>
                VerificationScreen(loginBody.phone, loginBody.password, "none"),
          ),
          (route) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage), backgroundColor: Colors.red));
    }
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<AuthProvider>(context, listen: false).isRemember;
    final String _countryDialCode = "+977";

    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: Dimensions.MARGIN_SIZE_LARGE),
      child: Form(
        key: _formKeyLogin,
        child: ListView(
          padding:
              EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_SMALL),
          children: [
            // // for Email
            // Container(
            //     margin: EdgeInsets.only(bottom: Dimensions.MARGIN_SIZE_SMALL),
            //     child: CustomTextField(
            //       hintText: getTranslated('ENTER_MOBILE_NUMBER', context),
            //       focusNode: _phoneNode,
            //       nextNode: _passNode,
            //       textInputType: TextInputType.phone,
            //       controller: _phoneController,
            //     )),

            Row(children: [
              CodePickerWidget(
                // onChanged: (CountryCode countryCode) {
                //   _countryDialCode = countryCode.dialCode;
                // },
                flagWidth: 15,
                initialSelection: _countryDialCode,
                // favorite: [_countryDialCode],
                showDropDownButton: false,
                padding: EdgeInsets.zero,

                showFlagMain: true,
                enabled: false,
                textStyle: TextStyle(
                    color: Theme.of(context).textTheme.headline1!.color),
              ),
              Expanded(
                  child: CustomTextField(
                hintText: getTranslated('ENTER_MOBILE_NUMBER', context),
                controller: _phoneController,
                focusNode: _phoneNode,
                nextNode: _passNode,
                isPhoneNumber: true,
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.phone,
              )),
            ]),

            // for Password
            Container(
                margin: EdgeInsets.only(
                    bottom: Dimensions.MARGIN_SIZE_DEFAULT,
                    left: Dimensions.MARGIN_SIZE_SMALL),
                child: CustomPasswordTextField(
                  hintTxt: getTranslated('ENTER_YOUR_PASSWORD', context),
                  textInputAction: TextInputAction.done,
                  focusNode: _passNode,
                  controller: _passwordController,
                )),

            // for remember and forgetpassword
            Container(
              margin: EdgeInsets.only(right: Dimensions.MARGIN_SIZE_SMALL),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Consumer<AuthProvider>(
                        builder: (context, authProvider, child) => Checkbox(
                          checkColor: ColorResources.WHITE,
                          activeColor: Theme.of(context).primaryColor,
                          value: authProvider.isRemember,
                          onChanged: authProvider.updateRemember,
                        ),
                      ),
                      //

                      Text(getTranslated('REMEMBER', context)!,
                          style: titilliumRegular),
                    ],
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ForgetPasswordScreen())),
                    child: Text(getTranslated('FORGET_PASSWORD', context)!,
                        style: titilliumRegular.copyWith(
                            color: ColorResources.getLightSkyBlue(context))),
                  ),
                ],
              ),
            ),

            // for signin button
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 30),
              child: Provider.of<AuthProvider>(context).isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(
                          Theme.of(context).primaryColor,
                        ),
                      ),
                    )
                  : CustomButton(
                      onTap: loginUser,
                      buttonText: getTranslated('SIGN_IN', context)),
            ),
            SizedBox(width: Dimensions.PADDING_SIZE_DEFAULT),

            // SocialLoginWidget(),
            SizedBox(width: Dimensions.PADDING_SIZE_DEFAULT),

            Center(
                child: Text(getTranslated('OR', context)!,
                    style: titilliumRegular.copyWith(
                        fontSize: Dimensions.FONT_SIZE_DEFAULT))),

            //for order as guest
            GestureDetector(
              onTap: () {
                if (!Provider.of<AuthProvider>(context, listen: false)
                    .isLoading) {
                  Provider.of<CartProvider>(context, listen: false)
                      .getCartData();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => DashBoardScreen()),
                      (route) => false);
                }
              },
              child: Container(
                margin: EdgeInsets.only(left: 50, right: 50, top: 30),
                width: double.infinity,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(getTranslated('CONTINUE_AS_GUEST', context)!,
                    style: titleHeader.copyWith(
                        color: ColorResources.getPrimary(context))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
