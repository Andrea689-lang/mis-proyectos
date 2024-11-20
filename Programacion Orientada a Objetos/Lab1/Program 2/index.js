/*
    * Student: Natalia Ariza
    * Student Number: C0527218
    * Lab: 1
    * Title: Introduction to NodeJS
    * Program: Loops
    *
*/
// Display Loop from 0 to 100
//variables
var c = 0;
var array = [100]; //100 elements
//Fill the array
for (let i = 0; i < 100; i++) {
    array[i] = c*2; //by 2 pairs
    c++;
}
//print the array
for (let item of array) {
    console.log(item);
}