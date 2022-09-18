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


/** This is an auto generated class representing the Product type in your schema. */
@immutable
class Product {
  final String id;
  final String? _name;
  final double? _price;
  final List<String>? _pictures;
  final List<String>? _smPictures;
  final String? _shortDesc;
  final String? _detail_url;
  final String? _category;
  final List<String>? _brands;
  final String? _top;
  final int? _rating;
  final int? _reviews;
  final int? _stock;
  final int? _totalProducts;
  final int? _page;
  final String? _searchedKeyword;

  String get name {
    try {
      return _name!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  double get price {
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
  
  List<String>? get pictures {
    return _pictures;
  }
  
  List<String>? get smPictures {
    return _smPictures;
  }
  
  String get shortDesc {
    try {
      return _shortDesc!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get detail_url {
    try {
      return _detail_url!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get category {
    try {
      return _category!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<String>? get brands {
    return _brands;
  }
  
  String get top {
    try {
      return _top!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get rating {
    try {
      return _rating!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get reviews {
    try {
      return _reviews!;
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
  
  int get totalProducts {
    try {
      return _totalProducts!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get page {
    try {
      return _page!;
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
  
  const Product._internal({required this.id, required name, required price, pictures, smPictures, required shortDesc, required detail_url, required category, brands, required top, required rating, required reviews, required stock, required totalProducts, required page, required searchedKeyword}): _name = name, _price = price, _pictures = pictures, _smPictures = smPictures, _shortDesc = shortDesc, _detail_url = detail_url, _category = category, _brands = brands, _top = top, _rating = rating, _reviews = reviews, _stock = stock, _totalProducts = totalProducts, _page = page, _searchedKeyword = searchedKeyword;
  
  factory Product({String? id, required String name, required double price, List<String>? pictures, List<String>? smPictures, required String shortDesc, required String detail_url, required String category, List<String>? brands, required String top, required int rating, required int reviews, required int stock, required int totalProducts, required int page, required String searchedKeyword}) {
    return Product._internal(
      id: id == null ? UUID.getUUID() : id,
      name: name,
      price: price,
      pictures: pictures != null ? List<String>.unmodifiable(pictures) : pictures,
      smPictures: smPictures != null ? List<String>.unmodifiable(smPictures) : smPictures,
      shortDesc: shortDesc,
      detail_url: detail_url,
      category: category,
      brands: brands != null ? List<String>.unmodifiable(brands) : brands,
      top: top,
      rating: rating,
      reviews: reviews,
      stock: stock,
      totalProducts: totalProducts,
      page: page,
      searchedKeyword: searchedKeyword);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Product &&
      id == other.id &&
      _name == other._name &&
      _price == other._price &&
      DeepCollectionEquality().equals(_pictures, other._pictures) &&
      DeepCollectionEquality().equals(_smPictures, other._smPictures) &&
      _shortDesc == other._shortDesc &&
      _detail_url == other._detail_url &&
      _category == other._category &&
      DeepCollectionEquality().equals(_brands, other._brands) &&
      _top == other._top &&
      _rating == other._rating &&
      _reviews == other._reviews &&
      _stock == other._stock &&
      _totalProducts == other._totalProducts &&
      _page == other._page &&
      _searchedKeyword == other._searchedKeyword;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Product {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("price=" + (_price != null ? _price!.toString() : "null") + ", ");
    buffer.write("pictures=" + (_pictures != null ? _pictures!.toString() : "null") + ", ");
    buffer.write("smPictures=" + (_smPictures != null ? _smPictures!.toString() : "null") + ", ");
    buffer.write("shortDesc=" + "$_shortDesc" + ", ");
    buffer.write("detail_url=" + "$_detail_url" + ", ");
    buffer.write("category=" + "$_category" + ", ");
    buffer.write("brands=" + (_brands != null ? _brands!.toString() : "null") + ", ");
    buffer.write("top=" + "$_top" + ", ");
    buffer.write("rating=" + (_rating != null ? _rating!.toString() : "null") + ", ");
    buffer.write("reviews=" + (_reviews != null ? _reviews!.toString() : "null") + ", ");
    buffer.write("stock=" + (_stock != null ? _stock!.toString() : "null") + ", ");
    buffer.write("totalProducts=" + (_totalProducts != null ? _totalProducts!.toString() : "null") + ", ");
    buffer.write("page=" + (_page != null ? _page!.toString() : "null") + ", ");
    buffer.write("searchedKeyword=" + "$_searchedKeyword");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Product copyWith({String? id, String? name, double? price, List<String>? pictures, List<String>? smPictures, String? shortDesc, String? detail_url, String? category, List<String>? brands, String? top, int? rating, int? reviews, int? stock, int? totalProducts, int? page, String? searchedKeyword}) {
    return Product._internal(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      pictures: pictures ?? this.pictures,
      smPictures: smPictures ?? this.smPictures,
      shortDesc: shortDesc ?? this.shortDesc,
      detail_url: detail_url ?? this.detail_url,
      category: category ?? this.category,
      brands: brands ?? this.brands,
      top: top ?? this.top,
      rating: rating ?? this.rating,
      reviews: reviews ?? this.reviews,
      stock: stock ?? this.stock,
      totalProducts: totalProducts ?? this.totalProducts,
      page: page ?? this.page,
      searchedKeyword: searchedKeyword ?? this.searchedKeyword);
  }
  
  Product.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _price = (json['price'] as num?)?.toDouble(),
      _pictures = json['pictures']?.cast<String>(),
      _smPictures = json['smPictures']?.cast<String>(),
      _shortDesc = json['shortDesc'],
      _detail_url = json['detail_url'],
      _category = json['category'],
      _brands = json['brands']?.cast<String>(),
      _top = json['top'],
      _rating = (json['rating'] as num?)?.toInt(),
      _reviews = (json['reviews'] as num?)?.toInt(),
      _stock = (json['stock'] as num?)?.toInt(),
      _totalProducts = (json['totalProducts'] as num?)?.toInt(),
      _page = (json['page'] as num?)?.toInt(),
      _searchedKeyword = json['searchedKeyword'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'price': _price, 'pictures': _pictures, 'smPictures': _smPictures, 'shortDesc': _shortDesc, 'detail_url': _detail_url, 'category': _category, 'brands': _brands, 'top': _top, 'rating': _rating, 'reviews': _reviews, 'stock': _stock, 'totalProducts': _totalProducts, 'page': _page, 'searchedKeyword': _searchedKeyword
  };

  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Product";
    modelSchemaDefinition.pluralName = "Products";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'id',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'name',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'price',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'pictures',
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'smPictures',
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'shortDesc',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'detail_url',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'category',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'brands',
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'top',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'rating',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'reviews',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'stock',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'totalProducts',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'page',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'searchedKeyword',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}