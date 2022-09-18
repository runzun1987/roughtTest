import 'package:esewa_flutter_sdk/esewa_config.dart';
import 'package:esewa_flutter_sdk/esewa_flutter_sdk.dart';
import 'package:esewa_flutter_sdk/esewa_payment.dart';
import 'package:esewa_flutter_sdk/esewa_payment_success_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/utill/cart_utils.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

import '../data/model/response/base/payment.dart';
import '../models/Cart.dart';
import '../provider/cart_provider.dart';
import '../provider/payment_provider.dart';
import 'custom_themes.dart';
import 'dimensions.dart';
import 'images.dart';

class PaymentSetting {
  static void _eSewa({
    required String productId,
    required String productName,
    required String productPrice,
    String callbackUrl = "www.test-url.com",
  }) {
    String CLIENT_ID = "JB0BBQ4aD0UqIThFJwAKBgAXEUkEGQUBBAwdOgABHD4DChwUAB0R";
    String SECRET_KEY = "BhwIWQQADhIYSxILExMcAgFXFhcOBwAKBgAXEQ==";
    try {
      EsewaFlutterSdk.initPayment(
        esewaConfig: EsewaConfig(
          environment: Environment.test,
          clientId: CLIENT_ID,
          secretId: SECRET_KEY,
        ),
        esewaPayment: EsewaPayment(
          productId: productId,
          productName: productName,
          productPrice: productPrice,
          callbackUrl: callbackUrl,
        ),
        onPaymentSuccess: (EsewaPaymentSuccessResult data) {
          debugPrint(":::SUCCESS::: => $data");
        },
        onPaymentFailure: (data) {
          debugPrint(":::FAILURE::: => $data");
        },
        onPaymentCancellation: (data) {
          debugPrint(":::CANCELLATION::: => $data");
        },
      );
    } on Exception catch (e) {
      print('ERRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR');
      debugPrint("EXCEPTION : ${e.toString()}");
    }
  }

  static PaymentConfig _config({
    required int amount,
    required String productIdentity,
    required String productName,
    String? productUrl,
  }) {
    return PaymentConfig(
      amount: amount * 100, // Amount should be in paisa
      productIdentity: productIdentity,
      productName: productName,
      productUrl: productUrl,
      // additionalData: {
      //   // Not mandatory; can be used for reporting purpose
      //   'vendor': 'Khalti Bazaar',
      // },
      // mobile:
      //     '9800000001', // Not mandatory; can be used to fill mobile number field
      // mobileReadOnly:
      //     true, // Not mandatory; makes the mobile field not editable
    );
  }

  static void _khaltiWallet({
    required BuildContext context,
    required int amount,
    required String productIdentity,
    required String productName,
    String? productUrl,
  }) {
    KhaltiScope.of(context).pay(
      config: _config(
        amount: amount,
        productIdentity: productIdentity,
        productName: productName,
        productUrl: productUrl,
      ),
      preferences: [
        PaymentPreference.khalti,
      ],
      onSuccess: (PaymentSuccessModel paymentSuccessModel) {},
      onFailure: (PaymentFailureModel paymentFailureModel) {},
      onCancel: null,
    );
  }

  static void _khaltiMobileBanking({
    required BuildContext context,
    required int amount,
    required String productIdentity,
    required String productName,
    String? productUrl,
  }) {
    KhaltiScope.of(context).pay(
      config: _config(
        amount: amount,
        productIdentity: productIdentity,
        productName: productName,
        productUrl: productUrl,
      ),
      preferences: [
        PaymentPreference.eBanking,
      ],
      onSuccess: (PaymentSuccessModel paymentSuccessModel) {},
      onFailure: (PaymentFailureModel paymentFailureModel) {},
      onCancel: null,
    );
  }

  static void _khaltiEBanking({
    required BuildContext context,
    required int amount,
    required String productIdentity,
    required String productName,
    String? productUrl,
  }) {
    KhaltiScope.of(context).pay(
      config: _config(
        amount: amount,
        productIdentity: productIdentity,
        productName: productName,
        productUrl: productUrl,
      ),
      preferences: [
        PaymentPreference.eBanking,
      ],
      onSuccess: (PaymentSuccessModel paymentSuccessModel) {},
      onFailure: (PaymentFailureModel paymentFailureModel) {},
      onCancel: null,
    );
  }

  static void _khaltiConnectIps({
    required BuildContext context,
    required int amount,
    required String productIdentity,
    required String productName,
    String? productUrl,
  }) {
    KhaltiScope.of(context).pay(
      config: _config(
        amount: amount,
        productIdentity: productIdentity,
        productName: productName,
        productUrl: productUrl,
      ),
      preferences: [
        PaymentPreference.connectIPS,
      ],
      onSuccess: (PaymentSuccessModel paymentSuccessModel) {},
      onFailure: (PaymentFailureModel paymentFailureModel) {},
      onCancel: null,
    );
  }

  static void _khaltiSCT({
    required BuildContext context,
    required int amount,
    required String productIdentity,
    required String productName,
    String? productUrl,
  }) {
    KhaltiScope.of(context).pay(
      config: _config(
        amount: amount,
        productIdentity: productIdentity,
        productName: productName,
        productUrl: productUrl,
      ),
      preferences: [
        PaymentPreference.sct,
      ],
      onSuccess: (PaymentSuccessModel paymentSuccessModel) {},
      onFailure: (PaymentFailureModel paymentFailureModel) {},
      onCancel: null,
    );
  }

