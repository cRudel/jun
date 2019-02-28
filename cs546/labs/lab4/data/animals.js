/*
*   Christopher Rudel
*   CS546
*   animals.js
*   lab4
*   I pledge my honor that I have abided by the Stevens Honor System
*/

const mongoCollections = require("./collections");
const animals = mongoCollections.animals;

const create = async function create(name, animalType){
    let animalCollection = await animals();

    let newAnimal = {
        name: name,
        animalType: animalType
    };

    let insertInfo = await animalCollection.insertOne(newAnimal);
    if(insertInfo.insertedCount === 0) throw "Could not insert animal";

    let newId = insertInfo.insertedId;
    //console.log(typeof newId);
    let animal = await this.get(newId);
    return animal;


}

const getAll = async function getAll(){
    let animalCollection = await animals();
    let allAnimals = await animalCollection.find({}).toArray();
    return allAnimals;
}

const get = async function get(id){
    if(typeof id == "string"){
        ObjectId = require('mongodb').ObjectID;
        id = ObjectId(id);
    }
    
    let animalCollection = await animals();
    let findAnimal = await animalCollection.findOne({ _id: id });
    //if(findAnimal === null) throw `No animal with id: ${id}`;
    return findAnimal;
}

const remove = async function remove(id){
    let animalCollection = await animals();
    let animalToRemove = await this.get(id);
    let deletedAnimal = {
        deleted: true,
        data: animalToRemove
    };

    let deletionInfo = await animalCollection.removeOne({_id: id});
    if(deletionInfo.deletedCount === 0) throw `Could not delete animal with id: ${id}`;

    return deletedAnimal;
}

const rename = async function rename(id, newName){
    let animalCollection = await animals();
    let oldAnimal = await this.get(id);
    let newAnimal = {
        $set:{
            name: newName,
            animalType: oldAnimal.animalType
        }
    };

    const updatedInfo = await animalCollection.updateOne({_id: oldAnimal._id}, newAnimal);
    if(updatedInfo.modifiedCount === 0){
        throw `Could not update dog: ${id} successfully`;
    }

    return await this.get(id);
}



module.exports = {
    firstName: "Christopher",
    lastName: "Rudel",
    studentId: "10413032",
    create,
    getAll,
    get,
    remove,
    rename
};