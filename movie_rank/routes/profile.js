var express = require('express');
var router = express.Router();
//const db = require(process.env.PWD + '/db.js')


// get usernam
router.get('/', (req, res, next)=>{
  let username = req.query.username;
  console.log(username)

  res.render("profile", {username: username});

});

//router.post('/', (req, res)=>{
//  res.send("profile")
//})

module.exports = router;