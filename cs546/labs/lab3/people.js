/*
*   Christopher Rudel
*   CS546
*   people.js
*   I pledge my honor that I have abided by the Stevens Honor System
*/

const fs = require('fs');


const getPersonById = function getPersonById(id){
    let names = [];
    fs.readFile("people.json", "utf-8", (error, data) => {
        if(error) throw error;

        let asObject = JSON.parse(data);
        asObject.forEach(person => {
            names.push(person.firstName);
        });
        console.log(names);

    });
    console.log("First person:");

}

const lexIndex = function lexIndex(index){

}

const firstNameMetrics = function firstNameMetrics(){

}



module.exports = {
    firstName: "Christopher",
    lastName: "Rudel",
    studentId: "10413032",
    getPersonById,
    lexIndex,
    firstNameMetrics
}