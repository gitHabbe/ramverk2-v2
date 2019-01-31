const FakeAPI = require("./classes/FakeAPI.js");

const fakeApi = new FakeAPI();
console.log(fakeApi.getGet("/about"));
console.log(fakeApi.getPost("/login", "qwer"));

// console.log("fakeApi", fakeApi);