
const dbconfig = require('./config')

const initOptions = {
    schema: process.env.DB_SCHEMA
 }
 const pgp = require('pg-promise')(initOptions)
 const db = pgp(dbconfig)

 module.exports = db