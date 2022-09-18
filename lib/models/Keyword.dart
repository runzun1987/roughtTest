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


/** This is an auto generated class representing the Keyword type in your schema. */
@immutable
class Keyword extends Model {
  static const classType = const _KeywordModelType();
  final String id;
  final int? _keywordCount;
  final String? _searchedKeyword;
  final String? _baseType;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  int get keywordCount {
    try {
      return _keywordCount!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get searchedKeyword {
    try {
      return _searchedKeyword!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
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
  
  const Keyword._internal({required this.id, required keywordCount, required searchedKeyword, baseType, createdAt, updatedAt}): _keywordCount = keywordCount, _searchedKeyword = searchedKeyword, _baseType = baseType, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Keyword({String? id, required int keywordCount, required String searchedKeyword, String? baseType}) {
    return Keyword._internal(
      id: id == null ? UUID.getUUID() : id,
      keywordCount: keywordCount,
      searchedKeyword: searchedKeyword,
      baseType: baseType);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Keyword &&
      id == other.id &&
      _keywordCount == other._keywordCount &&
      _searchedKeyword == other._searchedKeyword &&
      _baseType == other._baseType;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Keyword {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("keywordCount=" + (_keywordCount != null ? _keywordCount!.toString() : "null") + ", ");
    buffer.write("searchedKeyword=" + "$_searchedKeyword" + ", ");
    buffer.write("baseType=" + "$_baseType" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Keyword copyWith({String? id, int? keywordCount, String? searchedKeyword, String? baseType}) {
    return Keyword._internal(
      id: id ?? this.id,
      keywordCount: keywordCount ?? this.keywordCount,
      searchedKeyword: searchedKeyword ?? this.searchedKeyword,
      baseType: baseType ?? this.baseType);
  }
  
  Keyword.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _keywordCount = (json['keywordCount'] as num?)?.toInt(),
      _searchedKeyword = json['searchedKeyword'],
      _baseType = json['baseType'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'keywordCount': _keywordCount, 'searchedKeyword': _searchedKeyword, 'baseType': _baseType, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "keyword.id");
  static final QueryField KEYWORDCOUNT = QueryField(fieldName: "keywordCount");
  static final QueryField SEARCHEDKEYWORD = QueryField(fieldName: "searchedKeyword");
  static final QueryField BASETYPE = QueryField(fieldName: "baseType");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Keyword";
    modelSchemaDefinition.pluralName = "Keywords";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Keyword.KEYWORDCOUNT,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Keyword.SEARCHEDKEYWORD,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Keyword.BASETYPE,
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

class _KeywordModelType extends ModelType<Keyword> {
  const _KeywordModelType();
  
  @override
  Keyword fromJson(Map<String, dynamic> jsonData) {
    return Keyword.fromJson(jsonData);
  }
}