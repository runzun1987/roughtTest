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


/** This is an auto generated class representing the Expenses type in your schema. */
@immutable
class Expenses extends Model {
  static const classType = const _ExpensesModelType();
  final String id;
  final TemporalDateTime? _createdAt;
  final String? _description;
  final int? _amount;
  final String? _type;
  final String? _baseType;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  String? get description {
    return _description;
  }
  
  int? get amount {
    return _amount;
  }
  
  String? get type {
    return _type;
  }
  
  String? get baseType {
    return _baseType;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Expenses._internal({required this.id, createdAt, description, amount, type, baseType, updatedAt}): _createdAt = createdAt, _description = description, _amount = amount, _type = type, _baseType = baseType, _updatedAt = updatedAt;
  
  factory Expenses({String? id, TemporalDateTime? createdAt, String? description, int? amount, String? type, String? baseType}) {
    return Expenses._internal(
      id: id == null ? UUID.getUUID() : id,
      createdAt: createdAt,
      description: description,
      amount: amount,
      type: type,
      baseType: baseType);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Expenses &&
      id == other.id &&
      _createdAt == other._createdAt &&
      _description == other._description &&
      _amount == other._amount &&
      _type == other._type &&
      _baseType == other._baseType;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Expenses {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("amount=" + (_amount != null ? _amount!.toString() : "null") + ", ");
    buffer.write("type=" + "$_type" + ", ");
    buffer.write("baseType=" + "$_baseType" + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Expenses copyWith({String? id, TemporalDateTime? createdAt, String? description, int? amount, String? type, String? baseType}) {
    return Expenses._internal(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      type: type ?? this.type,
      baseType: baseType ?? this.baseType);
  }
  
  Expenses.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _description = json['description'],
      _amount = (json['amount'] as num?)?.toInt(),
      _type = json['type'],
      _baseType = json['baseType'],
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'createdAt': _createdAt?.format(), 'description': _description, 'amount': _amount, 'type': _type, 'baseType': _baseType, 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "expenses.id");
  static final QueryField CREATEDAT = QueryField(fieldName: "createdAt");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static final QueryField AMOUNT = QueryField(fieldName: "amount");
  static final QueryField TYPE = QueryField(fieldName: "type");
  static final QueryField BASETYPE = QueryField(fieldName: "baseType");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Expenses";
    modelSchemaDefinition.pluralName = "Expenses";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Expenses.CREATEDAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Expenses.DESCRIPTION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Expenses.AMOUNT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Expenses.TYPE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Expenses.BASETYPE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _ExpensesModelType extends ModelType<Expenses> {
  const _ExpensesModelType();
  
  @override
  Expenses fromJson(Map<String, dynamic> jsonData) {
    return Expenses.fromJson(jsonData);
  }
}