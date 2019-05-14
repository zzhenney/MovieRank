if(process.env.NODE_ENV === 'development') {
	require("dotenv").config();
}


var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

const bodyParser = require('body-parser')
const session = require('express-session')
require('dotenv').config()



var app = express();


const indexRouter = require('./routes/index')
const authRouter = require('./routes/register')
const loginRouter = require('./routes/login')

const searchRouter = require('./routes/search')
const ratingRouter = require('./routes/rating')



const homeRouter = require('./routes/home')
const logoutRouter = require('./routes/logout')




// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use(bodyParser.urlencoded({extended:true}))
app.use(session({ secret: process.env.SECRET, resave: false,
  saveUninitialized: true}))

//routes

app.use('/', indexRouter);
app.use('/register', authRouter)
app.use('/login', loginRouter)

app.use('/search', searchRouter)
app.use('/rating', ratingRouter)


app.use('/home', homeRouter)
app.use('/logout', logoutRouter)


// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});


// error handler

app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.send(err);
});


app.listen(process.env.PORT || 3000, ()=>{
     
     console.log('Server Running ....')
})


module.exports = app;
