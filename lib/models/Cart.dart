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

/** This is an auto generated class representing the Cart type in your schema. */
@immutable
class Cart extends Model {
  static const classType = const _CartModelType();
  final String id;
  final List<ProductInfo>? _items;
  final String? _userName;
  final String? _phoneNumber;
  final String? _baseType;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  List<ProductInfo>? get items {
    return _items;
  }

  String get userName {
    try {
      return _userName!;
    } catch (e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String? get phoneNumber {
    return _phoneNumber;
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

  const Cart._internal(
      {required this.id,
      items,
      required userName,
      phoneNumber,
      baseType,
      createdAt,
      updatedAt})
      : _items = items,
        _userName = userName,
        _phoneNumber = phoneNumber,
        _baseType = baseType,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  factory Cart(
      {String? id,
      List<ProductInfo>? items,
      required String userName,
      String? phoneNumber,
      String? baseType}) {
    return Cart._internal(
        id: id == null ? UUID.getUUID() : id,
        items: items != null ? List<ProductInfo>.unmodifiable(items) : items,
        userName: userName,
        phoneNumber: phoneNumber,
        baseType: baseType);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Cart &&
        id == other.id &&
        DeepCollectionEquality().equals(_items, other._items) &&
        _userName == other._userName &&
        _phoneNumber == other._phoneNumber &&
        _baseType == other._baseType;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Cart {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write(
        "items=" + (_items != null ? _items!.toString() : "null") + ", ");
    buffer.write("userName=" + "$_userName" + ", ");
    buffer.write("phoneNumber=" + "$_phoneNumber" + ", ");
    buffer.write("baseType=" + "$_baseType" + ", ");
    buffer.write("createdAt=" +
        (_createdAt != null ? _createdAt!.format() : "null") +
        ", ");
    buffer.write(
        "updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  Cart copyWith(
      {String? id,
      List<ProductInfo>? items,
      String? userName,
      String? phoneNumber,
      String? baseType}) {
    return Cart._internal(
        id: id ?? this.id,
        items: items ?? this.items,
        userName: userName ?? this.userName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        baseType: baseType ?? this.baseType);
  }

  Cart.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _items = json['items'] is List
            ? (json['items'] as List)
                .where((e) => e != null)
                .map((e) => ProductInfo.fromJson(new Map<String, dynamic>.from(
                    e['serializedData'] != null ? e['serializedData'] : e)))
                .toList()
            : null,
        _userName = json['userName'],
        _phoneNumber = json['phoneNumber'],
        _baseType = json['baseType'],
        _createdAt = json['createdAt'] != null
            ? TemporalDateTime.fromString(json['createdAt'])
            : null,
        _updatedAt = json['updatedAt'] != null
            ? TemporalDateTime.fromString(json['updatedAt'])
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'items': _items?.map((ProductInfo? e) => e?.toJson()).toList(),
        'userName': _userName,
        'phoneNumber': _phoneNumber,
        'baseType': _baseType,
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };

  static final QueryField ID = QueryField(fieldName: "cart.id");
  static final QueryField ITEMS = QueryField(fieldName: "items");
  static final QueryField USERNAME = QueryField(fieldName: "userName");
  static final QueryField PHONENUMBER = QueryField(fieldName: "phoneNumber");
  static final QueryField BASETYPE = QueryField(fieldName: "baseType");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Cart";
    modelSchemaDefinition.pluralName = "Carts";

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
        fieldName: 'items',
        isRequired: false,
        isArray: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.embeddedCollection,
            ofCustomTypeName: 'ProductInfo')));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Cart.USERNAME,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Cart.PHONENUMBER,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Cart.BASETYPE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
        fieldName: 'createdAt',
        isRequired: false,
        isReadOnly: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
        fieldName: 'updatedAt',
        isRequired: false,
        isReadOnly: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));
  });
}

class _CartModelType extends ModelType<Cart> {
  const _CartModelType();

  @override
  Cart fromJson(Map<String, dynamic> jsonData) {
    return Cart.fromJson(jsonData);
  }
}
