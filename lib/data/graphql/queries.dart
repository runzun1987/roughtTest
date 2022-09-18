String cartSortByPhoneNumber = '''
  query CartSortByPhoneNumber(
    \$baseType: String
    \$phoneNumber: ModelStringKeyConditionInput
    \$sortDirection: ModelSortDirection
    \$filter: ModelCartFilterInput
    \$limit: Int
    \$nextToken: String
  ) {
    cartSortByPhoneNumber(
      baseType: \$baseType
      phoneNumber: \$phoneNumber
      sortDirection: \$sortDirection
      filter: \$filter
      limit: \$limit
      nextToken: \$nextToken
    ) {
      items {
        id
        items {
          detail {
            name
            pic_url
            prop_key
            value
            prop_val
          }
          image
          price
          productId
          qty
          skuId
          sum
          title
          bigImageUrl
          city
          tier
          shippingType
          shippingCost
          sellerPrice
          ourPureShipping
          shippingStatus
          stock
          shippingCode
          purchased
          note
          provider
        }
        userName
        phoneNumber
        baseType
        createdAt
        updatedAt
      }
      nextToken
    }
  }
''';

String UserWishListByProductId = '''
  query UserWishListByProductId(
    \$userPhone: String
    \$productId: ModelStringKeyConditionInput
    \$sortDirection: ModelSortDirection
    \$filter: ModelUserWishListFilterInput
    \$limit: Int
    \$nextToken: String
  ) {
    UserWishListByProductId(
      userPhone: \$userPhone
      productId: \$productId
      sortDirection: \$sortDirection
      filter: \$filter
      limit: \$limit
      nextToken: \$nextToken
    ) {
      items {
        id
        userPhone
        productId
        provider
        title
        price
        image
        isPublic
        baseType
        createdAt
        updatedAt
      }
      nextToken
    }
  }
''';

String wishListByUserPhone = /* GraphQL */ """
  query WishListByUserPhone(
    \$baseType: String
    \$userPhone: ModelStringKeyConditionInput
    \$sortDirection: ModelSortDirection
    \$filter: ModelUserWishListFilterInput
    \$limit: Int
    \$nextToken: String
  ) {
    wishListByUserPhone(
      baseType: \$baseType
      userPhone: \$userPhone
      sortDirection: \$sortDirection
      filter: \$filter
      limit: \$limit
      nextToken: \$nextToken
    ) {
      items {
        id
        userPhone
        productId
        provider
        title
        price
        image
        isPublic
        baseType
        createdAt
        updatedAt
      }
      nextToken
    }
  }
""";

String getFcmDeviceByPhone = /* GraphQL */ """
  query GetFcmDeviceByPhone(
    \$baseType: String
    \$userPhone: ModelStringKeyConditionInput
    \$sortDirection: ModelSortDirection
    \$filter: ModelFcmDeviceFilterInput
    \$limit: Int
    \$nextToken: String
  ) {
    getFcmDeviceByPhone(
      baseType: \$baseType
      userPhone: \$userPhone
      sortDirection: \$sortDirection
      filter: \$filter
      limit: \$limit
      nextToken: \$nextToken
    ) {
      items {
        id
        deviceId
        userPhone
        baseType
        fcmTopics {
          items {
            id
            fcmDeviceID
            fcmTopicID
            fcmDevices {
              id
              deviceId
              userPhone
              baseType
              fcmTopics {
                items {
                  id
                  fcmDeviceID
                  fcmTopicID
                  baseType
                  createdAt
                  updatedAt
                }
                nextToken
              }
              createdAt
              updatedAt
            }
            fcmTopics {
              id
              name
              baseType
              FcmDeviceID {
                items {
                  id
                  fcmDeviceID
                  fcmTopicID
                  baseType
                  createdAt
                  updatedAt
                }
                nextToken
              }
              createdAt
              updatedAt
            }
            baseType
            createdAt
            updatedAt
          }
          nextToken
        }
        createdAt
        updatedAt
      }
      nextToken
    }
  }
""";

