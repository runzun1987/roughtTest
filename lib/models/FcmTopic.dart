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


/** This is an auto generated class representing the FcmTopic type in your schema. */
@immutable
class FcmTopic extends Model {
  static const classType = const _FcmTopicModelType();
  final String id;
  final String? _name;
  final String? _baseType;
  final List<FcmDeviceTopic>? _FcmDeviceID;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get name {
    return _name;
  }
  
  String? get baseType {
    return _baseType;
  }
  
  List<FcmDeviceTopic>? get FcmDeviceID {
    return _FcmDeviceID;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const FcmTopic._internal({required this.id, name, baseType, FcmDeviceID, createdAt, updatedAt}): _name = name, _baseType = baseType, _FcmDeviceID = FcmDeviceID, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory FcmTopic({String? id, String? name, String? baseType, List<FcmDeviceTopic>? FcmDeviceID}) {
    return FcmTopic._internal(
      id: id == null ? UUID.getUUID() : id,
      name: name,
      baseType: baseType,
      FcmDeviceID: FcmDeviceID != null ? List<FcmDeviceTopic>.unmodifiable(FcmDeviceID) : FcmDeviceID);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FcmTopic &&
      id == other.id &&
      _name == other._name &&
      _baseType == other._baseType &&
      DeepCollectionEquality().equals(_FcmDeviceID, other._FcmDeviceID);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("FcmTopic {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("baseType=" + "$_baseType" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  FcmTopic copyWith({String? id, String? name, String? baseType, List<FcmDeviceTopic>? FcmDeviceID}) {
    return FcmTopic._internal(
      id: id ?? this.id,
      name: name ?? this.name,
      baseType: baseType ?? this.baseType,
      FcmDeviceID: FcmDeviceID ?? this.FcmDeviceID);
  }
  
  FcmTopic.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _baseType = json['baseType'],
      _FcmDeviceID = json['FcmDeviceID'] is List
        ? (json['FcmDeviceID'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => FcmDeviceTopic.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'baseType': _baseType, 'FcmDeviceID': _FcmDeviceID?.map((FcmDeviceTopic? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "fcmTopic.id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField BASETYPE = QueryField(fieldName: "baseType");
  static final QueryField FCMDEVICEID = QueryField(
    fieldName: "FcmDeviceID",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (FcmDeviceTopic).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "FcmTopic";
    modelSchemaDefinition.pluralName = "FcmTopics";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: FcmTopic.NAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: FcmTopic.BASETYPE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: FcmTopic.FCMDEVICEID,
      isRequired: false,
      ofModelName: (FcmDeviceTopic).toString(),
      associatedKey: FcmDeviceTopic.FCMTOPICS
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

class _FcmTopicModelType extends ModelType<FcmTopic> {
  const _FcmTopicModelType();
  
  @override
  FcmTopic fromJson(Map<String, dynamic> jsonData) {
    return FcmTopic.fromJson(jsonData);
  }
}