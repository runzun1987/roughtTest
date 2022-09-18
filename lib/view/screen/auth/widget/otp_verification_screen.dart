import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/provider/auth_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/splash_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/button/custom_button.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/show_custom_snakbar.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/auth/auth_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/auth/widget/reset_password_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';

class VerificationScreen extends StatefulWidget {
  final String? mobileNumber;
  final String? password;
  final String from;
  final Function? outRoute;

  VerificationScreen(
    this.mobileNumber,
    this.password,
    this.from, {
    this.outRoute,
  });

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    listenOtp();
  }

  void listenOtp() async {
    await SmsAutoFill().listenForCode;
    print("OTP listen called");
  }

  final String tempToken = "token";

  final String email = 'email';

  String? codeValue = '';

  void verifyOptAndLogin(AuthProvider authProvider) {
    // Provider.of<AuthProvider>(context, listen: false)
    //     .verifyOtp(widget.mobileNumber)
    //     .then((value) {
    //   if (value.isSuccess) {
    //     c
    //   } else {
    //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //       content: Text(getTranslated('input_valid_otp', context)),
    //       backgroundColor: Colors.red,
    //     ));
    //   }
    // });
//  if(value.isSuccess) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(content: Text(getTranslated('password_reset_successfully', context)),backgroundColor: Colors.green,)
    //   );
    //   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => AuthScreen()), (route) => false);
    // }else {
    //   showCustomSnackBar(value.message, context);
    // }

    widget.from == 'forgetPassword'
        ? Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (_) => ResetPasswordWidget(
                mobileNumber: widget.mobileNumber,
                otp: authProvider.verificationCode,
              ),
            ),
            (route) => false)
        : Provider.of<AuthProvider>(context, listen: false)
            .verifyOtp(widget.mobileNumber!)
            .then((value) {
            if (value.isSuccess) {
              authProvider.updateSelectedIndex(0);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Phone number successfully verified"),
                backgroundColor: Colors.green,
              ));
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (_) => AuthScreen(
                            initialPage: 1,
                            outRoute: widget.outRoute,
                          )),
                  (route) => false);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(getTranslated('input_valid_otp', context)!),
                backgroundColor: Colors.red,
              ));
            }
          });
  }

  @override
  Widget build(BuildContext context) {
    print('=======Mobile Number=====>${widget.mobileNumber}');
    return Scaffold(
      body: SafeArea(
        child: Scrollbar(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Center(
              child: SizedBox(
                width: 1170,
                child: Consumer<AuthProvider>(
                  builder: (context, authProvider, child) => Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 55),
                      Image.asset(
                        Images.login,
                        width: 100,
                        height: 100,
                      ),
                      SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Center(
                            child: Text(
                          email == null
                              ? '${getTranslated('please_enter_4_digit_code', context)}\n${widget.mobileNumber}'
                              : '${getTranslated('please_enter_4_digit_code', context)}\n$email',
                          textAlign: TextAlign.center,
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 39, vertical: 35),
                        child: PinFieldAutoFill(
                          currentCode: codeValue,
                          codeLength: 6,
                          onCodeChanged: (code) {
                            authProvider.updateVerificationCode(code!);
                            codeValue = code;
                            verifyOptAndLogin(authProvider);
                          },
                          // appContext: context,
                          // obscureText: false,
                          // showCursor: true,
                          // keyboardType: TextInputType.number,
                          // animationType: AnimationType.fade,
                          // pinTheme: PinTheme(
                          //   shape: PinCodeFieldShape.box,
                          //   fieldHeight: 63,
                          //   fieldWidth: 55,
                          //   borderWidth: 1,
                          //   borderRadius: BorderRadius.circular(10),
                          //   selectedColor: ColorResources.colorMap[200],
                          //   selectedFillColor: Colors.white,
                          //   inactiveFillColor:
                          //       ColorResources.getSearchBg(context),
                          //   inactiveColor: ColorResources.colorMap[200],
                          //   activeColor: ColorResources.colorMap[400],
                          //   activeFillColor:
                          //       ColorResources.getSearchBg(context),
                          // ),
                          // animationDuration: Duration(milliseconds: 300),
                          // backgroundColor: Colors.transparent,
                          // enableActiveFill: true,
                          // onChanged: authProvider.updateVerificationCode,
                          // beforeTextPaste: (text) {
                          //   return true;
                          // },
                        ),
                      ),
                      Center(
                          child: Text(
                        getTranslated('i_didnt_receive_the_code', context)!,
                      )),
                      Center(
                        child: InkWell(
                          onTap: () {
                            Provider.of<AuthProvider>(context, listen: false)
                                .resendCode(widget.mobileNumber!)
                                .then((value) {
                              if (value.isSuccess) {
                                showCustomSnackBar(
                                    'Resent code successful', context,
                                    isError: false);
                              } else {
                                showCustomSnackBar(value.message, context);
                              }
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.all(
                                Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            child: Text(
                              getTranslated('resend_code', context)!,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 48),
                      !authProvider.isEnableVerificationCode
                          ? !authProvider.isPhoneNumberVerificationButtonLoading
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal:
                                          Dimensions.PADDING_SIZE_LARGE),
                                  child: CustomButton(
                                    buttonText:
                                        getTranslated('verify', context),
                                    onTap: () {
                                      bool phoneVerification =
                                          Provider.of<SplashProvider>(context,
                                                      listen: false)
                                                  .configModel!
                                                  .forgetPasswordVerification ==
                                              'phone';
                                      if (!phoneVerification) {
                                        verifyOptAndLogin(authProvider);
                                      } else {
                                        Provider.of<AuthProvider>(context,
                                                listen: false)
                                            .verifyPhone(
                                                widget.mobileNumber!, tempToken)
                                            .then((value) {
                                          if (value.isSuccess) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              content: Text(getTranslated(
                                                  'sign_up_successfully_now_login',
                                                  context)!),
                                              backgroundColor: Colors.green,
                                            ));
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) => AuthScreen(
                                                        initialPage: 1)),
                                                (route) => false);
                                          } else {
                                            print(value.message);
                                            showCustomSnackBar(
                                                value.message, context);
                                          }
                                        });
                                      }
                                    },
                                  ),
                                )
                              : Center(
                                  child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Theme.of(context).primaryColor)))
                          : SizedBox.shrink()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
