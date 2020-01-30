const expect = require('chai').expect
const app = require("../../../app.js")
const request = require('supertest')
const db = require("../../../db")
const user = request.agent(app)
describe("Ratings", function(){
    let cookie = null;
    
    before(function(done) {
        //insert test movie with rating
        //db.none("delete from rating where uid=4")

        user
            .post("/login")
            .set("Referer", "/")
            .send({username: "zac", password: "pass"})
            .end(function(err, response){
                expect(response.headers['set-cookie'])
                expect(response.status).to.equal(302)
                done()
            });
    })
    
    

    describe("Submit Rating - User", () => {
        it("Record created in rating table", (done) => {
            user
                .post("/rating")
                .set("Referer", "/search/avengers")
                .send({rating: 0, mid: 1})
                .end(function(err, response){

                    expect(response.status).to.equal(302)
                    db.one("select * from rating where uid=4")
                        .then(data => {
                            expect(data.rating).to.equal('0')
                            expect(data.uid).to.equal('4')
                            done()
                        })
                        .catch(err => {
                            done(err)
                        })
                   
                })

        });
        it("Rejects duplicate rating", (done) => {
            user
                .post("/rating")
                .set("Referer", "/search/avengers")
                .send({rating: 0, mid: 1})
                .end(function(err, response){

                    expect(response.status).to.equal(302)
                    
                    db.any("select * from rating where uid=4")
                        .then(data => {
                            console.log(data)
                            expect(data.length).to.equal(1)
                            done()
                            
                        })
                        .catch(err => {
                            done(err)
                        })
                  
                })

        })
    });
    describe("Update Rating - User", () => {
        it("Record updated in table", (done) => {
            db.one("select * from rating where uid = 4")
                .then(data => {
                    user
                        .post('/rating/update')
                        .send({rid: data.rid, rating: 3})
                        .end(function(err, response){
                            expect(response.status).to.equal(302)
                            
                            db.one(`select * from rating where uid=4 and rid=${data.rid}`)
                                .then(check_data => {
                                    expect(check_data.rating).to.equal('3')
                                    done()
                                    
                                })
                                .catch(err => {
                                    done(err)
                                })
                        })   
                })
        });
        
    });
    
    describe("Delete Rating - User", () => {
        it("Record deleted from table", (done) => {
            db.one("select * from rating where uid = 4")
                .then(data => {
                    user
                        .post('/rating/delete')
                        .send({uid: 4, rid: data.rid})
                        .end(function(err, response){
                            expect(response.status).to.equal(302)
                            db.any(`select * from rating where uid=4 and rid=${data.rid}`)
                                .then(data => {
                                    expect(!data)
                                    done()
                                    
                                })
                                .catch(err => {
                                    done(err)
                                })
                        })   
                })
        });
        
    });
    
    
    
    
});


