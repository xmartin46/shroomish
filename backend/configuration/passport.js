'use strict';

const config          = require('../config')
const passport        = require('passport')
const LocalStrategy   = require('passport-local').Strategy;
const crypto          = require('crypto')


passport.use(new LocalStrategy(
  function(username, password, done) { //username and password from the body
    ///////////////////console.log("LOCALSTRATEGY!!!")
    config.db.query('SELECT user_account.id, user_account.email, user_password.password, user_password.salt FROM user_account INNER JOIN user_password ON user_password.id_user = user_account.id WHERE LOWER(user_account.name) = LOWER($1)', [username], (err, result) => {
      if (err) throw err

      if (result.rows.length < 1) return done(null, false, { message: "No user found" })
      if (result.rows.length > 1) return done(null, false, { message: "More than one user found" })
      if (result.rows.length == 1) {
        // hashing user's salt and password with 1000 iterations,
        // 64 length and sha512 digest
        const hash = crypto.pbkdf2Sync(password, result.rows[0].salt, 1000, 64, `sha512`).toString(`hex`)

        if (hash !== result.rows[0].password) return done(null, false, { message: "Incorrect password" })
        if (hash === result.rows[0].password) {
          const user = {
            user_id: result.rows[0].id,
            user_name: username,
            user_email: result.rows[0].email,
            //user_password: password,
            //user_salt: result.rows[0].salt
          }

          return done(null, user)
        }
      }
    })
  }
))

// In order to help keep authentication state across HTTP requests,
// Sequelize needs to serialize and deserialize the user
// Just consider this part boilerplate needed to make it all work
passport.serializeUser(function(user, done) {
  ///////////////////console.log("Serializing!!!" + JSON.stringify(user))
  done(null, user.user_id);
});
//
passport.deserializeUser(function(id, done) {
  config.db.query('SELECT * FROM user_account WHERE id = $1', [id], (err, result) => {
    ///////////////////console.log("Deserializing!!!" + JSON.stringify(result.rows))
    done(err, result.rows[0]);
  });
});


module.exports = passport;
