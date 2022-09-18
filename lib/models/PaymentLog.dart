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


/** This is an auto generated class representing the PaymentLog type in your schema. */
@immutable
class PaymentLog extends Model {
  static const classType = const _PaymentLogModelType();
  final String id;
  final String? _amt;
  final String? _oid;
  final String? _q;
  final String? _refId;
  final String? _checkResponseESewa;
  final String? _esewaError;
  final String? _userPhone;
  final String? _cartList;
  final String? _paymentSelected;
  final String? _khaltiEvent;
  final String? _khaltiError;
  final String? _khaltiResponse;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get amt {
    return _amt;
  }
  
  String? get oid {
    return _oid;
  }
  
  String? get q {
    return _q;
  }
  
  String? get refId {
    return _refId;
  }
  
  String? get checkResponseESewa {
    return _checkResponseESewa;
  }
  
  String? get esewaError {
    return _esewaError;
  }
  
  String? get userPhone {
    return _userPhone;
  }
  
  String? get cartList {
    return _cartList;
  }
  
  String? get paymentSelected {
    return _paymentSelected;
  }
  
  String? get khaltiEvent {
    return _khaltiEvent;
  }
  
  String? get khaltiError {
    return _khaltiError;
  }
  
  String? get khaltiResponse {
    return _khaltiResponse;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const PaymentLog._internal({required this.id, amt, oid, q, refId, checkResponseESewa, esewaError, userPhone, cartList, paymentSelected, khaltiEvent, khaltiError, khaltiResponse, createdAt, updatedAt}): _amt = amt, _oid = oid, _q = q, _refId = refId, _checkResponseESewa = checkResponseESewa, _esewaError = esewaError, _userPhone = userPhone, _cartList = cartList, _paymentSelected = paymentSelected, _khaltiEvent = khaltiEvent, _khaltiError = khaltiError, _khaltiResponse = khaltiResponse, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory PaymentLog({String? id, String? amt, String? oid, String? q, String? refId, String? checkResponseESewa, String? esewaError, String? userPhone, String? cartList, String? paymentSelected, String? khaltiEvent, String? khaltiError, String? khaltiResponse}) {
    return PaymentLog._internal(
      id: id == null ? UUID.getUUID() : id,
      amt: amt,
      oid: oid,
      q: q,
      refId: refId,
      checkResponseESewa: checkResponseESewa,
      esewaError: esewaError,
      userPhone: userPhone,
      cartList: cartList,
      paymentSelected: paymentSelected,
      khaltiEvent: khaltiEvent,
      khaltiError: khaltiError,
      khaltiResponse: khaltiResponse);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaymentLog &&
      id == other.id &&
      _amt == other._amt &&
      _oid == other._oid &&
      _q == other._q &&
      _refId == other._refId &&
      _checkResponseESewa == other._checkResponseESewa &&
      _esewaError == other._esewaError &&
      _userPhone == other._userPhone &&
      _cartList == other._cartList &&
      _paymentSelected == other._paymentSelected &&
      _khaltiEvent == other._khaltiEvent &&
      _khaltiError == other._khaltiError &&
      _khaltiResponse == other._khaltiResponse;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("PaymentLog {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("amt=" + "$_amt" + ", ");
    buffer.write("oid=" + "$_oid" + ", ");
    buffer.write("q=" + "$_q" + ", ");
    buffer.write("refId=" + "$_refId" + ", ");
    buffer.write("checkResponseESewa=" + "$_checkResponseESewa" + ", ");
    buffer.write("esewaError=" + "$_esewaError" + ", ");
    buffer.write("userPhone=" + "$_userPhone" + ", ");
    buffer.write("cartList=" + "$_cartList" + ", ");
    buffer.write("paymentSelected=" + "$_paymentSelected" + ", ");
    buffer.write("khaltiEvent=" + "$_khaltiEvent" + ", ");
    buffer.write("khaltiError=" + "$_khaltiError" + ", ");
    buffer.write("khaltiResponse=" + "$_khaltiResponse" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  PaymentLog copyWith({String? id, String? amt, String? oid, String? q, String? refId, String? checkResponseESewa, String? esewaError, String? userPhone, String? cartList, String? paymentSelected, String? khaltiEvent, String? khaltiError, String? khaltiResponse}) {
    return PaymentLog._internal(
      id: id ?? this.id,
      amt: amt ?? this.amt,
      oid: oid ?? this.oid,
      q: q ?? this.q,
      refId: refId ?? this.refId,
      checkResponseESewa: checkResponseESewa ?? this.checkResponseESewa,
      esewaError: esewaError ?? this.esewaError,
      userPhone: userPhone ?? this.userPhone,
      cartList: cartList ?? this.cartList,
      paymentSelected: paymentSelected ?? this.paymentSelected,
      khaltiEvent: khaltiEvent ?? this.khaltiEvent,
      khaltiError: khaltiError ?? this.khaltiError,
      khaltiResponse: khaltiResponse ?? this.khaltiResponse);
  }
  
  PaymentLog.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _amt = json['amt'],
      _oid = json['oid'],
      _q = json['q'],
      _refId = json['refId'],
      _checkResponseESewa = json['checkResponseESewa'],
      _esewaError = json['esewaError'],
      _userPhone = json['userPhone'],
      _cartList = json['cartList'],
      _paymentSelected = json['paymentSelected'],
      _khaltiEvent = json['khaltiEvent'],
      _khaltiError = json['khaltiError'],
      _khaltiResponse = json['khaltiResponse'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'amt': _amt, 'oid': _oid, 'q': _q, 'refId': _refId, 'checkResponseESewa': _checkResponseESewa, 'esewaError': _esewaError, 'userPhone': _userPhone, 'cartList': _cartList, 'paymentSelected': _paymentSelected, 'khaltiEvent': _khaltiEvent, 'khaltiError': _khaltiError, 'khaltiResponse': _khaltiResponse, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "paymentLog.id");
  static final QueryField AMT = QueryField(fieldName: "amt");
  static final QueryField OID = QueryField(fieldName: "oid");
  static final QueryField Q = QueryField(fieldName: "q");
  static final QueryField REFID = QueryField(fieldName: "refId");
  static final QueryField CHECKRESPONSEESEWA = QueryField(fieldName: "checkResponseESewa");
  static final QueryField ESEWAERROR = QueryField(fieldName: "esewaError");
  static final QueryField USERPHONE = QueryField(fieldName: "userPhone");
  static final QueryField CARTLIST = QueryField(fieldName: "cartList");
  static final QueryField PAYMENTSELECTED = QueryField(fieldName: "paymentSelected");
  static final QueryField KHALTIEVENT = QueryField(fieldName: "khaltiEvent");
  static final QueryField KHALTIERROR = QueryField(fieldName: "khaltiError");
  static final QueryField KHALTIRESPONSE = QueryField(fieldName: "khaltiResponse");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "PaymentLog";
    modelSchemaDefinition.pluralName = "PaymentLogs";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: PaymentLog.AMT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: PaymentLog.OID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: PaymentLog.Q,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: PaymentLog.REFID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: PaymentLog.CHECKRESPONSEESEWA,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: PaymentLog.ESEWAERROR,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: PaymentLog.USERPHONE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: PaymentLog.CARTLIST,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: PaymentLog.PAYMENTSELECTED,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: PaymentLog.KHALTIEVENT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: PaymentLog.KHALTIERROR,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: PaymentLog.KHALTIRESPONSE,
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

class _PaymentLogModelType extends ModelType<PaymentLog> {
  const _PaymentLogModelType();
  
  @override
  PaymentLog fromJson(Map<String, dynamic> jsonData) {
    return PaymentLog.fromJson(jsonData);
  }
}