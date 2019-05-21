var express = require('express');
var router = express.Router();
const AuthDAO = require(process.env.PWD+'/db/AuthDAO')
const db = require(process.env.PWD + '/db.js')


// get login page


router.get('/', (req, res, next)=>{
    req.session.backURL = req.header('Referer')
    if(req.session.user){
        console.log(req.session.user)
        
        console.log(req.session.backURL)
        res.render('index', {user: req.session.user})
    }
    else {
  res.render('login', {error:undefined});
    }
});

// login user

router.post('/', (req, res, next)=>{

    const username = req.body.username
    const password = req.body.password
    console.log(username)
    console.log(password)
    const auth_dao = new AuthDAO(db,username, password)
    auth_dao.loginUser()
    .then((responseObject)=>{
         
        if(responseObject.value){
            req.session.user = {username: responseObject.user_name, user_id: responseObject.user_id}
            console.log(req.session.user)
            res.redirect(req.session.backURL)
        }

        else {
            res.render('login',{error:'error'})
        }
    })
})

module.exports = router;