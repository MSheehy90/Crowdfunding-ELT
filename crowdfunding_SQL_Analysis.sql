-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT cf_id, SUM (backers_count)
INTO backer_count_cf_id
FROM campaign
WHERE outcome = 'live'
GROUP BY cf_id
ORDER BY SUM DESC;

-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.

SELECT * FROM backer_count_cf_id, 

-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 

SELECT 
	first_name,
	last_name,
	email,
	SUM(goal) - SUM(pledged) AS "Remaining"
INTO amount_left_by_contact 
FROM campaign as ca
RIGHT JOIN contacts as co
ON co.contact_id = ca.contact_id
WHERE outcome = 'live'
GROUP BY first_name,
	last_name,
	email
ORDER BY "Remaining" DESC;

-- Check the table
SELECT * FROM amount_left_by_contact

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 

SELECT 
	b.email,
	b.first_name,
	b.last_name,
	b.cf_id,
	ca.company_name,
	ca.description,
	ca.end_date,
	SUM(ca.goal) - SUM(ca.pledged) AS "Left of Goal"
INTO email_backers_remaining_goal_amount
FROM campaign as ca
RIGHT JOIN backers as b
ON b.cf_id = ca.cf_id
WHERE outcome = 'live'
GROUP BY b.email,
	b.first_name,
	b.last_name,
	b.cf_id,
	ca.company_name,
	ca.description,
	ca.end_date
ORDER BY "email" DESC;


-- Check the table

SELECT * FROM email_backers_remaining_goal_amount
