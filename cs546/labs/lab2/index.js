/*
*   Christopher Rudel
*   CS546
*   index.js
*   I pledge my honor that I have abided by the Stevens Honor System
*/

const arrayUtils = require("./arrayUtils");
const stringUtils = require("./stringUtils");
const objUtils = require("./objUtils");

// Head tests
try{
    // should pass
    const headOne = arrayUtils.head([true,'1',2,3]);
    console.log("Head passed successfully")
}catch (e){
    console.error("Head test case failed")
}
try{
    // should fail
    const headTwo = arrayUtils.head(arguments[0]);
    console.error("Head did not error");
}catch(e){
    console.log("Head failed successfully");
}

// remove tests
try{
    // should pass
    const removeOne = arrayUtils.remove([null, 0, '0', undefined, false], 3);
    console.log("Remove passed successfully");
}catch(e){
    console.error("Remove test case failed");
}
try{
    //should fail
    const removeTwo = arrayUtils.remove([1,2,3,4], 4);
    console.error("Remove did not error");
}catch(e){
    console.log("Remove failed successfully ")
}
