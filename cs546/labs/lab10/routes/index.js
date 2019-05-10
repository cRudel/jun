const userRoutes = require("./users");

const constructorMethod = app => {
    app.use("/", userRoutes);

    app.use("*", (req, res) => {
        console.log("redirect home");
        res.redirect("/");
    });
};

module.exports = constructorMethod;