String getFcmDeviceByDeviceId = /* GraphQL */ """
  query GetFcmDeviceByDeviceId(
    \$baseType: String
    \$deviceId: ModelStringKeyConditionInput
    \$sortDirection: ModelSortDirection
    \$filter: ModelFcmDeviceFilterInput
    \$limit: Int
    \$nextToken: String
  ) {
    getFcmDeviceByDeviceId(
      baseType: \$baseType
      deviceId: \$deviceId
      sortDirection: \$sortDirection
      filter: \$filter
      limit: \$limit
      nextToken: \$nextToken
    ) {
      items {
        id
        deviceId
        userPhone
        baseType
        fcmTopics {
          items {
            id
            fcmDeviceID
            fcmTopicID
            fcmDevices {
              id
              deviceId
              userPhone
              baseType
              fcmTopics {
                items {
                  id
                  fcmDeviceID
                  fcmTopicID
                  baseType
                  createdAt
                  updatedAt
                }
                nextToken
              }
              createdAt
              updatedAt
            }
            fcmTopics {
              id
              name
              baseType
              FcmDeviceID {
                items {
                  id
                  fcmDeviceID
                  fcmTopicID
                  baseType
                  createdAt
                  updatedAt
                }
                nextToken
              }
              createdAt
              updatedAt
            }
            baseType
            createdAt
            updatedAt
          }
          nextToken
        }
        createdAt
        updatedAt
      }
      nextToken
    }
  }
""";

String byFcmDevice = /* GraphQL */ """
  query ByFcmDevice(
    \$fcmDeviceID: ID
    \$fcmTopicID: ModelIDKeyConditionInput
    \$sortDirection: ModelSortDirection
    \$filter: ModelFcmDeviceTopicFilterInput
    \$limit: Int
    \$nextToken: String
  ) {
    byFcmDevice(
      fcmDeviceID: \$fcmDeviceID
      fcmTopicID: \$fcmTopicID
      sortDirection: \$sortDirection
      filter: \$filter
      limit: \$limit
      nextToken: \$nextToken
    ) {
      items {
        id
        fcmDeviceID
        fcmTopicID
        fcmDevices {
          id
          deviceId
          userPhone
          baseType
          fcmTopics {
            items {
              id
              fcmDeviceID
              fcmTopicID
              fcmDevices {
                id
                deviceId
                userPhone
                baseType
                fcmTopics {
                  nextToken
                }
                createdAt
                updatedAt
              }
              fcmTopics {
                id
                name
                baseType
                FcmDeviceID {
                  nextToken
                }
                createdAt
                updatedAt
              }
              baseType
              createdAt
              updatedAt
            }
            nextToken
          }
          createdAt
          updatedAt
        }
        fcmTopics {
          id
          name
          baseType
          FcmDeviceID {
            items {
              id
              fcmDeviceID
              fcmTopicID
              fcmDevices {
                id
                deviceId
                userPhone
                baseType
                fcmTopics {
                  nextToken
                }
                createdAt
                updatedAt
              }
              fcmTopics {
                id
                name
                baseType
                FcmDeviceID {
                  nextToken
                }
                createdAt
                updatedAt
              }
              baseType
              createdAt
              updatedAt
            }
            nextToken
          }
          createdAt
          updatedAt
        }
        baseType
        createdAt
        updatedAt
      }
      nextToken
    }
  }
""";

