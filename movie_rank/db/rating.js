const db = require('../db.js')

const getRating = (mid) => {
	return db.one(`SELECT ROUND(AVG(rating),2) FROM rating, movieRating WHERE rating.rid = movieRating.rid AND movieRating.mid = ${mid}`)
		.then(data => {
			return data
		})
}

const submitUserRating = (rating, uid, mid) => {
	db.one(`INSERT INTO rating VALUES(default, ${rating}, ${uid}) RETURNING rid`)
		.then(data => {
			db.none(`INSERT INTO movieRating VALUES(${mid}, ${data.rid})`)
		})
}



module.exports = { getRating, submitUserRating }