import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_sixvalley_ecommerce/data/model/response/base/api_response.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/category.dart';
import 'package:flutter_sixvalley_ecommerce/data/repository/category_repo.dart';
import 'package:flutter_sixvalley_ecommerce/helper/api_checker.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'dart:io';

class CategoryProvider extends ChangeNotifier {
  final CategoryRepo? categoryRepo;

  CategoryProvider({required this.categoryRepo});

  List<Category> _categoryList = [];
  int? _categorySelectedIndex;

  List<Category> get categoryList => _categoryList;
  int? get categorySelectedIndex => _categorySelectedIndex;

  // _write(String text) async {
  //   print('111111111111111111111111111111111');
  //   try {
  //     final Directory directory = await path.getApplicationDocumentsDirectory();
  //     print('2222222222222222222222222222222222222');
  //     print(directory);
  //     final File file = File('${directory.path}/my_file.json');
  //     await file.writeAsString(text);
  //   } catch (e) {
  //     print('eeeeeeeeeeeeeeeeeee');
  //     print(e);
  //     print('fffffffffffffffffff');
  //   }
  // }

  Future<void> getCategoryList(bool reload, BuildContext context) async {
    if (_categoryList.length == 0 || reload) {
      ApiResponse apiResponse = await categoryRepo!.getCategoryList();
      if (apiResponse.response != null &&
          apiResponse.response!.statusCode == 200) {
        _categoryList.clear();

        apiResponse.response!.data.forEach(
            (category) => _categoryList.add(Category.fromJson(category)));
        _categorySelectedIndex = 0;
      } else {
        ApiChecker.checkApi(context, apiResponse);
      }
      notifyListeners();
    }
  }

  void changeSelectedIndex(int selectedIndex) {
    _categorySelectedIndex = selectedIndex;
    notifyListeners();
  }

  String? findKeyWordFromId(id) {
    print(id);
    if (id == 10101) {
      return "Women Jacket";
    } else {
      return "sex";
    }
  }
}
