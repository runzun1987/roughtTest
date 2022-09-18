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


/** This is an auto generated class representing the FcmDeviceTopic type in your schema. */
@immutable
class FcmDeviceTopic extends Model {
  static const classType = const _FcmDeviceTopicModelType();
  final String id;
  final FcmDevice? _fcmDevices;
  final FcmTopic? _fcmTopics;
  final String? _baseType;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  FcmDevice? get fcmDevices {
    return _fcmDevices;
  }
  
  FcmTopic? get fcmTopics {
    return _fcmTopics;
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
  
  const FcmDeviceTopic._internal({required this.id, fcmDevices, fcmTopics, baseType, createdAt, updatedAt}): _fcmDevices = fcmDevices, _fcmTopics = fcmTopics, _baseType = baseType, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory FcmDeviceTopic({String? id, FcmDevice? fcmDevices, FcmTopic? fcmTopics, String? baseType}) {
    return FcmDeviceTopic._internal(
      id: id == null ? UUID.getUUID() : id,
      fcmDevices: fcmDevices,
      fcmTopics: fcmTopics,
      baseType: baseType);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FcmDeviceTopic &&
      id == other.id &&
      _fcmDevices == other._fcmDevices &&
      _fcmTopics == other._fcmTopics &&
      _baseType == other._baseType;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("FcmDeviceTopic {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("fcmDevices=" + (_fcmDevices != null ? _fcmDevices!.toString() : "null") + ", ");
    buffer.write("fcmTopics=" + (_fcmTopics != null ? _fcmTopics!.toString() : "null") + ", ");
    buffer.write("baseType=" + "$_baseType" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  FcmDeviceTopic copyWith({String? id, FcmDevice? fcmDevices, FcmTopic? fcmTopics, String? baseType}) {
    return FcmDeviceTopic._internal(
      id: id ?? this.id,
      fcmDevices: fcmDevices ?? this.fcmDevices,
      fcmTopics: fcmTopics ?? this.fcmTopics,
      baseType: baseType ?? this.baseType);
  }
  
  FcmDeviceTopic.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _fcmDevices = json['fcmDevices']?['serializedData'] != null
        ? FcmDevice.fromJson(new Map<String, dynamic>.from(json['fcmDevices']['serializedData']))
        : null,
      _fcmTopics = json['fcmTopics']?['serializedData'] != null
        ? FcmTopic.fromJson(new Map<String, dynamic>.from(json['fcmTopics']['serializedData']))
        : null,
      _baseType = json['baseType'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'fcmDevices': _fcmDevices?.toJson(), 'fcmTopics': _fcmTopics?.toJson(), 'baseType': _baseType, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "fcmDeviceTopic.id");
  static final QueryField FCMDEVICES = QueryField(
    fieldName: "fcmDevices",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (FcmDevice).toString()));
  static final QueryField FCMTOPICS = QueryField(
    fieldName: "fcmTopics",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (FcmTopic).toString()));
  static final QueryField BASETYPE = QueryField(fieldName: "baseType");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "FcmDeviceTopic";
    modelSchemaDefinition.pluralName = "FcmDeviceTopics";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: FcmDeviceTopic.FCMDEVICES,
      isRequired: false,
      targetName: "fcmDeviceID",
      ofModelName: (FcmDevice).toString()
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: FcmDeviceTopic.FCMTOPICS,
      isRequired: false,
      targetName: "fcmTopicID",
      ofModelName: (FcmTopic).toString()
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: FcmDeviceTopic.BASETYPE,
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

class _FcmDeviceTopicModelType extends ModelType<FcmDeviceTopic> {
  const _FcmDeviceTopicModelType();
  
  @override
  FcmDeviceTopic fromJson(Map<String, dynamic> jsonData) {
    return FcmDeviceTopic.fromJson(jsonData);
  }
}