                require('dotenv').config()
const pg      = require('pg')

var db = new pg.Client({
  host: process.env.DB_HOST || 'shroomish-db',
  user: process.env.DB_USER || 'mushroom_admin',
  password: process.env.DB_PASSWORD || '',
  database: process.env.DB_DATABASE || 'shroomish',
  port: process.env.DB_PORT || 5432,
  // ssl: true
})

module.exports = {
    port: process.env.PORT || 8080,
    host: process.env.HOST || '0.0.0.0',
    db
}