String orderPhoneSearchSortByDate = /* GraphQL */ """
    query OrderPhoneSearchSortByDate(
    \$phone: String
    \$createdAt: ModelStringKeyConditionInput
    \$sortDirection: ModelSortDirection
    \$filter: ModelOrderFilterInput
    \$limit: Int
    \$nextToken: String
  ) {
    orderPhoneSearchSortByDate(
      phone: \$phone
      createdAt: \$createdAt
      sortDirection: \$sortDirection
      filter: \$filter
      limit: \$limit
      nextToken: \$nextToken
    ) {
      items {
        id
        orderId
        cartList {
          detail {
            name
            pic_url
            prop_key
            value
            prop_val
          }
          image
          price
          productId
          qty
          skuId
          sum
          title
          bigImageUrl
          city
          tier
          shippingType
          shippingCost
          sellerPrice
          ourPureShipping
          shippingStatus
          stock
          shippingCode
          purchased
          note
          provider
        }
        products {
          items {
            id
            createdAt
            secondaryOrderId
            image
            price
            productId
            qty
            skuId
            sum
            title
            bigImageUrl
            city
            tier
            shippingType
            shippingCost
            sellerPrice
            ourPureShipping
            shippingStatus
            deliveryDate
            stock
            shippingCode
            purchased
            note
            provider
            orderId
            baseType
            shipNepalOrderID
            selected
            shipNepalOrderStatus
            shipNepalOrderReceivedOn
             shipNepalOrder {
              id
              createdAt
              updatedAt
              order_id
              date
              order_status
              products {
                items {
                  id
                  createdAt
                  price
                  total
                  qty
                  tracking_number
                  weight
                  grand_total
                  pic
                  product_url
                  product_id
                  way_bill_number
                  order_status
                  baseType
                  shipNepalId
                  wayBillId
                  updatedAt
                }
                nextToken
              }
              baseType
            }
            updatedAt
          }
          nextToken
        }
        date
        status
        userName
        firstName
        lastName
        country
        street
        town
        phone
        email
        note
        total
        grandTotal
        shippingStyle
        shippingPrice
        shippingCode
        baseType
        createdAt
        NoCallTimes
        NoCallDate
        userId
        userOrder {
          id
          country
          email_verified
          firstName
          street
          town
          lastName
          phone_verified
          phone
          email
          userName
          userStatus
          createdAt
          baseType
          orders {
            nextToken
          }
          updatedAt
        }
        shipNepalOrderStatus
        couponCode
        payment
        payment_verified
        smsSendNotPaid
        smsSendDate
        updatedAt
      }
      nextToken
    }
  }
""";

String orderStatusByPhone = /* GraphQL */ """
 query OrderStatusByPhone(
    \$phone: String
    \$status: ModelStringKeyConditionInput
    \$sortDirection: ModelSortDirection
    \$filter: ModelOrderFilterInput
    \$limit: Int
    \$nextToken: String
  ) {
    orderStatusByPhone(
      phone: \$phone
      status: \$status
      sortDirection: \$sortDirection
      filter: \$filter
      limit: \$limit
      nextToken: \$nextToken
    ) {
      items {
        id
        orderId
        cartList {
          detail {
            name
            pic_url
            prop_key
            value
            prop_val
          }
          image
          price
          productId
          qty
          skuId
          sum
          title
          bigImageUrl
          city
          tier
          shippingType
          shippingCost
          sellerPrice
          ourPureShipping
          shippingStatus
          stock
          shippingCode
          purchased
          note
          provider
        }
        products {
          items {
            id
            createdAt
            secondaryOrderId
            image
            price
            productId
            qty
            skuId
            sum
            title
            bigImageUrl
            city
            tier
            shippingType
            shippingCost
            sellerPrice
            ourPureShipping
            shippingStatus
            deliveryDate
            stock
            shippingCode
            purchased
            note
            provider
            orderId
            baseType
            shipNepalOrderID
            selected
            shipNepalOrderStatus
            shipNepalOrderReceivedOn
     
             shipNepalOrder {
              id
              createdAt
              updatedAt
              order_id
              date
              order_status
              products {
                items {
                  id
                  createdAt
                  price
                  total
                  qty
                  tracking_number
                  weight
                  grand_total
                  pic
                  product_url
                  product_id
                  way_bill_number
                  order_status
                  baseType
                  shipNepalId
                  wayBillId
                  updatedAt
                }
                nextToken
              }
              baseType
            }
            updatedAt
          }
          nextToken
        }
        date
        status
        userName
        firstName
        lastName
        country
        street
        town
        phone
        email
        note
        total
        grandTotal
        shippingStyle
        shippingPrice
        shippingCode
        baseType
        createdAt
        NoCallTimes
        NoCallDate
        userId
        userOrder {
          id
          country
          email_verified
          firstName
          street
          town
          lastName
          phone_verified
          phone
          email
          userName
          userStatus
          createdAt
          baseType
          orders {
            nextToken
          }
          updatedAt
        }
        shipNepalOrderStatus
        couponCode
        payment
        payment_verified
        smsSendNotPaid
        smsSendDate
        updatedAt
      }
      nextToken
    }
  }
""";

