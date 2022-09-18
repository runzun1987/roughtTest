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


/** This is an auto generated class representing the UserWishList type in your schema. */
@immutable
class UserWishList extends Model {
  static const classType = const _UserWishListModelType();
  final String id;
  final String? _userPhone;
  final String? _productId;
  final String? _provider;
  final String? _title;
  final String? _price;
  final String? _image;
  final String? _isPublic;
  final String? _baseType;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get userPhone {
    return _userPhone;
  }
  
  String? get productId {
    return _productId;
  }
  
  String? get provider {
    return _provider;
  }
  
  String? get title {
    return _title;
  }
  
  String? get price {
    return _price;
  }
  
  String? get image {
    return _image;
  }
  
  String? get isPublic {
    return _isPublic;
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
  
  const UserWishList._internal({required this.id, userPhone, productId, provider, title, price, image, isPublic, baseType, createdAt, updatedAt}): _userPhone = userPhone, _productId = productId, _provider = provider, _title = title, _price = price, _image = image, _isPublic = isPublic, _baseType = baseType, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory UserWishList({String? id, String? userPhone, String? productId, String? provider, String? title, String? price, String? image, String? isPublic, String? baseType}) {
    return UserWishList._internal(
      id: id == null ? UUID.getUUID() : id,
      userPhone: userPhone,
      productId: productId,
      provider: provider,
      title: title,
      price: price,
      image: image,
      isPublic: isPublic,
      baseType: baseType);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserWishList &&
      id == other.id &&
      _userPhone == other._userPhone &&
      _productId == other._productId &&
      _provider == other._provider &&
      _title == other._title &&
      _price == other._price &&
      _image == other._image &&
      _isPublic == other._isPublic &&
      _baseType == other._baseType;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("UserWishList {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("userPhone=" + "$_userPhone" + ", ");
    buffer.write("productId=" + "$_productId" + ", ");
    buffer.write("provider=" + "$_provider" + ", ");
    buffer.write("title=" + "$_title" + ", ");
    buffer.write("price=" + "$_price" + ", ");
    buffer.write("image=" + "$_image" + ", ");
    buffer.write("isPublic=" + "$_isPublic" + ", ");
    buffer.write("baseType=" + "$_baseType" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  UserWishList copyWith({String? id, String? userPhone, String? productId, String? provider, String? title, String? price, String? image, String? isPublic, String? baseType}) {
    return UserWishList._internal(
      id: id ?? this.id,
      userPhone: userPhone ?? this.userPhone,
      productId: productId ?? this.productId,
      provider: provider ?? this.provider,
      title: title ?? this.title,
      price: price ?? this.price,
      image: image ?? this.image,
      isPublic: isPublic ?? this.isPublic,
      baseType: baseType ?? this.baseType);
  }
  
  UserWishList.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _userPhone = json['userPhone'],
      _productId = json['productId'],
      _provider = json['provider'],
      _title = json['title'],
      _price = json['price'],
      _image = json['image'],
      _isPublic = json['isPublic'],
      _baseType = json['baseType'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'userPhone': _userPhone, 'productId': _productId, 'provider': _provider, 'title': _title, 'price': _price, 'image': _image, 'isPublic': _isPublic, 'baseType': _baseType, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "userWishList.id");
  static final QueryField USERPHONE = QueryField(fieldName: "userPhone");
  static final QueryField PRODUCTID = QueryField(fieldName: "productId");
  static final QueryField PROVIDER = QueryField(fieldName: "provider");
  static final QueryField TITLE = QueryField(fieldName: "title");
  static final QueryField PRICE = QueryField(fieldName: "price");
  static final QueryField IMAGE = QueryField(fieldName: "image");
  static final QueryField ISPUBLIC = QueryField(fieldName: "isPublic");
  static final QueryField BASETYPE = QueryField(fieldName: "baseType");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "UserWishList";
    modelSchemaDefinition.pluralName = "UserWishLists";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: UserWishList.USERPHONE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: UserWishList.PRODUCTID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: UserWishList.PROVIDER,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: UserWishList.TITLE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: UserWishList.PRICE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: UserWishList.IMAGE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: UserWishList.ISPUBLIC,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: UserWishList.BASETYPE,
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

class _UserWishListModelType extends ModelType<UserWishList> {
  const _UserWishListModelType();
  
  @override
  UserWishList fromJson(Map<String, dynamic> jsonData) {
    return UserWishList.fromJson(jsonData);
  }
}