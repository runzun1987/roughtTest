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


/** This is an auto generated class representing the banner type in your schema. */
@immutable
class banner extends Model {
  static const classType = const _bannerModelType();
  final String id;
  final String? _createdAt;
  final String? _image;
  final String? _mobileImg;
  final String? _title;
  final String? _title2;
  final String? _subTitle;
  final String? _button;
  final String? _url;
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
  
  String get image {
    try {
      return _image!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get mobileImg {
    try {
      return _mobileImg!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
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
  
  String get title2 {
    try {
      return _title2!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get subTitle {
    try {
      return _subTitle!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get button {
    return _button;
  }
  
  String? get url {
    return _url;
  }
  
  String? get baseType {
    return _baseType;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const banner._internal({required this.id, required createdAt, required image, required mobileImg, required title, required title2, required subTitle, button, url, baseType, updatedAt}): _createdAt = createdAt, _image = image, _mobileImg = mobileImg, _title = title, _title2 = title2, _subTitle = subTitle, _button = button, _url = url, _baseType = baseType, _updatedAt = updatedAt;
  
  factory banner({String? id, required String createdAt, required String image, required String mobileImg, required String title, required String title2, required String subTitle, String? button, String? url, String? baseType}) {
    return banner._internal(
      id: id == null ? UUID.getUUID() : id,
      createdAt: createdAt,
      image: image,
      mobileImg: mobileImg,
      title: title,
      title2: title2,
      subTitle: subTitle,
      button: button,
      url: url,
      baseType: baseType);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is banner &&
      id == other.id &&
      _createdAt == other._createdAt &&
      _image == other._image &&
      _mobileImg == other._mobileImg &&
      _title == other._title &&
      _title2 == other._title2 &&
      _subTitle == other._subTitle &&
      _button == other._button &&
      _url == other._url &&
      _baseType == other._baseType;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("banner {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("createdAt=" + "$_createdAt" + ", ");
    buffer.write("image=" + "$_image" + ", ");
    buffer.write("mobileImg=" + "$_mobileImg" + ", ");
    buffer.write("title=" + "$_title" + ", ");
    buffer.write("title2=" + "$_title2" + ", ");
    buffer.write("subTitle=" + "$_subTitle" + ", ");
    buffer.write("button=" + "$_button" + ", ");
    buffer.write("url=" + "$_url" + ", ");
    buffer.write("baseType=" + "$_baseType" + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  banner copyWith({String? id, String? createdAt, String? image, String? mobileImg, String? title, String? title2, String? subTitle, String? button, String? url, String? baseType}) {
    return banner._internal(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      image: image ?? this.image,
      mobileImg: mobileImg ?? this.mobileImg,
      title: title ?? this.title,
      title2: title2 ?? this.title2,
      subTitle: subTitle ?? this.subTitle,
      button: button ?? this.button,
      url: url ?? this.url,
      baseType: baseType ?? this.baseType);
  }
  
  banner.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _createdAt = json['createdAt'],
      _image = json['image'],
      _mobileImg = json['mobileImg'],
      _title = json['title'],
      _title2 = json['title2'],
      _subTitle = json['subTitle'],
      _button = json['button'],
      _url = json['url'],
      _baseType = json['baseType'],
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'createdAt': _createdAt, 'image': _image, 'mobileImg': _mobileImg, 'title': _title, 'title2': _title2, 'subTitle': _subTitle, 'button': _button, 'url': _url, 'baseType': _baseType, 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "banner.id");
  static final QueryField CREATEDAT = QueryField(fieldName: "createdAt");
  static final QueryField IMAGE = QueryField(fieldName: "image");
  static final QueryField MOBILEIMG = QueryField(fieldName: "mobileImg");
  static final QueryField TITLE = QueryField(fieldName: "title");
  static final QueryField TITLE2 = QueryField(fieldName: "title2");
  static final QueryField SUBTITLE = QueryField(fieldName: "subTitle");
  static final QueryField BUTTON = QueryField(fieldName: "button");
  static final QueryField URL = QueryField(fieldName: "url");
  static final QueryField BASETYPE = QueryField(fieldName: "baseType");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "banner";
    modelSchemaDefinition.pluralName = "banners";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: banner.CREATEDAT,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: banner.IMAGE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: banner.MOBILEIMG,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: banner.TITLE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: banner.TITLE2,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: banner.SUBTITLE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: banner.BUTTON,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: banner.URL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: banner.BASETYPE,
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

class _bannerModelType extends ModelType<banner> {
  const _bannerModelType();
  
  @override
  banner fromJson(Map<String, dynamic> jsonData) {
    return banner.fromJson(jsonData);
  }
}