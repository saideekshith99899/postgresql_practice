select version();
SELECT VERSION();
SELECT 4 * 20;
SELECT 5+39-2;
SELECT * FROM movies;
DROP TABLE students;

INSERT INTO movies (movie_id,movie_name,movie_genre,imdb_ratings) 
VALUES
(101,'bahubali','history',10),
(102,'saaho','action',9),
(103,'radheshyam','love',8),
(104,'adipurush','ithihas',7),
(105,'kalki','sci-fi',10),
(106,'spirit','action,drama',10),
(107,'fauji','history','6'),
(108,'rajasaab','horror','9');


SELECT * FROM movies;


UPDATE movies
SET movie_genre = 'Romance'
WHERE movie_id = 103;


DELETE FROM movies
WHERE movie_id = 104;


SELECT * FROM movies
WHERE imdb_ratings > 9;

SELECT * FROM movies 
WHERE imdb_ratings <7;

SELECT * FROM movies
WHERE imdb_ratings between 7 AND 10;

SELECT * FROM movies 
WHERE movie_genre = 'sci-fi';

SELECT movie_genre,movie_id FROM movies
WHERE movie_id = 105;

SELECT * FROM movies;



CREATE TABLE employees(

emp_id INT NOT NULL PRIMARY KEY,
emp_name VARCHAR(20),
email VARCHAR(20),
gender VARCHAR(30),
department VARCHAR(20),
address VARCHAR(20),
salary REAL
);

SELECT * FROM employees;




INSERT INTO employees (emp_id, emp_name, email, gender, department, address, salary) 
VALUES
(1, 'Arjun', 'arjun1@ex.com', 'M', 'bus', 'USA', 50000),
(2, 'Vikram', 'vikram2@ex.com', 'M', 'bus', 'Can', 60000),
(3, 'Sita', 'sita3@ex.com', 'F', 'bus', 'Aus', 70000),
(4, 'Ravi', 'ravi4@ex.com', 'M', 'bus', 'UK', 80000),
(5, 'Meena', 'meena5@ex.com', 'F', 'bus', 'Ind', 90000),
(6, 'Suresh', 'suresh6@ex.com', 'M', 'bus', 'Ger', 55000),
(7, 'Anita', 'anita7@ex.com', 'F', 'bus', 'Fra', 65000),
(8, 'Kiran', 'kiran8@ex.com', 'M', 'bus', 'Ita', 75000),
(9, 'Raj', 'raj9@ex.com', 'M', 'bus', 'Spa', 85000),
(10, 'Nina', 'nina10@ex.com', 'F', 'bus', 'Bra', 95000),
(11, 'Amit', 'amit11@ex.com', 'M', 'bus', 'Jap', 56000),
(12, 'Neha', 'neha12@ex.com', 'F', 'bus', 'Chi', 67000),
(13, 'Prakash', 'prakash13@ex.com', 'M', 'bus', 'SK', 78000),
(14, 'Pooja', 'pooja14@ex.com', 'F', 'bus', 'Sin', 89000),
(15, 'Manoj', 'manoj15@ex.com', 'M', 'bus', 'Mal', 60000),
(16, 'Rita', 'rita16@ex.com', 'F', 'bus', 'Indo', 71000),
(17, 'Kumar', 'kumar17@ex.com', 'M', 'bus', 'Thai', 82000),
(18, 'Sonia', 'sonia18@ex.com', 'F', 'bus', 'Phi', 93000),
(19, 'Gaurav', 'gaurav19@ex.com', 'M', 'bus', 'Viet', 54000),
(20, 'Priya', 'priya20@ex.com', 'F', 'bus', 'Pak', 65000),
(21, 'Deepak', 'deepak21@ex.com', 'M', 'bus', 'Nep', 76000),
(22, 'Maya', 'maya22@ex.com', 'F', 'bus', 'Sri', 87000),
(23, 'Ajay', 'ajay23@ex.com', 'M', 'bus', 'Ban', 98000),
(24, 'Gita', 'gita24@ex.com', 'F', 'bus', 'Myan', 59000),
(25, 'Suraj', 'suraj25@ex.com', 'M', 'bus', 'Cam', 70000),
(26, 'Lata', 'lata26@ex.com', 'F', 'bus', 'Lao', 81000);



