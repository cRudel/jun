

const axios = require('axios');

async function getPeople(){
    const {data} = await axios.get("https://gist.githubusercontent.com/robherley/5112d73f5c69a632ef3ae9b7b3073f78/raw/24a7e1453e65a26a8aa12cd0fb266ed9679816aa/people.json");
    return data;
}

const getPersonById = async function getPersonById(id){
    if(id === undefined || id === null || typeof id != "number"){
        throw "Error: please ensure the argument is a number for function getPersonById";
    }
    
    let names = "";

    let people = await getPeople();

    if(id > people.length || id < 1){
        throw "Error: provided id is not within the bounds of the list of people";
    }
    people.forEach(person => {
        if(person["id"] == id){
            names = names.concat(person["firstName"], " ", person["lastName"]);
        }
    });
    return names;

}





module.exports = {
    getPersonById
};