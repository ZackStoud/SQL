SELECT name, city, state
FROM breweries$
ORDER BY state, city

SELECT *
FROM breweries$

SELECT *
FROM beers$
WHERE name LIKE '%rod%'

SELECT *
FROM breweries$

SELECT *
FROM beers$, breweries$

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

SELECT count(state) AS Florida_Breweries
FROM breweries$							
WHERE state LIKE '%FL%'

SELECT state
FROM breweries$							
WHERE state LIKE '%FL%'

SELECT COUNT(state) AS 'Tampa_Count'
FROM breweries$							/*works*/
WHERE city = 'Tampa'









