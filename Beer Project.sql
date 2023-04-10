SELECT *
FROM beers$

SELECT *
FROM breweries$

SELECT *
FROM beers$, breweries$

SELECT name, city, state
FROM breweries$
ORDER BY state, city

SELECT *
FROM beers$
WHERE name LIKE '%rod%'

SELECT DISTINCT name
FROM breweries$

SELECT *
FROM breweries$
ORDER BY F1

--Join brewery_id with F1
SELECT beers$.brewery_id, breweries$.F1
FROM beers$
LEFT JOIN breweries$ ON beers$.brewery_id = breweries$.F1

--Join brewery_id with F1
SELECT beers$.brewery_id, breweries$.F1, beers$.name, breweries$.name, beers$.style, breweries$.city, breweries$.state
FROM beers$
JOIN breweries$ ON beers$.brewery_id = breweries$.F1
ORDER BY 7

--Returns total # of breweries
SELECT DISTINCT(count(name)) AS Number_Of_Breweries
FROM breweries$

--Returns state list with # of breweries in each state
SELECT state, COUNT(state)
FROM breweries$
GROUP BY state

--Returns most used styles of beer
SELECT style, COUNT(style) AS 'Popularity'
FROM beers$
GROUP BY style
ORDER BY 'Popularity' 

--Returns top 5 most popular styles of beer
SELECT TOP 5 style, COUNT(style) AS 'Popularity'
FROM beers$
GROUP BY style
ORDER BY 'Popularity' DESC

--Total breweries in Florida
SELECT count(state) AS Florida_Breweries
FROM breweries$							
WHERE state LIKE '%FL%'

--Number of breweries in Tampa
SELECT COUNT(state) AS 'Tampa_Count'
FROM breweries$							
WHERE city = 'Tampa'

--Total number of beer styles
SELECT COUNT(style) AS TOTAL
FROM beers$
WHERE style IS NOT NULL
















