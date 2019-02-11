process.env.NODE_ENV = 'test';

const request = require('supertest');
// const chai = require('chai');
// const chaiHttp = require('chai-http');
const server = require('../../app.js');
// console.log('TCL: server', server);

// chai.should();

// chai.use(chaiHttp);

describe('Reports', () => {
    describe('GET /reports/kmom01', () => {
        it('200 HAPPY PATH', async (done) => {
            const res = await request(server).get("/reports/kmom01");
            console.log('TCL: res.status', res.status);
            // console.log('TCL: res.body', res.body)
            done();
        })
    });

    // describe('GET /reports/kmom02', () => {
    //     it('200 HAPPY PATH', (done) => {
    //         chai.request(server)
    //             .get("/reports/kmom02")
    //             .end((err, res) => {
    //                 res.should.have.status(200);
    //                 res.body.should.be.an("object");
    //                 res.body.data.should.be.an("array");
    //                 res.body.data.length.should.be.above(0);

    //                 done();
    //             });
    //     });
    // });
});
