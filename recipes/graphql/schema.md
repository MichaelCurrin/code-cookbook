# Schema
> GraphQL schemas


## Samples

### FaunaDB

Downloaded from the demo on [FaunaDB app dashboard](https://dashboard.fauna.com/).

See [FaunaDB cookbook](https://docs.fauna.com/fauna/current/cookbook/) and [API Reference](https://docs.fauna.com/fauna/current/api/).

Endpoint: `https://graphql.fauna.com/graphql`

- `ecommerce.gql`
    ```gql
    type Warehouse @collection(name: "warehouses") {
      name: String!
      address: Address! 
    }

    type Product @collection(name: "products") {
      name: String!
      description: String!
      price: Float!
      warehouse: Warehouse!
      quantity: Int!
      backorderLimit: Int!
      backordered: Boolean!
    }

    type Customer @collection(name: "customers") {
      firstName: String!
      lastName: String!
      address: Address!
      telephone: String!
      creditCard: CreditCard!
    }

    type Order @collection(name: "orders") {
      customer: Customer!
      line: [ProductLine!]!
      status: String!
      creationDate: Time!
      shipDate: Time
      shipAddress: Address!
      creditCard: CreditCard!
    }

    type Address @embedded {
      street: String!
      city: String!
      state: String!
      zipCode: String!
    }

    type CreditCard @embedded {
      network: String!
      number: String!
    }

    type ProductLine @embedded {
      product: Product!
      quantity: Int!
      price: Float!
    }

    input SubmitOrderProductInput {
      productId: ID!
      quantity: Int!
    }

    type Query {
      allWarehouses: [Warehouse!]! @index(name: "all_warehouses")
      allProducts: [Product!]! @index(name: "all_products")
      allCustomers: [Customer!]! @index(name: "all_customers")
      allOrders: [Order!]! @index(name: "all_orders")
    }

    type Mutation {
      submitOrder(customerId: ID!, products: [SubmitOrderProductInput]): Order! @resolver(name: "submit_order")
    }
    ```
- `mutation.gql`
    ```gql
    mutation {
      createWarehouse(data: {
        name: "East"
        address: {
          street: "13 Pierstorff Drive"
          city: "Washington"
          state: "DC"
          zipCode: "20220"
        }
      }){
        _id
      }
    }
    ```
- `query.gql`
    ```gql
    query {
      allWarehouses {
        data {
          _id
          name
          address {
            street
            city
            state
            zipCode
          }
        }
      }
    }
    ```
