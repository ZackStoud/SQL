--SELECT * 
--FROM ['Covid Deaths$']
--ORDER BY 3,4


--SELECT * 
--FROM ['Covid Vacinations$']
--ORDER BY 3,4

--SELECT location, date, total_cases, new_cases, total_deaths, population
--FROM ['Covid Deaths$']
--ORDER BY 1,2

--Total Cases vs Total Deaths
SELECT Location, date, total_cases, total_deaths, (cast(total_deaths AS FLOAT)/ cast(total_cases AS FLOAT))*100 AS DeathPercentage
FROM ['Covid Deaths$']
WHERE location LIKE '%states%'
ORDER BY 1,2

--Total Cases vs Population
--Percentage of population that got Covid
SELECT Location, date, total_cases, Population, (cast(total_cases AS FLOAT)/ cast(Population AS FLOAT))*100 AS PercentOfPopulationInfected
FROM ['Covid Deaths$']
WHERE location LIKE '%states%'
ORDER BY 1,2

--Countries with highest infection rate compared to population
SELECT Location, Population, MAX(total_cases) AS HighestInfectionCount, (cast(MAX(total_cases) AS FLOAT)/ cast(MAX(Population) AS FLOAT))*100 
AS PercentPopulationInfected
FROM ['Covid Deaths$']
--WHERE location LIKE '%states%'
GROUP BY Location, Population
ORDER BY PercentPopulationInfected DESC

--Continents with highest death count
SELECT continent, MAX(CAST(total_deaths AS INT)) AS TotalDeathCount
FROM ['Covid Deaths$']
--WHERE location LIKE '%states%'
--WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY TotalDeathCount DESC

--Countries with highest death count per population
SELECT location, MAX(CAST(total_deaths AS INT)) AS TotalDeathCount
FROM ['Covid Deaths$']
--WHERE location LIKE '%states%'
--WHERE location IS NOT NULL
GROUP BY continent
ORDER BY TotalDeathCount DESC

--Global Numbers
--SELECT date, SUM(CAST(new_cases AS BIGINT)), SUM(CAST(new_deaths AS BIGINT)), SUM(CAST(new_deaths AS BIGINT))/SUM(CAST(new_cases AS BIGINT))*100
--FROM ['Covid Deaths$']
--WHERE continent IS NOT NULL
--GROUP BY date
--ORDER BY 1,2


--Total Population vs Vaccinations
SELECT *
FROM ['Covid Deaths$'] dea
JOIN ['Covid Vaccinations$'] vac
	ON dea.location = vac.location
	AND dea.date = vac.date

--CTE
WITH PopsvsVac (continent, location, date, population, new_vaccinations, RollingVaccinationSum)
AS
(
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(CAST(vac.new_vaccinations AS BIGINT)) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date)
AS RollingVaccinationSum
--(RollingVaccinationSum/population)*100
FROM ['Covid Deaths$'] dea
JOIN ['Covid Vaccinations$'] vac
	ON dea.location = vac.location
	AND dea.date = vac.date
	WHERE dea.continent IS NOT NULL
--ORDER BY 1,2,3
)



