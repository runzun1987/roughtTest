import 'dart:convert';
import 'dart:io';

import 'package:flutter_sixvalley_ecommerce/models/Details.dart';
import 'package:flutter_sixvalley_ecommerce/provider/price_formula_provider.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/product/product_details_screen.dart';
import 'package:provider/provider.dart';

import 'base/api_provider.dart';
import 'base/city_tier.dart';
import 'base/shipping_type.dart';

class ProductModel {
  int? _totalSize;
  int? _limit;
  int? _offset;
  List<Product>? _products;
  Product? _product;

  ProductModel({
    int? totalSize,
    int? limit,
    int? offset,
    List<Product>? products,
    Product? product,
  }) {
    this._totalSize = totalSize;
    this._limit = limit;
    this._offset = offset;
    this._products = products;
    this._product = product;
  }

  int? get totalSize => _totalSize;
  int? get limit => _limit;
  int? get offset => _offset;
  List<Product>? get products => _products;
  Product? get product => _product;

  ProductModel.fromJson(Map<String, dynamic> json) {
    _totalSize = json['total_size'];
    _limit = json['limit'];
    _offset = json['offset'];
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products!.add(new Product.fromJson(v));
      });
    }
  }

  ProductModel.fromZapexProductDetailJson(Map<String, dynamic> json, context) {
    _product = Product.fromZapexProductDetailJson(json['data'], context);
  }

  ProductModel.fromZapexKeywordSearchJson(Map<String, dynamic> json, context) {
    _totalSize = json['data']['totalCount'];
    _limit = json['data']['resultPerPage'];

    if (json['data']['items'] != null) {
      _products = [];
      json['data']['items'].forEach((v) {
        _products!.add(
          Product.fromZapexKeywordSearchJson(v, context),
        );
      });
    }
  }

  ProductModel.fromZapexImageSearchJson(Map<String, dynamic> json, context) {
    _totalSize = json['data']['totalCount'];
    _limit = json['data']['resultPerPage'];

    if (json['data']['items'] != null) {
      _products = [];
      json['data']['items'].forEach((v) {
        _products!.add(
          Product.fromZapexImageSearchJson(v, context),
        );
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_size'] = this._totalSize;
    data['limit'] = this._limit;
    data['offset'] = this._offset;
    if (this._products != null) {
      data['products'] = this._products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  int? _id;
  String? _addedBy;
  int? _userId;
  String? _name;
  String? _slug;
  List<CategoryIds>? _categoryIds;
  String? _unit;
  List<String>? _images;
  String? _thumbnail;
  List<ProductColors>? _colors;
  List<String>? _attributes;
  List<ChoiceOptions>? _choiceOptions;
  List<Variation>? _variation;
  double? _unitPrice;
  double? _purchasePrice;
  double? _tax;
  int? _minQty;
  String? _taxType;
  double? _discount;
  String? _discountType;
  int? _currentStock;
  String? _details;
  String? _createdAt;
  String? _updatedAt;
  List<Rating>? _rating;
  double? _shippingCost = 0.0;
  int? _isMultiPly;
  int? _reviewCount;
  int? _totalOrders;
  dynamic _averageRating;

  int _qty = 1;

  Map<String?, Map>? _prop_obj;
  List? _skus_json;
  String? _provider;

  Product({
    int? id,
    String? addedBy,
    int? userId,
    String? name,
    String? slug,
    List<CategoryIds>? categoryIds,
    String? unit,
    int? minQty,
    List<String>? images,
    String? thumbnail,
    List<ProductColors>? colors,
    String? variantProduct,
    List<String>? attributes,
    List<ChoiceOptions>? choiceOptions,
    List<Variation>? variation,
    double? unitPrice,
    double? purchasePrice,
    double? tax,
    String? taxType,
    double? discount,
    String? discountType,
    int? currentStock,
    String? details,
    String? attachment,
    String? createdAt,
    String? updatedAt,
    int? featuredStatus,
    List<Rating>? rating,
    double? shippingCost,
    int? isMultiPly,
    int? reviewCount,
    int? totalOrders,
    double? averageRating,
    Map? prop_obj,
    List? skus_json,
    String? provider,
  }) {
    this._id = id;
    this._addedBy = addedBy;
    this._userId = userId;
    this._name = name;
    this._slug = slug;
    this._categoryIds = categoryIds;
    this._unit = unit;
    this._minQty = minQty;
    this._images = images;
    this._thumbnail = thumbnail;
    this._colors = colors;
    this._attributes = attributes;
    this._choiceOptions = choiceOptions;
    this._variation = variation;
    this._unitPrice = unitPrice;
    this._purchasePrice = purchasePrice;
    this._tax = tax;
    this._taxType = taxType;
    this._discount = discount;
    this._discountType = discountType;
    this._currentStock = currentStock;
    this._details = details;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
    this._rating = rating;
    this._shippingCost = shippingCost;
    this._isMultiPly = isMultiPly;
    this._reviewCount = reviewCount;
    this._totalOrders = totalOrders;
    this._averageRating = averageRating;
    this._prop_obj = prop_obj as Map<String?, Map<dynamic, dynamic>>?;
    this._skus_json = skus_json;
    this._provider = provider;
  }

  int? get id => _id;
  String? get addedBy => _addedBy;
  int? get userId => _userId;
  String? get name => _name;
  String? get slug => _slug;
  List<CategoryIds>? get categoryIds => _categoryIds;
  String? get unit => _unit;
  int? get minQty => _minQty;
  List<String>? get images => _images;
  String? get thumbnail => _thumbnail;
  List<ProductColors>? get colors => _colors;
  List<String>? get attributes => _attributes;
  List<ChoiceOptions>? get choiceOptions => _choiceOptions;
  List<Variation>? get variation => _variation;
  double? get unitPrice => _unitPrice;
  double? get purchasePrice => _purchasePrice;
  double? get tax => _tax;
  String? get taxType => _taxType;
  double? get discount => _discount;
  String? get discountType => _discountType;
  int? get currentStock => _currentStock;
  String? get details => _details;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  List<Rating>? get rating => _rating;
  double? get shippingCost => _shippingCost;
  int? get isMultiPly => _isMultiPly;
  int? get reviewCount => _reviewCount;
  int? get totalOrders => _totalOrders;
  double? get averageRating => _averageRating;
  Map<String?, Map>? get prop_obj => _prop_obj;
  List? get skus_json => _skus_json;
  String? get provider => _provider;

  int get qty => _qty;

  Product.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _addedBy = json['added_by'];
    _userId = json['user_id'];
    _name = json['name'];
    _slug = json['slug'];
    if (json['category_ids'] != null) {
      _categoryIds = [];
      try {
        json['category_ids'].forEach((v) {
          _categoryIds!.add(new CategoryIds.fromJson(v));
        });
      } catch (e) {
        jsonDecode(json['category_ids']).forEach((v) {
          _categoryIds!.add(new CategoryIds.fromJson(v));
        });
      }
    }
    _unit = json['unit'];
    _minQty = json['min_qty'];
    if (json['images'] != null) {
      try {
        _images = json['images'] != null ? json['images'].cast<String>() : [];
      } catch (e) {
        _images = json['images'] != null
            ? jsonDecode(json['images']).cast<String>()
            : [];
      }
    }
    //_images = json['images'] != null ? json['images'].cast<String>() : [];
    _thumbnail = json['thumbnail'];
    if (json['colors'] != null) {
      _colors = [];
      try {
        json['colors'].forEach((v) {
          _colors!.add(new ProductColors.fromJson(v));
        });
      } catch (e) {
        jsonDecode(json['colors']).forEach((v) {
          _colors!.add(new ProductColors.fromJson(v));
        });
      }
    }
    if (json['attributes'] != null) {
      try {
        _attributes = json['attributes'].cast<String>();
      } catch (e) {
        _attributes = jsonDecode(json['attributes']).cast<String>();
      }
    }
    if (json['choice_options'] != null) {
      _choiceOptions = [];
      try {
        json['choice_options'].forEach((v) {
          _choiceOptions!.add(new ChoiceOptions.fromJson(v));
        });
      } catch (e) {
        jsonDecode(json['choice_options']).forEach((v) {
          _choiceOptions!.add(new ChoiceOptions.fromJson(v));
        });
      }
    }
    if (json['variation'] != null) {
      _variation = [];
      try {
        json['variation'].forEach((v) {
          _variation!.add(new Variation.fromJson(v));
        });
      } catch (e) {
        jsonDecode(json['variation']).forEach((v) {
          _variation!.add(new Variation.fromJson(v));
        });
      }
    }
    if (json['unit_price'] != null) {
      _unitPrice = json['unit_price'].toDouble();
    }
    if (json['purchase_price'] != null) {
      _purchasePrice = json['purchase_price'].toDouble();
    }

    if (json['tax'] != null) {
      _tax = json['tax'].toDouble();
    }
    _taxType = json['tax_type'];
    if (json['discount'] != null) {
      _discount = json['discount'].toDouble();
    }
    _discountType = json['discount_type'];
    _currentStock = json['current_stock'];
    _details = json['details'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if (json['rating'] != null) {
      _rating = [];
      json['rating'].forEach((v) {
        _rating!.add(new Rating.fromJson(v));
      });
    } else {}
  
    if (json['shipping_cost'] != null) {
      _shippingCost = double.parse(json['shipping_cost'].toString());
    }
    if (json['multiply_qty'] != null) {
      _isMultiPly = int.parse(json['multiply_qty'].toString());
    }
    if (json['reviews_count'] != null) {
      _reviewCount = int.parse(json['reviews_count'].toString());
    }
  }

  Product.fromZapexKeywordSearchJson(Map<String, dynamic> json, context) {
    _id = int.parse(json['productId']);
    _name = json['title'];
    _totalOrders = int.parse(
        json['totalOrders'] != null ? json['totalOrders'].toString() : "0");
    _averageRating = json['averageRating'] != null
        ? double.parse(json['averageRating'].toString())
        : 0.0;
    _thumbnail = json['imageUrl'];

    if (json['productMinPrice'] != null) {
      dynamic totalPrice = (json['shippingMinPrice']['value'] != null
              ? json['shippingMinPrice']['value']
              : 0) +
          (json['productMinPrice']['value'] != null
              ? json['productMinPrice']['value']
              : 0);

      _unitPrice = double.parse(
        Provider.of<PriceFormulaProvider>(context, listen: false)
            .getAliExpressPrice(
          totalPrice,
          _name!.replaceAll('"', '').replaceAll("'", '').replaceAll('`', ''),
        ),
      );
    }

    if (json['shippingMinPrice'] != null) {
      _shippingCost = double.parse(json['shippingMinPrice']['value'] != null
          ? json['shippingMinPrice']['value'].toString()
          : "0");
    }
  }

  Product.fromZapexImageSearchJson(Map<String, dynamic> json, context) {
    _id = int.parse(json['productId']);
    _name = json['title'];
    _totalOrders = int.parse(
        json['totalOrders'] != null ? json['totalOrders'].toString() : "0");
    _averageRating = json['averageRating'] != null
        ? double.parse(json['averageRating'].toString())
        : 0.0;
    _thumbnail = json['imageUrl'];

    if (json['productMinPrice'] != null) {
      dynamic totalPrice = json['productMinPrice']['value'];

      _unitPrice = double.parse(
        Provider.of<PriceFormulaProvider>(context, listen: false)
            .getAliExpressPrice(
          totalPrice,
          _name!.replaceAll('"', '').replaceAll("'", '').replaceAll('`', ''),
        ),
      );
    }

    if (json['shippingMinPrice'] != null) {
      _shippingCost = double.parse(json['shippingMinPrice']['value'] != null
          ? json['shippingMinPrice']['value'].toString()
          : "0");
    }
  }

  Product.fromZapexProductDetailJson(Map<String, dynamic> json, context) {
    //BIG IMAGES
    _thumbnail = json['productImages'][0];

    // SMALL IMAGES
    if (json['productImages'] != null) {
      try {
        _images = json['productImages'] != null
            ? json['productImages'].cast<String>()
            : [];
      } catch (e) {
        _images = json['images'] != null
            ? jsonDecode(json['images']).cast<String>()
            : [];
      }
    }

    //TITLE
    _name = json['title'];

    //STOCK
    _currentStock = json['totalStock'] != null
        ? int.parse(json['totalStock'].toString())
        : int.parse(json['variations'][0]["stock"].toString());

    //total sold world wide
    _totalOrders = json['totalOrders'] != null ? json['totalOrders'] : 0;

    //review
    // double avgReview = 0.0;
    // int totalReviewCount = 0;
    if (json["hasReviewsRatings"]) {
      _averageRating = json["reviewsRatings"]["averageRating"];
      _reviewCount = json["reviewsRatings"]["totalCount"];
    }

    //PRICE

    Map temp_price = json["price"] ?? json["priceSummary"];

    double rawPrice;
    if (temp_price["web"]["discountedPrice"]["min"] != null) {
      rawPrice = temp_price["web"]["discountedPrice"]["min"]["value"] != null
          ? double.parse(
              temp_price["web"]["discountedPrice"]["min"]["value"].toString())
          : double.parse(
              temp_price["web"]["originalPrice"]["min"]["value"].toString());
    } else {
      rawPrice = temp_price["web"]["discountedPrice"]["value"] != null
          ? double.parse(
              temp_price["web"]["discountedPrice"]["value"].toString())
          : double.parse(
              temp_price["web"]["originalPrice"]["value"].toString());
    }

    _unitPrice = double.parse(
      Provider.of<PriceFormulaProvider>(context, listen: false)
          .getAliExpressPrice(
        rawPrice,
        _name!.replaceAll('"', '').replaceAll("'", '').replaceAll('`', ''),
      ),
    );
    // double shippingCost = 0.0;

    // if (json['shippingMinPrice'] != null) {
    //   shippingCost = double.parse(json['shippingMinPrice']['value'] != null
    //       ? json['shippingMinPrice']['value'].toString()
    //       : "0");
    //   _shippingCost = double.parse(
    //     Provider.of<PriceFormulaProvider>(context, listen: false)
    //         .getAliExpressPrice(
    //       shippingCost,
    //       _name,
    //     ),
    //   );
    // }

    double sellerShippingPrice = double.parse(
        json["shipping"]["carriers"][0]["price"]["value"].toString());

    if (sellerShippingPrice == null) {
      sellerShippingPrice = 0;
    }

    double _shippingCost = double.parse(
        Provider.of<PriceFormulaProvider>(context, listen: false)
            .getAliExpressPrice(
      sellerShippingPrice,
      _name!.replaceAll('"', '').replaceAll("'", '').replaceAll('`', ''),
    ));

    // _unitPrice = double.parse(rawPrice.toString());
    _discount = 0.00;
    _discountType = 'percentage';

    //RATING

    if (json['hasReviewsRatings']) {
      _averageRating =
          double.parse(json['reviewsRatings']['averageRating'].toString());

      _reviewCount = json['reviewsRatings']['totalCount'];
    }

    _details = json['htmlDescription'];

    _provider = 'zx';

    _id = int.parse(json['productId'].toString());

    List? skus = json['variations'];
    List skusProperties = json['properties'];

    List skus_arr = [];
    dynamic propertyId;

    if (skusProperties.length > 0) {
      for (int j = 0; j < skus!.length; j++) {
        List<dynamic>? splitPropertyId;

        if (!skus[j]['sku'].contains(';')) {
          propertyId = [skus[j]['sku']];

          splitPropertyId = propertyId;
        } else {
          propertyId = skus[j]['sku'];
          splitPropertyId = propertyId.split(';');
        }

        List<String> newPropertyId = [];

        for (int spl = 0; spl < splitPropertyId!.length; spl++) {
          List<String> individualSplitted = splitPropertyId[spl].split(':');

          Map found = skus[j]['properties'].firstWhere(
            (s) => s['id'] == individualSplitted[0],
          );

          newPropertyId.add(
            "${individualSplitted[0]}:${found["value"]["id"]}",
          );
        }

        String finalPropertyId = newPropertyId.join(';');

        double discountedPrice = double.parse(
          (skus[j]['price']['web']['discountedPrice']['value'] * 1).toString(),
        );

        skus_arr.add(
          [
            'unknown',
            finalPropertyId,
            double.parse(
              Provider.of<PriceFormulaProvider>(context, listen: false)
                  .getAliExpressPrice(
                discountedPrice,
                _name!
                    .replaceAll('"', '')
                    .replaceAll("'", '')
                    .replaceAll('`', ''),
              ),
            ),
            skus[j]['stock'],
            double.parse(
              Provider.of<PriceFormulaProvider>(context, listen: false)
                  .getAliExpressPrice(
                discountedPrice,
                _name!
                    .replaceAll('"', '')
                    .replaceAll("'", '')
                    .replaceAll('`', ''),
              ),
            ),
          ],
        );
      }
    }

    Map<String?, Map> prop_obj = {};

    for (int x = 0; x < skusProperties.length; x++) {
      String? mainId = skusProperties[x]['id'];
      List innerValueArray = skusProperties[x]['values'];
      String? displayName = skusProperties[x]['name'];

      for (int i = 0; i < innerValueArray.length; i++) {
        String? secondaryId = innerValueArray[i]['id'];
        String? value = innerValueArray[i]['name'];
        String? pic = innerValueArray[i]['imageUrl'];

        if (!prop_obj.containsKey(mainId)) {
          prop_obj.addAll({
            mainId: {
              secondaryId: Details(
                prop_key: mainId,
                prop_val: secondaryId,
                name: displayName,
                value: value,
                pic_url: pic != null ? pic : '',
              )
            }
          });
        } else {
          prop_obj[mainId]!.addAll(
            {
              secondaryId: Details(
                prop_key: mainId,
                prop_val: secondaryId,
                name: displayName,
                value: value,
                pic_url: pic != null ? pic : '',
              )
            },
          );
        }
      }
    }

    if (prop_obj['200007763'] != null &&
        (prop_obj['200007763']!['201336100'] != null ||
            prop_obj['200007763']!['201441035'] != null)) {
      if (prop_obj['200007763']!['201336100'] != null) {
        prop_obj = {
          ...prop_obj,
          "200007763": {
            '201336100': prop_obj['200007763']!['201336100'],
          },
        };
      }

      if (prop_obj['200007763']!['201441035'] != null) {
        prop_obj = {
          ...prop_obj,
          "200007763": {
            '201441035': prop_obj['200007763']!['201441035'],
          },
        };
      }
    }

    _prop_obj = prop_obj;
    _skus_json = skus_arr;

    //Just for test

    List<Map<String, dynamic>> choice_options = [
      {
        "name": "choice_1",
        "title": "size",
        "options": ["s", "          l"]
      }
    ];

    _choiceOptions = [];

    choiceOptions!.forEach((v) {
      _choiceOptions!
          .add(new ChoiceOptions.fromJson(v as Map<String, dynamic>));
    });

    var variation = [
      {"type": "Amethyst-s", "price": 500, "sku": "t1-Amethyst-s", "qty": 88},
      {"type": "Amethyst-l", "price": 500, "sku": "t1-Amethyst-l", "qty": 100},
      {
        "type": "Aquamarine-s",
        "price": 500,
        "sku": "t1-Aquamarine-s",
        "qty": 100
      },
      {
        "type": "Aquamarine-l",
        "price": 500,
        "sku": "t1-Aquamarine-l",
        "qty": 100
      }
    ];

    _variation = [];

    variation.forEach((v) {
      _variation!.add(new Variation.fromJson(v));
    });

    var colors = [
      {"name": "Amethyst", "code": "#9966CC"},
      {"name": "Aquamarine", "code": "#7FFFD4"}
    ];

    _colors = [];

    colors.forEach((v) {
      _colors!.add(new ProductColors.fromJson(v));
    });

    _rating = [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['added_by'] = this._addedBy;
    data['user_id'] = this._userId;
    data['name'] = this._name;
    data['slug'] = this._slug;
    if (this._categoryIds != null) {
      data['category_ids'] = this._categoryIds!.map((v) => v.toJson()).toList();
    }
    data['unit'] = this._unit;
    data['min_qty'] = this._minQty;
    data['images'] = this._images;
    data['thumbnail'] = this._thumbnail;
    if (this._colors != null) {
      data['colors'] = this._colors!.map((v) => v.toJson()).toList();
    }
    data['attributes'] = this._attributes;
    if (this._choiceOptions != null) {
      data['choice_options'] =
          this._choiceOptions!.map((v) => v.toJson()).toList();
    }
    if (this._variation != null) {
      data['variation'] = this._variation!.map((v) => v.toJson()).toList();
    }
    data['unit_price'] = this._unitPrice;
    data['purchase_price'] = this._purchasePrice;
    data['tax'] = this._tax;
    data['tax_type'] = this._taxType;
    data['discount'] = this._discount;
    data['discount_type'] = this._discountType;
    data['current_stock'] = this._currentStock;
    data['details'] = this._details;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    if (this._rating != null) {
      data['rating'] = this._rating!.map((v) => v.toJson()).toList();
    }
    data['shipping_cost'] = this._shippingCost;
    data['multiply_qty'] = this._isMultiPly;
    data['reviews_count'] = this._reviewCount;
    return data;
  }
}

class CategoryIds {
  int? _position;

  CategoryIds({int? position}) {
    this._position = position;
  }

  int? get position => _position;

  CategoryIds.fromJson(Map<String, dynamic> json) {
    _position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['position'] = this._position;
    return data;
  }
}

class ProductColors {
  String? _name;
  String? _code;

  ProductColors({String? name, String? code}) {
    this._name = name;
    this._code = code;
  }

  String? get name => _name;
  String? get code => _code;

  ProductColors.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['code'] = this._code;
    return data;
  }
}

class ChoiceOptions {
  String? _name;
  String? _title;
  List<String>? _options;

  ChoiceOptions({String? name, String? title, List<String>? options}) {
    this._name = name;
    this._title = title;
    this._options = options;
  }

  String? get name => _name;
  String? get title => _title;
  List<String>? get options => _options;

  ChoiceOptions.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _title = json['title'];
    _options = json['options'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['title'] = this._title;
    data['options'] = this._options;
    return data;
  }
}

class Variation {
  String? _type;
  double? _price;
  String? _sku;
  int? _qty;

  Variation({String? type, double? price, String? sku, int? qty}) {
    this._type = type;
    this._price = price;
    this._sku = sku;
    this._qty = qty;
  }

  String? get type => _type;
  double? get price => _price;
  String? get sku => _sku;
  int? get qty => _qty;

  Variation.fromJson(Map<String, dynamic> json) {
    _type = json['type'];
    _price = json['price'].toDouble();
    _sku = json['sku'];
    _qty = json['qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this._type;
    data['price'] = this._price;
    data['sku'] = this._sku;
    data['qty'] = this._qty;
    return data;
  }
}

class Rating {
  String? _average;
  int? _productId;

  Rating({String? average, int? productId}) {
    this._average = average;
    this._productId = productId;
  }

  String? get average => _average;
  int? get productId => _productId;

  Rating.fromJson(Map<String, dynamic> json) {
    _average = json['average'].toString();
    _productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['average'] = this._average;
    data['product_id'] = this._productId;
    return data;
  }
}
