var express = require('express');
var router = express.Router();
const db = require('../db/rating.js')

router.post('/', (req, res, next) => {
	console.log("RATING ROUTE")
	const rating = req.body.rating
	const userId = req.body.userId
	const mid = req.body.mid
	console.log(rating + ' ' + userId + ' ' + mid)
	db.submitUserRating(rating, userId, mid)
})



module.exports = router;

