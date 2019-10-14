'use strict';

const express       = require('express');

const mushroomCtrl  = require('../controllers/mushroom')
const userCtrl      = require('../controllers/user')

const api           = express.Router();
/*const auth          = require('../middlewares/auth');*/

// Listener mushrooms
// Get all mushrooms
api.get('/search/', mushroomCtrl.getMushrooms)
// Get mushrooms that contain the substring substr (parameter)
api.get('/search/:substr', mushroomCtrl.getMushroomsBySubstring)
// Get information only about one specific type of mushroom whose name in latin is the parameter name_latin
api.get('/info/:name_latin', mushroomCtrl.getMushroomInfo)
// Get heatmap of the mushroom called name_latin in latin
api.get('/heatmap/:name_latin', mushroomCtrl.getMushroomCoordinates)


// Listener user
api.post('/login/', userCtrl.logIn)
api.post('/signup/', userCtrl.signUp)
api.get('/users/', userCtrl.getUsers)
api.get('/users/:userName', userCtrl.getUsersByName)
api.patch('/users/:userName', userCtrl.modifyUser)
api.delete('/users/:userName', userCtrl.deleteUser)

module.exports = api;
