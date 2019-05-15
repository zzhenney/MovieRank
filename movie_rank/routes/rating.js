var express = require('express');
var router = express.Router();
const db = require('../db/rating.js')

router.post('/', (req, res, next) => {
	console.log("RATING ROUTE")
	const rating = req.body.rating
	console.log(rating)
	const userId = req.session.user.user_id
	const mid = req.body.mid
	console.log(rating + ' ' + userId + ' ' + mid)
	db.submitUserRating(rating, userId, mid)
	res.redirect('back')
})



module.exports = router;

