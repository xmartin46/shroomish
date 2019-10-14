'use strict';

const config   = require('../config')
var crypto     = require('crypto')

function logIn(req, res) {
  const username = req.body.username
  const password = req.body.password

  config.db.query('SELECT user_account.id, user_account.email, user_password.password, user_password.salt FROM user_account INNER JOIN user_password ON user_password.id_user = user_account.id WHERE LOWER(user_account.name) = LOWER($1)', [username], (err, result) => {
    if (err) throw err

    if (result.rows.length < 1) res.status(500).send( { message: "User not found" } )
    if (result.rows.length > 1) res.status(500).send( { message: "More than one user found" } )
    if (result.rows.length == 1) {
      // hashing user's salt and password with 1000 iterations,
      // 64 length and sha512 digest
      const hash = crypto.pbkdf2Sync(password, result.rows[0].salt, 1000, 64, `sha512`).toString(`hex`)

      if (hash === result.rows[0].password) {
        const user = {
          user_id: result.rows[0].id,
          user_name: username,
          user_email: result.rows[0].email,
          user_password: password,
          user_salt: result.rows[0].salt
        }

        console.log(user)
      } else{
        console.log("HAHA NUB")
      }
    }
  })
}

function signUp(req, res) {
  const username = req.body.username
  const email = req.body.email
  const password = req.body.password

  // creating a unique salt for a particular user
  const salt = crypto.randomBytes(16).toString('hex')

  // hashing user's salt and password with 1000 iterations,
  // 64 length and sha512 digest
  const hash = crypto.pbkdf2Sync(password, salt, 1000, 64, `sha512`).toString(`hex`)

  config.db.query('INSERT INTO user_account(name, email) VALUES ($1, $2) RETURNING id', [username, email], (err, result) => {
    if (err) throw err

    if (result.rows.length < 1) res.status(500).send( { message: "Server error (Not inserted)" } )
    if (result.rows.length > 1) res.status(500).send( { message: "Server error (More than one selected/inserted)" } )
    if (result.rows.length == 1) {
      config.db.query('INSERT INTO user_password(id_user, password, salt) VALUES ($1, $2, $3) RETURNING id', [result.rows[0].id, hash, salt], (err, result) => {
        if (err) throw err

        if (result.rows.length < 1) res.status(500).send( { message: "Server error (Not inserted)" } )
        if (result.rows.length > 1) res.status(500).send( { message: "Server error (More than one selected/inserted)" } )
        if (result.rows.length == 1) {
          const user = {
            user_id: result.rows[0].id,
            user_name: username,
            user_email: email,
            user_password: password,
            user_salt: salt
          }

          console.log(user)

          /*req.login(user, (err) => {
            if (err) throw err

          res.redirect('/api/user/profile')
          })*/
        }
      })
    }
  })
}

function getUsers(req, res) {
  config.db.query('SELECT name FROM user_account', [], (err, result) => {
    if (err) throw err

    if (result.rows.length < 1) res.status(200).send( { message: "No users in the database" } )
    if (result.rows.length >= 1) res.status(200).send(result.rows)
  })
}

function getUsersByName(req, res) {
  var username = req.params.userName

  config.db.query('SELECT user_account.name, user_account.email FROM user_account INNER JOIN user_password ON user_password.id_user = user_account.id WHERE LOWER(user_account.name) = LOWER($1)', [username], (err, result) => {
    if (err) throw err

    if (result.rows.length < 1) res.status(500).send( { message: "Server error (No users found)" } )
    if (result.rows.length > 1) res.status(500).send( { message: "Server error (More than one user found)" } )
    if (result.rows.length == 1) res.status(200).send(result.rows)
  })
}

function modifyUser(req, res) {
  var username = req.params.userName


}

function deleteUser(req, res) {
  var username = req.params.userName


}

module.exports = {
  logIn,
  signUp,
  getUsers,
  getUsersByName,
  modifyUser,
  deleteUser
}
