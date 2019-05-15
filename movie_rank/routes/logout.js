var express = require('express');
var router = express.Router();


router.get('/', (req, res, next)=>{

    req.session.destroy((err)=>{
          
        res.render('index', {user: 0})

    })

     
})


module.exports = router