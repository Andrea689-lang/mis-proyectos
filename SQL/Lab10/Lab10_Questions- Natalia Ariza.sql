/*********************************************************************************

 Assignment - Lab 10 - Views, Security & Normalization

 **********************************************************************************/

 
/*********************************************************************************
 Question 1
 
 Create a table called EMPLOYEES_NEW using select as from the HR.EMPLOYEES table. 


**********************************************************************************/
CREATE TABLE EMPLOYEES_NEW
AS (SELECT * FROM HR.EMPLOYEES);


/*********************************************************************************
 Question 2
 
Create a view called EMPLOYEES_VW based on the employee numbers, employee names, 
and department numbers from your EMPLOYEES_NEW table. The employee name should 
be a single column made up of the first name and last name with a space in between
(e.g Steven King). Change the heading for the employee name to EMPNAME. 

**********************************************************************************/
CREATE VIEW EMPLOYEES_VW AS
SELECT
employee_id,
first_name || ' ' || last_name AS EMPNAME,
department_id
FROM EMPLOYEES_NEW;
/*********************************************************************************
 Question 3

Display the employees who work in department 90 from the EMPLOYEES_VW view.
 
**********************************************************************************/
SELECT *
	FROM EMPLOYEES_VW
WHERE department_id = 90;
 

/*********************************************************************************
 Question 4
  
Select the view name and text from the USER_VIEWS data dictionary view 
for your new EMPLOYEES_VW only. 
  
**********************************************************************************/
SELECT view_name,
	   text
FROM USER_VIEWS
WHERE view_name = 'EMPLOYEES_VW';


/*********************************************************************************
 Question 5
 
Grant select on your EMPLOYEES_VW view to ICS120.

**********************************************************************************/
GRANT SELECT ON EMPLOYEES_VW TO ICS120


/*********************************************************************************
 Question 6 
 
Create a view, based on the original EMPLOYEES_NEW table, named DEPT50_VW that 
contains the employee numbers, employee last names, and department numbers for 
all employees in department 50. Label the view columns EMPNO, EMPLOYEE, and DEPTNO. 
Do not allow an employee to be reassigned to another department through the view. 
(Note: Do NOT use the READ ONLY constraint to enforce this.). 

**********************************************************************************/
CREATE VIEW DEPT50_VW AS
SELECT
employee_id AS EMPNO,
last_name AS employee,
department_id AS DEPTNO
FROM EMPLOYEES_NEW
WHERE department_id = 50
WITH CHECK OPTION;

/*********************************************************************************
 Question 7 
 
Display the structure (e.g. DESC...) and contents (e.g. SELECT * ...) of the 
DEPT50_VW view. List only the first 10 rows when displaying the content. 
(Hint: Use "rownum <= 10".). 
   
**********************************************************************************/
DESC DEPT50_VW;
SELECT *
FROM DEPT50_VW
WHERE ROWNUM <= 10;


/*********************************************************************************
 Question 8  
 
Using the DEPT50_VW, attempt to reassign the employee with a last name of Weiss to 
department 80. Do not update the EMPLOYEES_NEW table.  (If you accidentally do 
update the EMPLOYEES_NEW table, you will need to delete the new record for Matos - 
employee_ID 143 in the JOB_HISTORY table before continuing this lab.).  
 
**********************************************************************************/
UPDATE DEPT50_VW
SET DEPTNO = 80
WHERE employee = 'Weiss';


/*********************************************************************************
 Question 9
 
You will get an error when you do this. Why?     
 
 **********************************************************************************/
/*The DEPT50_VW view does not meet these conditions, the UPDATE statement will fail
with an error indicating that the view is not updatable*/


/*********************************************************************************
 Question 10
 
Grant public full access to the DEPT50_VW view. 
 
**********************************************************************************/
GRANT SELECT, UPDATE, INSERT, DELETE ON DEPT50_VW TO PUBLIC;


/*********************************************************************************
 Question 11
 
Select the view name and text from the USER_VIEWS data dictionary view to show the 
two views you created. 
 
**********************************************************************************/
SELECT view_name,
	   text
FROM USER_VIEWS
WHERE view_name = 'DEPT50_VW' OR view_name = 'EMPLOYEES_VW';



/*********************************************************************************
 Question 12
 
Using the USER_TAB_PRIVS_MADE show the privileges that you have made on the 
EMPLOYEES_VW view and the DEPT50_VW view. 

 
**********************************************************************************/
DESC USER_TAB_PRIVS_MADE;
SELECT * FROM USER_TAB_PRIVS_MADE;


/*********************************************************************************
 Question 13
 
Revoke all the privileges on the EMPLOYEES_VW view and the DEPT50_VW view. 
 
**********************************************************************************/
REVOKE DELETE, INSERT, SELECT, UPDATE ON DEPT50_VW FROM PUBLIC;
REVOKE SELECT ON EMPLOYEES_VW FROM ICS120;


/*********************************************************************************
 Question 14
 
Using the USER_TAB_PRIVS_MADE show that the privileges have been revoked on the 
EMPLOYEES_VW view and the DEPT50_VW view.
 
**********************************************************************************/
SELECT * FROM USER_TAB_PRIVS_MADE;




/*********************************************************************************
 Question 15
 
Drop all the views you created. 
 
**********************************************************************************/
DROP VIEW DEPT50_VW;
DROP VIEW EMPLOYEES_VW;