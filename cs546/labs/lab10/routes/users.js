const express = require("express");
const router = express.Router();
const users = require("../data/users");
const auth = require("../middleware/auth");

router.get("/", (req,res) =>{
    if(req.cookies.name === "AuthCookie") {
        res.redirect("/private");
    }else{
        console.log("here");
        res.render("users/home", { title: "Welcome to the login page"});
    }
});

router.post("/login", (req, res, next) =>{
    let userN = req.body.username;
    let passW = req.body.password;

    if(userN && passW){
        uResult = users.checkUsername(userN);
        pResult = users.checkPassword(userN, passW);

        if(uResult && pResult.status){

        }
    } else{
        res.render("users/home", {
            title: "Login Screen",
            message: "Wrong username or password",
            status: false
        });
    }
});

router.get("/private", auth, (req, res, next) => {
    let user = req.session.user;
    res.render("users/info",
    {
        user,
        title: `Hello ${user.firstName} ${user.lastName}`
    });
});

router.get("/logout", (req,res, next) =>{
    res.clearCookie('name');
    res.redirect("/");
})


module.exports = router;