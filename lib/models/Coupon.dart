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


/** This is an auto generated class representing the Coupon type in your schema. */
@immutable
class Coupon extends Model {
  static const classType = const _CouponModelType();
  final String id;
  final String? _userName;
  final bool? _couponUsed;
  final String? _couponName;
  final int? _couponDiscount;
  final String? _baseType;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
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
  
  bool get couponUsed {
    try {
      return _couponUsed!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get couponName {
    try {
      return _couponName!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get couponDiscount {
    try {
      return _couponDiscount!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get baseType {
    try {
      return _baseType!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Coupon._internal({required this.id, required userName, required couponUsed, required couponName, required couponDiscount, required baseType, createdAt, updatedAt}): _userName = userName, _couponUsed = couponUsed, _couponName = couponName, _couponDiscount = couponDiscount, _baseType = baseType, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Coupon({String? id, required String userName, required bool couponUsed, required String couponName, required int couponDiscount, required String baseType}) {
    return Coupon._internal(
      id: id == null ? UUID.getUUID() : id,
      userName: userName,
      couponUsed: couponUsed,
      couponName: couponName,
      couponDiscount: couponDiscount,
      baseType: baseType);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Coupon &&
      id == other.id &&
      _userName == other._userName &&
      _couponUsed == other._couponUsed &&
      _couponName == other._couponName &&
      _couponDiscount == other._couponDiscount &&
      _baseType == other._baseType;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Coupon {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("userName=" + "$_userName" + ", ");
    buffer.write("couponUsed=" + (_couponUsed != null ? _couponUsed!.toString() : "null") + ", ");
    buffer.write("couponName=" + "$_couponName" + ", ");
    buffer.write("couponDiscount=" + (_couponDiscount != null ? _couponDiscount!.toString() : "null") + ", ");
    buffer.write("baseType=" + "$_baseType" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Coupon copyWith({String? id, String? userName, bool? couponUsed, String? couponName, int? couponDiscount, String? baseType}) {
    return Coupon._internal(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      couponUsed: couponUsed ?? this.couponUsed,
      couponName: couponName ?? this.couponName,
      couponDiscount: couponDiscount ?? this.couponDiscount,
      baseType: baseType ?? this.baseType);
  }
  
  Coupon.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _userName = json['userName'],
      _couponUsed = json['couponUsed'],
      _couponName = json['couponName'],
      _couponDiscount = (json['couponDiscount'] as num?)?.toInt(),
      _baseType = json['baseType'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'userName': _userName, 'couponUsed': _couponUsed, 'couponName': _couponName, 'couponDiscount': _couponDiscount, 'baseType': _baseType, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "coupon.id");
  static final QueryField USERNAME = QueryField(fieldName: "userName");
  static final QueryField COUPONUSED = QueryField(fieldName: "couponUsed");
  static final QueryField COUPONNAME = QueryField(fieldName: "couponName");
  static final QueryField COUPONDISCOUNT = QueryField(fieldName: "couponDiscount");
  static final QueryField BASETYPE = QueryField(fieldName: "baseType");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Coupon";
    modelSchemaDefinition.pluralName = "Coupons";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Coupon.USERNAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Coupon.COUPONUSED,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Coupon.COUPONNAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Coupon.COUPONDISCOUNT,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Coupon.BASETYPE,
      isRequired: true,
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

class _CouponModelType extends ModelType<Coupon> {
  const _CouponModelType();
  
  @override
  Coupon fromJson(Map<String, dynamic> jsonData) {
    return Coupon.fromJson(jsonData);
  }
}