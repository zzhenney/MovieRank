const expect = require('chai').expect
//const search = require("../db/search.js")
const app = require("../../../app.js")
const request = require('supertest')(app)

describe("Search", function(){
    describe("Empty Search - \" \" ", () => {
        it("Returns 302 and redirects home", (done) => {
            request
                .get("/search/%20")
                .end((err, res) => {
                    expect(res.statusCode).to.equal(302);
                    expect("Location", "/")
                    done();
                });
        });
    });
    describe("Empty Search - \"  \"", () => {
        it("Returns 302 and redirects home", (done) => {
            request
                .get("/search/%20%20")
                .end((err, res) => {
                    expect(res.statusCode).to.equal(302);
                    expect("Location", "/")
                    done();
                });
        });
    });
    describe("Search Avengers", () => {
        it("Returns 200 and name equals Avengers", (done) => {
            request
                .get("/search/Avengers")
                .set("Accept", "application/json")
                .end((err, res) => {
                    expect(res.statusCode).to.equal(200);
                    expect(res.body.name).to.equal("Avengers");
                    done();
                });
        });
    });
    describe("Search -1", () => {
        it("Returns 302 and redirects home", (done) => {
            request
                .get("/search/-1")
                .end((err, res) => {
                    expect(res.statusCode).to.equal(302);
                    expect("Location", "/")
                    done();
                });
        });
    });
});


