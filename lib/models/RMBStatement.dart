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


/** This is an auto generated class representing the RMBStatement type in your schema. */
@immutable
class RMBStatement extends Model {
  static const classType = const _RMBStatementModelType();
  final String id;
  final String? _createdAt;
  final String? _type;
  final String? _userName;
  final int? _amount;
  final int? _remainingBal;
  final int? _prevBal;
  final String? _orderID;
  final String? _productTitle;
  final String? _note;
  final String? _baseType;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String get createdAt {
    try {
      return _createdAt!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get type {
    try {
      return _type!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get userName {
    try {
      return _userName!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get amount {
    try {
      return _amount!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get remainingBal {
    try {
      return _remainingBal!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get prevBal {
    try {
      return _prevBal!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get orderID {
    try {
      return _orderID!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get productTitle {
    try {
      return _productTitle!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get note {
    try {
      return _note!;
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
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const RMBStatement._internal({required this.id, required createdAt, required type, required userName, required amount, required remainingBal, required prevBal, required orderID, required productTitle, required note, baseType, updatedAt}): _createdAt = createdAt, _type = type, _userName = userName, _amount = amount, _remainingBal = remainingBal, _prevBal = prevBal, _orderID = orderID, _productTitle = productTitle, _note = note, _baseType = baseType, _updatedAt = updatedAt;
  
  factory RMBStatement({String? id, required String createdAt, required String type, required String userName, required int amount, required int remainingBal, required int prevBal, required String orderID, required String productTitle, required String note, String? baseType}) {
    return RMBStatement._internal(
      id: id == null ? UUID.getUUID() : id,
      createdAt: createdAt,
      type: type,
      userName: userName,
      amount: amount,
      remainingBal: remainingBal,
      prevBal: prevBal,
      orderID: orderID,
      productTitle: productTitle,
      note: note,
      baseType: baseType);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RMBStatement &&
      id == other.id &&
      _createdAt == other._createdAt &&
      _type == other._type &&
      _userName == other._userName &&
      _amount == other._amount &&
      _remainingBal == other._remainingBal &&
      _prevBal == other._prevBal &&
      _orderID == other._orderID &&
      _productTitle == other._productTitle &&
      _note == other._note &&
      _baseType == other._baseType;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("RMBStatement {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("createdAt=" + "$_createdAt" + ", ");
    buffer.write("type=" + "$_type" + ", ");
    buffer.write("userName=" + "$_userName" + ", ");
    buffer.write("amount=" + (_amount != null ? _amount!.toString() : "null") + ", ");
    buffer.write("remainingBal=" + (_remainingBal != null ? _remainingBal!.toString() : "null") + ", ");
    buffer.write("prevBal=" + (_prevBal != null ? _prevBal!.toString() : "null") + ", ");
    buffer.write("orderID=" + "$_orderID" + ", ");
    buffer.write("productTitle=" + "$_productTitle" + ", ");
    buffer.write("note=" + "$_note" + ", ");
    buffer.write("baseType=" + "$_baseType" + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  RMBStatement copyWith({String? id, String? createdAt, String? type, String? userName, int? amount, int? remainingBal, int? prevBal, String? orderID, String? productTitle, String? note, String? baseType}) {
    return RMBStatement._internal(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      type: type ?? this.type,
      userName: userName ?? this.userName,
      amount: amount ?? this.amount,
      remainingBal: remainingBal ?? this.remainingBal,
      prevBal: prevBal ?? this.prevBal,
      orderID: orderID ?? this.orderID,
      productTitle: productTitle ?? this.productTitle,
      note: note ?? this.note,
      baseType: baseType ?? this.baseType);
  }
  
  RMBStatement.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _createdAt = json['createdAt'],
      _type = json['type'],
      _userName = json['userName'],
      _amount = (json['amount'] as num?)?.toInt(),
      _remainingBal = (json['remainingBal'] as num?)?.toInt(),
      _prevBal = (json['prevBal'] as num?)?.toInt(),
      _orderID = json['orderID'],
      _productTitle = json['productTitle'],
      _note = json['note'],
      _baseType = json['baseType'],
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'createdAt': _createdAt, 'type': _type, 'userName': _userName, 'amount': _amount, 'remainingBal': _remainingBal, 'prevBal': _prevBal, 'orderID': _orderID, 'productTitle': _productTitle, 'note': _note, 'baseType': _baseType, 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "rMBStatement.id");
  static final QueryField CREATEDAT = QueryField(fieldName: "createdAt");
  static final QueryField TYPE = QueryField(fieldName: "type");
  static final QueryField USERNAME = QueryField(fieldName: "userName");
  static final QueryField AMOUNT = QueryField(fieldName: "amount");
  static final QueryField REMAININGBAL = QueryField(fieldName: "remainingBal");
  static final QueryField PREVBAL = QueryField(fieldName: "prevBal");
  static final QueryField ORDERID = QueryField(fieldName: "orderID");
  static final QueryField PRODUCTTITLE = QueryField(fieldName: "productTitle");
  static final QueryField NOTE = QueryField(fieldName: "note");
  static final QueryField BASETYPE = QueryField(fieldName: "baseType");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "RMBStatement";
    modelSchemaDefinition.pluralName = "RMBStatements";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: RMBStatement.CREATEDAT,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: RMBStatement.TYPE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: RMBStatement.USERNAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: RMBStatement.AMOUNT,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: RMBStatement.REMAININGBAL,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: RMBStatement.PREVBAL,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: RMBStatement.ORDERID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: RMBStatement.PRODUCTTITLE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: RMBStatement.NOTE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: RMBStatement.BASETYPE,
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

class _RMBStatementModelType extends ModelType<RMBStatement> {
  const _RMBStatementModelType();
  
  @override
  RMBStatement fromJson(Map<String, dynamic> jsonData) {
    return RMBStatement.fromJson(jsonData);
  }
}