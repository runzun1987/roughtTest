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

import 'package:amplify_core/amplify_core.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the CouponList type in your schema. */
@immutable
class CouponList extends Model {
  static const classType = const _CouponListModelType();
  final String id;
  final List<String>? _userType;
  final List<String>? _usedBy;
  final TemporalDateTime? _validity;
  final String? _times;
  final String? _name;
  final String? _value;
  final String? _baseType;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  List<String>? get userType {
    return _userType;
  }
  
  List<String>? get usedBy {
    return _usedBy;
  }
  
  TemporalDateTime? get validity {
    return _validity;
  }
  
  String? get times {
    return _times;
  }
  
  String? get name {
    return _name;
  }
  
  String? get value {
    return _value;
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
  
  const CouponList._internal({required this.id, userType, usedBy, validity, times, name, value, baseType, createdAt, updatedAt}): _userType = userType, _usedBy = usedBy, _validity = validity, _times = times, _name = name, _value = value, _baseType = baseType, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory CouponList({String? id, List<String>? userType, List<String>? usedBy, TemporalDateTime? validity, String? times, String? name, String? value, String? baseType}) {
    return CouponList._internal(
      id: id == null ? UUID.getUUID() : id,
      userType: userType != null ? List<String>.unmodifiable(userType) : userType,
      usedBy: usedBy != null ? List<String>.unmodifiable(usedBy) : usedBy,
      validity: validity,
      times: times,
      name: name,
      value: value,
      baseType: baseType);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CouponList &&
      id == other.id &&
      DeepCollectionEquality().equals(_userType, other._userType) &&
      DeepCollectionEquality().equals(_usedBy, other._usedBy) &&
      _validity == other._validity &&
      _times == other._times &&
      _name == other._name &&
      _value == other._value &&
      _baseType == other._baseType;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("CouponList {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("userType=" + (_userType != null ? _userType!.toString() : "null") + ", ");
    buffer.write("usedBy=" + (_usedBy != null ? _usedBy!.toString() : "null") + ", ");
    buffer.write("validity=" + (_validity != null ? _validity!.format() : "null") + ", ");
    buffer.write("times=" + "$_times" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("value=" + "$_value" + ", ");
    buffer.write("baseType=" + "$_baseType" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  CouponList copyWith({String? id, List<String>? userType, List<String>? usedBy, TemporalDateTime? validity, String? times, String? name, String? value, String? baseType}) {
    return CouponList._internal(
      id: id ?? this.id,
      userType: userType ?? this.userType,
      usedBy: usedBy ?? this.usedBy,
      validity: validity ?? this.validity,
      times: times ?? this.times,
      name: name ?? this.name,
      value: value ?? this.value,
      baseType: baseType ?? this.baseType);
  }
  
  CouponList.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _userType = json['userType']?.cast<String>(),
      _usedBy = json['usedBy']?.cast<String>(),
      _validity = json['validity'] != null ? TemporalDateTime.fromString(json['validity']) : null,
      _times = json['times'],
      _name = json['name'],
      _value = json['value'],
      _baseType = json['baseType'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'userType': _userType, 'usedBy': _usedBy, 'validity': _validity?.format(), 'times': _times, 'name': _name, 'value': _value, 'baseType': _baseType, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "couponList.id");
  static final QueryField USERTYPE = QueryField(fieldName: "userType");
  static final QueryField USEDBY = QueryField(fieldName: "usedBy");
  static final QueryField VALIDITY = QueryField(fieldName: "validity");
  static final QueryField TIMES = QueryField(fieldName: "times");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField VALUE = QueryField(fieldName: "value");
  static final QueryField BASETYPE = QueryField(fieldName: "baseType");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "CouponList";
    modelSchemaDefinition.pluralName = "CouponLists";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CouponList.USERTYPE,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CouponList.USEDBY,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CouponList.VALIDITY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CouponList.TIMES,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CouponList.NAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CouponList.VALUE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CouponList.BASETYPE,
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

class _CouponListModelType extends ModelType<CouponList> {
  const _CouponListModelType();
  
  @override
  CouponList fromJson(Map<String, dynamic> jsonData) {
    return CouponList.fromJson(jsonData);
  }
}