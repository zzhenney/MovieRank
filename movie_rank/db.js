
const dbconfig = require('./config')

const initOptions = {
    schema: process.env.DB_SCHEMA
 }

//const pgp = require('pg-promise')(initOptions)
const pgp = require('pg-promise')()
//const db = pgp(dbconfig)
let db = pgp(process.env.DATABASE_URL)
if(process.env.NODE_ENV === 'test'){
    db = pgp(process.env.TEST_DATABASE_URL)
}




module.exports = db