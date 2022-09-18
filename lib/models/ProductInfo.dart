/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

/** This is an auto generated class representing the ProductInfo type in your schema. */
@immutable
class ProductInfo {
  final List<Details>? _detail;
  final String? _image;
  final int? _price;
  final String? _productId;
  final int? _qty;
  final String? _skuId;
  final int? _sum;
  final String? _title;
  final String? _bigImageUrl;
  final String? _city;
  final int? _tier;
  final String? _shippingType;
  final int? _shippingCost;
  final int? _sellerPrice;
  final int? _ourPureShipping;
  final String? _shippingStatus;
  final int? _stock;
  final int? _shippingCode;
  final bool? _purchased;
  final String? _note;
  final String? _provider;

  List<Details>? get detail {
    return _detail;
  }

  String? get image {
    return _image;
  }

  int? get price {
    return _price;
  }

  String? get productId {
    return _productId;
  }

  int? get qty {
    return _qty;
  }

  String? get skuId {
    return _skuId;
  }

  int? get sum {
    return _sum;
  }

  String? get title {
    return _title;
  }

  String? get bigImageUrl {
    return _bigImageUrl;
  }

  String? get city {
    return _city;
  }

  int? get tier {
    return _tier;
  }

  String? get shippingType {
    return _shippingType;
  }

  int? get shippingCost {
    return _shippingCost;
  }

  int? get sellerPrice {
    return _sellerPrice;
  }

  int? get ourPureShipping {
    return _ourPureShipping;
  }

  String? get shippingStatus {
    return _shippingStatus;
  }

  int? get stock {
    return _stock;
  }

  int? get shippingCode {
    return _shippingCode;
  }

  bool? get purchased {
    return _purchased;
  }

  String? get note {
    return _note;
  }

  String? get provider {
    return _provider;
  }

  const ProductInfo._internal(
      {detail,
      image,
      price,
      productId,
      qty,
      skuId,
      sum,
      title,
      bigImageUrl,
      city,
      tier,
      shippingType,
      shippingCost,
      sellerPrice,
      ourPureShipping,
      shippingStatus,
      stock,
      shippingCode,
      purchased,
      note,
      provider})
      : _detail = detail,
        _image = image,
        _price = price,
        _productId = productId,
        _qty = qty,
        _skuId = skuId,
        _sum = sum,
        _title = title,
        _bigImageUrl = bigImageUrl,
        _city = city,
        _tier = tier,
        _shippingType = shippingType,
        _shippingCost = shippingCost,
        _sellerPrice = sellerPrice,
        _ourPureShipping = ourPureShipping,
        _shippingStatus = shippingStatus,
        _stock = stock,
        _shippingCode = shippingCode,
        _purchased = purchased,
        _note = note,
        _provider = provider;

  factory ProductInfo(
      {List<Details>? detail,
      String? image,
      int? price,
      String? productId,
      int? qty,
      String? skuId,
      int? sum,
      String? title,
      String? bigImageUrl,
      String? city,
      int? tier,
      String? shippingType,
      int? shippingCost,
      int? sellerPrice,
      int? ourPureShipping,
      String? shippingStatus,
      int? stock,
      int? shippingCode,
      bool? purchased,
      String? note,
      String? provider}) {
    return ProductInfo._internal(
        detail: detail != null ? List<Details>.unmodifiable(detail) : detail,
        image: image,
        price: price,
        productId: productId,
        qty: qty,
        skuId: skuId,
        sum: sum,
        title: title,
        bigImageUrl: bigImageUrl,
        city: city,
        tier: tier,
        shippingType: shippingType,
        shippingCost: shippingCost,
        sellerPrice: sellerPrice,
        ourPureShipping: ourPureShipping,
        shippingStatus: shippingStatus,
        stock: stock,
        shippingCode: shippingCode,
        purchased: purchased,
        note: note,
        provider: provider);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductInfo &&
        DeepCollectionEquality().equals(_detail, other._detail) &&
        _image == other._image &&
        _price == other._price &&
        _productId == other._productId &&
        _qty == other._qty &&
        _skuId == other._skuId &&
        _sum == other._sum &&
        _title == other._title &&
        _bigImageUrl == other._bigImageUrl &&
        _city == other._city &&
        _tier == other._tier &&
        _shippingType == other._shippingType &&
        _shippingCost == other._shippingCost &&
        _sellerPrice == other._sellerPrice &&
        _ourPureShipping == other._ourPureShipping &&
        _shippingStatus == other._shippingStatus &&
        _stock == other._stock &&
        _shippingCode == other._shippingCode &&
        _purchased == other._purchased &&
        _note == other._note &&
        _provider == other._provider;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("ProductInfo {");
    buffer.write(
        "detail=" + (_detail != null ? _detail!.toString() : "null") + ", ");
    buffer.write("image=" + "$_image" + ", ");
    buffer.write(
        "price=" + (_price != null ? _price!.toString() : "null") + ", ");
    buffer.write("productId=" + "$_productId" + ", ");
    buffer.write("qty=" + (_qty != null ? _qty!.toString() : "null") + ", ");
    buffer.write("skuId=" + "$_skuId" + ", ");
    buffer.write("sum=" + (_sum != null ? _sum!.toString() : "null") + ", ");
    buffer.write("title=" + "$_title" + ", ");
    buffer.write("bigImageUrl=" + "$_bigImageUrl" + ", ");
    buffer.write("city=" + "$_city" + ", ");
    buffer.write("tier=" + (_tier != null ? _tier!.toString() : "null") + ", ");
    buffer.write("shippingType=" + "$_shippingType" + ", ");
    buffer.write("shippingCost=" +
        (_shippingCost != null ? _shippingCost!.toString() : "null") +
        ", ");
    buffer.write("sellerPrice=" +
        (_sellerPrice != null ? _sellerPrice!.toString() : "null") +
        ", ");
    buffer.write("ourPureShipping=" +
        (_ourPureShipping != null ? _ourPureShipping!.toString() : "null") +
        ", ");
    buffer.write("shippingStatus=" + "$_shippingStatus" + ", ");
    buffer.write(
        "stock=" + (_stock != null ? _stock!.toString() : "null") + ", ");
    buffer.write("shippingCode=" +
        (_shippingCode != null ? _shippingCode!.toString() : "null") +
        ", ");
    buffer.write("purchased=" +
        (_purchased != null ? _purchased!.toString() : "null") +
        ", ");
    buffer.write("note=" + "$_note" + ", ");
    buffer.write("provider=" + "$_provider");
    buffer.write("}");

    return buffer.toString();
  }

