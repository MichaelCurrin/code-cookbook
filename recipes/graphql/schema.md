# Schema
> GraphQL schemas


## Samples

Downloaded from the demo on [FaunaDB app dashboard](https://dashboard.fauna.com/).

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
  
