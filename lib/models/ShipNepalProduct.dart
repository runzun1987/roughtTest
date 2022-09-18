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
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the ShipNepalProduct type in your schema. */
@immutable
class ShipNepalProduct extends Model {
  static const classType = const _ShipNepalProductModelType();
  final String id;
  final TemporalDateTime? _createdAt;
  final String? _price;
  final String? _total;
  final String? _qty;
  final String? _tracking_number;
  final String? _weight;
  final String? _grand_total;
  final String? _pic;
  final String? _product_url;
  final String? _product_id;
  final String? _way_bill_number;
  final String? _order_status;
  final String? _baseType;
  final ShipNepal? _topShipNepal;
  final WayBill? _wayBillShipNepal;
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
  
  String? get price {
    return _price;
  }
  
  String? get total {
    return _total;
  }
  
  String? get qty {
    return _qty;
  }
  
  String? get tracking_number {
    return _tracking_number;
  }
  
  String? get weight {
    return _weight;
  }
  
  String? get grand_total {
    return _grand_total;
  }
  
  String? get pic {
    return _pic;
  }
  
  String? get product_url {
    return _product_url;
  }
  
  String? get product_id {
    return _product_id;
  }
  
  String? get way_bill_number {
    return _way_bill_number;
  }
  
  String? get order_status {
    return _order_status;
  }
  
  String? get baseType {
    return _baseType;
  }
  
  ShipNepal? get topShipNepal {
    return _topShipNepal;
  }
  
