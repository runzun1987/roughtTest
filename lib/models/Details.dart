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


/** This is an auto generated class representing the Details type in your schema. */
@immutable
class Details {
  final String? _name;
  final String? _pic_url;
  final String? _prop_key;
  final String? _value;
  final String? _prop_val;

  String? get name {
    return _name;
  }
  
  String? get pic_url {
    return _pic_url;
  }
  
  String? get prop_key {
    return _prop_key;
  }
  
  String? get value {
    return _value;
  }
  
  String? get prop_val {
    return _prop_val;
  }
  
  const Details._internal({name, pic_url, prop_key, value, prop_val}): _name = name, _pic_url = pic_url, _prop_key = prop_key, _value = value, _prop_val = prop_val;
  
  factory Details({String? name, String? pic_url, String? prop_key, String? value, String? prop_val}) {
    return Details._internal(
      name: name,
      pic_url: pic_url,
      prop_key: prop_key,
      value: value,
      prop_val: prop_val);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Details &&
      _name == other._name &&
      _pic_url == other._pic_url &&
      _prop_key == other._prop_key &&
      _value == other._value &&
      _prop_val == other._prop_val;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Details {");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("pic_url=" + "$_pic_url" + ", ");
    buffer.write("prop_key=" + "$_prop_key" + ", ");
    buffer.write("value=" + "$_value" + ", ");
    buffer.write("prop_val=" + "$_prop_val");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Details copyWith({String? name, String? pic_url, String? prop_key, String? value, String? prop_val}) {
    return Details._internal(
      name: name ?? this.name,
      pic_url: pic_url ?? this.pic_url,
      prop_key: prop_key ?? this.prop_key,
      value: value ?? this.value,
      prop_val: prop_val ?? this.prop_val);
  }
  
  Details.fromJson(Map<String, dynamic> json)  
    : _name = json['name'],
      _pic_url = json['pic_url'],
      _prop_key = json['prop_key'],
      _value = json['value'],
      _prop_val = json['prop_val'];
  
  Map<String, dynamic> toJson() => {
    'name': _name, 'pic_url': _pic_url, 'prop_key': _prop_key, 'value': _value, 'prop_val': _prop_val
  };

  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Details";
    modelSchemaDefinition.pluralName = "Details";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'name',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'pic_url',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'prop_key',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'value',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'prop_val',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}