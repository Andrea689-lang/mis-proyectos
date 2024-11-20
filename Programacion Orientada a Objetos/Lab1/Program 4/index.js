/*
    * Student: Natalia Ariza
    * Student Number: C0527218
    * Lab: 1
    * Title: Introduction to NodeJS
    * Program: Template Strings
    *
*/
//showing the current date
const currentDate = new Date();
//showing the current year
const currentYear = currentDate.getFullYear();
//showing the current month number
const currentMonth_number = currentDate.getMonth();
const currentMonths = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];

var currentMonth = currentMonths[currentMonth_number];

//showing the current day
var currentDay = currentDate.getDate();
//showing the current time in hours and minutes
var time_hours = currentDate.getHours();
var time_minutes = currentDate.getMinutes();
//printing the current date
console.log(`Today: ${currentMonth} ${currentDay} in the year ${currentYear} and the time is ${time_hours}hours with ${time_minutes}minutes`);