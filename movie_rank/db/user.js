const db = require('../db.js')

const getUserProfile = (uid) => {
	return db.one(`SELECT users.username, users.thumbnail_url FROM users where users.uid = ${uid}`)
		.then(data => {
			return data
		})
}

const updatePassword = (uid, pass) => {
	console.log("db update password")
	db.one(`UPDATE users SET password = $1 WHERE uid = $2`, [pass, uid])
		.then(()=> {
			return
		})
		.catch(err => {
			console.log(err)
		})
}

const deleteAvatar = (uid) => {
	db.one(`UPDATE users SET thumbnail_url = 'NULL' WHERE uid = ${uid}`)
		.then(() => {
			return
		})
		.catch(err => {
			console.log(err)
		})
}

const updateAvatar = (uid, url) => {
	db.one(`UPDATE users SET thumbnail_url = '${url}' WHERE uid = ${uid}`)
		.then(() => {
			return
		})
		.catch(err => {
			console.log(err)
		})
}

module.exports = { getUserProfile, updatePassword, deleteAvatar, updateAvatar }