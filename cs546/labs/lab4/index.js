/*
*   Christopher Rudel
*   CS546
*   index.js
*   lab4
*   I pledge my honor that I have abided by the Stevens Honor System
*/
const connection = require("./data/connection");
const animals = require("./data/anim");

const start = async function start(){
    console.log("first");
    let allMyAnimals = await animals.getAll();
    console.log(allMyAnimals);

    console.log("ah");
    const ya = await animals.get("5c7701130c97df9bfa6fc771");
    console.log(ya);

    /*
    const test1 = await animals.create("Chris","Human");
    allMyAnimals = await animals.getAll();
    console.log(allMyAnimals);*/
    
    //console.log("Second");
    /*
    const testRem = await animals.remove("5c7701130c97df9bfa6fc771");
    console.log(testRem);

    console.log("finishing");
     allMyAnimals = await animals.getAll();
    console.log(allMyAnimals);*/


    //Closing connection to db
    const db = await connection();
    await db.serverConfig.close();
    console.log("\nDone");
}

start();