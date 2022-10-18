
# SQL for Analytics

## Table of contents
* [Overview](#overview)
* [Technical Aspect](#technical-aspect)
* [Customer Orders](#q1-problem-statement)
* [Employee Incentive](#q2-problem-statement)
* [Research Papers](#q3-problem-statement)
* [Author](#authors)

###  Overview

The powerful usage of SQL tool to fetch data from Database is demonstrated. 
There are three problem statements related to Customer orders, Employee incentives and 
research papers from an university.
---

## Technical Aspect
The project is devided into three parts:
1. creating tables and inserting data into Database
2. Understanding attributes, relationship between entities with the help of ER diagrams
3. Fetch data as per requirement for Analytical insights, the following sql syntax/functions used:
    * Aggregate Functions
    * Filters
    * Clauses
    * Sub Queries(nested,correlated)
    * Joins
    * Window Functions
---
    
## Q1 Problem statement
Find all the non-local orders by looking at the salesmen that generated orders for their
customers but are located elsewhere unlike their customers, and fetch the details like
order_no, name of the customer, customer_id, salesman_id.


## Input data of Q1

![Q1_input](https://github.com/varma-prasad/SQL-for-Analytics/blob/91cf84430b9886d607b52cc3dad0337fc77dbebe/images/1_input.png)

## Query for Q1
```

SELECT 
	o.order_no, c.name, o.customer_id, s.id 		-- required fields from tables
FROM 
	salesman s 						-- Inner Join & alliasing
	INNER JOIN customer c
	  ON c.salesman_id = s.id
	INNER JOIN orders o
 	  ON o.customer_id = c.id 				-- Appropriate relations on common fields
WHERE 
	s.city != c.city 					-- for non local orders
ORDER BY 
	order_no 						-- sorting the orders
```

## output data of Q1

![Q1_Output](https://github.com/varma-prasad/SQL-for-Analytics/blob/931b64d5bf7da53843f712e8919ca09cfbfedfdc/images/q1_output.png)

----

## Q2 Problem statement
A food store is planning to give incentive to it's employees based on their monthly performance
in sales.Incentive is different for each position and each position have it's max limit for incentive.
Sales target to avail the incentive is a milestone.
Employee makes incentive everytime he completes a milestone of sales.
Milestone is different for each position.
You are given the data for a month in the database store_data.
***Task***:
Find amount of incentive made by each employee.

## Input data of Q2

![Q2_input](https://github.com/varma-prasad/SQL-for-Analytics/blob/6863e80be7e4e2be5775f5ad8baf3441fda0b10f/images/2_input.png)

## Query for Q2
```
SELECT 
	e.employee_id,
CASE 
	WHEN ((ROUND(e.emp_sale/i.sales_milestone))*i.incentive) < i.cap
	THEN ((ROUND(e.emp_sale/i.sales_milestone))*i.incentive)
	WHEN ((ROUND(e.emp_sale/i.sales_milestone))*i.incentive) > i.cap
	THEN i.cap
END incentive_made 						-- use of CASE clause to categorise the incentive made 
FROM 
	employee e INNER JOIN incentive_details i
	  ON e.pos_id = i.p_id
ORDER BY 
	e.employee_id						-- sorting the orders
```

## output data of Q2

![Q2_Output](https://github.com/varma-prasad/SQL-for-Analytics/blob/6863e80be7e4e2be5775f5ad8baf3441fda0b10f/images/q2_output.png)

----
## Q3 Problem statement
There are research institutes with Researchers who have written papers under the guidance of
their mentors. You are given a database named ResearchInstitute for one such Institution.


## Input data of Q3

![Q3_input](https://github.com/varma-prasad/SQL-for-Analytics/blob/82ae635a303feb8632ff19946c306dd6ad2ace66/images/3_input.png)

## Query for Q3
```
SELECT 
	p_subject
FROM
 	(SELECT *, MAX(ct) OVER (PARTITION BY m_gender,P_subject) mc
 	FROM
 		(SELECT 
 			m_gender, p_subject, COUNT(*) AS ct
		 FROM
 			mentors me INNER JOIN research_mentor rm 	-- Inner join of tables
 			  ON me.m_id = rm.m_id
 			INNER JOIN researchers r 
 			  ON r.r_id = rm.r_id
 			INNER JOIN research_paper rp
 			  ON rp.r_id = r.r_id
 			INNER JOIN papers p
 			  ON p.p_id = rp.p_id
 		WHERE 
 			p_subject LIKE '%b%' 				-- subject with b letter 
 		GROUP BY m_gender, p_subject) a
 		) b
 WHERE 
 	m_gender = 'F' 							-- filtering gender
 AND
 	ct = mc 							-- filtering the max paper written under female mentor
```

## output data of Q3

![Q3_Output](https://github.com/varma-prasad/SQL-for-Analytics/blob/82ae635a303feb8632ff19946c306dd6ad2ace66/images/q3_output.png)

----

## 🛠 Tools used
![](https://img.shields.io/badge/postgresql-v14.5-blue)

## Authors

- [Varma Prasad S](https://github.com/varma-prasad)

## 🔗 Links

[![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/varma-prasad-s/)





