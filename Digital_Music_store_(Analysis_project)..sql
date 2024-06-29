Q.1 who is the most senior employee based on the job title ?


SELECT * FROM employee ORDER BY Levels DESC limit 1;

Q.2 Which Country have the most invoices ?

SELECT count(*) as c, billing_country
from invoice
GROUP BY billing_country
order by C DESC;

Q.3 What are top 3 values of total invoice ?

SELECT total FROM  invoice 
ORDER BY total 
DESC limit 3;

Q.4 Which city has the best customers? We would through a promotional music festival
in the city we made the most money. Write a query that returns one city that has the
highest sum of invoice totals. Returns both the city & sum of all invoice totals

SELECT SUM(total)
as invoice_Total, billing_city 
FROM invoice 
GROUP BY billing_city 
ORDER BY invoice_Total DESC;

Q.5 Who is the best customer? The best customer who spent the most money 
will be decleared the best customer. write a query that returns the person
who has spent the most money ?
                     
SELECT customer.customer_id, customer.first_name, customer.last_name,
SUM(invoice.total) 
as total 
FROM customer 
JOIN invoice 
on customer.customer_id = invoice.customer_id 
GROUP BY customer.customer_id
ORDER BY total 
DESC limit 1;

Q.6 Write query to return the- email, first name, last name, & Genre 
of all Rock Music listeners. Return your list ordered alphabetically
by email strarting with A ?

SELECT DISTINCT email,first_name,last_name
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
JOIN invoice_line on invoice.invoice_id = invoice_line.invoice_id
WHERE track_id IN(
	SELECT track_id FROM track 
	JOIN genre ON track.genre_id = genre.genre_id
	WHERE genre.name LIKE 'Rock'
)
ORDER BY email; 

Q.7 Lets invite the artists who have written the most rock music in our dataset.
write a query that returns the artist name and total track count of the top 10 rock bands ?

select artist.artist_id, artist.name, COUNT(artist.artist_id) AS number_of_songs
FROM track
JOIN album ON album.album_id = track.album_id
JOIN artist ON artist.artist_id = album.artist_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name LIKE 'Rock'
GROUP BY artist.artist_id
ORDER BY number_of_songs DESC
LIMIT 10;

Q.8 Return all the track names that have a song length 
longer than the average song length. Return the name and milliseconds for each track.
Order by the song length with the longest song listed first 

SELECT name,milliseconds
FROM track
WHERE milliseconds > (
SELECT AVG(milliseconds) AS avg_track_length
FROM track)
ORDER BY milliseconds DESC;



select * FROM artist;
select * FROM track;
select * FROM genre
