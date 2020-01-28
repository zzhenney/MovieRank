module.exports = (search) => {

    if(search.length < 2 || search.length > 200){
        return false
    }

    search = search.trim()
    const regex = new RegExp('/\W|_/g')
    return !regex.test(search)
}