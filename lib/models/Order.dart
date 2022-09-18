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

/** This is an auto generated class representing the Order type in your schema. */
@immutable
class Order extends Model {
  static const classType = const _OrderModelType();
  final String id;
  final String? _orderId;
  final List<ProductInfo>? _cartList;
  final List<eachProductOrder>? _products;
  final String? _date;
  final String? _status;
  final String? _userName;
  final String? _firstName;
  final String? _lastName;
  final String? _country;
  final String? _street;
  final String? _town;
  final String? _phone;
  final String? _email;
  final String? _note;
  final int? _total;
  final int? _grandTotal;
  final String? _shippingStyle;
  final int? _shippingPrice;
  final int? _shippingCode;
  final String? _baseType;
  final TemporalDateTime? _createdAt;
  final int? _NoCallTimes;
  final TemporalDateTime? _NoCallDate;
  final user? _userOrder;
  final String? _shipNepalOrderStatus;
  final String? _couponCode;
  final String? _payment;
  final bool? _payment_verified;
  final String? _smsSendNotPaid;
  final TemporalDateTime? _smsSendDate;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  String? get orderId {
    return _orderId;
  }

  List<ProductInfo> get cartList {
    try {
      return _cartList!;
    } catch (e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  List<eachProductOrder> get products {
    try {
      return _products!;
    } catch (e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String get date {
    try {
      return _date!;
    } catch (e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String get status {
    try {
      return _status!;
    } catch (e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String get userName {
    try {
      return _userName!;
    } catch (e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String get firstName {
    try {
      return _firstName!;
    } catch (e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String get lastName {
    try {
      return _lastName!;
    } catch (e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String get country {
    try {
      return _country!;
    } catch (e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String get street {
    try {
      return _street!;
    } catch (e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String get town {
    try {
      return _town!;
    } catch (e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String get phone {
    try {
      return _phone!;
    } catch (e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String get email {
    try {
      return _email!;
    } catch (e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String? get note {
    return _note;
  }

  int get total {
    try {
      return _total!;
    } catch (e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  int get grandTotal {
    try {
      return _grandTotal!;
    } catch (e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String get shippingStyle {
    try {
      return _shippingStyle!;
    } catch (e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  int get shippingPrice {
    try {
      return _shippingPrice!;
    } catch (e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  int? get shippingCode {
    return _shippingCode;
  }

  String get baseType {
    try {
      return _baseType!;
    } catch (e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  TemporalDateTime get createdAt {
    try {
      return _createdAt!;
    } catch (e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  int? get NoCallTimes {
    return _NoCallTimes;
  }

  TemporalDateTime? get NoCallDate {
    return _NoCallDate;
  }

  user? get userOrder {
    return _userOrder;
  }

  String? get shipNepalOrderStatus {
    return _shipNepalOrderStatus;
  }

  String? get couponCode {
    return _couponCode;
  }

  String? get payment {
    return _payment;
  }

  bool? get payment_verified {
    return _payment_verified;
  }

  String? get smsSendNotPaid {
    return _smsSendNotPaid;
  }

  TemporalDateTime? get smsSendDate {
    return _smsSendDate;
  }

  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }

  const Order._internal(
      {required this.id,
      orderId,
      required cartList,
      required products,
      required date,
      required status,
      required userName,
      required firstName,
      required lastName,
      required country,
      required street,
      required town,
      required phone,
      required email,
      note,
      required total,
      required grandTotal,
      required shippingStyle,
      required shippingPrice,
      shippingCode,
      required baseType,
      required createdAt,
      NoCallTimes,
      NoCallDate,
      userOrder,
      shipNepalOrderStatus,
      couponCode,
      payment,
      payment_verified,
      smsSendNotPaid,
      smsSendDate,
      updatedAt})
      : _orderId = orderId,
        _cartList = cartList,
        _products = products,
        _date = date,
        _status = status,
        _userName = userName,
        _firstName = firstName,
        _lastName = lastName,
        _country = country,
        _street = street,
        _town = town,
        _phone = phone,
        _email = email,
        _note = note,
        _total = total,
        _grandTotal = grandTotal,
        _shippingStyle = shippingStyle,
        _shippingPrice = shippingPrice,
        _shippingCode = shippingCode,
        _baseType = baseType,
        _createdAt = createdAt,
        _NoCallTimes = NoCallTimes,
        _NoCallDate = NoCallDate,
        _userOrder = userOrder,
        _shipNepalOrderStatus = shipNepalOrderStatus,
        _couponCode = couponCode,
        _payment = payment,
        _payment_verified = payment_verified,
        _smsSendNotPaid = smsSendNotPaid,
        _smsSendDate = smsSendDate,
        _updatedAt = updatedAt;

  factory Order(
      {String? id,
      String? orderId,
      required List<ProductInfo> cartList,
      required List<eachProductOrder> products,
      required String date,
      required String status,
      required String userName,
      required String firstName,
      required String lastName,
      required String country,
      required String street,
      required String town,
      required String phone,
      required String email,
      String? note,
      required int total,
      required int grandTotal,
      required String shippingStyle,
      required int shippingPrice,
      int? shippingCode,
      required String baseType,
      required TemporalDateTime createdAt,
      int? NoCallTimes,
      TemporalDateTime? NoCallDate,
      user? userOrder,
      String? shipNepalOrderStatus,
      String? couponCode,
      String? payment,
      bool? payment_verified,
      String? smsSendNotPaid,
      TemporalDateTime? smsSendDate}) {
    return Order._internal(
        id: id == null ? UUID.getUUID() : id,
        orderId: orderId,
        cartList: cartList != null
            ? List<ProductInfo>.unmodifiable(cartList)
            : cartList,
        products: products != null
            ? List<eachProductOrder>.unmodifiable(products)
            : products,
        date: date,
        status: status,
        userName: userName,
        firstName: firstName,
        lastName: lastName,
        country: country,
        street: street,
        town: town,
        phone: phone,
        email: email,
        note: note,
        total: total,
        grandTotal: grandTotal,
        shippingStyle: shippingStyle,
        shippingPrice: shippingPrice,
        shippingCode: shippingCode,
        baseType: baseType,
        createdAt: createdAt,
        NoCallTimes: NoCallTimes,
        NoCallDate: NoCallDate,
        userOrder: userOrder,
        shipNepalOrderStatus: shipNepalOrderStatus,
        couponCode: couponCode,
        payment: payment,
        payment_verified: payment_verified,
        smsSendNotPaid: smsSendNotPaid,
        smsSendDate: smsSendDate);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Order &&
        id == other.id &&
        _orderId == other._orderId &&
        DeepCollectionEquality().equals(_cartList, other._cartList) &&
        DeepCollectionEquality().equals(_products, other._products) &&
        _date == other._date &&
        _status == other._status &&
        _userName == other._userName &&
        _firstName == other._firstName &&
        _lastName == other._lastName &&
        _country == other._country &&
        _street == other._street &&
        _town == other._town &&
        _phone == other._phone &&
        _email == other._email &&
        _note == other._note &&
        _total == other._total &&
        _grandTotal == other._grandTotal &&
        _shippingStyle == other._shippingStyle &&
        _shippingPrice == other._shippingPrice &&
        _shippingCode == other._shippingCode &&
        _baseType == other._baseType &&
        _createdAt == other._createdAt &&
        _NoCallTimes == other._NoCallTimes &&
        _NoCallDate == other._NoCallDate &&
        _userOrder == other._userOrder &&
        _shipNepalOrderStatus == other._shipNepalOrderStatus &&
        _couponCode == other._couponCode &&
        _payment == other._payment &&
        _payment_verified == other._payment_verified &&
        _smsSendNotPaid == other._smsSendNotPaid &&
        _smsSendDate == other._smsSendDate;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Order {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("orderId=" + "$_orderId" + ", ");
    buffer.write("cartList=" +
        (_cartList != null ? _cartList!.toString() : "null") +
        ", ");
    buffer.write("date=" + "$_date" + ", ");
    buffer.write("status=" + "$_status" + ", ");
    buffer.write("userName=" + "$_userName" + ", ");
    buffer.write("firstName=" + "$_firstName" + ", ");
    buffer.write("lastName=" + "$_lastName" + ", ");
    buffer.write("country=" + "$_country" + ", ");
    buffer.write("street=" + "$_street" + ", ");
    buffer.write("town=" + "$_town" + ", ");
    buffer.write("phone=" + "$_phone" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("note=" + "$_note" + ", ");
    buffer.write(
        "total=" + (_total != null ? _total!.toString() : "null") + ", ");
    buffer.write("grandTotal=" +
        (_grandTotal != null ? _grandTotal!.toString() : "null") +
        ", ");
    buffer.write("shippingStyle=" + "$_shippingStyle" + ", ");
    buffer.write("shippingPrice=" +
        (_shippingPrice != null ? _shippingPrice!.toString() : "null") +
        ", ");
    buffer.write("shippingCode=" +
        (_shippingCode != null ? _shippingCode!.toString() : "null") +
        ", ");
    buffer.write("baseType=" + "$_baseType" + ", ");
    buffer.write("createdAt=" +
        (_createdAt != null ? _createdAt!.format() : "null") +
        ", ");
    buffer.write("NoCallTimes=" +
        (_NoCallTimes != null ? _NoCallTimes!.toString() : "null") +
        ", ");
    buffer.write("NoCallDate=" +
        (_NoCallDate != null ? _NoCallDate!.format() : "null") +
        ", ");
    buffer.write("userOrder=" +
        (_userOrder != null ? _userOrder!.toString() : "null") +
        ", ");
    buffer.write("shipNepalOrderStatus=" + "$_shipNepalOrderStatus" + ", ");
    buffer.write("couponCode=" + "$_couponCode" + ", ");
    buffer.write("payment=" + "$_payment" + ", ");
    buffer.write("payment_verified=" +
        (_payment_verified != null ? _payment_verified!.toString() : "null") +
        ", ");
    buffer.write("smsSendNotPaid=" + "$_smsSendNotPaid" + ", ");
    buffer.write("smsSendDate=" +
        (_smsSendDate != null ? _smsSendDate!.format() : "null") +
        ", ");
    buffer.write(
        "updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  Order copyWith(
      {String? id,
      String? orderId,
      List<ProductInfo>? cartList,
      List<eachProductOrder>? products,
      String? date,
      String? status,
      String? userName,
      String? firstName,
      String? lastName,
      String? country,
      String? street,
      String? town,
      String? phone,
      String? email,
      String? note,
      int? total,
      int? grandTotal,
      String? shippingStyle,
      int? shippingPrice,
      int? shippingCode,
      String? baseType,
      TemporalDateTime? createdAt,
      int? NoCallTimes,
      TemporalDateTime? NoCallDate,
      user? userOrder,
      String? shipNepalOrderStatus,
      String? couponCode,
      String? payment,
      bool? payment_verified,
      String? smsSendNotPaid,
      TemporalDateTime? smsSendDate}) {
    return Order._internal(
        id: id ?? this.id,
        orderId: orderId ?? this.orderId,
        cartList: cartList ?? this.cartList,
        products: products ?? this.products,
        date: date ?? this.date,
        status: status ?? this.status,
        userName: userName ?? this.userName,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        country: country ?? this.country,
        street: street ?? this.street,
        town: town ?? this.town,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        note: note ?? this.note,
        total: total ?? this.total,
        grandTotal: grandTotal ?? this.grandTotal,
        shippingStyle: shippingStyle ?? this.shippingStyle,
        shippingPrice: shippingPrice ?? this.shippingPrice,
        shippingCode: shippingCode ?? this.shippingCode,
        baseType: baseType ?? this.baseType,
        createdAt: createdAt ?? this.createdAt,
        NoCallTimes: NoCallTimes ?? this.NoCallTimes,
        NoCallDate: NoCallDate ?? this.NoCallDate,
        userOrder: userOrder ?? this.userOrder,
        shipNepalOrderStatus: shipNepalOrderStatus ?? this.shipNepalOrderStatus,
        couponCode: couponCode ?? this.couponCode,
        payment: payment ?? this.payment,
        payment_verified: payment_verified ?? this.payment_verified,
        smsSendNotPaid: smsSendNotPaid ?? this.smsSendNotPaid,
        smsSendDate: smsSendDate ?? this.smsSendDate);
  }

  Order.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _orderId = json['orderId'],
        _cartList = json['cartList'] is List
            ? (json['cartList'] as List)
                .where((e) => e != null)
                .map((e) => ProductInfo.fromJson(new Map<String, dynamic>.from(
                    e['serializedData'] != null ? e['serializedData'] : e)))
                .toList()
            : null,
        _products = json['products'] is Map
            ? (json['products']["items"] as List)
                .where((e) => (e != null))
                .map((e) => eachProductOrder.fromJson(
                    new Map<String, dynamic>.from(
                        e['serializedData'] != null ? e['serializedData'] : e)))
                .toList()
            : null,
        _date = json['date'],
        _status = json['status'],
        _userName = json['userName'],
        _firstName = json['firstName'],
        _lastName = json['lastName'],
        _country = json['country'],
        _street = json['street'],
        _town = json['town'],
        _phone = json['phone'],
        _email = json['email'],
        _note = json['note'],
        _total = (json['total'] as num?)?.toInt(),
        _grandTotal = (json['grandTotal'] as num?)?.toInt(),
        _shippingStyle = json['shippingStyle'],
        _shippingPrice = (json['shippingPrice'] as num?)?.toInt(),
        _shippingCode = (json['shippingCode'] as num?)?.toInt(),
        _baseType = json['baseType'],
        _createdAt = json['createdAt'] != null
            ? TemporalDateTime.fromString(json['createdAt'])
            : null,
        _NoCallTimes = (json['NoCallTimes'] as num?)?.toInt(),
        _NoCallDate = json['NoCallDate'] != null
            ? TemporalDateTime.fromString(json['NoCallDate'])
            : null,
        _userOrder = json['userOrder']?['serializedData'] != null
            ? user.fromJson(new Map<String, dynamic>.from(
                json['userOrder']['serializedData']))
            : null,
        _shipNepalOrderStatus = json['shipNepalOrderStatus'],
        _couponCode = json['couponCode'],
        _payment = json['payment'],
        _payment_verified = json['payment_verified'],
        _smsSendNotPaid = json['smsSendNotPaid'],
        _smsSendDate = json['smsSendDate'] != null
            ? TemporalDateTime.fromString(json['smsSendDate'])
            : null,
        _updatedAt = json['updatedAt'] != null
            ? TemporalDateTime.fromString(json['updatedAt'])
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'orderId': _orderId,
        'cartList': _cartList?.map((ProductInfo? e) => e?.toJson()).toList(),
        'products':
            _products?.map((eachProductOrder? e) => e?.toJson()).toList(),
        'date': _date,
        'status': _status,
        'userName': _userName,
        'firstName': _firstName,
        'lastName': _lastName,
        'country': _country,
        'street': _street,
        'town': _town,
        'phone': _phone,
        'email': _email,
        'note': _note,
        'total': _total,
        'grandTotal': _grandTotal,
        'shippingStyle': _shippingStyle,
        'shippingPrice': _shippingPrice,
        'shippingCode': _shippingCode,
        'baseType': _baseType,
        'createdAt': _createdAt?.format(),
        'NoCallTimes': _NoCallTimes,
        'NoCallDate': _NoCallDate?.format(),
        'userOrder': _userOrder?.toJson(),
        'shipNepalOrderStatus': _shipNepalOrderStatus,
        'couponCode': _couponCode,
        'payment': _payment,
        'payment_verified': _payment_verified,
        'smsSendNotPaid': _smsSendNotPaid,
        'smsSendDate': _smsSendDate?.format(),
        'updatedAt': _updatedAt?.format()
      };

  static final QueryField ID = QueryField(fieldName: "order.id");
  static final QueryField ORDERID = QueryField(fieldName: "orderId");
  static final QueryField CARTLIST = QueryField(fieldName: "cartList");
  static final QueryField PRODUCTS = QueryField(
      fieldName: "products",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (eachProductOrder).toString()));
  static final QueryField DATE = QueryField(fieldName: "date");
  static final QueryField STATUS = QueryField(fieldName: "status");
  static final QueryField USERNAME = QueryField(fieldName: "userName");
  static final QueryField FIRSTNAME = QueryField(fieldName: "firstName");
  static final QueryField LASTNAME = QueryField(fieldName: "lastName");
  static final QueryField COUNTRY = QueryField(fieldName: "country");
  static final QueryField STREET = QueryField(fieldName: "street");
  static final QueryField TOWN = QueryField(fieldName: "town");
  static final QueryField PHONE = QueryField(fieldName: "phone");
  static final QueryField EMAIL = QueryField(fieldName: "email");
  static final QueryField NOTE = QueryField(fieldName: "note");
  static final QueryField TOTAL = QueryField(fieldName: "total");
  static final QueryField GRANDTOTAL = QueryField(fieldName: "grandTotal");
  static final QueryField SHIPPINGSTYLE =
      QueryField(fieldName: "shippingStyle");
  static final QueryField SHIPPINGPRICE =
      QueryField(fieldName: "shippingPrice");
  static final QueryField SHIPPINGCODE = QueryField(fieldName: "shippingCode");
  static final QueryField BASETYPE = QueryField(fieldName: "baseType");
  static final QueryField CREATEDAT = QueryField(fieldName: "createdAt");
  static final QueryField NOCALLTIMES = QueryField(fieldName: "NoCallTimes");
  static final QueryField NOCALLDATE = QueryField(fieldName: "NoCallDate");
  static final QueryField USERORDER = QueryField(
      fieldName: "userOrder",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (user).toString()));
  static final QueryField SHIPNEPALORDERSTATUS =
      QueryField(fieldName: "shipNepalOrderStatus");
  static final QueryField COUPONCODE = QueryField(fieldName: "couponCode");
  static final QueryField PAYMENT = QueryField(fieldName: "payment");
  static final QueryField PAYMENT_VERIFIED =
      QueryField(fieldName: "payment_verified");
  static final QueryField SMSSENDNOTPAID =
      QueryField(fieldName: "smsSendNotPaid");
  static final QueryField SMSSENDDATE = QueryField(fieldName: "smsSendDate");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Order";
    modelSchemaDefinition.pluralName = "Orders";

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Order.ORDERID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
        fieldName: 'cartList',
        isRequired: true,
        isArray: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.embeddedCollection,
            ofCustomTypeName: 'ProductInfo')));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: Order.PRODUCTS,
        isRequired: true,
        ofModelName: (eachProductOrder).toString(),
        associatedKey: eachProductOrder.ORDERCART));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Order.DATE,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Order.STATUS,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Order.USERNAME,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Order.FIRSTNAME,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Order.LASTNAME,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Order.COUNTRY,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Order.STREET,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Order.TOWN,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Order.PHONE,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Order.EMAIL,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Order.NOTE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Order.TOTAL,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Order.GRANDTOTAL,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Order.SHIPPINGSTYLE,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Order.SHIPPINGPRICE,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Order.SHIPPINGCODE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Order.BASETYPE,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Order.CREATEDAT,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Order.NOCALLTIMES,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Order.NOCALLDATE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
        key: Order.USERORDER,
        isRequired: false,
        targetName: "userId",
        ofModelName: (user).toString()));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Order.SHIPNEPALORDERSTATUS,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Order.COUPONCODE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Order.PAYMENT,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Order.PAYMENT_VERIFIED,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.bool)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Order.SMSSENDNOTPAID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Order.SMSSENDDATE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
        fieldName: 'updatedAt',
        isRequired: false,
        isReadOnly: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));
  });
}

class _OrderModelType extends ModelType<Order> {
  const _OrderModelType();

  @override
  Order fromJson(Map<String, dynamic> jsonData) {
    return Order.fromJson(jsonData);
  }
}
