var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  console.log('index router')
  if (req.session.user) {


    res.render('index', {user: req.session.user});

    }

    else {
        res.render('index', {user: 0})
    }

});



module.exports = router;
