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
import 'ApiInfo.dart';
import 'Balance.dart';
import 'Cart.dart';
import 'Comment.dart';
import 'Coupon.dart';
import 'CouponList.dart';
import 'Driver.dart';
import 'Expenses.dart';
import 'FcmDevice.dart';
import 'FcmDeviceTopic.dart';
import 'FcmTopic.dart';
import 'Keyword.dart';
import 'Like.dart';
import 'Order.dart';
import 'OverAllReviews.dart';
import 'PaymentLog.dart';
import 'PlayList.dart';
import 'Post.dart';
import 'Price.dart';
import 'ProductReview.dart';
import 'RMBStatement.dart';
import 'RMBTotal.dart';
import 'RecoverCart.dart';
import 'ScrapDetail.dart';
import 'ShipNepal.dart';
import 'ShipNepalProduct.dart';
import 'UserWishList.dart';
import 'WayBill.dart';
import 'audioOption.dart';
import 'banner.dart';
import 'confirmedUserCount.dart';
import 'eachProductOrder.dart';
import 'freeShipping.dart';
import 'newsletter.dart';
import 'notificationStatus.dart';
import 'quickSale.dart';
import 'scrapTrigger.dart';
import 'user.dart';
import 'whoIsPlaying.dart';
import 'Details.dart';
import 'Product.dart';
import 'ProductInfo.dart';

export 'ApiInfo.dart';
export 'Balance.dart';
export 'Cart.dart';
export 'Comment.dart';
export 'Coupon.dart';
export 'CouponList.dart';
export 'Details.dart';
export 'Driver.dart';
export 'Expenses.dart';
export 'FcmDevice.dart';
export 'FcmDeviceTopic.dart';
export 'FcmTopic.dart';
export 'Keyword.dart';
export 'Like.dart';
export 'Order.dart';
export 'OverAllReviews.dart';
export 'PaymentLog.dart';
export 'PlayList.dart';
export 'Post.dart';
export 'Price.dart';
export 'Product.dart';
export 'ProductInfo.dart';
export 'ProductReview.dart';
export 'RMBStatement.dart';
export 'RMBTotal.dart';
export 'RecoverCart.dart';
export 'ScrapDetail.dart';
export 'ShipNepal.dart';
export 'ShipNepalProduct.dart';
export 'UserWishList.dart';
export 'WayBill.dart';
export 'audioOption.dart';
export 'banner.dart';
export 'confirmedUserCount.dart';
export 'eachProductOrder.dart';
export 'freeShipping.dart';
export 'newsletter.dart';
export 'notificationStatus.dart';
export 'quickSale.dart';
export 'scrapTrigger.dart';
export 'user.dart';
export 'whoIsPlaying.dart';

class ModelProvider implements ModelProviderInterface {
  @override
  String version = "961dbf09c3a338b247a9064683b1645d";
  @override
  List<ModelSchema> modelSchemas = [ApiInfo.schema, Balance.schema, Cart.schema, Comment.schema, Coupon.schema, CouponList.schema, Driver.schema, Expenses.schema, FcmDevice.schema, FcmDeviceTopic.schema, FcmTopic.schema, Keyword.schema, Like.schema, Order.schema, OverAllReviews.schema, PaymentLog.schema, PlayList.schema, Post.schema, Price.schema, ProductReview.schema, RMBStatement.schema, RMBTotal.schema, RecoverCart.schema, ScrapDetail.schema, ShipNepal.schema, ShipNepalProduct.schema, UserWishList.schema, WayBill.schema, audioOption.schema, banner.schema, confirmedUserCount.schema, eachProductOrder.schema, freeShipping.schema, newsletter.schema, notificationStatus.schema, quickSale.schema, scrapTrigger.schema, user.schema, whoIsPlaying.schema];
  static final ModelProvider _instance = ModelProvider();
  @override
  List<ModelSchema> customTypeSchemas = [Details.schema, Product.schema, ProductInfo.schema];

  static ModelProvider get instance => _instance;
  
  ModelType getModelTypeByModelName(String modelName) {
    switch(modelName) {
      case "ApiInfo":
        return ApiInfo.classType;
      case "Balance":
        return Balance.classType;
      case "Cart":
        return Cart.classType;
      case "Comment":
        return Comment.classType;
      case "Coupon":
        return Coupon.classType;
      case "CouponList":
        return CouponList.classType;
      case "Driver":
        return Driver.classType;
      case "Expenses":
        return Expenses.classType;
      case "FcmDevice":
        return FcmDevice.classType;
      case "FcmDeviceTopic":
        return FcmDeviceTopic.classType;
      case "FcmTopic":
        return FcmTopic.classType;
      case "Keyword":
        return Keyword.classType;
      case "Like":
        return Like.classType;
      case "Order":
        return Order.classType;
      case "OverAllReviews":
        return OverAllReviews.classType;
      case "PaymentLog":
        return PaymentLog.classType;
      case "PlayList":
        return PlayList.classType;
      case "Post":
        return Post.classType;
      case "Price":
        return Price.classType;
      case "ProductReview":
        return ProductReview.classType;
      case "RMBStatement":
        return RMBStatement.classType;
      case "RMBTotal":
        return RMBTotal.classType;
      case "RecoverCart":
        return RecoverCart.classType;
      case "ScrapDetail":
        return ScrapDetail.classType;
      case "ShipNepal":
        return ShipNepal.classType;
      case "ShipNepalProduct":
        return ShipNepalProduct.classType;
      case "UserWishList":
        return UserWishList.classType;
      case "WayBill":
        return WayBill.classType;
      case "audioOption":
        return audioOption.classType;
      case "banner":
        return banner.classType;
      case "confirmedUserCount":
        return confirmedUserCount.classType;
      case "eachProductOrder":
        return eachProductOrder.classType;
      case "freeShipping":
        return freeShipping.classType;
      case "newsletter":
        return newsletter.classType;
      case "notificationStatus":
        return notificationStatus.classType;
      case "quickSale":
        return quickSale.classType;
      case "scrapTrigger":
        return scrapTrigger.classType;
      case "user":
        return user.classType;
      case "whoIsPlaying":
        return whoIsPlaying.classType;
      default:
        throw Exception("Failed to find model in model provider for model name: " + modelName);
    }
  }
}