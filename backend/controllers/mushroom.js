'use strict';

const config = require('../config')

function getMushrooms(req, res) {
  config.db.query('SELECT mushroom.name_eng, mushroom.name_latin, mushroom.description, mushroom.edibility, mushroom_image.URL FROM mushroom INNER JOIN mushroom_image ON mushroom_image.id_mushroom = mushroom.id ORDER BY mushroom.name_eng', [], (err, result) => {
      if (err) throw err

      if (result.rows.length < 1) res.status(200).send( { message: "No objects in the database " } )
      if (result.rows.length >= 1) res.status(200).send(result.rows)
  })
}

function getMushroomsBySubstring(req, res) {
  const substr = "%" + req.params.substr + "%"
  config.db.query('SELECT DISTINCT ON (mushroom.name_eng) mushroom.name_eng, mushroom.name_latin, mushroom.description, mushroom.edibility, mushroom_image.URL FROM mushroom INNER JOIN mushroom_image ON mushroom_image.id_mushroom = mushroom.id WHERE LOWER(mushroom.name_eng) LIKE LOWER($1) OR LOWER(mushroom.name_latin) LIKE LOWER($1) ORDER BY mushroom.name_eng', [substr], (err, result) => {
      if (err) throw err

      if (result.rows.length < 1) res.status(200).send( { message: "No objects in the database " } )
      if (result.rows.length >= 1) res.status(200).send(result.rows)
  })
}

function getMushroomInfo(req, res) {
  const name_latin = "%" + req.params.name_latin + "%"

  config.db.query('SELECT mushroom.name_eng, mushroom.name_latin, mushroom.description, mushroom.edibility, mushroom_image.URL FROM mushroom INNER JOIN mushroom_image ON mushroom_image.id_mushroom = mushroom.id WHERE mushroom.name_latin LIKE $1 ORDER BY mushroom.name_eng', [name_latin], (err, result) => {
      if (err) throw err

      if (result.rows.length < 1) res.status(200).send( { message: "No objects in the database " } )
      if (result.rows.length >= 1) res.status(200).send(result.rows)
  })
}

module.exports = {
  getMushrooms,
  getMushroomsBySubstring,
  getMushroomInfo
}
