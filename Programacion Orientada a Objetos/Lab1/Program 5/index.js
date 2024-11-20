/*
    * Student: Natalia Ariza
    * Student Number: C0527218
    * Lab: 1
    * Title: Introduction to NodeJS
    * Program: Classes
    *
*/
// 1 constructor
//  2 methods with parameters and return values
//  2 member variables
class Student {
    constructor(firstName, lastName, grade1, grade2) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.grade1 = grade1;
        this.grade2 = grade2;
    }

    set firstName(value) {
        this._firstName = value;
    }
    set lastName(value) {
        this._lastName = value;
    }
    set grade1(value) {
        this._grade1 = value;
    }
    set grade2(value) {
        this._grade2 = value;
    }
    get firstName() {
        return this._firstName;
    }
    get lastName() {
        return this._lastName;
    }
    get grade1() {
        return this._grade1;
    }
    get grade2() {
        return this._grade2;
    }

    calculateFinalGrade(grade01, grade02) {

        return (this.grade1 + this.grade2)/2;
    }
    
    completeName(){
        return this.firstName + " " + this.lastName;
    }
    
}
// main part
const student1 = new Student("Natalia", "Ariza", 20, 15);
console.log("Complete Name: ", student1.completeName());
console.log("Average Final Grade: ", student1.calculateFinalGrade(20,15));
