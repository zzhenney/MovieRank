var express = require('express');
var router = express.Router();
const AuthDAO = require(process.env.PWD+'/db/AuthDAO')
const db = require(process.env.PWD + '/db.js')


// get registration page


router.get('/', (req, res, next)=>{
  res.render('register');
});



// register user

router.post('/', (req, res)=>{
     
    const username = req.body.username
    const password = req.body.password
    console.log(username)
    console.log(password)
    const auth_dao = new AuthDAO(db,username, password)
    auth_dao.checkIfUserExists()
    .then((hasUser)=>{
         
        if(hasUser){

            res.send('User already exists')
        }

        else {
             
              auth_dao.registerUser()
              .then((data)=>{
                   
                 res.send('user successfully registered')
              })
              .catch((err)=>{
                  
                console.log(err)
                  res.send(err)
              })
        }
    })

    .catch((err)=>{
        
        console.log(err)
        res.send(err)
    })
    
})

module.exports = router;