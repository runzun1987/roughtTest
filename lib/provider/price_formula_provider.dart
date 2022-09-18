import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_js/flutter_js.dart';
import 'package:flutter_js/javascript_runtime.dart';
import 'package:flutter_sixvalley_ecommerce/data/repository/api/get_price_formula.dart';

import '../data/model/response/base/api_response.dart';
import '../helper/api_checker.dart';
import '../models/Price.dart';
import 'package:dart_eval/dart_eval.dart';

class PriceFormulaProvider with ChangeNotifier {
  final GetPriceForumulaRepo? priceFormulaRepo;
  PriceFormulaProvider({required this.priceFormulaRepo});

  // String _formula;

  final JavascriptRuntime _jsRuntime = getJavascriptRuntime();

  void initPriceFormula(BuildContext context) async {
    ApiResponse apiResponse = await priceFormulaRepo!.getFormula();
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      var code = json.decode(apiResponse.response!.data.code);
      var ali_code = code['ali'];
      var tb_code = code['tb'];

      String? ali_args = ali_code['arguments'];
      String? ali_body = ali_code['body'];

      String? tb_args = tb_code['arguments'];
      String? tb_body = tb_code['body'];

      String _ali_function_js =
          'const ali_function = new Function("${ali_args}",`${ali_body}`);';
      String _tb_function_js =
          'const tb_function = new Function("${tb_args}",`${tb_body}`)';

      _jsRuntime.evaluate(_ali_function_js + _tb_function_js);

      // var ali_function = new Function(ali_code.arguments, ali_code.body);
    } else {
      ApiChecker.checkApi(context, apiResponse);
    }
    notifyListeners();
  }

  String test() {
    return "TEXT";
  }

  String getAliExpressPrice(price, title) {
    return _jsRuntime
        .evaluate("""ali_function($price,"$title");""").stringResult;
  }

  String getTaobaoPrice(price, title) {
    return _jsRuntime.evaluate("""tb_function($price,"$title")""").stringResult;
  }
}
