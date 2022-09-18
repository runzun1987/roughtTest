import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/base/api_response.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/brand_model.dart';
import 'package:flutter_sixvalley_ecommerce/data/repository/brand_repo.dart';
import 'package:flutter_sixvalley_ecommerce/helper/api_checker.dart';

class BrandProvider extends ChangeNotifier {
  final BrandRepo? brandRepo;

  BrandProvider({required this.brandRepo});

  List<BrandModel> _brandList = [];

  List<BrandModel> get brandList => _brandList;

  List<BrandModel> _originalBrandList = [];

  dynamic data = [
    {
      "id": 27,
      "name": "Headphones",
      "slug": "phone Headphones",
      "image":
          "https://ae04.alicdn.com/kf/Hb16ac8d5fe674b76a5beb3ee241eacdaW.jpg_300x300Q70.jpg_.webp",
      "parent_id": 0,
      "position": 0,
      "created_at": "2022-04-11T09:35:06.000000Z",
      "updated_at": "2022-04-13T06:25:57.000000Z",
      "home_status": 1,
      "priority": 2,
      "childes": [],
      "translations": []
    },
    {
      "id": 27,
      "name": "Handbags",
      "slug": "women handbag",
      "image":
          "https://ae04.alicdn.com/kf/H27ddc355ef4c4e0e85565cbbc0db0fa8i.jpg_300x300Q70.jpg_.webp",
      "parent_id": 0,
      "position": 0,
      "created_at": "2022-04-11T09:35:06.000000Z",
      "updated_at": "2022-04-13T06:25:57.000000Z",
      "home_status": 1,
      "priority": 2,
      "childes": [],
      "translations": []
    },
    {
      "id": 27,
      "name": "Boots",
      "slug": "women Ankle Boots",
      "image":
          "https://ae04.alicdn.com/kf/H4422f9fa37664547a0aced148bc66241p.jpg_300x300Q70.jpg_.webp",
      "parent_id": 0,
      "position": 0,
      "created_at": "2022-04-11T09:35:06.000000Z",
      "updated_at": "2022-04-13T06:25:57.000000Z",
      "home_status": 1,
      "priority": 2,
      "childes": [],
      "translations": []
    },
    {
      "id": 23,
      "name": "Watches",
      "slug": "women mechanical watch",
      "image":
          "https://ae04.alicdn.com/kf/H8e384a85b3814ab8b56938862c9a8492A.jpg_300x300Q70.jpg_.webp",
      "parent_id": 19,
      "position": 2,
      "created_at": "2022-04-11T08:25:26.000000Z",
      "updated_at": "2022-04-11T08:25:26.000000Z",
      "home_status": 0,
      "priority": 0,
      "translations": []
    },
    {
      "id": 27,
      "name": "Blazer",
      "slug": "men blazer sets",
      "image":
          "https://ae04.alicdn.com/kf/S43b26e87ac854aab84aca73e9b02a99c2.jpg_300x300Q70.jpg_.webp",
      "parent_id": 0,
      "position": 0,
      "created_at": "2022-04-11T09:35:06.000000Z",
      "updated_at": "2022-04-13T06:25:57.000000Z",
      "home_status": 1,
      "priority": 2,
      "childes": [],
      "translations": []
    },
    {
      "id": 27,
      "name": "Sweatshirts",
      "slug": "men sweatshirt",
      "image":
          "https://ae04.alicdn.com/kf/H76e9117a7e55467a9cb2f67e0f0d4471Z.jpg_300x300Q70.jpg_.webp",
      "parent_id": 0,
      "position": 0,
      "created_at": "2022-04-11T09:35:06.000000Z",
      "updated_at": "2022-04-13T06:25:57.000000Z",
      "home_status": 1,
      "priority": 2,
      "childes": [],
      "translations": []
    },
    {
      "id": 27,
      "name": "Ukuleles",
      "slug": "Ukuleles",
      "image":
          "https://ae04.alicdn.com/kf/Hd6b032bab0914f65a2dbcab6eeb98cdaX.jpg_300x300Q70.jpg_.webp",
      "parent_id": 0,
      "position": 0,
      "created_at": "2022-04-11T09:35:06.000000Z",
      "updated_at": "2022-04-13T06:25:57.000000Z",
      "home_status": 1,
      "priority": 2,
      "childes": [],
      "translations": []
    },
    {
      "id": 27,
      "name": "Coloring Books",
      "slug": "Coloring Books",
      "image":
          "https://ae04.alicdn.com/kf/H70c9ff378bdb44aaa060af8394f0d3ba8.jpg_300x300Q70.jpg_.webp",
      "parent_id": 0,
      "position": 0,
      "created_at": "2022-04-11T09:35:06.000000Z",
      "updated_at": "2022-04-13T06:25:57.000000Z",
      "home_status": 1,
      "priority": 2,
      "childes": [],
      "translations": []
    },
    {
      "id": 27,
      "name": "Pens",
      "slug": "Pens",
      "image":
          "https://ae04.alicdn.com/kf/Hcb578297b4904ffd8151189a79f68506n.jpg_300x300Q70.jpg_.webp",
      "parent_id": 0,
      "position": 0,
      "created_at": "2022-04-11T09:35:06.000000Z",
      "updated_at": "2022-04-13T06:25:57.000000Z",
      "home_status": 1,
      "priority": 2,
      "childes": [],
      "translations": []
    },
    {
      "id": 27,
      "name": "Maps",
      "slug": "Maps",
      "image":
          "https://ae04.alicdn.com/kf/H39d65d20e2a848d69a3329d05af587cam.jpg_300x300Q70.jpg_.webp",
      "parent_id": 0,
      "position": 0,
      "created_at": "2022-04-11T09:35:06.000000Z",
      "updated_at": "2022-04-13T06:25:57.000000Z",
      "home_status": 1,
      "priority": 2,
      "childes": [],
      "translations": []
    },
    {
      "id": 27,
      "name": "Printers",
      "slug": "Printers",
      "image":
          "https://ae04.alicdn.com/kf/Uef90511febdf448ba8cdeaed4127214b8.jpg_300x300Q70.jpg_.webp",
      "parent_id": 0,
      "position": 0,
      "created_at": "2022-04-11T09:35:06.000000Z",
      "updated_at": "2022-04-13T06:25:57.000000Z",
      "home_status": 1,
      "priority": 2,
      "childes": [],
      "translations": []
    },
    {
      "id": 27,
      "name": "Pools",
      "slug": "Swimming Pools",
      "image":
          "https://ae04.alicdn.com/kf/H36efa77420354001a431c89455b4cc362.jpg_300x300Q70.jpg_.webp",
      "parent_id": 0,
      "position": 0,
      "created_at": "2022-04-11T09:35:06.000000Z",
      "updated_at": "2022-04-13T06:25:57.000000Z",
      "home_status": 1,
      "priority": 2,
      "childes": [],
      "translations": []
    },
    {
      "id": 27,
      "name": "Cycling Gloves",
      "slug": "Cycling Gloves",
      "image":
          "https://ae04.alicdn.com/kf/Hbd213413efd74a9da4940fc609d3e96e3.jpg_300x300Q70.jpg_.webp",
      "parent_id": 0,
      "position": 0,
      "created_at": "2022-04-11T09:35:06.000000Z",
      "updated_at": "2022-04-13T06:25:57.000000Z",
      "home_status": 1,
      "priority": 2,
      "childes": [],
      "translations": []
    },
    {
      "id": 27,
      "name": "Darts",
      "slug": "Darts",
      "image":
          "https://ae04.alicdn.com/kf/H34ec9c3717d24ffcadacc2f9d42970b7o.jpg_300x300Q70.jpg_.webp",
      "parent_id": 0,
      "position": 0,
      "created_at": "2022-04-11T09:35:06.000000Z",
      "updated_at": "2022-04-13T06:25:57.000000Z",
      "home_status": 1,
      "priority": 2,
      "childes": [],
      "translations": []
    },
  ];