  static List<dynamic> paymentSelection({
    Cart? cart,
    required PaymentProvider paymentProvider,
    BuildContext? context,
    // CartProvider cartProvider,
  }) {
    if (paymentProvider.character == PaymentList.ESEWA) {
      return [
        Padding(
          padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_EXTRA_SMALL),
          child: Image.asset(
            Images.esewa_logo,
            scale: 10,
          ),
        ),
        "E-SEWA",
        InkWell(
          onTap: () => _eSewa(
            productId: cart!.id!,
            productName: cart.items![0].title!,
            productPrice: CartUtils.getGrandTotal(cart).toString(),
          ),
          child: Container(
            width: MediaQuery.of(context!).size.width * .97,
            height: 50,
            color: Color(0xff5CB246),
            child: Center(
              child: Text("Pay via E-SEWA",
                  style: titilliumSemiBold.copyWith(
                    fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                    color: Theme.of(context).cardColor,
                  )),
            ),
          ),
        )
      ];
    } else if (paymentProvider.character == PaymentList.KHALTI) {
      return [
        Padding(
          padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_EXTRA_SMALL),
          child: Image.asset(
            Images.khalte_logo,
            scale: 10,
          ),
        ),
        "KHALTI ",
        InkWell(
          onTap: () => _khaltiWallet(
            context: context!,
            productIdentity: cart!.id!,
            productName: cart.items![0].title!,
            productUrl: cart.items![0].productId,
            amount: CartUtils.getGrandTotal(cart).ceil(),
          ),
          child: Container(
            width: MediaQuery.of(context!).size.width * .97,
            height: 50,
            color: Color(0xff5D2E8E),
            child: Center(
              child: Text("Pay via KHALTI",
                  style: titilliumSemiBold.copyWith(
                    fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                    color: Theme.of(context).cardColor,
                  )),
            ),
          ),
        )
      ];
    } else if (paymentProvider.character == PaymentList.EBANKING) {
      return [
        Icon(Icons.account_balance),
        "E-BANKING",
        InkWell(
          onTap: () => _khaltiEBanking(
            context: context!,
            productIdentity: cart!.id!,
            productName: cart.items![0].title!,
            productUrl: cart.items![0].productId,
            amount: CartUtils.getGrandTotal(cart).ceil(),
          ),
          child: Container(
            width: MediaQuery.of(context!).size.width * .97,
            height: 50,
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Text("Pay via E-BANKING",
                  style: titilliumSemiBold.copyWith(
                    fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                    color: Theme.of(context).cardColor,
                  )),
            ),
          ),
        )
      ];
    } else if (paymentProvider.character == PaymentList.MOBILEBANKING) {
      return [
        Icon(Icons.mobile_friendly_outlined),
        "MOBILE-BANKING",
        InkWell(
          onTap: () => _khaltiMobileBanking(
            context: context!,
            productIdentity: cart!.id!,
            productName: cart.items![0].title!,
            productUrl: cart.items![0].productId,
            amount: CartUtils.getGrandTotal(cart).ceil(),
          ),
          child: Container(
            width: MediaQuery.of(context!).size.width * .97,
            height: 50,
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Text("Pay via MOBILE-BANKING",
                  style: titilliumSemiBold.copyWith(
                    fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                    color: Theme.of(context).cardColor,
                  )),
            ),
          ),
        )
      ];
    } else if (paymentProvider.character == PaymentList.CONNECTIPS) {
      return [
        Padding(
          padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_EXTRA_SMALL),
          child: Image.asset(
            Images.ips,
            scale: 10,
          ),
        ),
        "CONNECT-IPS",
        InkWell(
          onTap: () => _khaltiConnectIps(
            context: context!,
            productIdentity: cart!.id!,
            productName: cart.items![0].title!,
            productUrl: cart.items![0].productId,
            amount: CartUtils.getGrandTotal(cart).ceil(),
          ),
          child: Container(
            width: MediaQuery.of(context!).size.width * .97,
            height: 50,
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Text("Pay via CONNECT-IPS",
                  style: titilliumSemiBold.copyWith(
                    fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                    color: Theme.of(context).cardColor,
                  )),
            ),
          ),
        )
      ];
    } else if (paymentProvider.character == PaymentList.SCT) {
      return [
        Padding(
          padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_EXTRA_SMALL),
          child: Image.asset(
            Images.sct,
            scale: 10,
          ),
        ),
        "SCT",
        InkWell(
          onTap: () => _khaltiSCT(
            context: context!,
            productIdentity: cart!.id!,
            productName: cart.items![0].title!,
            productUrl: cart.items![0].productId,
            amount: CartUtils.getGrandTotal(cart).ceil(),
          ),
          child: Container(
            width: MediaQuery.of(context!).size.width * .97,
            height: 50,
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Text("Pay via SCT",
                  style: titilliumSemiBold.copyWith(
                    fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                    color: Theme.of(context).cardColor,
                  )),
            ),
          ),
        )
      ];
    } else {
      return [];
    }
  }
}
