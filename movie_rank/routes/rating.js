var express = require('express');
var router = express.Router();
const db = require('../db/rating.js')

router.post('/', (req, res, next) => {
	const rating = req.body.rating
	//console.log(req.session.user.user_id)
	const userId = req.session.user.user_id
	//console.log(userId)
	const mid = req.body.mid
	db.submitUserRating(rating, userId, mid)
		.then(data => {
			//res.send(data)
			if(data == 1){
				req.flash("messages", "You have already rated this movie. Please update rating in your profile.")
				return res.redirect('back')
				
			}
			else{
				return res.redirect('back')
				//res.send(data)

			}
		})
		.catch(err => {
			console.log(err)
			return res.redirect('back')
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

