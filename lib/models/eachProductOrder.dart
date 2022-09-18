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


/** This is an auto generated class representing the eachProductOrder type in your schema. */
@immutable
class eachProductOrder extends Model {
  static const classType = const _eachProductOrderModelType();
  final String id;
  final TemporalDateTime? _createdAt;
  final String? _secondaryOrderId;
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
  final TemporalDateTime? _deliveryDate;
  final int? _stock;
  final int? _shippingCode;
  final bool? _purchased;
  final String? _note;
  final String? _provider;
  final Order? _orderCart;
  final String? _baseType;
  final String? _selected;
  final String? _shipNepalOrderStatus;
  final TemporalDateTime? _shipNepalOrderReceivedOn;
  final ShipNepal? _shipNepalOrder;
  final Driver? _driver;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  String? get secondaryOrderId {
    return _secondaryOrderId;
  }
  
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
  
  TemporalDateTime? get deliveryDate {
    return _deliveryDate;
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
  
  Order? get orderCart {
    return _orderCart;
  }
  
  String? get baseType {
    return _baseType;
  }
  
  String? get selected {
    return _selected;
  }
  
  String? get shipNepalOrderStatus {
    return _shipNepalOrderStatus;
  }
  
  TemporalDateTime? get shipNepalOrderReceivedOn {
    return _shipNepalOrderReceivedOn;
  }
  
  ShipNepal? get shipNepalOrder {
    return _shipNepalOrder;
  }
  
  Driver? get driver {
    return _driver;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const eachProductOrder._internal({required this.id, createdAt, secondaryOrderId, detail, image, price, productId, qty, skuId, sum, title, bigImageUrl, city, tier, shippingType, shippingCost, sellerPrice, ourPureShipping, shippingStatus, deliveryDate, stock, shippingCode, purchased, note, provider, orderCart, baseType, selected, shipNepalOrderStatus, shipNepalOrderReceivedOn, shipNepalOrder, driver, updatedAt}): _createdAt = createdAt, _secondaryOrderId = secondaryOrderId, _detail = detail, _image = image, _price = price, _productId = productId, _qty = qty, _skuId = skuId, _sum = sum, _title = title, _bigImageUrl = bigImageUrl, _city = city, _tier = tier, _shippingType = shippingType, _shippingCost = shippingCost, _sellerPrice = sellerPrice, _ourPureShipping = ourPureShipping, _shippingStatus = shippingStatus, _deliveryDate = deliveryDate, _stock = stock, _shippingCode = shippingCode, _purchased = purchased, _note = note, _provider = provider, _orderCart = orderCart, _baseType = baseType, _selected = selected, _shipNepalOrderStatus = shipNepalOrderStatus, _shipNepalOrderReceivedOn = shipNepalOrderReceivedOn, _shipNepalOrder = shipNepalOrder, _driver = driver, _updatedAt = updatedAt;
  
  factory eachProductOrder({String? id, TemporalDateTime? createdAt, String? secondaryOrderId, List<Details>? detail, String? image, int? price, String? productId, int? qty, String? skuId, int? sum, String? title, String? bigImageUrl, String? city, int? tier, String? shippingType, int? shippingCost, int? sellerPrice, int? ourPureShipping, String? shippingStatus, TemporalDateTime? deliveryDate, int? stock, int? shippingCode, bool? purchased, String? note, String? provider, Order? orderCart, String? baseType, String? selected, String? shipNepalOrderStatus, TemporalDateTime? shipNepalOrderReceivedOn, ShipNepal? shipNepalOrder, Driver? driver}) {
    return eachProductOrder._internal(
      id: id == null ? UUID.getUUID() : id,
      createdAt: createdAt,
      secondaryOrderId: secondaryOrderId,
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
      deliveryDate: deliveryDate,
      stock: stock,
      shippingCode: shippingCode,
      purchased: purchased,
      note: note,
      provider: provider,
      orderCart: orderCart,
      baseType: baseType,
      selected: selected,
      shipNepalOrderStatus: shipNepalOrderStatus,
      shipNepalOrderReceivedOn: shipNepalOrderReceivedOn,
      shipNepalOrder: shipNepalOrder,
      driver: driver);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is eachProductOrder &&
      id == other.id &&
      _createdAt == other._createdAt &&
      _secondaryOrderId == other._secondaryOrderId &&
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
      _deliveryDate == other._deliveryDate &&
      _stock == other._stock &&
      _shippingCode == other._shippingCode &&
      _purchased == other._purchased &&
      _note == other._note &&
      _provider == other._provider &&
      _orderCart == other._orderCart &&
      _baseType == other._baseType &&
      _selected == other._selected &&
      _shipNepalOrderStatus == other._shipNepalOrderStatus &&
      _shipNepalOrderReceivedOn == other._shipNepalOrderReceivedOn &&
      _shipNepalOrder == other._shipNepalOrder &&
      _driver == other._driver;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("eachProductOrder {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("secondaryOrderId=" + "$_secondaryOrderId" + ", ");
    buffer.write("detail=" + (_detail != null ? _detail!.toString() : "null") + ", ");
    buffer.write("image=" + "$_image" + ", ");
    buffer.write("price=" + (_price != null ? _price!.toString() : "null") + ", ");
    buffer.write("productId=" + "$_productId" + ", ");
    buffer.write("qty=" + (_qty != null ? _qty!.toString() : "null") + ", ");
    buffer.write("skuId=" + "$_skuId" + ", ");
    buffer.write("sum=" + (_sum != null ? _sum!.toString() : "null") + ", ");
    buffer.write("title=" + "$_title" + ", ");
    buffer.write("bigImageUrl=" + "$_bigImageUrl" + ", ");
    buffer.write("city=" + "$_city" + ", ");
    buffer.write("tier=" + (_tier != null ? _tier!.toString() : "null") + ", ");
    buffer.write("shippingType=" + "$_shippingType" + ", ");
    buffer.write("shippingCost=" + (_shippingCost != null ? _shippingCost!.toString() : "null") + ", ");
    buffer.write("sellerPrice=" + (_sellerPrice != null ? _sellerPrice!.toString() : "null") + ", ");
    buffer.write("ourPureShipping=" + (_ourPureShipping != null ? _ourPureShipping!.toString() : "null") + ", ");
    buffer.write("shippingStatus=" + "$_shippingStatus" + ", ");
    buffer.write("deliveryDate=" + (_deliveryDate != null ? _deliveryDate!.format() : "null") + ", ");
    buffer.write("stock=" + (_stock != null ? _stock!.toString() : "null") + ", ");
    buffer.write("shippingCode=" + (_shippingCode != null ? _shippingCode!.toString() : "null") + ", ");
    buffer.write("purchased=" + (_purchased != null ? _purchased!.toString() : "null") + ", ");
    buffer.write("note=" + "$_note" + ", ");
    buffer.write("provider=" + "$_provider" + ", ");
    buffer.write("orderCart=" + (_orderCart != null ? _orderCart!.toString() : "null") + ", ");
    buffer.write("baseType=" + "$_baseType" + ", ");
    buffer.write("selected=" + "$_selected" + ", ");
    buffer.write("shipNepalOrderStatus=" + "$_shipNepalOrderStatus" + ", ");
    buffer.write("shipNepalOrderReceivedOn=" + (_shipNepalOrderReceivedOn != null ? _shipNepalOrderReceivedOn!.format() : "null") + ", ");
    buffer.write("shipNepalOrder=" + (_shipNepalOrder != null ? _shipNepalOrder!.toString() : "null") + ", ");
    buffer.write("driver=" + (_driver != null ? _driver!.toString() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  eachProductOrder copyWith({String? id, TemporalDateTime? createdAt, String? secondaryOrderId, List<Details>? detail, String? image, int? price, String? productId, int? qty, String? skuId, int? sum, String? title, String? bigImageUrl, String? city, int? tier, String? shippingType, int? shippingCost, int? sellerPrice, int? ourPureShipping, String? shippingStatus, TemporalDateTime? deliveryDate, int? stock, int? shippingCode, bool? purchased, String? note, String? provider, Order? orderCart, String? baseType, String? selected, String? shipNepalOrderStatus, TemporalDateTime? shipNepalOrderReceivedOn, ShipNepal? shipNepalOrder, Driver? driver}) {
    return eachProductOrder._internal(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      secondaryOrderId: secondaryOrderId ?? this.secondaryOrderId,
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
      deliveryDate: deliveryDate ?? this.deliveryDate,
      stock: stock ?? this.stock,
      shippingCode: shippingCode ?? this.shippingCode,
      purchased: purchased ?? this.purchased,
      note: note ?? this.note,
      provider: provider ?? this.provider,
      orderCart: orderCart ?? this.orderCart,
      baseType: baseType ?? this.baseType,
      selected: selected ?? this.selected,
      shipNepalOrderStatus: shipNepalOrderStatus ?? this.shipNepalOrderStatus,
      shipNepalOrderReceivedOn: shipNepalOrderReceivedOn ?? this.shipNepalOrderReceivedOn,
      shipNepalOrder: shipNepalOrder ?? this.shipNepalOrder,
      driver: driver ?? this.driver);
  }
  
  eachProductOrder.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _secondaryOrderId = json['secondaryOrderId'],
      _detail = json['detail'] is List
        ? (json['detail'] as List)
          .where((e) => e != null)
          .map((e) => Details.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
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
      _deliveryDate = json['deliveryDate'] != null ? TemporalDateTime.fromString(json['deliveryDate']) : null,
      _stock = (json['stock'] as num?)?.toInt(),
      _shippingCode = (json['shippingCode'] as num?)?.toInt(),
      _purchased = json['purchased'],
      _note = json['note'],
      _provider = json['provider'],
      _orderCart = json['orderCart']?['serializedData'] != null
        ? Order.fromJson(new Map<String, dynamic>.from(json['orderCart']['serializedData']))
        : null,
      _baseType = json['baseType'],
      _selected = json['selected'],
      _shipNepalOrderStatus = json['shipNepalOrderStatus'],
      _shipNepalOrderReceivedOn = json['shipNepalOrderReceivedOn'] != null ? TemporalDateTime.fromString(json['shipNepalOrderReceivedOn']) : null,
      _shipNepalOrder = json['shipNepalOrder'] != null
        ? ShipNepal.fromJson(new Map<String, dynamic>.from(json['shipNepalOrder']))
        : null,
      _driver = json['driver']?['serializedData'] != null
        ? Driver.fromJson(new Map<String, dynamic>.from(json['driver']['serializedData']))
        : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'createdAt': _createdAt?.format(), 'secondaryOrderId': _secondaryOrderId, 'detail': _detail?.map((Details? e) => e?.toJson()).toList(), 'image': _image, 'price': _price, 'productId': _productId, 'qty': _qty, 'skuId': _skuId, 'sum': _sum, 'title': _title, 'bigImageUrl': _bigImageUrl, 'city': _city, 'tier': _tier, 'shippingType': _shippingType, 'shippingCost': _shippingCost, 'sellerPrice': _sellerPrice, 'ourPureShipping': _ourPureShipping, 'shippingStatus': _shippingStatus, 'deliveryDate': _deliveryDate?.format(), 'stock': _stock, 'shippingCode': _shippingCode, 'purchased': _purchased, 'note': _note, 'provider': _provider, 'orderCart': _orderCart?.toJson(), 'baseType': _baseType, 'selected': _selected, 'shipNepalOrderStatus': _shipNepalOrderStatus, 'shipNepalOrderReceivedOn': _shipNepalOrderReceivedOn?.format(), 'shipNepalOrder': _shipNepalOrder?.toJson(), 'driver': _driver?.toJson(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "eachProductOrder.id");
  static final QueryField CREATEDAT = QueryField(fieldName: "createdAt");
  static final QueryField SECONDARYORDERID = QueryField(fieldName: "secondaryOrderId");
  static final QueryField DETAIL = QueryField(fieldName: "detail");
  static final QueryField IMAGE = QueryField(fieldName: "image");
  static final QueryField PRICE = QueryField(fieldName: "price");
  static final QueryField PRODUCTID = QueryField(fieldName: "productId");
  static final QueryField QTY = QueryField(fieldName: "qty");
  static final QueryField SKUID = QueryField(fieldName: "skuId");
  static final QueryField SUM = QueryField(fieldName: "sum");
  static final QueryField TITLE = QueryField(fieldName: "title");
  static final QueryField BIGIMAGEURL = QueryField(fieldName: "bigImageUrl");
  static final QueryField CITY = QueryField(fieldName: "city");
  static final QueryField TIER = QueryField(fieldName: "tier");
  static final QueryField SHIPPINGTYPE = QueryField(fieldName: "shippingType");
  static final QueryField SHIPPINGCOST = QueryField(fieldName: "shippingCost");
  static final QueryField SELLERPRICE = QueryField(fieldName: "sellerPrice");
  static final QueryField OURPURESHIPPING = QueryField(fieldName: "ourPureShipping");
  static final QueryField SHIPPINGSTATUS = QueryField(fieldName: "shippingStatus");
  static final QueryField DELIVERYDATE = QueryField(fieldName: "deliveryDate");
  static final QueryField STOCK = QueryField(fieldName: "stock");
  static final QueryField SHIPPINGCODE = QueryField(fieldName: "shippingCode");
  static final QueryField PURCHASED = QueryField(fieldName: "purchased");
  static final QueryField NOTE = QueryField(fieldName: "note");
  static final QueryField PROVIDER = QueryField(fieldName: "provider");
  static final QueryField ORDERCART = QueryField(
    fieldName: "orderCart",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Order).toString()));
  static final QueryField BASETYPE = QueryField(fieldName: "baseType");
  static final QueryField SELECTED = QueryField(fieldName: "selected");
  static final QueryField SHIPNEPALORDERSTATUS = QueryField(fieldName: "shipNepalOrderStatus");
  static final QueryField SHIPNEPALORDERRECEIVEDON = QueryField(fieldName: "shipNepalOrderReceivedOn");
  static final QueryField SHIPNEPALORDER = QueryField(
    fieldName: "shipNepalOrder",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (ShipNepal).toString()));
  static final QueryField DRIVER = QueryField(
    fieldName: "driver",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Driver).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "eachProductOrder";
    modelSchemaDefinition.pluralName = "eachProductOrders";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: eachProductOrder.CREATEDAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: eachProductOrder.SECONDARYORDERID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'detail',
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.embeddedCollection, ofCustomTypeName: 'Details')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: eachProductOrder.IMAGE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: eachProductOrder.PRICE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: eachProductOrder.PRODUCTID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: eachProductOrder.QTY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: eachProductOrder.SKUID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: eachProductOrder.SUM,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: eachProductOrder.TITLE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: eachProductOrder.BIGIMAGEURL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: eachProductOrder.CITY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: eachProductOrder.TIER,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: eachProductOrder.SHIPPINGTYPE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: eachProductOrder.SHIPPINGCOST,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: eachProductOrder.SELLERPRICE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: eachProductOrder.OURPURESHIPPING,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: eachProductOrder.SHIPPINGSTATUS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: eachProductOrder.DELIVERYDATE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: eachProductOrder.STOCK,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: eachProductOrder.SHIPPINGCODE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: eachProductOrder.PURCHASED,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: eachProductOrder.NOTE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: eachProductOrder.PROVIDER,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: eachProductOrder.ORDERCART,
      isRequired: false,
      targetName: "orderId",
      ofModelName: (Order).toString()
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: eachProductOrder.BASETYPE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: eachProductOrder.SELECTED,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: eachProductOrder.SHIPNEPALORDERSTATUS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: eachProductOrder.SHIPNEPALORDERRECEIVEDON,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: eachProductOrder.SHIPNEPALORDER,
      isRequired: false,
      targetName: "shipNepalOrderID",
      ofModelName: (ShipNepal).toString()
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: eachProductOrder.DRIVER,
      isRequired: false,
      targetName: "eachProductOrderDriverId",
      ofModelName: (Driver).toString()
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _eachProductOrderModelType extends ModelType<eachProductOrder> {
  const _eachProductOrderModelType();
  
  @override
  eachProductOrder fromJson(Map<String, dynamic> jsonData) {
    return eachProductOrder.fromJson(jsonData);
  }
}