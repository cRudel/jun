/*
*   Christopher Rudel
*   CS546
*   app.js
*   I pledge my honor that I have abided by the Stevens Honor System
*/


const people = require("./people");
const weather = require("./weather");
const work = require("./work");

const start = async function start(){
    try{
        //const test = await people.firstNameMetrics();
        //console.log(test);

        let test = await work.findTheHacker("157.254.170.156");
        console.log(test);
    }catch(error){
        console.error(error);
    }
}

start();