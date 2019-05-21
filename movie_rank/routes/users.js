var express = require('express');
var router = express.Router();
const db = require('../db/user.js')


/* GET users listing. */


router.post('/update/password', function(req, res, next) {
	console.log("update password")
	userId = req.session.user.user_id
	console.log(userId)
	password = req.body.password
	console.log(`new password: ${password}`)
	db.updatePassword(userId, password)
	res.redirect('back')

})

router.post('/delete/avatar', function(req, res, next) {
	userId = req.session.user.user_id
	db.deleteAvatar(userId)
	res.redirect('back')

})

router.post('/update/avatar', function(req, res, next) {
	userId = req.session.user.user_id
	url = req.body.avatar_url
	db.updateAvatar(userId, url)
	res.redirect('back')

})

module.exports = router;
