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


/** This is an auto generated class representing the ScrapDetail type in your schema. */
@immutable
class ScrapDetail extends Model {
  static const classType = const _ScrapDetailModelType();
  final String id;
  final TemporalDateTime? _started;
  final String? _currentStatus;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  TemporalDateTime? get started {
    return _started;
  }
  
  String? get currentStatus {
    return _currentStatus;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const ScrapDetail._internal({required this.id, started, currentStatus, createdAt, updatedAt}): _started = started, _currentStatus = currentStatus, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory ScrapDetail({String? id, TemporalDateTime? started, String? currentStatus}) {
    return ScrapDetail._internal(
      id: id == null ? UUID.getUUID() : id,
      started: started,
      currentStatus: currentStatus);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ScrapDetail &&
      id == other.id &&
      _started == other._started &&
      _currentStatus == other._currentStatus;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("ScrapDetail {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("started=" + (_started != null ? _started!.format() : "null") + ", ");
    buffer.write("currentStatus=" + "$_currentStatus" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  ScrapDetail copyWith({String? id, TemporalDateTime? started, String? currentStatus}) {
    return ScrapDetail._internal(
      id: id ?? this.id,
      started: started ?? this.started,
      currentStatus: currentStatus ?? this.currentStatus);
  }
  
  ScrapDetail.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _started = json['started'] != null ? TemporalDateTime.fromString(json['started']) : null,
      _currentStatus = json['currentStatus'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'started': _started?.format(), 'currentStatus': _currentStatus, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "scrapDetail.id");
  static final QueryField STARTED = QueryField(fieldName: "started");
  static final QueryField CURRENTSTATUS = QueryField(fieldName: "currentStatus");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "ScrapDetail";
    modelSchemaDefinition.pluralName = "ScrapDetails";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ScrapDetail.STARTED,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ScrapDetail.CURRENTSTATUS,
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

class _ScrapDetailModelType extends ModelType<ScrapDetail> {
  const _ScrapDetailModelType();
  
  @override
  ScrapDetail fromJson(Map<String, dynamic> jsonData) {
    return ScrapDetail.fromJson(jsonData);
  }
}