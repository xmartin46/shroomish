                require('dotenv').config()
const pg      = require('pg')

/* THIS IS ONLY IF YOU WANT TO CONNECT TO DOCKER'S SHROOMISH-DATABASE CONTAINER */
var db = new pg.Client({
  host: process.env.DB_HOST || 'shroomish-db',
  user: process.env.DB_USER || 'mushroom_admin',
  password: process.env.DB_PASSWORD || '',
  database: process.env.DB_DATABASE || 'shroomish',
  port: process.env.DB_PORT || 5432,
  // ssl: true
})

/* THIS IS ONLY IF YOU WANT TO CONNECT TO YOUR LOCALDATABASE
var db = new pg.Client({
  host: process.env.DB_HOST || 'localhost',
  user: process.env.DB_USER || 'postgres',
  password: process.env.DB_PASSWORD || '',
  database: process.env.DB_DATABASE || 'postgres',
  port: process.env.DB_PORT || 5432,
  // ssl: true
})*/

module.exports = {
    port: process.env.PORT || 8080,
    host: process.env.HOST || '0.0.0.0',
    db
}
