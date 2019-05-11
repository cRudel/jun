const authUser = function authUser(req, res, next) {
    let str = new Date().toUTCString();
    str = str.concat(" ");
    str = str.concat(req.method);
    str = str.concat(" ");
    str = str.concat(req.originalUrl);
    str = str.concat(" ");
    if(req.cookies.name === 'AuthCookie'){
        str = str.concat("(Authenticated User)");
        console.log(str);
        next();
    }else{
        str = str.concat("(Non-Authenticated User)");
        console.log(str);
        res.status(403).render("users/error", {title: "Error: Not allowed"});
    }
}

module.exports = authUser;