/*********************************************************************************

Assignment - Lab 3 Multiple Table Queries

**********************************************************************************/

set pagesize 40
set linesize 120


/*********************************************************************************
 Question 1A, 1B, 1C
 Use the tables in your schema.
 For each country in Asia, display the country name and the region name. 
 Sort the results by country name in ascendening sequence.
 Give the answer in the requested SQL verisons using the requested keywords.
 Write the query in SQL/86 and SQL/92.
 Note: Do NOT use the code for Asia in your search, look for the string 'Asia'
**********************************************************************************/
-- 1A -- SQL/86
SELECT country_name, 
       region_name
FROM countries c, regions r
WHERE c.region_id = r.region_id AND r.region_name = 'Asia'
ORDER BY c.country_name ASC;

-- 1B -- SQL/92 using "ON"
SELECT country_name,
	   region_name
FROM countries c INNER JOIN regions r ON c.region_id = r.region_id
WHERE region_name = 'Asia'
ORDER BY c.country_name ASC;

-- 1C -- SQL/92 using "USING"
SELECT country_name, 
       region_name
FROM countries c INNER JOIN regions r USING(region_id)
WHERE region_name = 'Asia'
ORDER BY c.country_name ASC;

/*********************************************************************************
 Question 2A, 2B
 Use the tables in your schema.
 Write a query to display the last name, job title, department id, and 
 department name for all employees who work in Southlake. 
 Sort the results by last name in ascending sequence.
**********************************************************************************/
-- 2A --  SQL/86
SELECT e.last_name, 
       j.job_title, 
	   d.department_id, 
	   d.department_name
FROM employees e,
	 jobs j,
     departments d,
	 locations l
WHERE (e.job_id = j.job_id)
AND (e.department_id = d.department_id)
AND (d.location_id = l.location_id)
AND (l.city = 'Southlake')
ORDER BY e.last_name ASC;

-- 2B -- SQL/92
SElECT e.last_name, 
       j.job_title, 
	   d.department_id, 
	   d.department_name
FROM employees e
INNER JOIN jobs j ON e.job_id = j.job_id
INNER JOIN departments d ON e.department_id = d.department_id
INNER JOIN locations l ON d.location_id = l.location_id
AND l.city = 'Southlake'
ORDER BY e.last_name ASC;


/*********************************************************************************
 Question 3A, 3B 
 Use the tables in your schema.
 Write a query that will list all of the employees (last names), whose last name
 starts with 'G', and the departments (give the name of the department) to which 
 they belong. Include all employees who have not yet been assigned to any department. 
 If an employee does not belong to a department, use the string "unassigned" for 
 the department name.
 Sort the results by last name in ascending sequence.
 Use the terms "Last Name" and "Department" for the column headings.
 Write the query in SQL/86 and SQL/92.
 Note: do not use IS NULL or IS NOT NULL in your query. 
**********************************************************************************/
-- 3A -- SQL/86
SELECT e.last_name AS "Last Name",
       NVL (d.department_name, 'unassigned')
FROM employees e, 
     departments d
WHERE e.department_id = d.department_id (+)
AND e.last_name LIKE 'G%'
ORDER BY e.last_name ASC;

-- 3B -- SQL/92
SELECT e.last_name AS "Last Name",
      NVL(d.department_name, 'unassigned') AS "Department"
FROM employees e
LEFT OUTER JOIN departments d ON e.department_id = d.department_id
WHERE e.last_name LIKE 'G%'
ORDER BY e.last_name ASC;


/*********************************************************************************
 Question 4A, 4B  
 Use the tables in your schema.
 Display the employee last name and employee id along with their manager's last 
 name and manager number (in other words the manager's employee id) for all 
 employees whose last name begins with 'T'. 
 Label the columns Employee, Emp#, Manager, and Mgr#, respectively (note the use of upper and lower 
 case). 
 Sort the results by employee last name in descending sequence.
 Write the query in SQL/86 and SQL/92.
**********************************************************************************/

-- 4A -- SQL/86
SELECT e.last_name AS "Employee", 
       e.employee_id AS "Emp#", 
	   m.last_name AS "Manager", 
	   m.employee_id AS "Mgr#"
FROM employees e, employees m
WHERE e.last_name LIKE 'T%'
AND e.manager_id = m.employee_id
ORDER BY e.last_name DESC;

-- 4B -- SQL/92

