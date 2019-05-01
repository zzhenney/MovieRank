var express = require('express');
var router = express.Router();
const db = require('../db/search.js')

router.post('/', (req, res, next) => {
	const movieTitle = req.body.movieTitle
	console.log(movieTitle)
	res.redirect(`/search/${movieTitle}`)
	//res.redirect('/')
})

router.get('/:movieTitle', (req, res, next)=>{
	const movieTitle = req.params.movieTitle
	db.getMovie(movieTitle)
		.then(data => {
			//res.redirect('/result', {data})
			res.send(data)
		})
});


module.exports = router;

