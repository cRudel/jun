/*
*   Christopher Rudel
*   CS546
*   arrayUtils.js
*   I pledge my honor that I have abided by the Stevens Honor System
*/
const head = function head(arr) {
	if(arr === undefined || arr.constructor !== Array){
		throw "Error: please ensure to input a variable of type array";
	}
	else if(arr.length == 0){
		throw "Error: please input a non empty array"
	}
	else{
		return arr[0];
	}
}

const last = function last(arr) {
	if(arr === undefined || arr.constructor !== Array){
		throw "Error: please ensure to input a variable of type array";
	}
	else if(arr.length == 0){
		throw "Error: please input a non empty array";
	}
	else{
		return arr[arr.length-1];
	}
}

const remove = function remove(arr, index) {
	if(arr === undefined || arr.constructor !== Array){
		throw "Error: please ensure to input a variable of type array";
	}
	else if(arr.length == 0){
		throw "Error: please input a non empty array";
	}
	else if(index > arr.length || index < 0){
		throw "Error: please ensure the index is within the bounds of the array";
	}
	else if(isNaN(index) || index === null || index === undefined){
		throw "Error: please input a number for the index";
	}
	else{
		arr.splice(index,1);
		return arr;
	}
}

const range = function range(end, value) {
	if(!Number.isInteger(end)){ // integers will get past this and so will doubles like 1.0
		console.log("ahh");
	}
	else{
		if(end <= 0){
			throw "Error: please enter a number greater than 0";
		}
		let retMe = new Array(end);
		if(value === undefined || value === null){
			for(let i = 0; i < retMe.length; i++){
				retMe[i] = i;
			}
			
		} else{
			retMe.fill(value);
		}
		return retMe;
	}
}

const countElements = function countElements(arr) {

}

const isEqual = function isEqual(arr1, arr2) {

}

module.exports = {
	  firstName: "Christopher",
    lastName: "Rudel",
    studentId: "10413032",
    head,
		last,
		remove,
		range,
		countElements,
		isEqual
};