SELECT e.last_name AS "Employee", 
       e.employee_id AS "Emp#", 
	   m.last_name AS "Manager", 
	   m.employee_id AS "Mgr#"
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
WHERE e.last_name LIKE 'T%'
ORDER BY e.last_name DESC;


/*********************************************************************************
 Question 5A, 5B 
 Use the tables in your schema.
 Display the region, the employee first and last name (separated by a space) in a 
 column titled "Employee Name", and the employee's salary.  Only include employees 
 with a salary between 9000 and 10000 (inclusive).
 Sort the report by ascending region name, and then by descending salary.
 Make it so region names are not repeated (ie: suppress duplicate values - if the 
 region name of a row matches the region name of the row above it - don't show the
 region name).  Hint: you will need to us "BREAK ON". After a grouping of employees
 within a region, add in a blank line by  using "SKIP 1" at the end of the break
 on clause.
 Be sure to clear breaks after your query so it does not affect other queries.
 Write the query in SQL/86 and SQL/92.
 Note: Remember to join all the tables that are required to connect the employee 
       table to the region table.
**********************************************************************************/
-- 5A -- SQL/86
BREAK ON "Region" SKIP 1;
SELECT r.region_name AS "Region",
       e.first_name || ' ' || e.last_name AS "Enployee Name",
	   e.salary AS "Salary"
FROM employees e, 
     departments d, 
	 locations l, 
	 countries  C,
	 regions  r
WHERE e.department_id = d.department_id AND
	  d.location_id = l.location_id AND
      l.country_id = c.country_id AND
      c.region_id = r.region_id AND
      e.salary BETWEEN 9000 AND 10000
ORDER BY r.region_name ASC, e.salary DESC;

CLEAR BREAKS;

-- 5B -- SQL/92
BREAK ON "Region" SKIP 1;
SELECT r.region_name AS "Region",
       e.first_name || ' ' || e.last_name AS "Enployee Name",
	   e.salary AS "Salary"
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
INNER JOIN locations l ON d.location_id =l.location_id
INNER JOIN countries c ON l.country_id = c.country_id
INNER JOIN regions r ON c.region_id = r.region_id 
WHERE e.salary BETWEEN 9000 AND 10000
ORDER BY r.region_name ASC, 
         e.salary DESC;

CLEAR BREAKS;

/*********************************************************************************
 Question 6 
 Use the tables in your schema.
 Create a report showing:
   First name, last name, and salary of all of the employees who make over $11,000.
   Use a column command to format the salary to have a heading of "Emp Salary",
   and left justify it.  Put the salaries into a currency format: $9,999,999.99
   Sort the report by salary in descending sequence.
   Turn the TTITLE and BTITLE off after the query and clear the salary column so
   that it doesn't affect other queries.
Create the following header for the report:
   left-justified: 'Run date: ' use _DATE command
   centered: Show the user who ran the query as 'Run by: ' SQL.USER
   right-justified: Put Page number on the right as 'Page: ' SQL.PNO
Create the following footer for the report:
   centered: 'End of Report'
**********************************************************************************/
COLUMN salary FORMAT $9,999,999.99 HEADING 'Emp Salary' justify left
TTITLE left 'Run date: ' _DATE center 'Run by: ' SQL.USER right 'Page: ' SQL.PNO
BTITLE center 'End of Report'

SELECT first_name, last_name, salary
FROM employees
WHERE salary > 11000
ORDER BY salary DESC;

TTITLE OFF
BTITLE OFF 

CLEAR COLUMNS;


/*********************************************************************************
 Question 7A, 7B
 Use the tables in your schema.
 List the the employees (last name, job name, department name, salary) who make
 more than X dollars.  Make it so that the user running the script is prompted 
 to enter the X amount for salary. 
 Sort the results by salary in descending sequence. 
 Test it with a salary of 4000.
 Write the query in SQL/86 and SQL/92.
**********************************************************************************/
-- 7A -- SQL/86
SELECT e.last_name, 
	   j.job_title, 
	   d.department_name, 
	   e.salary
FROM jobs j, 
	 employees e, 
	 departments d
WHERE j.job_id = e.job_id
AND e.department_id = d.department_id
AND e.salary > &salary
ORDER BY e.salary DESC;

-- 7B -- SQL/92
SELECT e.last_name, 
	   j.job_title, 
	   d.department_name, 
	   e.salary
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
JOIN departments d ON e.department_id = d.department_id
WHERE e.salary > &salary
ORDER BY e.salary DESC;


