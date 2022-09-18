import 'package:flutter/material.dart';

import '../data/model/response/base/payment.dart';

class PaymentProvider with ChangeNotifier {
  PaymentList? _character = PaymentList.KHALTI;

  PaymentList? get character => _character;

  void changePayment(PaymentList? payment) {
    _character = payment;
    notifyListeners();
  }
}
