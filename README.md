
# SQL for Analytics


##  Overview

The powerful usage of SQL tool to fetch data from Database is demonstrated. 
There are three problem statements related to Customer orders, Employee incentives and 
research papers from an university.

## Technical Aspect
The process devided into three parts:
1. creating tables and inserting data into Database
2. Understanding attributes, relationship between entities with the help of ER diagrams
3. Fetch data as per requirement for Analytical insights, the following sql syntax/functions used:
    * sub queries, aggregate functions, window functions, Joins, filtering etc
---
    
## Problem statement 1 (Q1)
Find all the non-local orders by looking at the salesmen that generated orders for their
customers but are located elsewhere unlike their customers, and fetch the details like
order_no, name of the customer, customer_id, salesman_id.


## Input data of Q1

![Q1_input](https://github.com/varma-prasad/SQL-for-Analytics/blob/91cf84430b9886d607b52cc3dad0337fc77dbebe/images/1_input.png)

## Query for Q1
```

SELECT 
	o.order_no, c.name, o.customer_id, s.id 	-- required fields from tables
FROM 
	salesman s 									-- Inner Join & alliasing
	INNER JOIN customer c
	  ON c.salesman_id = s.id
	INNER JOIN orders o
 	  ON o.customer_id = c.id 					-- Appropriate relations on common fields
WHERE 
	s.city != c.city 							-- for non local orders
ORDER BY 
	order_no 									-- sorting the orders
```

## output data of Q1

![Q1_Output](https://github.com/varma-prasad/SQL-for-Analytics/blob/931b64d5bf7da53843f712e8919ca09cfbfedfdc/images/q1_output.png)

----

## Problem statement 1 (Q1)
Find all the non-local orders by looking at the salesmen that generated orders for their
customers but are located elsewhere unlike their customers, and fetch the details like
order_no, name of the customer, customer_id, salesman_id.
