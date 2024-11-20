/** Natalia Ariza_Lab01**/

DESC user_catalog

SELECT 
	table_name,
	table_type 
FROM user_catalog;


DESC user_constraints

SELECT owner,
	constraint_name,
	constraint_type, 
	table_name 
FROM user_constraints;


DESC user_cons_columns

SELECT owner, 
	constraint_name, 
	table_name, 
	column_name 
FROM user_cons_columns;


DESC user_indexes

SELECT index_name,
	   index_type, 
	   table_owner, 
	   table_name 
FROM user_indexes;


DESC user_ind_columns

SELECT index_name, 
       table_name, 
	   column_name, 
	   column_position 
FROM user_ind_columns;


DESC user_synonyms

SELECT synonym_name, 
	   table_owner, 
	   table_name, 
	   db_link 
FROM user_synonyms;


DESC user_tab_columns

SELECT table_name, 
	   column_name, 
	   data_type, 
	   data_type_mod 
FROM user_tab_columns;


DESC user_col_comments

SELECT table_name, 
       column_name, 
	   comments 
FROM user_col_comments;


DESC user_views

SELECT view_name, 
       text_length, 
	   text, 
	   type_text_length 
FROM user_views;


SELECT * FROM regions;
SELECT * FROM locations;
SELECT * FROM departments;
SELECT * FROM jobs;
SELECT * FROM employees;
SELECT * FROM job_history;
SELECT * FROM countries;