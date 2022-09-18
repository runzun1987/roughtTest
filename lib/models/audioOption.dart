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


/** This is an auto generated class representing the audioOption type in your schema. */
@immutable
class audioOption extends Model {
  static const classType = const _audioOptionModelType();
  final String id;
  final bool? _autoPlay;
  final int? _defaultVolume;
  final String? _theme;
  final int? _defaultPlayIndex;
  final bool? _remember;
  final int? _top;
  final int? _left;
  final String? _mode;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  bool get autoPlay {
    try {
      return _autoPlay!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get defaultVolume {
    try {
      return _defaultVolume!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get theme {
    try {
      return _theme!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get defaultPlayIndex {
    try {
      return _defaultPlayIndex!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  bool get remember {
    try {
      return _remember!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get top {
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
  
  int get left {
    try {
      return _left!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get mode {
    try {
      return _mode!;
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
  
  const audioOption._internal({required this.id, required autoPlay, required defaultVolume, required theme, required defaultPlayIndex, required remember, required top, required left, required mode, createdAt, updatedAt}): _autoPlay = autoPlay, _defaultVolume = defaultVolume, _theme = theme, _defaultPlayIndex = defaultPlayIndex, _remember = remember, _top = top, _left = left, _mode = mode, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory audioOption({String? id, required bool autoPlay, required int defaultVolume, required String theme, required int defaultPlayIndex, required bool remember, required int top, required int left, required String mode}) {
    return audioOption._internal(
      id: id == null ? UUID.getUUID() : id,
      autoPlay: autoPlay,
      defaultVolume: defaultVolume,
      theme: theme,
      defaultPlayIndex: defaultPlayIndex,
      remember: remember,
      top: top,
      left: left,
      mode: mode);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is audioOption &&
      id == other.id &&
      _autoPlay == other._autoPlay &&
      _defaultVolume == other._defaultVolume &&
      _theme == other._theme &&
      _defaultPlayIndex == other._defaultPlayIndex &&
      _remember == other._remember &&
      _top == other._top &&
      _left == other._left &&
      _mode == other._mode;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("audioOption {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("autoPlay=" + (_autoPlay != null ? _autoPlay!.toString() : "null") + ", ");
    buffer.write("defaultVolume=" + (_defaultVolume != null ? _defaultVolume!.toString() : "null") + ", ");
    buffer.write("theme=" + "$_theme" + ", ");
    buffer.write("defaultPlayIndex=" + (_defaultPlayIndex != null ? _defaultPlayIndex!.toString() : "null") + ", ");
    buffer.write("remember=" + (_remember != null ? _remember!.toString() : "null") + ", ");
    buffer.write("top=" + (_top != null ? _top!.toString() : "null") + ", ");
    buffer.write("left=" + (_left != null ? _left!.toString() : "null") + ", ");
    buffer.write("mode=" + "$_mode" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  audioOption copyWith({String? id, bool? autoPlay, int? defaultVolume, String? theme, int? defaultPlayIndex, bool? remember, int? top, int? left, String? mode}) {
    return audioOption._internal(
      id: id ?? this.id,
      autoPlay: autoPlay ?? this.autoPlay,
      defaultVolume: defaultVolume ?? this.defaultVolume,
      theme: theme ?? this.theme,
      defaultPlayIndex: defaultPlayIndex ?? this.defaultPlayIndex,
      remember: remember ?? this.remember,
      top: top ?? this.top,
      left: left ?? this.left,
      mode: mode ?? this.mode);
  }
  
  audioOption.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _autoPlay = json['autoPlay'],
      _defaultVolume = (json['defaultVolume'] as num?)?.toInt(),
      _theme = json['theme'],
      _defaultPlayIndex = (json['defaultPlayIndex'] as num?)?.toInt(),
      _remember = json['remember'],
      _top = (json['top'] as num?)?.toInt(),
      _left = (json['left'] as num?)?.toInt(),
      _mode = json['mode'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'autoPlay': _autoPlay, 'defaultVolume': _defaultVolume, 'theme': _theme, 'defaultPlayIndex': _defaultPlayIndex, 'remember': _remember, 'top': _top, 'left': _left, 'mode': _mode, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "audioOption.id");
  static final QueryField AUTOPLAY = QueryField(fieldName: "autoPlay");
  static final QueryField DEFAULTVOLUME = QueryField(fieldName: "defaultVolume");
  static final QueryField THEME = QueryField(fieldName: "theme");
  static final QueryField DEFAULTPLAYINDEX = QueryField(fieldName: "defaultPlayIndex");
  static final QueryField REMEMBER = QueryField(fieldName: "remember");
  static final QueryField TOP = QueryField(fieldName: "top");
  static final QueryField LEFT = QueryField(fieldName: "left");
  static final QueryField MODE = QueryField(fieldName: "mode");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "audioOption";
    modelSchemaDefinition.pluralName = "audioOptions";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: audioOption.AUTOPLAY,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: audioOption.DEFAULTVOLUME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: audioOption.THEME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: audioOption.DEFAULTPLAYINDEX,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: audioOption.REMEMBER,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: audioOption.TOP,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: audioOption.LEFT,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: audioOption.MODE,
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

class _audioOptionModelType extends ModelType<audioOption> {
  const _audioOptionModelType();
  
  @override
  audioOption fromJson(Map<String, dynamic> jsonData) {
    return audioOption.fromJson(jsonData);
  }
}