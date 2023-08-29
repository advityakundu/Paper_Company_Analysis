-----------------------------------------------------------------------
--account with maximum total orders
SELECT a.id AS account_id, 
		b.name AS account_name, 
		SUM(o.standard_qty) AS max_total_qty
FROM orders o
JOIN accounts a ON a.id = o.account_id
JOIN accounts b ON b.name = a.name
WHERE o.standard_qty > 0
GROUP BY 1, 2
ORDER BY 3 DESC
LIMIT 1;
-------------------------------------------------------------------------
------What are the top and least channel of contact for Core-Mark Holding in web events?
SELECT accounts.name, 
		web_events.channel, 
		COUNT(*) AS total_occurance
FROM accounts
JOIN web_events ON accounts.id = web_events.account_id
WHERE accounts.name LIKE '%Core-Mark Holding%'
GROUP BY accounts.name, web_events.channel
ORDER BY total_occurance DESC;
--------------------------------------------------------------------------
--the name of the sales_rep in each region with the largest amount of total_amt_usd sales.*
WITH tbl1_region_salesrep_with_total_sales AS
	(SELECT r.id AS region_id,
	 		r.name AS region_name,
	 		sr.id AS sales_rep_id, 
	 		sr.name AS sales_rep_name, 
			SUM(o.total_amt_usd) AS total_sales_per_rep
		FROM orders o
		JOIN accounts a ON a.id = o.account_id
		JOIN sales_reps sr ON sr.id = a.sales_rep_id
		JOIN region r ON r.id = sr.region_id
		GROUP BY 1,2,3,4
		ORDER BY 2,3),
		
	tbl2_region_with_max_sales AS 
		(SELECT tbl1_region_salesrep_with_total_sales.region_id,
		 		MAX(total_sales_per_rep) AS max_sales
			FROM tbl1_region_salesrep_with_total_sales
			GROUP BY 1) 
		
		
SELECT region_name,
	sales_rep_name,
	total_sales_per_rep AS largest_amount_of_sales
FROM tbl1_region_salesrep_with_total_sales
JOIN tbl2_region_with_max_sales
ON tbl1_region_salesrep_with_total_sales.region_id = tbl2_region_with_max_sales.region_id
	AND tbl1_region_salesrep_with_total_sales.total_sales_per_rep = tbl2_region_with_max_sales.max_sales
ORDER BY 3 DESC;

