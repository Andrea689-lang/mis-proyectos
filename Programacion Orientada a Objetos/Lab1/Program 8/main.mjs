/*
    * Student: Natalia Ariza
    * Student Number: C0527218
    * Lab: 1
    * Title: Introduction to NodeJS
    * Program: Restful Service Call
    *
*/
import axios from "axios";

//assigment of the variable call to the desired link
const call = 'https://jsonplaceholder.typicode.com/todos/1';

//async version of the axios.get method
//gets keys and values, reads and prints
async function getAnswers() 
{
    const response = await axios.get(call);
    //Extraction the keys and values from response data
    let key = Object.keys(response.data);
    let data = Object.values(response.data);

    //Loop through keys and values to print it
    for (let i = 0; i < key.length; i++) {
        console.log(key[i] + ":" + data[i]);
    }
}
//calling the await function
await getAnswers();

