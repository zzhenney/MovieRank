// do input validation, and make db call
// title length > 0
// title length < 177
// remove leading/trailing ""
// remvove special characters
const validate = require("../routes/util/validate")
//const db = require('../db/search.js')

module.exports = (Search) => (req, cb) => {
    const movieTitle = req.params.movieTitle
    /*
    if(!validate(movieTitle)){
        cb(null, { status: 400, responseJson: { message: "Invalid input"}})
    }
    */
    console.log("pre search " + movieTitle)
    Search.getMovie( movieTitle, (err, movieData) => {
        console.log('got movie')
        if (err) {
            return cb(err)
        }
        //console.log(movieData)
        cb(null, {status: 200, responseJson: { data: movieData}})
    })
};