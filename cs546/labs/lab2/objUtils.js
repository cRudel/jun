/*
*   Christopher Rudel
*   CS546
*   objUtils.js
*   I pledge my honor that I have abided by the Stevens Honor System
*/

//todo: finish
const extend = function extend(...theArgs){
    console.log(theArgs);
    let retMe = {};
    let keys = new Array(theArgs.length);
    let arr = [];
    for(let i=0; i<theArgs.length; i++){
        arr = arr.concat(Object.keys(theArgs[i]));
        // this takes all the keys and puts them into an array
    }
    let merged = {...theArgs[0], ...theArgs[1]};
    merged = {...merged, ...theArgs[2]};
    console.log(merged);

}

//todo: arg checking
const smush = function smush(...theArgs){
    let retMe = {};
    for(let i=0; i<theArgs.length; i++){
        retMe = {...retMe, ...theArgs[i]};
    }

    return retMe;
}

//todo: finish
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