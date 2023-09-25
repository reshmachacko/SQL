use project;
select * from netflix;

# 1. Fetch the details of TV shows which are released in the year 2020
select * from netflix 
where type='TV Show' 
and release_year =2020;

# 2. Fetch all the details about indian movies/TV shows
select * from netflix 
where country='India';

# 3. Fetch all the details about the thriller genres in the data
select * from netflix 
where listed_in like '%Thrillers%';

# 4. Find the newly added shows in netflix
select title,type,release_year,date_added 
from netflix  
order by date_added desc;

# 5. Find the released_year wise count of movies/TV shows in each year
select release_year,count(*) as NumOfShows 
from netflix 
group by release_year 
order by count(release_year) desc;

# 6. Fetch all the details about movies which are added on September 24, 2021
select * from netflix 
where date_added='September 24, 2021' 
and type='Movie';

# 7. Fetch the names of movies/TV shows acted by Ranjan Raj
select title,type from netflix 
where cast like '%Ranjan Raj%';

# 8. Fetch the names of movies/TV shows directed by the persons whom have nationality same as Kirsten Johnson
select title,director,country 
from netflix 
where country=(select country from netflix where director='Kirsten Johnson');

# 9. fetch the number of movies/TV shows directed by each director
select director,count(*) 
from netflix 
group by director 
order by count(*) desc;

# 10. Fetch the details of movies/TV shows which are released in season wise
select * from netflix 
where duration like '%Season%';
