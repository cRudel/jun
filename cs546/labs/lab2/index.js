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
//finish me
const test = arrayUtils.range(4, true);
console.log(test);

const arrayCount = arrayUtils.countElements([13, '13', 13, 'hello', true, true]);
const stringCount = stringUtils.countChars("");
/*
const equalTest = arrayUtils.isEqual([1, 2, 3], [1,2,3]);
const stringCap = stringUtils.capitalize('monday tuesday wednesday thursday');
const stringRep = stringUtils.repeat("", 1);*/
console.log(stringCount);

const objTest = objUtils.extend(1,2,3,'yo', false, 'mios');