var express = require('express');
var router = express.Router();
const db = require('../db/search.js')


router.get('/:movieTitle', (req, res, next)=>{
	const movieTitle = req.params.movieTitle
	db.getMovie(movieTitle)
		.then(data => {
			res.send(data)
		})
});


module.exports = router;