  WayBill? get wayBillShipNepal {
    return _wayBillShipNepal;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const ShipNepalProduct._internal({required this.id, createdAt, price, total, qty, tracking_number, weight, grand_total, pic, product_url, product_id, way_bill_number, order_status, baseType, topShipNepal, wayBillShipNepal, updatedAt}): _createdAt = createdAt, _price = price, _total = total, _qty = qty, _tracking_number = tracking_number, _weight = weight, _grand_total = grand_total, _pic = pic, _product_url = product_url, _product_id = product_id, _way_bill_number = way_bill_number, _order_status = order_status, _baseType = baseType, _topShipNepal = topShipNepal, _wayBillShipNepal = wayBillShipNepal, _updatedAt = updatedAt;
  
  factory ShipNepalProduct({String? id, TemporalDateTime? createdAt, String? price, String? total, String? qty, String? tracking_number, String? weight, String? grand_total, String? pic, String? product_url, String? product_id, String? way_bill_number, String? order_status, String? baseType, ShipNepal? topShipNepal, WayBill? wayBillShipNepal}) {
    return ShipNepalProduct._internal(
      id: id == null ? UUID.getUUID() : id,
      createdAt: createdAt,
      price: price,
      total: total,
      qty: qty,
      tracking_number: tracking_number,
      weight: weight,
      grand_total: grand_total,
      pic: pic,
      product_url: product_url,
      product_id: product_id,
      way_bill_number: way_bill_number,
      order_status: order_status,
      baseType: baseType,
      topShipNepal: topShipNepal,
      wayBillShipNepal: wayBillShipNepal);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShipNepalProduct &&
      id == other.id &&
      _createdAt == other._createdAt &&
      _price == other._price &&
      _total == other._total &&
      _qty == other._qty &&
      _tracking_number == other._tracking_number &&
      _weight == other._weight &&
      _grand_total == other._grand_total &&
      _pic == other._pic &&
      _product_url == other._product_url &&
      _product_id == other._product_id &&
      _way_bill_number == other._way_bill_number &&
      _order_status == other._order_status &&
      _baseType == other._baseType &&
      _topShipNepal == other._topShipNepal &&
      _wayBillShipNepal == other._wayBillShipNepal;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("ShipNepalProduct {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("price=" + "$_price" + ", ");
    buffer.write("total=" + "$_total" + ", ");
    buffer.write("qty=" + "$_qty" + ", ");
    buffer.write("tracking_number=" + "$_tracking_number" + ", ");
    buffer.write("weight=" + "$_weight" + ", ");
    buffer.write("grand_total=" + "$_grand_total" + ", ");
    buffer.write("pic=" + "$_pic" + ", ");
    buffer.write("product_url=" + "$_product_url" + ", ");
    buffer.write("product_id=" + "$_product_id" + ", ");
    buffer.write("way_bill_number=" + "$_way_bill_number" + ", ");
    buffer.write("order_status=" + "$_order_status" + ", ");
    buffer.write("baseType=" + "$_baseType" + ", ");
    buffer.write("topShipNepal=" + (_topShipNepal != null ? _topShipNepal!.toString() : "null") + ", ");
    buffer.write("wayBillShipNepal=" + (_wayBillShipNepal != null ? _wayBillShipNepal!.toString() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  ShipNepalProduct copyWith({String? id, TemporalDateTime? createdAt, String? price, String? total, String? qty, String? tracking_number, String? weight, String? grand_total, String? pic, String? product_url, String? product_id, String? way_bill_number, String? order_status, String? baseType, ShipNepal? topShipNepal, WayBill? wayBillShipNepal}) {
    return ShipNepalProduct._internal(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      price: price ?? this.price,
      total: total ?? this.total,
      qty: qty ?? this.qty,
      tracking_number: tracking_number ?? this.tracking_number,
      weight: weight ?? this.weight,
      grand_total: grand_total ?? this.grand_total,
      pic: pic ?? this.pic,
      product_url: product_url ?? this.product_url,
      product_id: product_id ?? this.product_id,
      way_bill_number: way_bill_number ?? this.way_bill_number,
      order_status: order_status ?? this.order_status,
      baseType: baseType ?? this.baseType,
      topShipNepal: topShipNepal ?? this.topShipNepal,
      wayBillShipNepal: wayBillShipNepal ?? this.wayBillShipNepal);
  }
  
  ShipNepalProduct.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _price = json['price'],
      _total = json['total'],
      _qty = json['qty'],
      _tracking_number = json['tracking_number'],
      _weight = json['weight'],
      _grand_total = json['grand_total'],
      _pic = json['pic'],
      _product_url = json['product_url'],
      _product_id = json['product_id'],
      _way_bill_number = json['way_bill_number'],
      _order_status = json['order_status'],
      _baseType = json['baseType'],
      _topShipNepal = json['topShipNepal']?['serializedData'] != null
        ? ShipNepal.fromJson(new Map<String, dynamic>.from(json['topShipNepal']['serializedData']))
        : null,
      _wayBillShipNepal = json['wayBillShipNepal']?['serializedData'] != null
        ? WayBill.fromJson(new Map<String, dynamic>.from(json['wayBillShipNepal']['serializedData']))
        : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'createdAt': _createdAt?.format(), 'price': _price, 'total': _total, 'qty': _qty, 'tracking_number': _tracking_number, 'weight': _weight, 'grand_total': _grand_total, 'pic': _pic, 'product_url': _product_url, 'product_id': _product_id, 'way_bill_number': _way_bill_number, 'order_status': _order_status, 'baseType': _baseType, 'topShipNepal': _topShipNepal?.toJson(), 'wayBillShipNepal': _wayBillShipNepal?.toJson(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "shipNepalProduct.id");
  static final QueryField CREATEDAT = QueryField(fieldName: "createdAt");
  static final QueryField PRICE = QueryField(fieldName: "price");
  static final QueryField TOTAL = QueryField(fieldName: "total");
  static final QueryField QTY = QueryField(fieldName: "qty");
  static final QueryField TRACKING_NUMBER = QueryField(fieldName: "tracking_number");
  static final QueryField WEIGHT = QueryField(fieldName: "weight");
  static final QueryField GRAND_TOTAL = QueryField(fieldName: "grand_total");
  static final QueryField PIC = QueryField(fieldName: "pic");
  static final QueryField PRODUCT_URL = QueryField(fieldName: "product_url");
  static final QueryField PRODUCT_ID = QueryField(fieldName: "product_id");
  static final QueryField WAY_BILL_NUMBER = QueryField(fieldName: "way_bill_number");
  static final QueryField ORDER_STATUS = QueryField(fieldName: "order_status");
  static final QueryField BASETYPE = QueryField(fieldName: "baseType");
  static final QueryField TOPSHIPNEPAL = QueryField(
    fieldName: "topShipNepal",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (ShipNepal).toString()));
  static final QueryField WAYBILLSHIPNEPAL = QueryField(
    fieldName: "wayBillShipNepal",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (WayBill).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "ShipNepalProduct";
    modelSchemaDefinition.pluralName = "ShipNepalProducts";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ShipNepalProduct.CREATEDAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ShipNepalProduct.PRICE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ShipNepalProduct.TOTAL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ShipNepalProduct.QTY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ShipNepalProduct.TRACKING_NUMBER,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ShipNepalProduct.WEIGHT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ShipNepalProduct.GRAND_TOTAL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ShipNepalProduct.PIC,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ShipNepalProduct.PRODUCT_URL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ShipNepalProduct.PRODUCT_ID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ShipNepalProduct.WAY_BILL_NUMBER,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ShipNepalProduct.ORDER_STATUS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ShipNepalProduct.BASETYPE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: ShipNepalProduct.TOPSHIPNEPAL,
      isRequired: false,
      targetName: "shipNepalId",
      ofModelName: (ShipNepal).toString()
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: ShipNepalProduct.WAYBILLSHIPNEPAL,
      isRequired: false,
      targetName: "wayBillId",
      ofModelName: (WayBill).toString()
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _ShipNepalProductModelType extends ModelType<ShipNepalProduct> {
  const _ShipNepalProductModelType();
  
  @override
  ShipNepalProduct fromJson(Map<String, dynamic> jsonData) {
    return ShipNepalProduct.fromJson(jsonData);
  }
}