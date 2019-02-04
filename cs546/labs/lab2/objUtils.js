/*
*   Christopher Rudel
*   CS546
*   objUtils.js
*   I pledge my honor that I have abided by the Stevens Honor System
*/

const extend = function extend(...theArgs){
    let retMe = {};
    let keys = new Array(theArgs.length);
    for(let i=0; i<theArgs.length; i++){
        keys[i] = Object.keys(theArgs[i]);
    }
    for(let i=0; i<theArgs.length; i++){

    }
}

const smush = function smush(...theArgs){

}

const mapValues = function mapValues(obj, func){
    
}

module.exports = {
	firstName: "Christopher",
    lastName: "Rudel",
    studentId: "10413032",
    extend,
    smush,
    mapValues
};