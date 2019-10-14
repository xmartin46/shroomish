'use strict';

                    require('dotenv').config()
const express       = require('express');
const bodyParser    = require('body-parser');
const passport      = require('passport')
const session       = require("express-session");

const app           = express();
const api           = require('./routes');

//add midelware bodyparse to express app
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());


app.use(session({
  name: process.env.SESSION_NAME,
  secret: process.env.SESSION_SECRET,
  resave: false,
  saveUninitialized: false
}))

app.use(passport.initialize());
app.use(passport.session());

/////////////////app.use(function printSession(req, res, next) {
/////////////////  console.log('req', req);
/////////////////  console.log(req.isAuthenticated())
/////////////////  console.log()
/////////////////  return next();
/////////////////});

app.use('/api', api);


module.exports = app;
