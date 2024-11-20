/*
    * Student: Natalia Ariza
    * Student Number: C0527218
    * Lab: 1
    * Title: Introduction to NodeJS
    * Program: Calculator
    *
*/
export class Class1 {
    firstValue = 0;
    secondValue = 0;
    operator = "+";

    constructor (firstValue, secondValue, operator) {
        this.firstValue = firstValue;
        this.secondValue = secondValue;
        this.operator = operator;
    }

    math() {
        switch(this.operator) {
            //four methods
            case "+":
                return (`${this.firstValue} ${this.secondValue} ${this.operator} = ${parseInt(this.firstValue) + parseInt(this.secondValue)}`);
            case "-":
                return (`${this.firstValue} ${this.secondValue} ${this.operator} = ${this.firstValue - this.secondValue}`);
            case "*":
                return (`${this.firstValue} ${this.secondValue} ${this.operator} = ${this.firstValue * this.secondValue}`);
            case "/":
                return (`${this.firstValue} ${this.secondValue} ${this.operator} = ${this.firstValue / this.secondValue}`);

            default: 
                console.log(`The operator ${this.operator} is invalid`);
                break;
        }
    }
}