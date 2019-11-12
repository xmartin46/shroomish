'use strict';

                      require('dotenv').config()
const express       = require('express');
const bodyParser    = require('body-parser');
const passport      = require('passport')
const session       = require("express-session");

const app           = express();
const api           = require('./routes');
const cors 	        = require('cors')

app.use(cors({credentials: true, origin: 'http://localhost:3000'}));
//add midelware bodyparse to express app
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.use(session({
  name: process.env.SESSION_NAME || 'Create a .env pls',
  secret: process.env.SESSION_SECRET || 'Create a .env pls (x2)',
  resave: false,
  saveUninitialized: false,
  cookie: {
      httpOnly: false,
      secure: false,
      expires: new Date(new Date().getTime() + (1000*60*60*24*365*10))
    }
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
