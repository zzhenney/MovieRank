const db = require('../db.js')

const getRating = (mid) => {
	return db.one(`SELECT ROUND(AVG(rating),2) FROM rating, movieRating WHERE rating.rid = movieRating.rid AND movieRating.mid = ${mid}`)
		.then(data => {
			return data
		})
}



module.exports = { getRating }