-- MUSIC DATA STORE ANALYSIS USING MYSQL. 
-- PART 1
# Question 1
# Who is the senior most employee based on job title?
select first_name , last_name , levels from employee
order by levels desc
limit 1

# Question 2
# Which countries have the most Invoices?
select billing_country , count(*) as count from invoice
group by billing_country
order by count desc

# Question 3
# What are top 3 values of total invoice?
select * from invoice
order by total desc
limit 3

# Question 4
# What are top 3 customers  of total invoice?
select c.first_name , c.last_name , i.total from invoice i 
join customer c
on i.customer_id = c.customer_id
order by total desc
limit 3

# Question 5
/* Which top 5 cities has the best customers? We would like to throw a promotional Music
Festival in the city we made the most money. Write a query that returns one city that
has the highest sum of invoice totals. Return both the city name & sum of all invoice
totals*/
select billing_city , round(sum(total),2) as inv_total from invoice
group by billing_city
order by inv_total desc
limit 5

# Question 6
/* Who are the top 3 best customer? The customer who has spent the most money will be
declared the best customer. Write a query that returns the person who has spent the
most money */
select c.customer_id , c.first_name , c.last_name , round(sum(i.total),2) as total_inv from invoice i 
join customer c
on i.customer_id = c.customer_id
group by c.customer_id
order by total_inv desc
limit 3






