
const dbconfig = require('./config')

const initOptions = {
    schema: process.env.DB_SCHEMA
 }

//const pgp = require('pg-promise')(initOptions)
const pgp = require('pg-promise')()
//const db = pgp(dbconfig)
const db = pgp(process.env.DATABASE_URL)



module.exports = db