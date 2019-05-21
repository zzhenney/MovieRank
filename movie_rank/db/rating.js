const db = require('../db.js')

const getRating = (mid) => {
	return db.one(`SELECT ROUND(AVG(rating),2) FROM rating, movieRating WHERE rating.rid = movieRating.rid AND movieRating.mid = ${mid}`)
		.then(data => {
			return data
		})
}

const submitUserRating = (rating, uid, mid) => {
	return db.any(`SELECT * FROM rating, movierating WHERE rating.uid = ${uid} AND rating.rid = movierating.rid AND movierating.mid = ${mid}`)
		.then(data => {
			if(data.length > 0){
				//user already submitted rating
				return 1
			}

			else{
				db.one(`INSERT INTO rating VALUES(default, ${rating}, ${uid}) RETURNING rid`)
					.then(data => {
						db.none(`INSERT INTO movieRating VALUES(${mid}, ${data.rid})`)
						return 0
					})
			}
		})
	
}

const getUserRatings = (uid) => {
	let userRatings = {}
	return db.task(t => {
		return t.any(`SELECT rating.rid, rating.rating, movie.name, movieRating.mid FROM rating, movieRating, movie WHERE rating.uid = ${uid} AND movieRating.rid = rating.rid AND movie.mid = movieRating.mid`)	
			.then(data => {
				userRatings = data
				return userRatings
			})
	})
}

const deleteUserRating = (uid, rid) => {
	console.log(`uid: ${uid}    rid: ${rid}`)
	db.one(`DELETE FROM rating WHERE rating.uid = ${uid} AND rating.rid = ${rid}`)
		.then(()=> {
			return
		})
		.catch(err => {
			console.log(err)
		})
}

const updateUserRating = (uid, rid, rating) => {
	db.one(`UPDATE rating SET rating=${rating} WHERE rating.uid = ${uid} AND rating.rid = ${rid}`)
		.then(()=> {
			return
		})
		.catch(err => {
			console.log(err)
		})
}



module.exports = { getRating, submitUserRating, getUserRatings, deleteUserRating, updateUserRating }


