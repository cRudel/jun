/*
*   Christopher Rudel
*   CS546
*   animals.js
*   I pledge my honor that I have abided by the Stevens Honor System
*/

const mongoCollections = require("./collections");
const animals = mongoCollections.animals;

let exportedMethods = {
    async create(name, animalType){
        let animalCollection = await animals();
    
        let newAnimal = {
            name: name,
            animalType: animalType
        }
        let insertInfo = await animalCollection.insertOne(newAnimal);
        if(insertInfo.insertedCount === 0) throw "Could not insert animal";

        let newId = insertInfo.insertedId;
        //console.log(typeof newId);
        let animal = await this.get(newId);
        return animal;

    },

    async getAll(){
        let animalCollection = await animals();
        let allAnimals = await animalCollection.find({}).toArray();
        return allAnimals;
    },

    async get(id){
        let animalCollection = await animals();
        let findAnimal = await animalCollection.findOne({ _id: id });
        if(findAnimal === null) throw `No animal with id: ${id}`;
        return findAnimal;
    },

    async remove(id){
        let animalCollection = await animals();
        let animalToRemove = await this.get(id);
        let deletedAnimal = {
            deleted: true,
            data: animalToRemove
        };
    
        let deletionInfo = await animalCollection.removeOne({_id: id});
        if(deletionInfo.deletedCount === 0) throw `Could not delete animal with id: ${id}`;
    
        return deletedAnimal;
    },

    async rename(id, newName){
        let animalCollection = await animals();
        let newAnimal = {
    
        }
    }

};

module.exports = exportedMethods;