String orderPaymentByPhone = /* GraphQL */ """
  query OrderPaymentByPhone(
    \$phone: String
    \$payment: ModelStringKeyConditionInput
    \$sortDirection: ModelSortDirection
    \$filter: ModelOrderFilterInput
    \$limit: Int
    \$nextToken: String
  ) {
    orderPaymentByPhone(
      phone: \$phone
      payment: \$payment
      sortDirection: \$sortDirection
      filter: \$filter
      limit: \$limit
      nextToken: \$nextToken
    ) {
      items {
        id
        orderId
        cartList {
          detail {
            name
            pic_url
            prop_key
            value
            prop_val
          }
          image
          price
          productId
          qty
          skuId
          sum
          title
          bigImageUrl
          city
          tier
          shippingType
          shippingCost
          sellerPrice
          ourPureShipping
          shippingStatus
          stock
          shippingCode
          purchased
          note
          provider
        }
        products {
          items {
            id
            createdAt
            secondaryOrderId
            image
            price
            productId
            qty
            skuId
            sum
            title
            bigImageUrl
            city
            tier
            shippingType
            shippingCost
            sellerPrice
            ourPureShipping
            shippingStatus
            deliveryDate
            stock
            shippingCode
            purchased
            note
            provider
            orderId
            baseType
            shipNepalOrderID
            selected
            shipNepalOrderStatus
            shipNepalOrderReceivedOn
             shipNepalOrder {
              id
              createdAt
              updatedAt
              order_id
              date
              order_status
              products {
                items {
                  id
                  createdAt
                  price
                  total
                  qty
                  tracking_number
                  weight
                  grand_total
                  pic
                  product_url
                  product_id
                  way_bill_number
                  order_status
                  baseType
                  shipNepalId
                  wayBillId
                  updatedAt
                }
                nextToken
              }
              baseType
            }
            updatedAt
          }
          nextToken
        }
        date
        status
        userName
        firstName
        lastName
        country
        street
        town
        phone
        email
        note
        total
        grandTotal
        shippingStyle
        shippingPrice
        shippingCode
        baseType
        createdAt
        NoCallTimes
        NoCallDate
        userId
        userOrder {
          id
          country
          email_verified
          firstName
          street
          town
          lastName
          phone_verified
          phone
          email
          userName
          userStatus
          createdAt
          baseType
          orders {
            nextToken
          }
          updatedAt
        }
        shipNepalOrderStatus
        couponCode
        payment
        payment_verified
        smsSendNotPaid
        smsSendDate
        updatedAt
      }
      nextToken
    }
  }
""";

String orderMainIDByPhone = /* GraphQL */ """
  query OrderMainIDByPhone(
    \$phone: String
    \$id: ModelIDKeyConditionInput
    \$sortDirection: ModelSortDirection
    \$filter: ModelOrderFilterInput
    \$limit: Int
    \$nextToken: String
  ) {
    orderMainIDByPhone(
      phone: \$phone
      id: \$id
      sortDirection: \$sortDirection
      filter: \$filter
      limit: \$limit
      nextToken: \$nextToken
    ) {
      items {
        id
        orderId
        cartList {
          detail {
            name
            pic_url
            prop_key
            value
            prop_val
          }
          image
          price
          productId
          qty
          skuId
          sum
          title
          bigImageUrl
          city
          tier
          shippingType
          shippingCost
          sellerPrice
          ourPureShipping
          shippingStatus
          stock
          shippingCode
          purchased
          note
          provider
        }
        products {
          items {
            id
            createdAt
            secondaryOrderId
            image
            price
            productId
            qty
            skuId
            sum
            title
            bigImageUrl
            city
            tier
            shippingType
            shippingCost
            sellerPrice
            ourPureShipping
            shippingStatus
            deliveryDate
            stock
            shippingCode
            purchased
            note
            provider
            orderId
            baseType
            shipNepalOrderID
            selected
            shipNepalOrderStatus
            shipNepalOrderReceivedOn
             shipNepalOrder {
              id
              createdAt
              updatedAt
              order_id
              date
              order_status
              products {
                items {
                  id
                  createdAt
                  price
                  total
                  qty
                  tracking_number
                  weight
                  grand_total
                  pic
                  product_url
                  product_id
                  way_bill_number
                  order_status
                  baseType
                  shipNepalId
                  wayBillId
                  updatedAt
                }
                nextToken
              }
              baseType
            }
            updatedAt
          }
          nextToken
        }
        date
        status
        userName
        firstName
        lastName
        country
        street
        town
        phone
        email
        note
        total
        grandTotal
        shippingStyle
        shippingPrice
        shippingCode
        baseType
        createdAt
        NoCallTimes
        NoCallDate
        userId
        userOrder {
          id
          country
          email_verified
          firstName
          street
          town
          lastName
          phone_verified
          phone
          email
          userName
          userStatus
          createdAt
          baseType
          orders {
            nextToken
          }
          updatedAt
        }
        shipNepalOrderStatus
        couponCode
        payment
        payment_verified
        smsSendNotPaid
        smsSendDate
        updatedAt
      }
      nextToken
    }
  }
""";

