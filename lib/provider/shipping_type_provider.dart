import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/base/shipping_type.dart';

class ShippingTypeProvider with ChangeNotifier {
  String? _character = ShippingType.express;

  String? get character => _character;

  void changePayment(String? payment) {
    _character = payment;
    notifyListeners();
  }
}
