exports.updateUser = /* GraphQL */ `
  mutation UpdateUser(
    $input: UpdateUserInput!
    $condition: ModeluserConditionInput
  ) {
    updateUser(input: $input, condition: $condition) {
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
          updatedAt
        }
        nextToken
      }
      updatedAt
    }
  }
`;

exports.updateConfirmedUserCount = /* GraphQL */ `
  mutation UpdateConfirmedUserCount(
    $input: UpdateConfirmedUserCountInput!
    $condition: ModelconfirmedUserCountConditionInput
  ) {
    updateConfirmedUserCount(input: $input, condition: $condition) {
      id
      confirmedUsers
      createdAt
      updatedAt
    }
  }
`;
