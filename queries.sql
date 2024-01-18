
Find all the non-local orders by looking at the salesmen that generated orders for 
their customers but are located elsewhere unlike their customers, and fetch the 
details like order_no, name of the customer, customer_id, salesman_id.


-- Joins concept is reuired to solve this problem

			/* query to fetch the required result*/

	
SELECT 
	o.order_no, c.name, o.customer_id, s.id	-- required fields from tables
FROM 
	salesman s 				-- Inner Join & alliasing
	INNER JOIN customer c
	ON c.salesman_id = s.id
	INNER JOIN orders o
	ON o.customer_id = c.id 		-- Appropriate relations on common fields
WHERE 
	s.city != c.city			-- for non local orders
ORDER BY 
	order_no				-- sorting the orders

				
	--------------------------------------------------------
					

Find amount of incentive made by each employee


				/* query for employee incentive made */


SELECT 
	e.employee_id,
CASE 
	WHEN ((ROUND(e.emp_sale/i.sales_milestone))*i.incentive) < i.cap
	THEN ((ROUND(e.emp_sale/i.sales_milestone))*i.incentive)
	WHEN ((ROUND(e.emp_sale/i.sales_milestone))*i.incentive) > i.cap
	THEN i.cap
END incentive_made	-- use of CASE clause to categorise the incentive made 			
FROM 
	employee e INNER JOIN incentive_details i
	ON e.pos_id = i.p_id
ORDER BY 
	e.employee_id

	---------------------------------------------------------



Write an SQL Query to find subjects that contain the alphabet "b" and have papers 
written under the guidance of more female mentors than male mentors.


/* Query to fetch results for assigned task */

SELECT 
	p_subject
FROM
	(SELECT 
		m_gender, p_subject, COUNT(*)
	FROM
		mentors me INNER JOIN research_mentor rm  -- Inner join of tables
		ON me.m_id = rm.m_id
		INNER JOIN researchers r 
		ON r.r_id = rm.r_id
		INNER JOIN research_paper rp
		ON rp.r_id = r.r_id
		INNER JOIN papers p
		ON p.p_id = rp.p_id
	 WHERE 
	 	m_gender = 'F'		-- filter to get female mentors
	 AND 
	 	p_subject LIKE '%b%'	-- subject with b letter 
	GROUP BY m_gender, p_subject) a

/* research paper task by another query */
-- fetching the result by using windows function in the query

SELECT 
	p_subject
FROM
    (SELECT *, MAX(ct) OVER (PARTITION BY m_gender,P_subject) mc
    FROM
        (SELECT 
            m_gender, p_subject, COUNT(*) AS ct
        FROM
            mentors me INNER JOIN research_mentor rm  -- Inner join of tables
            ON me.m_id = rm.m_id
            INNER JOIN researchers r 
            ON r.r_id = rm.r_id
            INNER JOIN research_paper rp
            ON rp.r_id = r.r_id
            INNER JOIN papers p
            ON p.p_id = rp.p_id
        WHERE 
            p_subject LIKE '%b%'	-- subject with b letter 
        GROUP BY m_gender, p_subject) a
        ) b
    WHERE 
        m_gender = 'F'		-- filtering gender
    AND
        ct = mc		-- filtering the paper






								VARMA PRASAD S



			




