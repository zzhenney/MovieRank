const db = require('../db.js')
//const db = require(process.env.PWD + '/db.js')

const getMovie = (movieTitle) => {
	console.log(process.env.DB_USER)
	return db.any(`SELECT * FROM movie where movie.name LIKE '%${movieTitle}%'`)
		.then(data => {
			//issue with multiple movies of similar name
			/*
			console.log(data.length)
			console.log(data)
			if(data.length > 1){
				console.log(data[0])
				return data[0]
			}
			*/
			
			return data
		})
		.catch(err => {
			console.log(err)
		})
}

module.exports = { getMovie }