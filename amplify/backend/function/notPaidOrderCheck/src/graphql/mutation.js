exports.updateOrder = /* GraphQL */ `
  mutation UpdateOrder(
    $input: UpdateOrderInput!
    $condition: ModelOrderConditionInput
  ) {
    updateOrder(input: $input, condition: $condition) {
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
                updatedAt
              }
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
  }
`;
