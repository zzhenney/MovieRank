var express = require('express');
var router = express.Router();
const AuthDAO = require(process.env.PWD+'/db/AuthDAO')
const db = require(process.env.PWD + '/db.js')


// get login page


router.get('/', (req, res, next)=>{
  res.render('register');
});

// login user

router.post('/', (req, res)=>{
      
    const username = req.body.username
    const password = req.body.password
    console.log(username)
    console.log(password)
    const auth_dao = new AuthDAO(db,username, password)
    auth_dao.loginUser()
    .then((hasUser)=>{
         
        if(hasUser){

            res.send('Login success')
        }

        else {

            res.send('username or password do not match')
        }
    })
})

module.exports = router;