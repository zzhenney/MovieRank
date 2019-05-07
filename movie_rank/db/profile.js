class AuthDAO {

    constructor(db,username) {
         
        this.db = db
        this.username = username
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

    getMovieRanked(){
        /*
        
        return new Promise((resolve, reject)=>{
             
            this.db.any(`select * from users where username='${this.username}`)
              .then((result)=>{
                
                  if(result.length > 0) resolve(true)
                  else resolve(false)
          })
  
          .catch((err)=>{
                 console.log(err)
                 reject(err)
          })
  
  
          })
          */
    }
}

module.exports = profile