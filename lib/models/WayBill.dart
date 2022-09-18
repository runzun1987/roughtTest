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


/** This is an auto generated class representing the WayBill type in your schema. */
@immutable
class WayBill extends Model {
  static const classType = const _WayBillModelType();
  final String id;
  final String? _wayBillNumber;
  final List<ShipNepalProduct>? _product;
  final String? _baseType;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get wayBillNumber {
    return _wayBillNumber;
  }
  
  List<ShipNepalProduct>? get product {
    return _product;
  }
  
  String? get baseType {
    return _baseType;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const WayBill._internal({required this.id, wayBillNumber, product, baseType, createdAt, updatedAt}): _wayBillNumber = wayBillNumber, _product = product, _baseType = baseType, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory WayBill({String? id, String? wayBillNumber, List<ShipNepalProduct>? product, String? baseType}) {
    return WayBill._internal(
      id: id == null ? UUID.getUUID() : id,
      wayBillNumber: wayBillNumber,
      product: product != null ? List<ShipNepalProduct>.unmodifiable(product) : product,
      baseType: baseType);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WayBill &&
      id == other.id &&
      _wayBillNumber == other._wayBillNumber &&
      DeepCollectionEquality().equals(_product, other._product) &&
      _baseType == other._baseType;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("WayBill {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("wayBillNumber=" + "$_wayBillNumber" + ", ");
    buffer.write("baseType=" + "$_baseType" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  WayBill copyWith({String? id, String? wayBillNumber, List<ShipNepalProduct>? product, String? baseType}) {
    return WayBill._internal(
      id: id ?? this.id,
      wayBillNumber: wayBillNumber ?? this.wayBillNumber,
      product: product ?? this.product,
      baseType: baseType ?? this.baseType);
  }
  
  WayBill.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _wayBillNumber = json['wayBillNumber'],
      _product = json['product'] is List
        ? (json['product'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => ShipNepalProduct.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _baseType = json['baseType'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'wayBillNumber': _wayBillNumber, 'product': _product?.map((ShipNepalProduct? e) => e?.toJson()).toList(), 'baseType': _baseType, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "wayBill.id");
  static final QueryField WAYBILLNUMBER = QueryField(fieldName: "wayBillNumber");
  static final QueryField PRODUCT = QueryField(
    fieldName: "product",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (ShipNepalProduct).toString()));
  static final QueryField BASETYPE = QueryField(fieldName: "baseType");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "WayBill";
    modelSchemaDefinition.pluralName = "WayBills";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: WayBill.WAYBILLNUMBER,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: WayBill.PRODUCT,
      isRequired: false,
      ofModelName: (ShipNepalProduct).toString(),
      associatedKey: ShipNepalProduct.WAYBILLSHIPNEPAL
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: WayBill.BASETYPE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _WayBillModelType extends ModelType<WayBill> {
  const _WayBillModelType();
  
  @override
  WayBill fromJson(Map<String, dynamic> jsonData) {
    return WayBill.fromJson(jsonData);
  }
}