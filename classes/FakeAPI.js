/**
 * A module for a fake api.
 */
"use strict";

class FakeAPI {
    /**
     * @constructor
     *
     * @param {object} options - Configure by sending options.
     */
    constructor(options = {}) {
        this.getRoutes  = options.getRoutes  || ["", "reports", "about"];
        this.postRoutes = options.postRoutes || ["report", "login"];
    }

    getGet(route) {
        let trimRoute = route.split("/").join("");
        let isValid = this.getRoutes.find(validRoute => validRoute === trimRoute);
        switch (isValid) {
            case "":
                return {
                    status: 200,
                    title: "Home",
                    data: "Welcome to fakepi"
                }
            case "about":
                return {
                    status: 200,
                    title: "About",
                    data: "This is the about page for fake api"
                }
            case "reports":
                return {
                    status: 200,
                    title: "Completed reports",
                    data: "These are the completed reports",
                    reports: [
                        {
                            kmom: "01",
                            data: "Report for kmom01"
                        },
                        {
                            kmom: "02",
                            data: "Report for kmom02"
                        },
                        {
                            kmom: "03",
                            data: "Report for kmom03"
                        }
                    ]
                }
        
            default:
                return {
                    status: 404,
                    data: "Route does not exist"
                }
        }
    }

    getPost(route, data) {
        if (!data) return "No data provided";
        let trimRoute = route.split("/").join("");
        let isValid = this.postRoutes.find(validRoute => validRoute === trimRoute);
        switch (isValid) {
            case "report":
                return {
                    status: 201,
                    reportInfo: data
                }
            case "login":
                return {
                    status: 201,
                    loginInfo: data
                }
            default:
                return {
                    status: 404,
                    data: "Route does not exist"
                }
        }
    }
}

module.exports = FakeAPI;