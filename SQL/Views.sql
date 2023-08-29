---For creating View named business_op_detail with Columns- 
---accounts(id, name, primary_poc, sales_rep_id), sales_reps(sales_rep_name)*/ 

CREATE VIEW business_op_detail AS
 SELECT ac.id,
    ac.name,
    ac.website,
    ac.primary_poc,
    ac.sales_rep_id,
    sa.name AS sales_rep_name
   FROM accounts ac
     LEFT JOIN sales_reps sa ON ac.sales_rep_id = sa.id;