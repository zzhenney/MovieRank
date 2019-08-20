var express = require('express');
var router = express.Router();
const db = require('../db/search.js')

router.post('/', (req, res, next) => {
	const movieTitle = req.body.movieTitle
	if(movieTitle.length == 0){
		res.redirect('back')
	}
	res.redirect(`/search/${movieTitle}`)

})

router.get('/:movieTitle', (req, res, next)=>{
	const movieTitle = req.params.movieTitle
	
	db.getMovie(movieTitle)
		.then(data => {
			if(data == 1){
				res.redirect('back')
			}
			else{
			//change to req.session.user.user_id
				data.user = 0
				if(req.session.user){
					data.user = req.session.user
				}

				res.render('result', { data: data,
									   messages: req.flash('messages') 
				});
			}

		})
});


module.exports = router;

