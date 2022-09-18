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


/** This is an auto generated class representing the Post type in your schema. */
@immutable
class Post extends Model {
  static const classType = const _PostModelType();
  final String id;
  final String? _createdAt;
  final String? _userName;
  final String? _firstName;
  final String? _LastName;
  final String? _location;
  final String? _profilePic;
  final String? _phone;
  final String? _email;
  final String? _type;
  final String? _caption;
  final List<String>? _images;
  final List<Comment>? _comments;
  final List<Like>? _likes;
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
  
  String get firstName {
    try {
      return _firstName!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get LastName {
    try {
      return _LastName!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get location {
    return _location;
  }
  
  String? get profilePic {
    return _profilePic;
  }
  
  String? get phone {
    return _phone;
  }
  
  String? get email {
    return _email;
  }
  
  String? get type {
    return _type;
  }
  
  String? get caption {
    return _caption;
  }
  
  List<String>? get images {
    return _images;
  }
  
  List<Comment>? get comments {
    return _comments;
  }
  
  List<Like>? get likes {
    return _likes;
  }
  
  String? get baseType {
    return _baseType;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Post._internal({required this.id, required createdAt, required userName, required firstName, required LastName, location, profilePic, phone, email, type, caption, images, comments, likes, baseType, updatedAt}): _createdAt = createdAt, _userName = userName, _firstName = firstName, _LastName = LastName, _location = location, _profilePic = profilePic, _phone = phone, _email = email, _type = type, _caption = caption, _images = images, _comments = comments, _likes = likes, _baseType = baseType, _updatedAt = updatedAt;
  
  factory Post({String? id, required String createdAt, required String userName, required String firstName, required String LastName, String? location, String? profilePic, String? phone, String? email, String? type, String? caption, List<String>? images, List<Comment>? comments, List<Like>? likes, String? baseType}) {
    return Post._internal(
      id: id == null ? UUID.getUUID() : id,
      createdAt: createdAt,
      userName: userName,
      firstName: firstName,
      LastName: LastName,
      location: location,
      profilePic: profilePic,
      phone: phone,
      email: email,
      type: type,
      caption: caption,
      images: images != null ? List<String>.unmodifiable(images) : images,
      comments: comments != null ? List<Comment>.unmodifiable(comments) : comments,
      likes: likes != null ? List<Like>.unmodifiable(likes) : likes,
      baseType: baseType);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Post &&
      id == other.id &&
      _createdAt == other._createdAt &&
      _userName == other._userName &&
      _firstName == other._firstName &&
      _LastName == other._LastName &&
      _location == other._location &&
      _profilePic == other._profilePic &&
      _phone == other._phone &&
      _email == other._email &&
      _type == other._type &&
      _caption == other._caption &&
      DeepCollectionEquality().equals(_images, other._images) &&
      DeepCollectionEquality().equals(_comments, other._comments) &&
      DeepCollectionEquality().equals(_likes, other._likes) &&
      _baseType == other._baseType;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Post {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("createdAt=" + "$_createdAt" + ", ");
    buffer.write("userName=" + "$_userName" + ", ");
    buffer.write("firstName=" + "$_firstName" + ", ");
    buffer.write("LastName=" + "$_LastName" + ", ");
    buffer.write("location=" + "$_location" + ", ");
    buffer.write("profilePic=" + "$_profilePic" + ", ");
    buffer.write("phone=" + "$_phone" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("type=" + "$_type" + ", ");
    buffer.write("caption=" + "$_caption" + ", ");
    buffer.write("images=" + (_images != null ? _images!.toString() : "null") + ", ");
    buffer.write("baseType=" + "$_baseType" + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Post copyWith({String? id, String? createdAt, String? userName, String? firstName, String? LastName, String? location, String? profilePic, String? phone, String? email, String? type, String? caption, List<String>? images, List<Comment>? comments, List<Like>? likes, String? baseType}) {
    return Post._internal(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      userName: userName ?? this.userName,
      firstName: firstName ?? this.firstName,
      LastName: LastName ?? this.LastName,
      location: location ?? this.location,
      profilePic: profilePic ?? this.profilePic,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      type: type ?? this.type,
      caption: caption ?? this.caption,
      images: images ?? this.images,
      comments: comments ?? this.comments,
      likes: likes ?? this.likes,
      baseType: baseType ?? this.baseType);
  }
  
  Post.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _createdAt = json['createdAt'],
      _userName = json['userName'],
      _firstName = json['firstName'],
      _LastName = json['LastName'],
      _location = json['location'],
      _profilePic = json['profilePic'],
      _phone = json['phone'],
      _email = json['email'],
      _type = json['type'],
      _caption = json['caption'],
      _images = json['images']?.cast<String>(),
      _comments = json['comments'] is List
        ? (json['comments'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Comment.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _likes = json['likes'] is List
        ? (json['likes'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Like.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _baseType = json['baseType'],
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'createdAt': _createdAt, 'userName': _userName, 'firstName': _firstName, 'LastName': _LastName, 'location': _location, 'profilePic': _profilePic, 'phone': _phone, 'email': _email, 'type': _type, 'caption': _caption, 'images': _images, 'comments': _comments?.map((Comment? e) => e?.toJson()).toList(), 'likes': _likes?.map((Like? e) => e?.toJson()).toList(), 'baseType': _baseType, 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "post.id");
  static final QueryField CREATEDAT = QueryField(fieldName: "createdAt");
  static final QueryField USERNAME = QueryField(fieldName: "userName");
  static final QueryField FIRSTNAME = QueryField(fieldName: "firstName");
  static final QueryField LASTNAME = QueryField(fieldName: "LastName");
  static final QueryField LOCATION = QueryField(fieldName: "location");
  static final QueryField PROFILEPIC = QueryField(fieldName: "profilePic");
  static final QueryField PHONE = QueryField(fieldName: "phone");
  static final QueryField EMAIL = QueryField(fieldName: "email");
  static final QueryField TYPE = QueryField(fieldName: "type");
  static final QueryField CAPTION = QueryField(fieldName: "caption");
  static final QueryField IMAGES = QueryField(fieldName: "images");
  static final QueryField COMMENTS = QueryField(
    fieldName: "comments",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Comment).toString()));
  static final QueryField LIKES = QueryField(
    fieldName: "likes",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Like).toString()));
  static final QueryField BASETYPE = QueryField(fieldName: "baseType");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Post";
    modelSchemaDefinition.pluralName = "Posts";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Post.CREATEDAT,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Post.USERNAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Post.FIRSTNAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Post.LASTNAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Post.LOCATION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Post.PROFILEPIC,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Post.PHONE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Post.EMAIL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Post.TYPE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Post.CAPTION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Post.IMAGES,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Post.COMMENTS,
      isRequired: false,
      ofModelName: (Comment).toString(),
      associatedKey: Comment.POSTCOMMENT
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Post.LIKES,
      isRequired: false,
      ofModelName: (Like).toString(),
      associatedKey: Like.POSTLIKE
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Post.BASETYPE,
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

class _PostModelType extends ModelType<Post> {
  const _PostModelType();
  
  @override
  Post fromJson(Map<String, dynamic> jsonData) {
    return Post.fromJson(jsonData);
  }
}