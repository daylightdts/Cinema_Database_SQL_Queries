-- Underwriter Requests


/* 
Question 1
We will need a list of all staff members, including their first and last names,
email addresses, the store identification number in which they work?
*/

select 
	first_name,
	last_name,
	email,
	store_id
from 
	staff;




/*
Question 2
We will need separate counts of inventory items held at each of your two stores. 
*/ 

select 
	store_id,
	count(inventory_id) as total_inventory_per_store
from 
	inventory
group by 
	store_id;


/*
Question 3	
We will need a count of active customers for each of your stores. Separately, please. 
*/

select
	store_id,
	count(customer_id) as active_customers_per_store
from 
	customer
where 
	active = 1
group by
	store_id;



/*
Question 4
In order to assess the liability of a data breach, we will need you to provide a count 
of all customer email addresses stored in the database. 
*/

select 
	count(email) as total_emails 
from
	customer;


/*
Question 5
We are interested in how diverse your film offering is as a means of understanding how likely 
you are to keep customers engaged in the future. Please provide a count of unique film titles 
you have in inventory at each store and then provide a count of the unique categories of films you provide. 
*/

select
	store_id,
	count(distinct film_id) as unique_films
from 
	inventory
group by 
	store_id;


-- second query

select distinct 
	count(category_id) as unique_category
from
	category;


/*
Question 6
We would like to understand the replacement cost of your films. 
Please provide the replacement cost for the film that is least expensive to replace, 
the most expensive to replace, and the average of all films you carry. ``	
*/

select
	min(replacement_cost) as least_expensive_to_replace,
	avg(replacement_cost) as average_cost_of_replacemet,
	max(replacement_cost) as most_expensive_to_replace

from
	film;




/*
Question 7
We are interested in having you put payment monitoring systems and maximum payment 
processing restrictions in place in order to minimize the future risk of fraud by your staff. 
Please provide the average payment you processed, as well as the maximum payment you have processed.
*/
    
select 
	avg(amount) as average_payment,
	max(amount) as max_payment
    
from
	payment;



/*
Question 8
We would like to better understand what your customer base looks like. 
Please provide a list of all customer identification values, with a count of rentals 
they have made at all-time, with your highest volume customers at the top of the list.
*/

select distinct
	customer_id,
	count(rental_id) as no_of_rentals
from 
	rental
group by 
	customer_id
order by 
	count(rental_id) desc;
