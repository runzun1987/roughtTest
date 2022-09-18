exports.getPrice = /* GraphQL */ `
  query GetPrice($id: ID!) {
    getPrice(id: $id) {
      id
      code
      createdAt
      updatedAt
    }
  }
`;
