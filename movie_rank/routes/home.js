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
        userDB.getUserProfile(1)
    		.then(data => {
    			userData.push(data)
                console.log(userData)
    			ratingDB.getUserRatings(1)
    				.then(data => {
                        for (var i = data.length - 1; i >= 0; i--) {
                            userData.push(data[i])
                        }
    					res.render('home', {data: userData});
    				})
    			
    		})


    	//res.render('home', {user: req.session.user});

    }

    else {
        res.render('home', {error:undefined})
    }

  });


  module.exports = router

