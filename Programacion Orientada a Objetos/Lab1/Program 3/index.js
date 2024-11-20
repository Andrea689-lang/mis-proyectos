/*
    * Student: Natalia Ariza
    * Student Number: C0527218
    * Lab: 1
    * Title: Introduction to NodeJS
    * Program: Loops
    *
*/
//Exception calls a function that will randomly throw an exception,
function gettingError() {
    //number betwween 0 and 10
    var value = parseInt(Math.random()*10);
    //printing random value
    console.log("Value random: ", value);
    //conditional if, in the case is a odd value throw exception
    if (value % 2 == 1) {
        throw "Exception random";
    }
    //if the value is not odd, throw just this message
    else {
        console.log("Not an exception")
    }
}

try {
    gettingError();
} catch(err) {
    console.log(err);
}
