var express = require('express');
var router = express.Router();
const db = require('../db/search.js')

router.post('/', (req, res, next) => {
	const movieTitle = req.body.movieTitle
	res.redirect(`/search/${movieTitle}`)
})

router.get('/:movieTitle', (req, res, next)=>{
	const movieTitle = req.params.movieTitle
	db.getMovie(movieTitle)
		.then(data => {
			//console.log(data)
			data.user = 1
			//console.log(data)
			res.render('result', { data: data })
			//res.send(data)
		})
});


module.exports = router;

