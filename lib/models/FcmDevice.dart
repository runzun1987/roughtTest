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


/** This is an auto generated class representing the FcmDevice type in your schema. */
@immutable
class FcmDevice extends Model {
  static const classType = const _FcmDeviceModelType();
  final String id;
  final String? _deviceId;
  final String? _userPhone;
  final String? _baseType;
  final List<FcmDeviceTopic>? _fcmTopics;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get deviceId {
    return _deviceId;
  }
  
  String? get userPhone {
    return _userPhone;
  }
  
  String? get baseType {
    return _baseType;
  }
  
  List<FcmDeviceTopic>? get fcmTopics {
    return _fcmTopics;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const FcmDevice._internal({required this.id, deviceId, userPhone, baseType, fcmTopics, createdAt, updatedAt}): _deviceId = deviceId, _userPhone = userPhone, _baseType = baseType, _fcmTopics = fcmTopics, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory FcmDevice({String? id, String? deviceId, String? userPhone, String? baseType, List<FcmDeviceTopic>? fcmTopics}) {
    return FcmDevice._internal(
      id: id == null ? UUID.getUUID() : id,
      deviceId: deviceId,
      userPhone: userPhone,
      baseType: baseType,
      fcmTopics: fcmTopics != null ? List<FcmDeviceTopic>.unmodifiable(fcmTopics) : fcmTopics);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FcmDevice &&
      id == other.id &&
      _deviceId == other._deviceId &&
      _userPhone == other._userPhone &&
      _baseType == other._baseType &&
      DeepCollectionEquality().equals(_fcmTopics, other._fcmTopics);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("FcmDevice {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("deviceId=" + "$_deviceId" + ", ");
    buffer.write("userPhone=" + "$_userPhone" + ", ");
    buffer.write("baseType=" + "$_baseType" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  FcmDevice copyWith({String? id, String? deviceId, String? userPhone, String? baseType, List<FcmDeviceTopic>? fcmTopics}) {
    return FcmDevice._internal(
      id: id ?? this.id,
      deviceId: deviceId ?? this.deviceId,
      userPhone: userPhone ?? this.userPhone,
      baseType: baseType ?? this.baseType,
      fcmTopics: fcmTopics ?? this.fcmTopics);
  }
  
  FcmDevice.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _deviceId = json['deviceId'],
      _userPhone = json['userPhone'],
      _baseType = json['baseType'],
      _fcmTopics = json['fcmTopics'] is List
        ? (json['fcmTopics'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => FcmDeviceTopic.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'deviceId': _deviceId, 'userPhone': _userPhone, 'baseType': _baseType, 'fcmTopics': _fcmTopics?.map((FcmDeviceTopic? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "fcmDevice.id");
  static final QueryField DEVICEID = QueryField(fieldName: "deviceId");
  static final QueryField USERPHONE = QueryField(fieldName: "userPhone");
  static final QueryField BASETYPE = QueryField(fieldName: "baseType");
  static final QueryField FCMTOPICS = QueryField(
    fieldName: "fcmTopics",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (FcmDeviceTopic).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "FcmDevice";
    modelSchemaDefinition.pluralName = "FcmDevices";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: FcmDevice.DEVICEID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: FcmDevice.USERPHONE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: FcmDevice.BASETYPE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: FcmDevice.FCMTOPICS,
      isRequired: false,
      ofModelName: (FcmDeviceTopic).toString(),
      associatedKey: FcmDeviceTopic.FCMDEVICES
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

class _FcmDeviceModelType extends ModelType<FcmDevice> {
  const _FcmDeviceModelType();
  
  @override
  FcmDevice fromJson(Map<String, dynamic> jsonData) {
    return FcmDevice.fromJson(jsonData);
  }
}