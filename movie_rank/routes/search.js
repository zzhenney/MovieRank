var express = require('express');
var router = express.Router();
const db = require('../db/search.js')
const valid = require('./util/validate')

router.post('/', (req, res, next) => {
	const movieTitle = req.body.movieTitle
	if(movieTitle.length == 0){
		res.redirect('back')
	}
	res.redirect(`/search/${movieTitle}`)

})

router.get('/:movieTitle', (req, res, next)=>{
	const movieTitle = req.params.movieTitle
	if(valid(movieTitle)){

	
		db.getMovie(movieTitle)
			.then(data => {
				if(data == -1){
					return res.redirect('back')
				}
				else{
				//change to req.session.user.user_id
					data.user = 0
					if(req.session.user){
						data.user = req.session.user
					}
					//this makes tests work but seems odd placement
					if(process.env.NODE_ENV === 'test' && req.accepts('json')){
						return res.send(data)
					}

					return res.render('result', { data: data,
										messages: req.flash('messages') 
					});
				}

			})
		return
	}

	return res.redirect('back') 

	
});


module.exports = router;