SELECT address FROM employees;

SELECT COUNT(DISTINCT  address) FROM employees;

SELECT * FROM employees
WHERE email is null;


SELECT * FROM employees
ORDER BY salary desc;

SELECT * FROM employees
ORDER BY salary;


ALTER TABLE employees 
RENAME column address to country;

SELECT * FROM employees
WHERE country = 'Ger' and salary > 800;

SELECT * FROM employees
WHERE country = 'Ind' or salary > 60000 LIMIT 10;

SELECT * FROM employees
WHERE country = 'Ind' or salary > 60000 LIMIT 5 OFFSET 3;

SELECT emp_name ,email from employees 
WHERE emp_name like 'A%';

SELECT emp_name ,email from employees 
WHERE emp_name like '%A';

SELECT emp_name ,email from employees 
WHERE emp_name like '%a';

SELECT emp_name ,email from employees 
WHERE emp_name like 'S%';

SELECT emp_name ,email from employees 
WHERE emp_name like '%h';

SELECT emp_name ,email from employees 
WHERE emp_name like '%ish%';


SELECT emp_name ,email from employees 
WHERE emp_name like '%o%';


SELECT emp_name ,email from employees 
WHERE emp_name like '_u%';            -- second letter contains 'u'


SELECT SUM(salary) as total_salary 
from employees;

SELECT AVG(salary) as mean_salary
from employees;

SELECT MAX(salary) as Maximum
from employees;


SELECT MIN(salary) as minimum
from employees;

SELECT count(DISTINCT department) as total_dept from employees;


SELECT department from employees;


SELECT DISTINCT department FROM employees;


SELECT country , AVG(salary) as average_salary
FROM employees  
WHERE salary > 60000
GROUP BY country ORDER BY country;


SELECT gender, MAX(salary) as max_salary
FROM employees
GROUP BY gender
ORDER BY max_salary;


SELECT country, COUNT(emp_id) 
FROM employees
GROUP BY country;


SELECT country, AVG(salary) as avg_salary
FROM employees
WHERE salary > 80000
GROUP  BY country
ORDER BY avg_salary;

SELECT country, AVG(salary) as avg_salary
FROM employees
GROUP  BY country
HAVING AVG(salary) > 80000
ORDER BY avg_salary;


SELECT country, COUNT(emp_id) as count_id
FROM employees
GROUP BY country
HAVING  COUNT(emp_id)< 10;


-- case expression in postgresql

SELECT department, country, salary,
CASE
WHEN salary > 45000 AND salary < 55000
THEN 'low salary'
WHEN salary > 55000 AND salary <80000
THEN 'medium salary'
WHEN salary > 80000 AND salary < 100000
THEN 'high salary'
END AS salary_range
FROM employees
ORDER BY salary DESC;


SELECT emp_name , department, country, salary 
FROM employees WHERE salary > 80000;




SELECT emp_name , department, country, salary 
FROM employees WHERE salary > (SELECT AVG(salary) FROM employees);


/* sql functions */
-- sql functions  this is a comment section represent in the postgresql 


SELECT abs(-100)  /* this is the inbuilt command in the sql */

SELECT GREATEST(2,3,4,5);  /* to find the largest number */

SELECT MOD(45,21);

SELECT SQRT(10);

SELECT POWER(10,3)

SELECT SIN(0) ;

SELECT CEIL(10.1);

SELECT FLOOR(10.88);


-- string functions

SELECT CHAR_LENGTH('india is a democracy');

SELECT CHAR_LENGTH('hello ');

SELECT CONCAT('sql ', 'is ', 'fun');

SELECT LEFT('hi i am deekshit', 10);


SELECT RIGHT ('hi i am deekshith',10);


SELECT REPEAT('indian ',10);


-- user defined function 

CREATE OR REPLACE FUNCTION 
COUNT_emails()
returns integer as $total_emails$
declare 
	total_emails integer;
begin
SELECT count(email) into total_emails
from employees;
return total_emails;
end
$total_emails$ language plpgsql;



SELECT COUNT_emails();



SELECT * FROM employees;