  Future<void> getBrandList(bool reload, BuildContext context) async {
    if (_brandList.length == 0 || reload) {
      ApiResponse apiResponse = await brandRepo!.getBrandList();
      if (apiResponse.response != null &&
          apiResponse.response!.statusCode == 200) {
        _originalBrandList.clear();
        data.forEach(
            (brand) => _originalBrandList.add(BrandModel.fromJson(brand)));
        _brandList.clear();
        data.forEach((brand) => _brandList.add(BrandModel.fromJson(brand)));
      } else {
        ApiChecker.checkApi(context, apiResponse);
      }
      notifyListeners();
    }
  }

  bool isTopBrand = true;
  bool isAZ = false;
  bool isZA = false;

  void sortBrandLis(int value) {
    if (value == 0) {
      _brandList.clear();
      _brandList.addAll(_originalBrandList);
      isTopBrand = true;
      isAZ = false;
      isZA = false;
    } else if (value == 1) {
      _brandList.clear();
      _brandList.addAll(_originalBrandList);
      _brandList.sort(
          (a, b) => a.name!.toLowerCase().compareTo(b.name!.toLowerCase()));
      isTopBrand = false;
      isAZ = true;
      isZA = false;
    } else if (value == 2) {
      _brandList.clear();
      _brandList.addAll(_originalBrandList);
      _brandList.sort(
          (a, b) => a.name!.toLowerCase().compareTo(b.name!.toLowerCase()));
      Iterable iterable = _brandList.reversed;
      _brandList = iterable.toList() as List<BrandModel>;
      isTopBrand = false;
      isAZ = false;
      isZA = true;
    }

    notifyListeners();
  }
}
