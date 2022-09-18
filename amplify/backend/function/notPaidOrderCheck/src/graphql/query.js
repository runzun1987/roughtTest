exports.orderNotPaidByDate = /* GraphQL */ `
  query OrderNotPaidByDate(
    $payment: String
    $createdAt: ModelStringKeyConditionInput
    $sortDirection: ModelSortDirection
    $filter: ModelOrderFilterInput
    $limit: Int
    $nextToken: String
  ) {
    orderNotPaidByDate(
      payment: $payment
      createdAt: $createdAt
      sortDirection: $sortDirection
      filter: $filter
      limit: $limit
      nextToken: $nextToken
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
            deliveryDate
            stock
            shippingCode
            purchased
            note
            provider
            orderId
            orderCart {
              id
              orderId
              cartList {
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
                updatedAt
              }
              shipNepalOrderStatus
              couponCode
              payment
              smsSendNotPaid
              smsSendDate
              updatedAt
            }
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
              }
              baseType
            }
            driver {
              id
              name
              products {
                nextToken
              }
              baseType
              createdAt
              updatedAt
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
            items {
              id
              orderId
              cartList {
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
                updatedAt
              }
              shipNepalOrderStatus
              couponCode
              payment
              smsSendNotPaid
              smsSendDate
              updatedAt
            }
            nextToken
          }
          updatedAt
        }
        shipNepalOrderStatus
        couponCode
        payment
        smsSendNotPaid
        smsSendDate
        updatedAt
      }
      nextToken
    }
  }
`;

exports.orderSmsSendNotPaidBySmsSendDate = /* GraphQL */ `
  query OrderSmsSendNotPaidBySmsSendDate(
    $smsSendNotPaid: String
    $smsSendDate: ModelStringKeyConditionInput
    $sortDirection: ModelSortDirection
    $filter: ModelOrderFilterInput
    $limit: Int
    $nextToken: String
  ) {
    orderSmsSendNotPaidBySmsSendDate(
      smsSendNotPaid: $smsSendNotPaid
      smsSendDate: $smsSendDate
      sortDirection: $sortDirection
      filter: $filter
      limit: $limit
      nextToken: $nextToken
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
            deliveryDate
            stock
            shippingCode
            purchased
            note
            provider
            orderId
            orderCart {
              id
              orderId
              cartList {
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
                updatedAt
              }
              shipNepalOrderStatus
              couponCode
              payment
              smsSendNotPaid
              smsSendDate
              updatedAt
            }
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
              }
              baseType
            }
            driver {
              id
              name
              products {
                nextToken
              }
              baseType
              createdAt
              updatedAt
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
            items {
              id
              orderId
              cartList {
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
                updatedAt
              }
              shipNepalOrderStatus
              couponCode
              payment
              smsSendNotPaid
              smsSendDate
              updatedAt
            }
            nextToken
          }
          updatedAt
        }
        shipNepalOrderStatus
        couponCode
        payment
        smsSendNotPaid
        smsSendDate
        updatedAt
      }
      nextToken
    }
  }
`;
