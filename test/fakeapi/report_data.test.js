process.env.NODE_ENV = 'test';

const request = require('supertest');
const server = require('../../app.js');

describe('Reports', () => {
    describe('GET /reports/kmom01', () => {
        it('200 HAPPY PATH', async (done) => {
            const res = await request(server).get("/reports/kmom01");
            expect(res.status).toBe(200);
            done();
        })
    });
    describe('GET /reports/kmom02', () => {
        it('200 HAPPY PATH2', async (done) => {
            const res = await request(server).get("/reports/kmom02");
            expect(res.status).toBe(200);
            done();
        })
    });
    describe('POST /register', () => {
        it('200 AUTH', async (done) => {
            const res = await request(server).post("/register")
                .send({email: "aa", password: "bb"});
            expect(res.status).toBe(200);
            done();
        })
    });
    describe('POST /login', () => {
        it('200 HAPPY POST PATH', async (done) => {
            const res = await request(server).post("/login")
                .send({email: "aa", password: "bb"})
                .set("Content-Type", "application/x-www-form-urlencoded")
                .set('Accept', 'application/json');
            expect(res.status).toBe(200);
            done();
        })
    });
    describe('GET /', () => {
        it('200 Text', async (done) => {
            const res = await request(server).get("/");
            const text = JSON.parse(res.text).data.text;
            expect(text.startsWith("Mitt namn är Niklas Hallberg")).toBe(true);
            done();
        })
    });
    describe('GET /jwt_outh 403', () => {
        it('403 AUTH', async (done) => {
            const res = await request(server).get("/jwt_outh");
            expect(res.status).toBe(403);
            done();
        })
    });
    describe('GET /jwt_outh happy', () => {
        it('200 AUTH', async (done) => {
            const res = await request(server).post("/login")
                .send({email: "aa", password: "bb"});
            const token = JSON.parse(res.text).token;
            const res2 = await request(server).get("/jwt_outh")
                .set('x-access-token', token);
            expect(res2.status).toBe(200);
            done();
        })
    });
    

});
