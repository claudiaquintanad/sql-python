/*1.	¿Qué consulta harías para obtener todos los países que hablan esloveno? Tu consulta debe devolver el nombre del país, el idioma y el porcentaje de idioma. Tu consulta debe organizar el resultado por porcentaje de idioma en orden descendente. */
SELECT c.name, l.language, l.percentage 
FROM languages AS l
JOIN countries AS c
ON c.id=l.country_id
WHERE language = 'slovene'
ORDER BY percentage DESC;

/*2.	¿Qué consulta ejecutarías para mostrar el número total de ciudades para cada país? Su consulta debe devolver el nombre del país y el número total de ciudades. Tu consulta debe organizar el resultado por el número de ciudades en orden descendente*/
SELECT c.name, count(ci.name) AS cities
FROM cities AS ci
JOIN countries AS c
ON c.id=ci.country_id
GROUP BY c.name
ORDER BY cities DESC;

/*3. ¿Qué consulta harías para obtener todas las ciudades de México con una población de más de 500,000? Tu consulta debe organizar el resultado por población en orden descendente. */
SELECT ci.name, ci.population
FROM cities as ci
JOIN countries AS c
ON c.id= ci.country_id
WHERE c.name = 'Mexico' AND ci.population > 500000
ORDER BY ci.population DESC;

/*4. ¿Qué consulta ejecutarías para obtener todos los idiomas en cada país con un porcentaje superior al 89%? Tu consulta debe organizar el resultado por porcentaje en orden descendente.*/
SELECT c.name, l.language, l.percentage 
FROM languages AS l
JOIN countries AS c
ON c.id=l.country_id
WHERE percentage > 89
ORDER BY percentage DESC;

/*5.¿Qué consulta haría para obten todos los países con un área de superficie inferior a 501 y una población superior a 100,000? */
SELECT name, surface_area, population 
FROM countries
WHERE surface_area < 501 AND population > 100000;

/*6. ¿Qué consulta harías para obtener países con solo Monarquía Constitucional con un capital superior a 200 y una esperanza de vida superior a 75 años? */
SELECT name, government_form, capital, life_expectancy
FROM countries
WHERE government_form = 'Constitutional Monarchy' AND capital > 200 AND life_expectancy > 75;

/*7. ¿Qué consulta harías para obtener todas las ciudades de Argentina dentro del distrito de Buenos Aires y tener una población superior a 500,000? La consulta debe devolver el nombre del país, el nombre de la ciudad, el distrito y la población. */
SELECT c.name, ci.name, ci.district, ci.population
FROM cities as ci
JOIN countries as c
ON c.id= ci.country_id
WHERE c.name = 'Argentina' AND ci.district = 'Buenos Aires' AND ci.population > 500000;

/*8. ¿Qué consulta harías para resumir el número de países en cada región? La consulta debe mostrar el nombre de la región y el número de países. Además, la consulta debe organizar el resultado por el número de países en orden descendente. */
SELECT region, count(name) as countries
FROM countries
group by region
order by countries desc;