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


/** This is an auto generated class representing the user type in your schema. */
@immutable
class user extends Model {
  static const classType = const _userModelType();
  final String id;
  final String? _country;
  final bool? _email_verified;
  final String? _firstName;
  final String? _street;
  final String? _town;
  final String? _lastName;
  final bool? _phone_verified;
  final String? _phone;
  final String? _email;
  final String? _userName;
  final String? _userStatus;
  final TemporalDateTime? _createdAt;
  final String? _baseType;
  final List<Order>? _orders;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get country {
    return _country;
  }
  
  bool? get email_verified {
    return _email_verified;
  }
  
  String? get firstName {
    return _firstName;
  }
  
  String? get street {
    return _street;
  }
  
  String? get town {
    return _town;
  }
  
  String? get lastName {
    return _lastName;
  }
  
  bool? get phone_verified {
    return _phone_verified;
  }
  
  String get phone {
    try {
      return _phone!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get email {
    try {
      return _email!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get userName {
    return _userName;
  }
  
  String? get userStatus {
    return _userStatus;
  }
  
  TemporalDateTime get createdAt {
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
  
  String? get baseType {
    return _baseType;
  }
  
  List<Order>? get orders {
    return _orders;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const user._internal({required this.id, country, email_verified, firstName, street, town, lastName, phone_verified, required phone, required email, userName, userStatus, required createdAt, baseType, orders, updatedAt}): _country = country, _email_verified = email_verified, _firstName = firstName, _street = street, _town = town, _lastName = lastName, _phone_verified = phone_verified, _phone = phone, _email = email, _userName = userName, _userStatus = userStatus, _createdAt = createdAt, _baseType = baseType, _orders = orders, _updatedAt = updatedAt;
  
  factory user({String? id, String? country, bool? email_verified, String? firstName, String? street, String? town, String? lastName, bool? phone_verified, required String phone, required String email, String? userName, String? userStatus, required TemporalDateTime createdAt, String? baseType, List<Order>? orders}) {
    return user._internal(
      id: id == null ? UUID.getUUID() : id,
      country: country,
      email_verified: email_verified,
      firstName: firstName,
      street: street,
      town: town,
      lastName: lastName,
      phone_verified: phone_verified,
      phone: phone,
      email: email,
      userName: userName,
      userStatus: userStatus,
      createdAt: createdAt,
      baseType: baseType,
      orders: orders != null ? List<Order>.unmodifiable(orders) : orders);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is user &&
      id == other.id &&
      _country == other._country &&
      _email_verified == other._email_verified &&
      _firstName == other._firstName &&
      _street == other._street &&
      _town == other._town &&
      _lastName == other._lastName &&
      _phone_verified == other._phone_verified &&
      _phone == other._phone &&
      _email == other._email &&
      _userName == other._userName &&
      _userStatus == other._userStatus &&
      _createdAt == other._createdAt &&
      _baseType == other._baseType &&
      DeepCollectionEquality().equals(_orders, other._orders);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("user {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("country=" + "$_country" + ", ");
    buffer.write("email_verified=" + (_email_verified != null ? _email_verified!.toString() : "null") + ", ");
    buffer.write("firstName=" + "$_firstName" + ", ");
    buffer.write("street=" + "$_street" + ", ");
    buffer.write("town=" + "$_town" + ", ");
    buffer.write("lastName=" + "$_lastName" + ", ");
    buffer.write("phone_verified=" + (_phone_verified != null ? _phone_verified!.toString() : "null") + ", ");
    buffer.write("phone=" + "$_phone" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("userName=" + "$_userName" + ", ");
    buffer.write("userStatus=" + "$_userStatus" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("baseType=" + "$_baseType" + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  user copyWith({String? id, String? country, bool? email_verified, String? firstName, String? street, String? town, String? lastName, bool? phone_verified, String? phone, String? email, String? userName, String? userStatus, TemporalDateTime? createdAt, String? baseType, List<Order>? orders}) {
    return user._internal(
      id: id ?? this.id,
      country: country ?? this.country,
      email_verified: email_verified ?? this.email_verified,
      firstName: firstName ?? this.firstName,
      street: street ?? this.street,
      town: town ?? this.town,
      lastName: lastName ?? this.lastName,
      phone_verified: phone_verified ?? this.phone_verified,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      userName: userName ?? this.userName,
      userStatus: userStatus ?? this.userStatus,
      createdAt: createdAt ?? this.createdAt,
      baseType: baseType ?? this.baseType,
      orders: orders ?? this.orders);
  }
  
  user.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _country = json['country'],
      _email_verified = json['email_verified'],
      _firstName = json['firstName'],
      _street = json['street'],
      _town = json['town'],
      _lastName = json['lastName'],
      _phone_verified = json['phone_verified'],
      _phone = json['phone'],
      _email = json['email'],
      _userName = json['userName'],
      _userStatus = json['userStatus'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _baseType = json['baseType'],
      _orders = json['orders'] is List
        ? (json['orders'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Order.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'country': _country, 'email_verified': _email_verified, 'firstName': _firstName, 'street': _street, 'town': _town, 'lastName': _lastName, 'phone_verified': _phone_verified, 'phone': _phone, 'email': _email, 'userName': _userName, 'userStatus': _userStatus, 'createdAt': _createdAt?.format(), 'baseType': _baseType, 'orders': _orders?.map((Order? e) => e?.toJson()).toList(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "user.id");
  static final QueryField COUNTRY = QueryField(fieldName: "country");
  static final QueryField EMAIL_VERIFIED = QueryField(fieldName: "email_verified");
  static final QueryField FIRSTNAME = QueryField(fieldName: "firstName");
  static final QueryField STREET = QueryField(fieldName: "street");
  static final QueryField TOWN = QueryField(fieldName: "town");
  static final QueryField LASTNAME = QueryField(fieldName: "lastName");
  static final QueryField PHONE_VERIFIED = QueryField(fieldName: "phone_verified");
  static final QueryField PHONE = QueryField(fieldName: "phone");
  static final QueryField EMAIL = QueryField(fieldName: "email");
  static final QueryField USERNAME = QueryField(fieldName: "userName");
  static final QueryField USERSTATUS = QueryField(fieldName: "userStatus");
  static final QueryField CREATEDAT = QueryField(fieldName: "createdAt");
  static final QueryField BASETYPE = QueryField(fieldName: "baseType");
  static final QueryField ORDERS = QueryField(
    fieldName: "orders",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Order).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "user";
    modelSchemaDefinition.pluralName = "users";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: user.COUNTRY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: user.EMAIL_VERIFIED,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: user.FIRSTNAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: user.STREET,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: user.TOWN,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: user.LASTNAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: user.PHONE_VERIFIED,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: user.PHONE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: user.EMAIL,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: user.USERNAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: user.USERSTATUS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: user.CREATEDAT,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: user.BASETYPE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: user.ORDERS,
      isRequired: false,
      ofModelName: (Order).toString(),
      associatedKey: Order.USERORDER
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _userModelType extends ModelType<user> {
  const _userModelType();
  
  @override
  user fromJson(Map<String, dynamic> jsonData) {
    return user.fromJson(jsonData);
  }
}