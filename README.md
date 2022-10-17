
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

![Q1_output](https://github.com/varma-prasad/SQL-for-Analytics/blob/931b64d5bf7da53843f712e8919ca09cfbfedfdc/images/q1_output.png)
