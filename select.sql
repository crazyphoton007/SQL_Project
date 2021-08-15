######Select Queries#######
Insights
####Based on overall rating

SELECT 
	rl.place_id, 
	rl.name, 
	rl.address, 
	rl.city, 
	O_Rating.overallRating
FROM reslocation AS rl
JOIN
(
	SELECT 
		place_id, 
		SUM(CAST(rating AS INT)) AS overallRating 
	FROM userrating
	GROUP BY place_id
) AS O_Rating
ON rl.place_id = O_Rating.place_id
ORDER BY O_Rating.overallRating DESC

####Based on food

SELECT 
	rl.place_id, 
	rl.name, 
	rl.address, 
	rl.city, 
	O_Rating.foodRating
FROM reslocation AS rl
JOIN
(
	SELECT 
		place_id, 
		SUM(CAST(food_rating AS INT)) AS foodRating 
	FROM userrating
	GROUP BY place_id
) AS O_Rating
ON rl.place_id = O_Rating.place_id
ORDER BY O_Rating.foodRating DESC



#### Based on service
SELECT 
	rl.place_id, 
	rl.name, 
	rl.address, 
	rl.city, 
	O_Rating.serviceRating
FROM reslocation AS rl
JOIN
(
	SELECT 
		place_id, 
		SUM(CAST(service_rating AS INT)) AS serviceRating 
	FROM userrating
	GROUP BY place_id
) AS O_Rating
ON rl.place_id = O_Rating.place_id
ORDER BY O_Rating.serviceRating DESC


#### Based on food rating corresponding to cuisines
which rest. is having good food rating and in which cuisine category.(combination of both)

SELECT 
	rl.place_id, 
	rl.name, 
	rl.address, 
	rl.city, 
	O_Rating.foodRating,
	rc.Cuisines
FROM reslocation AS rl
JOIN
(
	SELECT 
		place_id, 
		SUM(CAST(food_rating AS INT)) AS foodRating 
	FROM userrating
	GROUP BY place_id
) AS O_Rating
ON rl.place_id = O_Rating.place_id
JOIN rescuisines rc
ON O_Rating.place_id = rc.place_id
ORDER BY O_Rating.foodRating DESC
