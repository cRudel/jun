const express = require("express");
const router = express.Router();
const users = require("../data/users");

router.get("/", (req,res) =>{
    if(req.cookies.name === "AuthCookie") {
        res.redirect("/private");
    }else{
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


module.exports = router;