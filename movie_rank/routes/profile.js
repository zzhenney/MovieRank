var express = require('express');
var router = express.Router();
//test
const ratingDB = require('../db/rating.js')
const userDB = require('../db/user.js')

router.get('/', (req, res, next)=>{

    //console.log(req.session)
    
    if (req.session.user) {
    	//db.getUserRatings(req.session.user.user_id)
    	let userData = []
        userId = req.session.user.user_id
        userDB.getUserProfile(userId)
    		.then(data => {
    			userData.push(data)
                console.log(userData)
    			ratingDB.getUserRatings(userId)
    				.then(data => {
                        for (var i = data.length - 1; i >= 0; i--) {
                            userData.push(data[i])
                        }
    					res.render('profile', {data: userData});
    				})
    			
    		})


    	//res.render('home', {user: req.session.user});

    }

    else {
        res.redirect('/')
    }

  });


  module.exports = router

