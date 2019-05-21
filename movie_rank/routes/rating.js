var express = require('express');
var router = express.Router();
const db = require('../db/rating.js')

router.post('/', (req, res, next) => {
	const rating = req.body.rating
	const userId = req.session.user.user_id
	const mid = req.body.mid
	db.submitUserRating(rating, userId, mid)
		.then(data => {
			if(data == 1){
				req.flash("messages", "You have already rated this movie. Please update rating in your profile.")
				res.redirect('back')
			}
			else{
				res.redirect('back')

			}
		})
		.catch(err => {
			console.log(err)
		})
	//res.redirect('back')
})

router.post('/delete', (req, res, next) => {
	const userId = req.session.user.user_id
	const rid = req.body.rid
	db.deleteUserRating(userId, rid)
	res.redirect('back')
})

router.post('/update', (req, res, next) => {
	const userId = req.session.user.user_id
	const rating = req.body.rating
	const rid = req.body.rid
	db.updateUserRating(userId, rid, rating)
	res.redirect('back')
})



module.exports = router;

