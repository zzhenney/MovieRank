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
		.then(()=> {
			res.redirect('back')
		})
		.catch(err => {
			console.log(err)
		})
	

})

module.exports = router;
