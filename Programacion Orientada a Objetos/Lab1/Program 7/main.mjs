/*
    * Student: Natalia Ariza
    * Student Number: C0527218
    * Lab: 1
    * Title: Introduction to NodeJS
    * Program: Calculator
    *
*/
import { Class1 } from "./mymodule.mjs";
import * as process from 'process';

//try catch to execute the math() method of the calculator instance variable
let calculator = new Class1 (process.argv [2], process.argv[3], process.argv[4]);
//If works, print the result of the math() method
try {
    calculator.math();
    console.log(calculator.math());
//printing error message
} catch(err) {
    console.log(err);
}
