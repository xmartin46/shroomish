'use strict';

const express       = require('express');

const mushroomCtrl  = require('../controllers/mushroom')

const api           = express.Router();
/*const auth          = require('../middlewares/auth');*/

//listener mushrooms
// TODO: change path to /gallery/???????????????????????????????
// Get all mushrooms
api.get('/search/', mushroomCtrl.getMushrooms)
// TODO: change path to /gallery/???????????????????????????????
// Get mushrooms that contain the substring substr (parameter)
api.get('/search/:substr', mushroomCtrl.getMushroomsBySubstring)

// Get information only about one specific type of mushroom whose name in latin is the parameter name_latin
api.get('/info/:name_latin', mushroomCtrl.getMushroomInfo)

module.exports = api;
