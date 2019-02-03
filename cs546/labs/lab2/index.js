/*
*   Christopher Rudel
*   CS546
*   index.js
*   I pledge my honor that I have abided by the Stevens Honor System
*/

const arrayUtils = require("./arrayUtils");
const stringUtils = require("./stringUtils");

// Head tests
try{
    // should pass
    const headOne = arrayUtils.head([true,'1',2,3]);
    console.log(headOne);
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

// last tests
try{
    // should pass
    const lastOne = arrayUtils.last([true,'1',2,3]);
    console.log(lastOne);
    console.log("Head passed successfully")
}catch (e){
    console.error("Head test case failed")
}
try{
    // should fail
    const lastTwo = arrayUtils.last(null);
    console.error("Head did not error");
}catch(e){
    console.log("Head failed successfully");
}

// remove tests
try{
    // should pass
    const removeOne = arrayUtils.remove([true, '1', 2, 8], 3);
    console.log(removeOne);
    console.log("Head passed successfully")
}catch (e){
    console.error("Head test case failed")
}
try{
    // should fail
    const removeTwo = arrayUtils.remove([true, '1', 2, 3], 10);
    console.error("Head did not error");
}catch(e){
    console.log("Head failed successfully");
}

const test = arrayUtils.range(1);