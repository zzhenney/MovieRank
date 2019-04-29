class RegisterDAO {

    constructor(db,username, password) {
         
        this.db = db
        this.username = username
        this.password = password
    }

    checkIfUserExists(){

        return new Promise((resolve, reject)=>{
             
          this.db.any(`select * from users where username=$1`, this.username)
            .then((result)=>{
              
                if(result.length > 0) resolve(true)
                else resolve(false)
        })

        .catch((err)=>{
               console.log("Error in check user")
               reject(err)
        })


        })


    }

    registerUser(){
         
          return new Promise((resolve, reject)=>{
                
            this.db.none(`insert into users(username, password, thumbnail_url)values('${this.username}', '${this.password}', 'NULL')`)
            .then((data)=>{
                  
                console.log('Insert Successful')
                resolve(data)
            })
            .catch((err)=>{
                 console.log("err in insert")
                 reject(err)
            })
          })
    }
}

module.exports = RegisterDAO