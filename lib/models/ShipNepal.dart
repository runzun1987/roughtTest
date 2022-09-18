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


/** This is an auto generated class representing the ShipNepal type in your schema. */
@immutable
class ShipNepal extends Model {
  static const classType = const _ShipNepalModelType();
  final String id;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;
  final String? _order_id;
  final TemporalDateTime? _date;
  final String? _order_status;
  final List<ShipNepalProduct>? _products;
  final String? _baseType;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  String? get order_id {
    return _order_id;
  }
  
  TemporalDateTime? get date {
    return _date;
  }
  
  String? get order_status {
    return _order_status;
  }
  
  List<ShipNepalProduct>? get products {
    return _products;
  }
  
  String? get baseType {
    return _baseType;
  }
  
  const ShipNepal._internal({required this.id, createdAt, updatedAt, order_id, date, order_status, products, baseType}): _createdAt = createdAt, _updatedAt = updatedAt, _order_id = order_id, _date = date, _order_status = order_status, _products = products, _baseType = baseType;
  
  factory ShipNepal({String? id, TemporalDateTime? createdAt, TemporalDateTime? updatedAt, String? order_id, TemporalDateTime? date, String? order_status, List<ShipNepalProduct>? products, String? baseType}) {
    return ShipNepal._internal(
      id: id == null ? UUID.getUUID() : id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      order_id: order_id,
      date: date,
      order_status: order_status,
      products: products != null ? List<ShipNepalProduct>.unmodifiable(products) : products,
      baseType: baseType);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShipNepal &&
      id == other.id &&
      _createdAt == other._createdAt &&
      _updatedAt == other._updatedAt &&
      _order_id == other._order_id &&
      _date == other._date &&
      _order_status == other._order_status &&
      DeepCollectionEquality().equals(_products, other._products) &&
      _baseType == other._baseType;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("ShipNepal {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("order_id=" + "$_order_id" + ", ");
    buffer.write("date=" + (_date != null ? _date!.format() : "null") + ", ");
    buffer.write("order_status=" + "$_order_status" + ", ");
    buffer.write("baseType=" + "$_baseType");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  ShipNepal copyWith({String? id, TemporalDateTime? createdAt, TemporalDateTime? updatedAt, String? order_id, TemporalDateTime? date, String? order_status, List<ShipNepalProduct>? products, String? baseType}) {
    return ShipNepal._internal(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      order_id: order_id ?? this.order_id,
      date: date ?? this.date,
      order_status: order_status ?? this.order_status,
      products: products ?? this.products,
      baseType: baseType ?? this.baseType);
  }
  
  ShipNepal.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null,
      _order_id = json['order_id'],
      _date = json['date'] != null ? TemporalDateTime.fromString(json['date']) : null,
      _order_status = json['order_status'],
      _products = json['products']["items"] is List
        ? (json['products']["items"] as List)
          .where((e) => e != null)
          .map((e) => ShipNepalProduct.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _baseType = json['baseType'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'order_id': _order_id, 'date': _date?.format(), 'order_status': _order_status, 'products': _products?.map((ShipNepalProduct? e) => e?.toJson()).toList(), 'baseType': _baseType
  };

  static final QueryField ID = QueryField(fieldName: "shipNepal.id");
  static final QueryField CREATEDAT = QueryField(fieldName: "createdAt");
  static final QueryField UPDATEDAT = QueryField(fieldName: "updatedAt");
  static final QueryField ORDER_ID = QueryField(fieldName: "order_id");
  static final QueryField DATE = QueryField(fieldName: "date");
  static final QueryField ORDER_STATUS = QueryField(fieldName: "order_status");
  static final QueryField PRODUCTS = QueryField(
    fieldName: "products",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (ShipNepalProduct).toString()));
  static final QueryField BASETYPE = QueryField(fieldName: "baseType");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "ShipNepal";
    modelSchemaDefinition.pluralName = "ShipNepals";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ShipNepal.CREATEDAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ShipNepal.UPDATEDAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ShipNepal.ORDER_ID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ShipNepal.DATE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ShipNepal.ORDER_STATUS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: ShipNepal.PRODUCTS,
      isRequired: false,
      ofModelName: (ShipNepalProduct).toString(),
      associatedKey: ShipNepalProduct.TOPSHIPNEPAL
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ShipNepal.BASETYPE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _ShipNepalModelType extends ModelType<ShipNepal> {
  const _ShipNepalModelType();
  
  @override
  ShipNepal fromJson(Map<String, dynamic> jsonData) {
    return ShipNepal.fromJson(jsonData);
  }
}