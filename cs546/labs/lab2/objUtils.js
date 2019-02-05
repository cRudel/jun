/*
*   Christopher Rudel
*   CS546
*   objUtils.js
*   I pledge my honor that I have abided by the Stevens Honor System
*/

//todo: arg checking
const extend = function extend(...theArgs){
    //console.log(theArgs);
    let retMe = {};
    let keys = new Array(theArgs.length);
    let keyArr = [];
    let valueArr = [];
    for(let i=0; i<theArgs.length; i++){
        keyArr = keyArr.concat(Object.keys(theArgs[i])); // this takes all the keys and puts them into an array
        valueArr = valueArr.concat(Object.values(theArgs[i])); // this takes all the values and puts them into an array
    }

    for(let i=0; i<keyArr.length; i++){
        if(keyArr[i] in retMe){
            continue;
        }else{
            retMe[keyArr[i]] = valueArr[i];
        }
    }

    console.log(retMe);
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