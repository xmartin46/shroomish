              require('dotenv').config()
const pg      = require('pg')

var db = new pg.Client({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_DATABASE,
  port: process.env.DB_PORT,
  // ssl: true
})

module.exports = {
    port: process.env.PORT || 8080,
    host: process.env.HOST || '0.0.0.0',
    db
}
