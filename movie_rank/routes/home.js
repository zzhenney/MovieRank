var express = require('express');
var router = express.Router();

router.get('/', (req, res, next)=>{

    console.log(req.session)
    
    if (req.session.user) {


    res.render('home', {user: req.session.user});

    }

    else {
        res.render('login', {error:undefined})
    }

  });


  module.exports = router