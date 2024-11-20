/*********************************************************************************

 Assignment - Lab 6 - Date & Time & Changing Table Contents

 **********************************************************************************/

/************************************************/
/***                                          ***/
/***   Part 1 Processing Date and Time in SQL ***/
/***                                          ***/
/************************************************/
 
 
/*********************************************************************************
 Question 1
 For each employee whose last name begins with a P, 
 display the employee's last name and calculate the number of months between 
 today and the date the employee was hired. 
 Label the column "Months Worked" (note case). 
 Order your results in descending order by the number of months employed. 
 Round the number of months so that there is only a single digit after the decimal. 
**********************************************************************************/





/*********************************************************************************
 Question 2
 Your company is considering providing a special lunch every month for all
 employees who have worked for the company at least 15 years. 
 They will be invited to the lunch in the month in which they were hired. 
 To get an idea of how many employees might come to a special lunch each month over the 
 calendar year, your boss has asked you to write a query to return the number 
 of employees who will have worked for the company at least 15 years divided 
 into groupings by month.
 Label columns as "Month" and "Number of Hires".
 Make use of SYSDATE so that your query could be run at any point in the year.
 Order by increasing calendar month (hint: 2 ways to do this
	(1) involves converting a date to a to a char string and then back to a date
	(2) involves converting a column alias to a date)

 Your results should look similar to those below:

 Month                             Number of Hires
 --------------------------        ---------------
 January                                        14


 Hint:  
 To group by month, you will need to use a character string representing the month.
 To order by month, you will need to use a date representing the month.
**********************************************************************************/






/*********************************************************************************
 Question 3
 You will use the ICS120.PEOPLE table for this query.
 Your boss wants to know how many people might come who are of legal drinking age in    Gondwanaland (in other words, are at least 35 as of December 3rd 2018). 
 You need to write a query to count the number of people in the people database who are at   least 35 by that date. 
 Exclude anyone with no date of birth specified.
 Output results in the following form (where X is the number of drinkers):

 Party goers
 ------------------------------
 Drinkers: X  
**********************************************************************************/


/*************************************************/
/***                                           ***/
/***   Part 2 Changing Table Contents with DML ***/
/***                                           ***/
/*************************************************/
 

/*********************************************************************************
 Question 4
 Add the following data to the customers table (be sure the dates are entered as 
 dates and in the same format as shown, e.g.. as December 9, 1906, not as "9-DEC-06"
 - TO_DATE is helpful here). Be sure to format the dates using SQL, NOT using SQL*Plus.
 
 customer_id   first_name   last_name   dob                phone
 -----------   ----------   ---------   -----------------  --------------
 50            Grace        Hopper      December 9, 1906   800-555-1250
 51            Steve        Jobs        February 24, 1955  800-555-1251
 52            Larry        Ellison     August 17, 1944    800-555-1252
 53            Tom          Thomson     August 4, 1877     NULL
 
**********************************************************************************/





/*********************************************************************************
 Question 5
 Confirm your addition to the table. Order by customer_id.
**********************************************************************************/




/*********************************************************************************
 Question 6 
 The last_name for customer_id 53 is "Thomson" but should be "Thomas". Correct it.
**********************************************************************************/




/*********************************************************************************
 Question 7 
 Mr. Jobs has closed his account. Remove his record from the table. 
 Remove him by name NOT by id number.
**********************************************************************************/


/*********************************************************************************
 Question 8  
 There is a legacy data problem. You need to change all the customer_id values. 
 Update the customer_id values by adding 100 to all the customer_id values in the table.
 The update should apply to ALL records not just the ones you entered.
**********************************************************************************/


/*********************************************************************************
 Question 9
 Confirm your changes to the table. Order by customer_id.
 **********************************************************************************/



/*********************************************************************************
 Question 10
 Create a SAVEPOINT named CUST_SAVEP. 
**********************************************************************************/


/*********************************************************************************
 Question 11
 Add yourself to the customers table. 
 Feel free to make up your birth date and phone number. 
**********************************************************************************/


/*********************************************************************************
 Question 12
 Confirm your changes to the table. Order by customer_id. 
**********************************************************************************/



/*********************************************************************************
 Question 13
 ROLLBACK To the CUST_SAVEP SAVEPOINT. 
**********************************************************************************/



/*********************************************************************************
 Question 14
 List the table contents. Order by customer_id.
 (Hint: Use a SELECT statement.) ***/
**********************************************************************************/



/*********************************************************************************
 Question 15
 Now issue a general ROLLBACK command. 
**********************************************************************************/



/*********************************************************************************
 Question 16
 List the table contents. Order by customer_id.
**********************************************************************************/


/*********************************************************************************
 Question 17
 Re-insert the row from step 11 above, i.e. re-insert yourself 
**********************************************************************************/


/*********************************************************************************
 Question 18
 Now issue the COMMIT command.
**********************************************************************************/


/*********************************************************************************
 Question 19
 List the table contents. Order by customer_id 
**********************************************************************************/



/*********************************************************************************
 Question 20
 ROLLBACK to the CUST_SAVEP SAVEPOINT. Did anything happen?
 Enter a at least one statement (in the comment below) if not both, saying why
 you got the result you did from the "ROLLBACK to CUST_SAVEP" command. 
**********************************************************************************/
/*** 

Reason #1: 
           
Reason #2: 

***/


/*********************************************************************************
 Question 21
 Issue a SELECT statement which will list all the data records with the dates
 in the format as they were originally entered. For example, the date should be given
 as "December 9, 1906" (note the upper and lower case) and not as "9-DEC-06" or any 
 other default format. (Note: Don't worry if all the months, days and years do not 
 line up.) Use a SQL command to format the dates (hint: TO_CHAR and its format 
 specifications), NOT a SQL*Plus command. 
**********************************************************************************/




