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


/** This is an auto generated class representing the Comment type in your schema. */
@immutable
class Comment extends Model {
  static const classType = const _CommentModelType();
  final String id;
  final String? _updatedAt;
  final String? _userName;
  final String? _firstName;
  final String? _LastName;
  final String? _location;
  final String? _profilePic;
  final String? _phone;
  final String? _email;
  final String? _comment;
  final List<Like>? _likes;
  final String? _baseType;
  final String? _postId;
  final String? _topCommentId;
  final List<Comment>? _children;
  final Post? _postComment;
  final Comment? _commentId;
  final TemporalDateTime? _createdAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String get updatedAt {
    try {
      return _updatedAt!;
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
  
  String get comment {
    try {
      return _comment!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<Like>? get likes {
    return _likes;
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
  
  String? get topCommentId {
    return _topCommentId;
  }
  
  List<Comment>? get children {
    return _children;
  }
  
  Post? get postComment {
    return _postComment;
  }
  
  Comment? get commentId {
    return _commentId;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  const Comment._internal({required this.id, required updatedAt, required userName, required firstName, required LastName, location, profilePic, phone, email, required comment, likes, baseType, required postId, topCommentId, children, postComment, commentId, createdAt}): _updatedAt = updatedAt, _userName = userName, _firstName = firstName, _LastName = LastName, _location = location, _profilePic = profilePic, _phone = phone, _email = email, _comment = comment, _likes = likes, _baseType = baseType, _postId = postId, _topCommentId = topCommentId, _children = children, _postComment = postComment, _commentId = commentId, _createdAt = createdAt;
  
  factory Comment({String? id, required String updatedAt, required String userName, required String firstName, required String LastName, String? location, String? profilePic, String? phone, String? email, required String comment, List<Like>? likes, String? baseType, required String postId, String? topCommentId, List<Comment>? children, Post? postComment, Comment? commentId}) {
    return Comment._internal(
      id: id == null ? UUID.getUUID() : id,
      updatedAt: updatedAt,
      userName: userName,
      firstName: firstName,
      LastName: LastName,
      location: location,
      profilePic: profilePic,
      phone: phone,
      email: email,
      comment: comment,
      likes: likes != null ? List<Like>.unmodifiable(likes) : likes,
      baseType: baseType,
      postId: postId,
      topCommentId: topCommentId,
      children: children != null ? List<Comment>.unmodifiable(children) : children,
      postComment: postComment,
      commentId: commentId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Comment &&
      id == other.id &&
      _updatedAt == other._updatedAt &&
      _userName == other._userName &&
      _firstName == other._firstName &&
      _LastName == other._LastName &&
      _location == other._location &&
      _profilePic == other._profilePic &&
      _phone == other._phone &&
      _email == other._email &&
      _comment == other._comment &&
      DeepCollectionEquality().equals(_likes, other._likes) &&
      _baseType == other._baseType &&
      _postId == other._postId &&
      _topCommentId == other._topCommentId &&
      DeepCollectionEquality().equals(_children, other._children) &&
      _postComment == other._postComment &&
      _commentId == other._commentId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Comment {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("updatedAt=" + "$_updatedAt" + ", ");
    buffer.write("userName=" + "$_userName" + ", ");
    buffer.write("firstName=" + "$_firstName" + ", ");
    buffer.write("LastName=" + "$_LastName" + ", ");
    buffer.write("location=" + "$_location" + ", ");
    buffer.write("profilePic=" + "$_profilePic" + ", ");
    buffer.write("phone=" + "$_phone" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("comment=" + "$_comment" + ", ");
    buffer.write("baseType=" + "$_baseType" + ", ");
    buffer.write("postId=" + "$_postId" + ", ");
    buffer.write("topCommentId=" + "$_topCommentId" + ", ");
    buffer.write("postComment=" + (_postComment != null ? _postComment!.toString() : "null") + ", ");
    buffer.write("commentId=" + (_commentId != null ? _commentId!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Comment copyWith({String? id, String? updatedAt, String? userName, String? firstName, String? LastName, String? location, String? profilePic, String? phone, String? email, String? comment, List<Like>? likes, String? baseType, String? postId, String? topCommentId, List<Comment>? children, Post? postComment, Comment? commentId}) {
    return Comment._internal(
      id: id ?? this.id,
      updatedAt: updatedAt ?? this.updatedAt,
      userName: userName ?? this.userName,
      firstName: firstName ?? this.firstName,
      LastName: LastName ?? this.LastName,
      location: location ?? this.location,
      profilePic: profilePic ?? this.profilePic,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      comment: comment ?? this.comment,
      likes: likes ?? this.likes,
      baseType: baseType ?? this.baseType,
      postId: postId ?? this.postId,
      topCommentId: topCommentId ?? this.topCommentId,
      children: children ?? this.children,
      postComment: postComment ?? this.postComment,
      commentId: commentId ?? this.commentId);
  }
  
  Comment.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _updatedAt = json['updatedAt'],
      _userName = json['userName'],
      _firstName = json['firstName'],
      _LastName = json['LastName'],
      _location = json['location'],
      _profilePic = json['profilePic'],
      _phone = json['phone'],
      _email = json['email'],
      _comment = json['comment'],
      _likes = json['likes'] is List
        ? (json['likes'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Like.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _baseType = json['baseType'],
      _postId = json['postId'],
      _topCommentId = json['topCommentId'],
      _children = json['children'] is List
        ? (json['children'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Comment.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _postComment = json['postComment']?['serializedData'] != null
        ? Post.fromJson(new Map<String, dynamic>.from(json['postComment']['serializedData']))
        : null,
      _commentId = json['commentId']?['serializedData'] != null
        ? Comment.fromJson(new Map<String, dynamic>.from(json['commentId']['serializedData']))
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'updatedAt': _updatedAt, 'userName': _userName, 'firstName': _firstName, 'LastName': _LastName, 'location': _location, 'profilePic': _profilePic, 'phone': _phone, 'email': _email, 'comment': _comment, 'likes': _likes?.map((Like? e) => e?.toJson()).toList(), 'baseType': _baseType, 'postId': _postId, 'topCommentId': _topCommentId, 'children': _children?.map((Comment? e) => e?.toJson()).toList(), 'postComment': _postComment?.toJson(), 'commentId': _commentId?.toJson(), 'createdAt': _createdAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "comment.id");
  static final QueryField UPDATEDAT = QueryField(fieldName: "updatedAt");
  static final QueryField USERNAME = QueryField(fieldName: "userName");
  static final QueryField FIRSTNAME = QueryField(fieldName: "firstName");
  static final QueryField LASTNAME = QueryField(fieldName: "LastName");
  static final QueryField LOCATION = QueryField(fieldName: "location");
  static final QueryField PROFILEPIC = QueryField(fieldName: "profilePic");
  static final QueryField PHONE = QueryField(fieldName: "phone");
  static final QueryField EMAIL = QueryField(fieldName: "email");
  static final QueryField COMMENT = QueryField(fieldName: "comment");
  static final QueryField LIKES = QueryField(
    fieldName: "likes",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Like).toString()));
  static final QueryField BASETYPE = QueryField(fieldName: "baseType");
  static final QueryField POSTID = QueryField(fieldName: "postId");
  static final QueryField TOPCOMMENTID = QueryField(fieldName: "topCommentId");
  static final QueryField CHILDREN = QueryField(
    fieldName: "children",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Comment).toString()));
  static final QueryField POSTCOMMENT = QueryField(
    fieldName: "postComment",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Post).toString()));
  static final QueryField COMMENTID = QueryField(
    fieldName: "commentId",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Comment).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Comment";
    modelSchemaDefinition.pluralName = "Comments";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Comment.UPDATEDAT,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Comment.USERNAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Comment.FIRSTNAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Comment.LASTNAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Comment.LOCATION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Comment.PROFILEPIC,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Comment.PHONE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Comment.EMAIL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Comment.COMMENT,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Comment.LIKES,
      isRequired: false,
      ofModelName: (Like).toString(),
      associatedKey: Like.COMMENT
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Comment.BASETYPE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Comment.POSTID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Comment.TOPCOMMENTID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Comment.CHILDREN,
      isRequired: false,
      ofModelName: (Comment).toString(),
      associatedKey: Comment.COMMENTID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: Comment.POSTCOMMENT,
      isRequired: false,
      targetName: "commentPostCommentId",
      ofModelName: (Post).toString()
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: Comment.COMMENTID,
      isRequired: false,
      targetName: "commentCommentIdId",
      ofModelName: (Comment).toString()
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _CommentModelType extends ModelType<Comment> {
  const _CommentModelType();
  
  @override
  Comment fromJson(Map<String, dynamic> jsonData) {
    return Comment.fromJson(jsonData);
  }
}