'use strict';

const express       = require('express');
const bodyParser    = require('body-parser');
const passport      = require('passport')
const session       = require("express-session");

const app = express();
const api = require('./routes');

//add midelware bodyparse to express app
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());


app.use(session({
    secret: "cat",
    resave: false,
    saveUninitialized: false,
    //store: sessionStore,
    // HTTPS => cookie: { secure: true }
}))

app.use(passport.initialize());
app.use(passport.session());

app.use('/api', api);


module.exports = app;
