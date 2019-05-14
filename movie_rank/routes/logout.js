var express = require('express');
var router = express.Router();


router.get('/', (req, res, next)=>{

    req.session.destroy((err)=>{
          
        res.render('login', {error:undefined})

    })

     
})


module.exports = router