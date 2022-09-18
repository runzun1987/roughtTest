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
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Like type in your schema. */
@immutable
class Like extends Model {
  static const classType = const _LikeModelType();
  final String id;
  final String? _createdAt;
  final String? _userName;
  final String? _firstName;
  final String? _LastName;
  final String? _location;
  final String? _profilePic;
  final String? _phone;
  final String? _email;
  final String? _reaction;
  final String? _baseType;
  final String? _postId;
  final Post? _postLike;
  final Comment? _comment;
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
  
  String? get reaction {
    return _reaction;
  }
  
  String? get baseType {
    return _baseType;
  }
  
  String get postId {
    try {
      return _postId!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  Post? get postLike {
    return _postLike;
  }
  
  Comment? get comment {
    return _comment;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Like._internal({required this.id, required createdAt, required userName, required firstName, required LastName, location, profilePic, phone, email, reaction, baseType, required postId, postLike, comment, updatedAt}): _createdAt = createdAt, _userName = userName, _firstName = firstName, _LastName = LastName, _location = location, _profilePic = profilePic, _phone = phone, _email = email, _reaction = reaction, _baseType = baseType, _postId = postId, _postLike = postLike, _comment = comment, _updatedAt = updatedAt;
  
  factory Like({String? id, required String createdAt, required String userName, required String firstName, required String LastName, String? location, String? profilePic, String? phone, String? email, String? reaction, String? baseType, required String postId, Post? postLike, Comment? comment}) {
    return Like._internal(
      id: id == null ? UUID.getUUID() : id,
      createdAt: createdAt,
      userName: userName,
      firstName: firstName,
      LastName: LastName,
      location: location,
      profilePic: profilePic,
      phone: phone,
      email: email,
      reaction: reaction,
      baseType: baseType,
      postId: postId,
      postLike: postLike,
      comment: comment);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Like &&
      id == other.id &&
      _createdAt == other._createdAt &&
      _userName == other._userName &&
      _firstName == other._firstName &&
      _LastName == other._LastName &&
      _location == other._location &&
      _profilePic == other._profilePic &&
      _phone == other._phone &&
      _email == other._email &&
      _reaction == other._reaction &&
      _baseType == other._baseType &&
      _postId == other._postId &&
      _postLike == other._postLike &&
      _comment == other._comment;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Like {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("createdAt=" + "$_createdAt" + ", ");
    buffer.write("userName=" + "$_userName" + ", ");
    buffer.write("firstName=" + "$_firstName" + ", ");
    buffer.write("LastName=" + "$_LastName" + ", ");
    buffer.write("location=" + "$_location" + ", ");
    buffer.write("profilePic=" + "$_profilePic" + ", ");
    buffer.write("phone=" + "$_phone" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("reaction=" + "$_reaction" + ", ");
    buffer.write("baseType=" + "$_baseType" + ", ");
    buffer.write("postId=" + "$_postId" + ", ");
    buffer.write("postLike=" + (_postLike != null ? _postLike!.toString() : "null") + ", ");
    buffer.write("comment=" + (_comment != null ? _comment!.toString() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Like copyWith({String? id, String? createdAt, String? userName, String? firstName, String? LastName, String? location, String? profilePic, String? phone, String? email, String? reaction, String? baseType, String? postId, Post? postLike, Comment? comment}) {
    return Like._internal(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      userName: userName ?? this.userName,
      firstName: firstName ?? this.firstName,
      LastName: LastName ?? this.LastName,
      location: location ?? this.location,
      profilePic: profilePic ?? this.profilePic,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      reaction: reaction ?? this.reaction,
      baseType: baseType ?? this.baseType,
      postId: postId ?? this.postId,
      postLike: postLike ?? this.postLike,
      comment: comment ?? this.comment);
  }
  
  Like.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _createdAt = json['createdAt'],
      _userName = json['userName'],
      _firstName = json['firstName'],
      _LastName = json['LastName'],
      _location = json['location'],
      _profilePic = json['profilePic'],
      _phone = json['phone'],
      _email = json['email'],
      _reaction = json['reaction'],
      _baseType = json['baseType'],
      _postId = json['postId'],
      _postLike = json['postLike']?['serializedData'] != null
        ? Post.fromJson(new Map<String, dynamic>.from(json['postLike']['serializedData']))
        : null,
      _comment = json['comment']?['serializedData'] != null
        ? Comment.fromJson(new Map<String, dynamic>.from(json['comment']['serializedData']))
        : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'createdAt': _createdAt, 'userName': _userName, 'firstName': _firstName, 'LastName': _LastName, 'location': _location, 'profilePic': _profilePic, 'phone': _phone, 'email': _email, 'reaction': _reaction, 'baseType': _baseType, 'postId': _postId, 'postLike': _postLike?.toJson(), 'comment': _comment?.toJson(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "like.id");
  static final QueryField CREATEDAT = QueryField(fieldName: "createdAt");
  static final QueryField USERNAME = QueryField(fieldName: "userName");
  static final QueryField FIRSTNAME = QueryField(fieldName: "firstName");
  static final QueryField LASTNAME = QueryField(fieldName: "LastName");
  static final QueryField LOCATION = QueryField(fieldName: "location");
  static final QueryField PROFILEPIC = QueryField(fieldName: "profilePic");
  static final QueryField PHONE = QueryField(fieldName: "phone");
  static final QueryField EMAIL = QueryField(fieldName: "email");
  static final QueryField REACTION = QueryField(fieldName: "reaction");
  static final QueryField BASETYPE = QueryField(fieldName: "baseType");
  static final QueryField POSTID = QueryField(fieldName: "postId");
  static final QueryField POSTLIKE = QueryField(
    fieldName: "postLike",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Post).toString()));
  static final QueryField COMMENT = QueryField(
    fieldName: "comment",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Comment).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Like";
    modelSchemaDefinition.pluralName = "Likes";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Like.CREATEDAT,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Like.USERNAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Like.FIRSTNAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Like.LASTNAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Like.LOCATION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Like.PROFILEPIC,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Like.PHONE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Like.EMAIL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Like.REACTION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Like.BASETYPE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Like.POSTID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: Like.POSTLIKE,
      isRequired: false,
      targetName: "likePostLikeId",
      ofModelName: (Post).toString()
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: Like.COMMENT,
      isRequired: false,
      targetName: "likeCommentId",
      ofModelName: (Comment).toString()
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _LikeModelType extends ModelType<Like> {
  const _LikeModelType();
  
  @override
  Like fromJson(Map<String, dynamic> jsonData) {
    return Like.fromJson(jsonData);
  }
}