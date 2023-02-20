-- MUSIC DATA STORE ANALYSIS USING MYSQL. 
-- PART 2
# Question 1
 /* Write query to return the email, first name, last name, & Genre of all Rock Music
listeners. Return your list ordered alphabetically by email starting with A */
with cte1 as(
SELECT DISTINCT c.email AS Email,c.first_name AS FirstName, c.last_name AS LastName, g.name AS Name
FROM customer c
JOIN invoice i 
ON i.customer_id = c.customer_id
JOIN invoice_line il 
ON il.invoice_id = i.invoice_id
JOIN track t ON 
t.track_id = il.track_id
JOIN genre g 
ON g.genre_id = t.genre_id)
select * from cte1 where name LIKE 'Rock'
ORDER BY email;

# Question 2
/* Let's invite the artists who have written the most rock music in our dataset. Write a
query that returns the Artist name and total track count of the top 10 rock bands */
SELECT artist.artist_id, artist.name,COUNT(artist.artist_id) AS number_of_songs
FROM track
JOIN album ON album.album_id = track.album_id
JOIN artist ON artist.artist_id = album.artist_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name LIKE 'Rock'
GROUP BY artist.artist_id
ORDER BY number_of_songs DESC
LIMIT 10;

# Question 3
/* Return all the track names that have a song length longer than the average song length.
Return the Name and Milliseconds for each track. Order by the song length with the
longest songs listed first */
select name , milliseconds , milliseconds / 60000 as min from track 
where milliseconds > (select round(avg(milliseconds),2) from track)
order by milliseconds desc


















