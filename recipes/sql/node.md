# Node
> Query a SQL database using Node.js

## Samples

Example using Sequelize.

- [Sequelize](https://www.npmjs.com/package/sequelize) on NPM.
	> Sequelize is a promise-based Node.js ORM for Postgres, MySQL, MariaDB, SQLite and Microsoft SQL Server. It features solid transaction support, relations, eager and lazy loading, read replication and more.

Code:

- `main.js`
    ```javascript
    let DBConnectionURI = `postgresql://postgres:${POSTGRES_PASSWORD || ''}@postgres:5432/postgres`;
    let DBOpts = {
      dialect: 'postgres',
      pool: {
        max: 10,
        min: 0,
        idle: 10000,
       },
      logging: false,
    };

    const instance = new Sequelize(DBConnectionURI, DBOpts);

    instance.query('SELECT 1 AS foo')
      .then(result => console.log(result));
    // => [ [ anonymous { foo: 1 } ]
    ```