String orderShortIDByPhone = /* GraphQL */ """
  query OrderShortIDByPhone(
    \$phone: String
    \$orderId: ModelStringKeyConditionInput
    \$sortDirection: ModelSortDirection
    \$filter: ModelOrderFilterInput
    \$limit: Int
    \$nextToken: String
  ) {
    orderShortIDByPhone(
      phone: \$phone
      orderId: \$orderId
      sortDirection: \$sortDirection
      filter: \$filter
      limit: \$limit
      nextToken: \$nextToken
    ) {
      items {
        id
        orderId
        cartList {
          detail {
            name
            pic_url
            prop_key
            value
            prop_val
          }
          image
          price
          productId
          qty
          skuId
          sum
          title
          bigImageUrl
          city
          tier
          shippingType
          shippingCost
          sellerPrice
          ourPureShipping
          shippingStatus
          stock
          shippingCode
          purchased
          note
          provider
        }
        products {
          items {
            id
            createdAt
            secondaryOrderId
            image
            price
            productId
            qty
            skuId
            sum
            title
            bigImageUrl
            city
            tier
            shippingType
            shippingCost
            sellerPrice
            ourPureShipping
            shippingStatus
            deliveryDate
            stock
            shippingCode
            purchased
            note
            provider
            orderId
            baseType
            shipNepalOrderID
            selected
            shipNepalOrderStatus
            shipNepalOrderReceivedOn
             shipNepalOrder {
              id
              createdAt
              updatedAt
              order_id
              date
              order_status
              products {
                items {
                  id
                  createdAt
                  price
                  total
                  qty
                  tracking_number
                  weight
                  grand_total
                  pic
                  product_url
                  product_id
                  way_bill_number
                  order_status
                  baseType
                  shipNepalId
                  wayBillId
                  updatedAt
                }
                nextToken
              }
              baseType
            }
            updatedAt
          }
          nextToken
        }
        date
        status
        userName
        firstName
        lastName
        country
        street
        town
        phone
        email
        note
        total
        grandTotal
        shippingStyle
        shippingPrice
        shippingCode
        baseType
        createdAt
        NoCallTimes
        NoCallDate
        userId
        userOrder {
          id
          country
          email_verified
          firstName
          street
          town
          lastName
          phone_verified
          phone
          email
          userName
          userStatus
          createdAt
          baseType
          orders {
            nextToken
          }
          updatedAt
        }
        shipNepalOrderStatus
        couponCode
        payment
        payment_verified
        smsSendNotPaid
        smsSendDate
        updatedAt
      }
      nextToken
    }
  }
""";

String listQuickSales = """

  query ListQuickSales(
    \$filter: ModelquickSaleFilterInput
    \$limit: Int
    \$nextToken: String
  ) {
    listQuickSales(filter: \$filter, limit: \$limit, nextToken: \$nextToken) {
      items {
        id
        title
        smallImages
        bigImageUrl
        description
        price
        adult
        sellerShippingPrice
        skus_json
        stock
        prop_obj
        baseType
        productId
        provider
        provider_slug
        url
        category
        categoryId
        subCategory
        subCategoryId
        tags
        createdAt
        updatedAt
      }
      nextToken
    }
  }




""";
