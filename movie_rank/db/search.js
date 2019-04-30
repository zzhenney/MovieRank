const db = require('../db.js')
const rating = require('./rating.js')
//const db = require(process.env.PWD + '/db.js')

const getMovie = (movieTitle) => {
	let movieData = {}
	return db.any(`SELECT * FROM movie where movie.name ILIKE '%${movieTitle}%'`)
		.then(data => {
			movieData.mid = data[0].mid
			movieData.name = data[0].name
			movieData.release_date = data[0].release_date
			movieData.mpaa_rating = data[0].mpaa_rating
			movieData.runtime = data[0].runtime
			movieData.description = data[0].description
			movieData.poster = data[0].thumbnail_url

			return getDirector(data[0].did)
				.then(data => {
					movieData.director = data.name
					return getGenre(movieData.mid)
						.then(data => {
							movieData.genre = data[0].name
							for (var i = 1; i <= data.length - 1; i++) {
								movieData.genre += (', ' + data[i].name )
							}
							return getActors(movieData.mid)
								.then(data => {
									movieData.actor = data[0].name
									for (var i = 1; i <= data.length - 1; i++) {
										movieData.actor += (', ' + data[i].name )
									}
									return rating.getRating(movieData.mid)
										.then(data => {
											movieData.rating = data.round
											return movieData
										})
										
								})
						})
				})
		})

		.catch(err => {
			console.log(err)
		})
}

const getActors = (mid) => {
	return db.any(`SELECT actor.name FROM actor, movieActor WHERE actor.aid = movieActor.aid AND movieActor.mid = ${mid}`)
		.then(data => {
			return data
		})
		.catch(err => {
			console.log(err)
		})
}

const getDirector = (did) => {
	return db.one(`SELECT director.name FROM director WHERE director.did = ${did}`)
		.then(data => {
			return data
		})
		.catch(err => {
			console.log(err)
		})
}

const getGenre = (mid) => {
	return db.any(`SELECT genre.name FROM genre, movieGenre WHERE genre.gid = movieGenre.gid AND movieGenre.mid = ${mid}`)
		.then(data => {
			return data
		})
		.catch(err => {
			console.log(err)
		})
}


module.exports = { getMovie }