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
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the freeShipping type in your schema. */
@immutable
class freeShipping extends Model {
  static const classType = const _freeShippingModelType();
  final String id;
  final String? _title;
  final List<String>? _smallImages;
  final String? _bigImageUrl;
  final String? _description;
  final int? _price;
  final bool? _adult;
  final int? _sellerShippingPrice;
  final String? _skus_json;
  final int? _stock;
  final String? _prop_obj;
  final String? _baseType;
  final String? _productId;
  final String? _provider;
  final String? _provider_slug;
  final String? _url;
  final String? _category;
  final String? _categoryId;
  final String? _subCategory;
  final String? _subCategoryId;
  final List<String>? _tags;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String get title {
    try {
      return _title!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<String> get smallImages {
    try {
      return _smallImages!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get bigImageUrl {
    try {
      return _bigImageUrl!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get description {
    try {
      return _description!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get price {
    try {
      return _price!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  bool get adult {
    try {
      return _adult!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get sellerShippingPrice {
    try {
      return _sellerShippingPrice!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get skus_json {
    try {
      return _skus_json!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get stock {
    try {
      return _stock!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get prop_obj {
    try {
      return _prop_obj!;
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
  
  String? get productId {
    return _productId;
  }
  
  String? get provider {
    return _provider;
  }
  
  String? get provider_slug {
    return _provider_slug;
  }
  
  String? get url {
    return _url;
  }
  
  String? get category {
    return _category;
  }
  
  String? get categoryId {
    return _categoryId;
  }
  
  String? get subCategory {
    return _subCategory;
  }
  
  String? get subCategoryId {
    return _subCategoryId;
  }
  
  List<String>? get tags {
    return _tags;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const freeShipping._internal({required this.id, required title, required smallImages, required bigImageUrl, required description, required price, required adult, required sellerShippingPrice, required skus_json, required stock, required prop_obj, required baseType, productId, provider, provider_slug, url, category, categoryId, subCategory, subCategoryId, tags, createdAt, updatedAt}): _title = title, _smallImages = smallImages, _bigImageUrl = bigImageUrl, _description = description, _price = price, _adult = adult, _sellerShippingPrice = sellerShippingPrice, _skus_json = skus_json, _stock = stock, _prop_obj = prop_obj, _baseType = baseType, _productId = productId, _provider = provider, _provider_slug = provider_slug, _url = url, _category = category, _categoryId = categoryId, _subCategory = subCategory, _subCategoryId = subCategoryId, _tags = tags, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory freeShipping({String? id, required String title, required List<String> smallImages, required String bigImageUrl, required String description, required int price, required bool adult, required int sellerShippingPrice, required String skus_json, required int stock, required String prop_obj, required String baseType, String? productId, String? provider, String? provider_slug, String? url, String? category, String? categoryId, String? subCategory, String? subCategoryId, List<String>? tags}) {
    return freeShipping._internal(
      id: id == null ? UUID.getUUID() : id,
      title: title,
      smallImages: smallImages != null ? List<String>.unmodifiable(smallImages) : smallImages,
      bigImageUrl: bigImageUrl,
      description: description,
      price: price,
      adult: adult,
      sellerShippingPrice: sellerShippingPrice,
      skus_json: skus_json,
      stock: stock,
      prop_obj: prop_obj,
      baseType: baseType,
      productId: productId,
      provider: provider,
      provider_slug: provider_slug,
      url: url,
      category: category,
      categoryId: categoryId,
      subCategory: subCategory,
      subCategoryId: subCategoryId,
      tags: tags != null ? List<String>.unmodifiable(tags) : tags);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is freeShipping &&
      id == other.id &&
      _title == other._title &&
      DeepCollectionEquality().equals(_smallImages, other._smallImages) &&
      _bigImageUrl == other._bigImageUrl &&
      _description == other._description &&
      _price == other._price &&
      _adult == other._adult &&
      _sellerShippingPrice == other._sellerShippingPrice &&
      _skus_json == other._skus_json &&
      _stock == other._stock &&
      _prop_obj == other._prop_obj &&
      _baseType == other._baseType &&
      _productId == other._productId &&
      _provider == other._provider &&
      _provider_slug == other._provider_slug &&
      _url == other._url &&
      _category == other._category &&
      _categoryId == other._categoryId &&
      _subCategory == other._subCategory &&
      _subCategoryId == other._subCategoryId &&
      DeepCollectionEquality().equals(_tags, other._tags);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("freeShipping {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("title=" + "$_title" + ", ");
    buffer.write("smallImages=" + (_smallImages != null ? _smallImages!.toString() : "null") + ", ");
    buffer.write("bigImageUrl=" + "$_bigImageUrl" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("price=" + (_price != null ? _price!.toString() : "null") + ", ");
    buffer.write("adult=" + (_adult != null ? _adult!.toString() : "null") + ", ");
    buffer.write("sellerShippingPrice=" + (_sellerShippingPrice != null ? _sellerShippingPrice!.toString() : "null") + ", ");
    buffer.write("skus_json=" + "$_skus_json" + ", ");
    buffer.write("stock=" + (_stock != null ? _stock!.toString() : "null") + ", ");
    buffer.write("prop_obj=" + "$_prop_obj" + ", ");
    buffer.write("baseType=" + "$_baseType" + ", ");
    buffer.write("productId=" + "$_productId" + ", ");
    buffer.write("provider=" + "$_provider" + ", ");
    buffer.write("provider_slug=" + "$_provider_slug" + ", ");
    buffer.write("url=" + "$_url" + ", ");
    buffer.write("category=" + "$_category" + ", ");
    buffer.write("categoryId=" + "$_categoryId" + ", ");
    buffer.write("subCategory=" + "$_subCategory" + ", ");
    buffer.write("subCategoryId=" + "$_subCategoryId" + ", ");
    buffer.write("tags=" + (_tags != null ? _tags!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  freeShipping copyWith({String? id, String? title, List<String>? smallImages, String? bigImageUrl, String? description, int? price, bool? adult, int? sellerShippingPrice, String? skus_json, int? stock, String? prop_obj, String? baseType, String? productId, String? provider, String? provider_slug, String? url, String? category, String? categoryId, String? subCategory, String? subCategoryId, List<String>? tags}) {
    return freeShipping._internal(
      id: id ?? this.id,
      title: title ?? this.title,
      smallImages: smallImages ?? this.smallImages,
      bigImageUrl: bigImageUrl ?? this.bigImageUrl,
      description: description ?? this.description,
      price: price ?? this.price,
      adult: adult ?? this.adult,
      sellerShippingPrice: sellerShippingPrice ?? this.sellerShippingPrice,
      skus_json: skus_json ?? this.skus_json,
      stock: stock ?? this.stock,
      prop_obj: prop_obj ?? this.prop_obj,
      baseType: baseType ?? this.baseType,
      productId: productId ?? this.productId,
      provider: provider ?? this.provider,
      provider_slug: provider_slug ?? this.provider_slug,
      url: url ?? this.url,
      category: category ?? this.category,
      categoryId: categoryId ?? this.categoryId,
      subCategory: subCategory ?? this.subCategory,
      subCategoryId: subCategoryId ?? this.subCategoryId,
      tags: tags ?? this.tags);
  }
  
  freeShipping.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _title = json['title'],
      _smallImages = json['smallImages']?.cast<String>(),
      _bigImageUrl = json['bigImageUrl'],
      _description = json['description'],
      _price = (json['price'] as num?)?.toInt(),
      _adult = json['adult'],
      _sellerShippingPrice = (json['sellerShippingPrice'] as num?)?.toInt(),
      _skus_json = json['skus_json'],
      _stock = (json['stock'] as num?)?.toInt(),
      _prop_obj = json['prop_obj'],
      _baseType = json['baseType'],
      _productId = json['productId'],
      _provider = json['provider'],
      _provider_slug = json['provider_slug'],
      _url = json['url'],
      _category = json['category'],
      _categoryId = json['categoryId'],
      _subCategory = json['subCategory'],
      _subCategoryId = json['subCategoryId'],
      _tags = json['tags']?.cast<String>(),
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'title': _title, 'smallImages': _smallImages, 'bigImageUrl': _bigImageUrl, 'description': _description, 'price': _price, 'adult': _adult, 'sellerShippingPrice': _sellerShippingPrice, 'skus_json': _skus_json, 'stock': _stock, 'prop_obj': _prop_obj, 'baseType': _baseType, 'productId': _productId, 'provider': _provider, 'provider_slug': _provider_slug, 'url': _url, 'category': _category, 'categoryId': _categoryId, 'subCategory': _subCategory, 'subCategoryId': _subCategoryId, 'tags': _tags, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "freeShipping.id");
  static final QueryField TITLE = QueryField(fieldName: "title");
  static final QueryField SMALLIMAGES = QueryField(fieldName: "smallImages");
  static final QueryField BIGIMAGEURL = QueryField(fieldName: "bigImageUrl");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static final QueryField PRICE = QueryField(fieldName: "price");
  static final QueryField ADULT = QueryField(fieldName: "adult");
  static final QueryField SELLERSHIPPINGPRICE = QueryField(fieldName: "sellerShippingPrice");
  static final QueryField SKUS_JSON = QueryField(fieldName: "skus_json");
  static final QueryField STOCK = QueryField(fieldName: "stock");
  static final QueryField PROP_OBJ = QueryField(fieldName: "prop_obj");
  static final QueryField BASETYPE = QueryField(fieldName: "baseType");
  static final QueryField PRODUCTID = QueryField(fieldName: "productId");
  static final QueryField PROVIDER = QueryField(fieldName: "provider");
  static final QueryField PROVIDER_SLUG = QueryField(fieldName: "provider_slug");
  static final QueryField URL = QueryField(fieldName: "url");
  static final QueryField CATEGORY = QueryField(fieldName: "category");
  static final QueryField CATEGORYID = QueryField(fieldName: "categoryId");
  static final QueryField SUBCATEGORY = QueryField(fieldName: "subCategory");
  static final QueryField SUBCATEGORYID = QueryField(fieldName: "subCategoryId");
  static final QueryField TAGS = QueryField(fieldName: "tags");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "freeShipping";
    modelSchemaDefinition.pluralName = "freeShippings";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: freeShipping.TITLE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: freeShipping.SMALLIMAGES,
      isRequired: true,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: freeShipping.BIGIMAGEURL,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: freeShipping.DESCRIPTION,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: freeShipping.PRICE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: freeShipping.ADULT,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: freeShipping.SELLERSHIPPINGPRICE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: freeShipping.SKUS_JSON,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: freeShipping.STOCK,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: freeShipping.PROP_OBJ,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: freeShipping.BASETYPE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: freeShipping.PRODUCTID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: freeShipping.PROVIDER,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: freeShipping.PROVIDER_SLUG,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: freeShipping.URL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: freeShipping.CATEGORY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: freeShipping.CATEGORYID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: freeShipping.SUBCATEGORY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: freeShipping.SUBCATEGORYID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: freeShipping.TAGS,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
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

class _freeShippingModelType extends ModelType<freeShipping> {
  const _freeShippingModelType();
  
  @override
  freeShipping fromJson(Map<String, dynamic> jsonData) {
    return freeShipping.fromJson(jsonData);
  }
}