  ProductInfo copyWith(
      {List<Details>? detail,
      String? image,
      int? price,
      String? productId,
      int? qty,
      String? skuId,
      int? sum,
      String? title,
      String? bigImageUrl,
      String? city,
      int? tier,
      String? shippingType,
      int? shippingCost,
      int? sellerPrice,
      int? ourPureShipping,
      String? shippingStatus,
      int? stock,
      int? shippingCode,
      bool? purchased,
      String? note,
      String? provider}) {
    return ProductInfo._internal(
        detail: detail ?? this.detail,
        image: image ?? this.image,
        price: price ?? this.price,
        productId: productId ?? this.productId,
        qty: qty ?? this.qty,
        skuId: skuId ?? this.skuId,
        sum: sum ?? this.sum,
        title: title ?? this.title,
        bigImageUrl: bigImageUrl ?? this.bigImageUrl,
        city: city ?? this.city,
        tier: tier ?? this.tier,
        shippingType: shippingType ?? this.shippingType,
        shippingCost: shippingCost ?? this.shippingCost,
        sellerPrice: sellerPrice ?? this.sellerPrice,
        ourPureShipping: ourPureShipping ?? this.ourPureShipping,
        shippingStatus: shippingStatus ?? this.shippingStatus,
        stock: stock ?? this.stock,
        shippingCode: shippingCode ?? this.shippingCode,
        purchased: purchased ?? this.purchased,
        note: note ?? this.note,
        provider: provider ?? this.provider);
  }

  ProductInfo.fromJson(Map<String, dynamic> json)
      : _detail = json['detail'] is List
            ? (json['detail'] as List)
                .where((e) => e != null)
                .map((e) => Details.fromJson(new Map<String, dynamic>.from(
                    e['serializedData'] != null ? e['serializedData'] : e)))
                .toList()
            : null,
        _image = json['image'],
        _price = (json['price'] as num?)?.toInt(),
        _productId = json['productId'],
        _qty = (json['qty'] as num?)?.toInt(),
        _skuId = json['skuId'],
        _sum = (json['sum'] as num?)?.toInt(),
        _title = json['title'],
        _bigImageUrl = json['bigImageUrl'],
        _city = json['city'],
        _tier = (json['tier'] as num?)?.toInt(),
        _shippingType = json['shippingType'],
        _shippingCost = (json['shippingCost'] as num?)?.toInt(),
        _sellerPrice = (json['sellerPrice'] as num?)?.toInt(),
        _ourPureShipping = (json['ourPureShipping'] as num?)?.toInt(),
        _shippingStatus = json['shippingStatus'],
        _stock = (json['stock'] as num?)?.toInt(),
        _shippingCode = (json['shippingCode'] as num?)?.toInt(),
        _purchased = json['purchased'],
        _note = json['note'],
        _provider = json['provider'];

  Map<String, dynamic> toJson() => {
        'detail': _detail?.map((Details? e) => e?.toJson()).toList(),
        'image': _image,
        'price': _price,
        'productId': _productId,
        'qty': _qty,
        'skuId': _skuId,
        'sum': _sum,
        'title': _title,
        'bigImageUrl': _bigImageUrl,
        'city': _city,
        'tier': _tier,
        'shippingType': _shippingType,
        'shippingCost': _shippingCost,
        'sellerPrice': _sellerPrice,
        'ourPureShipping': _ourPureShipping,
        'shippingStatus': _shippingStatus,
        'stock': _stock,
        'shippingCode': _shippingCode,
        'purchased': _purchased,
        'note': _note,
        'provider': _provider
      };

  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "ProductInfo";
    modelSchemaDefinition.pluralName = "ProductInfos";

    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
        fieldName: 'detail',
        isRequired: false,
        isArray: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.embeddedCollection,
            ofCustomTypeName: 'Details')));

    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
        fieldName: 'image',
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
        fieldName: 'price',
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
        fieldName: 'productId',
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
        fieldName: 'qty',
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
        fieldName: 'skuId',
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
        fieldName: 'sum',
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
        fieldName: 'title',
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
        fieldName: 'bigImageUrl',
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
        fieldName: 'city',
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
        fieldName: 'tier',
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
        fieldName: 'shippingType',
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
        fieldName: 'shippingCost',
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
        fieldName: 'sellerPrice',
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
        fieldName: 'ourPureShipping',
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
        fieldName: 'shippingStatus',
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
        fieldName: 'stock',
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
        fieldName: 'shippingCode',
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
        fieldName: 'purchased',
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.bool)));

    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
        fieldName: 'note',
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
        fieldName: 'provider',
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}
