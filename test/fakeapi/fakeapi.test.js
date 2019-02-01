const FakeAPI = require("../../classes/FakeAPI.js");

const API = new FakeAPI();

test("Get home data", () => {
    const exp = "Welcome to fakeapi";
    const res = API.getGet("");
    expect(res.data).toBe(exp);
});

test("Get about data", () => {
    const exp = 200;
    const res = API.getGet("/about");
    expect(res.status).toBe(exp);
});

test("Get route error", () => {
    const exp = 404;
    const res = API.getGet("asdf");
    expect(res.status).toBe(exp);
});

test("Get unposted report", () => {
    const exp = "undefined";
    const res = API.getGet("/reports");
    expect(typeof res.reports[3]).toBe(exp);
});

test("Get reports data", () => {
    const exp = "string";
    const res = API.getGet("/reports");
    expect(typeof res.reports[0].data).toBe(exp);
});

test("Post route error", () => {
    let exp = 404;
    const res = API.getPost("report");
    expect(res.status).not.toBe(404);
    exp = "No data provided";
    expect(res).toBe(exp);
});

test("Post submit report", () => {
    const exp = "This is a report";
    const res = API.getPost("report", "This is a report");
    expect(res.reportInfo).toBe(exp);
});

test("Post submit login information", () => {
    const exp = 201;
    const res = API.getPost("login", "coolUsername");
    expect(res.status).toBe(exp);
});

test("Post submit login error", () => {
    const exp = 201;
    const res = API.getPost("login");
    expect(res.status).not.toBe(exp);
});

test("Post unsupported route", () => {
    let exp = "No data provided";
    let res = API.getPost("/yahoo");
    exp = 404;
    res = API.getPost("/yahoo", "some data");
    expect(res.status).toBe(exp);
});
