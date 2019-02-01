const FakeAPI = require("../../classes/FakeAPI.js");

const API = new FakeAPI();

test("Get home data", () => {
    const exp = "Welcome to fakeapi";
    const res = API.getGet("");
    expect(res.data).toBe(exp);
});

test("Get route error", () => {
    const exp = 404;
    const res = API.getGet("asdf");
    expect(res.status).toBe(exp);
});

test("Post route error", () => {
    let exp = 404;
    const res = API.getPost("report");
    expect(res.status).not.toBe(404);
    exp = "No data provided";
    expect(res).toBe(exp);
});

test("Post submit report", () => {
    let exp = "This is a report";
    const res = API.getPost("report", "This is a report");
    expect(res.reportInfo).toBe(exp);
});

test("Post submit login information", () => {
    let exp = 201;
    const res = API.getPost("report", "coolUsername");
    expect(res.status).toBe(exp);
});

test("Post submit login error", () => {
    let exp = 201;
    const res = API.getPost("report");
    expect(res.status).not.toBe(exp);
});
