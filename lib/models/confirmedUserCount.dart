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
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the confirmedUserCount type in your schema. */
@immutable
class confirmedUserCount extends Model {
  static const classType = const _confirmedUserCountModelType();
  final String id;
  final int? _confirmedUsers;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  int? get confirmedUsers {
    return _confirmedUsers;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const confirmedUserCount._internal({required this.id, confirmedUsers, createdAt, updatedAt}): _confirmedUsers = confirmedUsers, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory confirmedUserCount({String? id, int? confirmedUsers}) {
    return confirmedUserCount._internal(
      id: id == null ? UUID.getUUID() : id,
      confirmedUsers: confirmedUsers);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is confirmedUserCount &&
      id == other.id &&
      _confirmedUsers == other._confirmedUsers;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("confirmedUserCount {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("confirmedUsers=" + (_confirmedUsers != null ? _confirmedUsers!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  confirmedUserCount copyWith({String? id, int? confirmedUsers}) {
    return confirmedUserCount._internal(
      id: id ?? this.id,
      confirmedUsers: confirmedUsers ?? this.confirmedUsers);
  }
  
  confirmedUserCount.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _confirmedUsers = (json['confirmedUsers'] as num?)?.toInt(),
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'confirmedUsers': _confirmedUsers, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "confirmedUserCount.id");
  static final QueryField CONFIRMEDUSERS = QueryField(fieldName: "confirmedUsers");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "confirmedUserCount";
    modelSchemaDefinition.pluralName = "confirmedUserCounts";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: confirmedUserCount.CONFIRMEDUSERS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
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

class _confirmedUserCountModelType extends ModelType<confirmedUserCount> {
  const _confirmedUserCountModelType();
  
  @override
  confirmedUserCount fromJson(Map<String, dynamic> jsonData) {
    return confirmedUserCount.fromJson(jsonData);
  }
}