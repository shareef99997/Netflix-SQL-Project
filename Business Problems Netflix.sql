-- View the entire Netflix table
SELECT * FROM netflix;

-- 1. Count the number of Movies vs TV Shows
-- Business Problem: Compare the number of Movies and TV Shows on Netflix.
-- Solution: Grouped the content by type and counted the occurrences.
SELECT type, COUNT(*) AS count
FROM netflix
GROUP BY type;

-- 2. Find the most common rating for movies and TV shows
-- Business Problem: Identify the most popular rating category.
-- Solution: Counted the ratings, grouped by type, and selected the highest count.
WITH RatingCounts AS (
    SELECT 
        type, 
        rating, 
        COUNT(*) AS count, 
        ROW_NUMBER() OVER (PARTITION BY type ORDER BY COUNT(*) DESC) AS rn
    FROM netflix
    GROUP BY type, rating
)
SELECT type, rating, count
FROM RatingCounts
WHERE rn = 1;

-- 3. List all movies released in a specific year (e.g., 2020)
-- Business Problem: Find all movies released in a particular year.
-- Solution: Filtered movies by release year.
SELECT title 
FROM netflix
WHERE type = 'Movie' 
AND release_year = 2020;

-- 4. Find the top 5 countries with the most content on Netflix
-- Business Problem: Determine which countries produce the most content.
-- Solution: Split multiple countries per row and counted occurrences.
WITH splited_countries AS (
	SELECT unnest(string_to_array(country,', ')) AS country
	FROM netflix
	WHERE country IS NOT NULL
)
SELECT country, COUNT(*) as content
FROM splited_countries
GROUP BY country
ORDER BY COUNT(*) DESC
LIMIT 5;

-- 5. Identify the longest movie
-- Business Problem: Find the movie with the longest duration.
-- Solution: Converted duration to integer and sorted by descending order.
SELECT title, duration
FROM netflix
WHERE type = 'Movie' AND duration IS NOT NULL
ORDER BY Cast(TRIM(REPLACE(duration, 'min', ''))AS int) DESC
LIMIT 1;

-- 6. Find content added in the last 5 years
-- Business Problem: Analyze recent content additions.
-- Solution: Extracted year from date_added and filtered by the last 5 years.
WITH years_data AS (
    SELECT 
        *, 
        EXTRACT(YEAR FROM TO_DATE(date_added, 'Month DD, YYYY')) AS added_year
    FROM netflix
    WHERE date_added IS NOT NULL
)
SELECT *, added_year
FROM years_data
WHERE added_year >= EXTRACT(YEAR FROM CURRENT_DATE) - 5
ORDER BY added_year DESC;

-- 7. Find all the movies/TV shows by director 'Rajiv Chilaka'
-- Business Problem: List all content directed by Rajiv Chilaka.
-- Solution: Used LIKE to search for the director's name.
SELECT * 
FROM netflix
WHERE director LIKE '%Rajiv Chilaka%';

-- 8. List all TV shows with more than 5 seasons
-- Business Problem: Find long-running TV shows.
-- Solution: Extracted number of seasons and filtered for more than 5.
WITH tv_shows AS (
	SELECT *, 
			CAST(TRIM(REPLACE(duration, ' Seasons', '')) AS INT) AS seasons
	FROM netflix
	WHERE type ILIKE 'TV Show'
	AND duration ILIKE '%Seasons'
)
SELECT 
		title,
		seasons
	FROM tv_shows 
	WHERE seasons > 5;

-- 9. Count the number of content items in each genre
-- Business Problem: Determine the popularity of different genres.
-- Solution: Split multiple genres per row and counted each occurrence.
WITH genres AS (
    SELECT 
        title,
        UNNEST(string_to_array(listed_in, ', ')) AS genre
    FROM netflix
    WHERE listed_in IS NOT NULL
)
SELECT 
     TRIM(genre) AS genre,
    COUNT(*) AS content_count
FROM genres
GROUP BY genre
ORDER BY content_count DESC;
	
-- 10. Find each year and the average numbers of content release in France
-- Business Problem: Analyze content trends in France.
-- Solution: Counted content per year and calculated the average.
WITH france_content AS (
    SELECT 
        release_year,
        COUNT(*) AS content_count
    FROM netflix
    WHERE country LIKE '%France%'
    GROUP BY release_year
)
SELECT 
    release_year, 
    ROUND(AVG(content_count), 2) AS avg_content_release
FROM france_content
GROUP BY release_year
ORDER BY avg_content_release DESC
LIMIT 5;

-- 11. List all movies that are documentaries
-- Business Problem: Identify documentary movies.
-- Solution: Filtered movies by 'Documentaries' in listed_in.
SELECT title, listed_in
	FROM
	netflix
	WHERE type = 'Movie' AND listed_in LIKE '%Documentaries%';

-- 12. Find all content without a director
-- Business Problem: Identify content with missing director information.
-- Solution: Checked for NULL or empty strings in the director column.
SELECT * 
FROM netflix
WHERE director IS NULL OR director = '';

-- 13. Find how many movies actor 'Salman Khan' appeared in last 10 years
-- Business Problem: Analyze Salman Khan's movie appearances.
-- Solution: Filtered by actor name and release year.
WITH salman_khan_movies AS (
	SELECT 
		*
	FROM netflix
	WHERE type = 'Movie' 
	AND casts LIKE '%Salman Khan%' 
)
SELECT COUNT(*)
	FROM salman_khan_movies 
	WHERE release_year  >= EXTRACT(YEAR FROM CURRENT_DATE) - 10;

-- 14. Find the top 10 actors in French movies
-- Business Problem: Find popular actors in French movies.
-- Solution: Split casts by comma, counted occurrences, and sorted.
WITH france_content AS (
    SELECT 
		title, 
        UNNEST(string_to_array(casts, ', ')) AS actor
    FROM netflix
    WHERE country LIKE '%France%' AND type = 'Movie'
	AND casts IS NOT NULL
)
SELECT 
    TRIM(actor) AS actor, 
    COUNT(*) AS movies
FROM france_content
GROUP BY actor
ORDER BY movies DESC
LIMIT 10;

-- 15. Categorize content as 'Bad' or 'Good' based on keywords
-- Business Problem: Categorize content by keywords ('kill' and 'violence').
-- Solution: Used CASE to label content and counted each category.
WITH pg AS (
	SELECT 
		title,
		CASE
			WHEN description LIKE '%kill%' OR description LIKE '%violence%' THEN 'Bad'
			ELSE 'Good'
		END AS status,
		description
	FROM netflix 
)
SELECT status, COUNT(*) AS content
FROM pg 
GROUP BY status 
ORDER BY content DESC;