/*1. ¿Qué consulta ejecutarías para obtener todos los clientes dentro de city_id = 312? Su consulta debe devolver el nombre, apellido, correo electrónico y dirección del cliente.*/
SELECT ci.city_id, c.first_name, c.last_name, c.email, a.address
FROM customer AS c
JOIN address AS a
ON a.address_id = c.address_id
JOIN city AS ci
ON ci.city_id = a.city_id
WHERE ci.city_id = 312;

/*2. ¿Qué consulta harías para obtener todas las películas de comedia? Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación, las características especiales y el género (categoría).*/
SELECT f.title , f.description, f.release_year, f.rating, f.special_features, c.name
FROM film AS f
JOIN film_category
ON film_category.film_id = f.film_id
JOIN category as c
ON film_category.category_id = c.category_id
WHERE c.name = 'Comedy';

/*3. ¿Qué consulta harías para obtener todas las películas unidas por actor_id = 5? Su consulta debe devolver la identificación del actor, el nombre del actor, el título de la película, la descripción y el año de lanzamiento.*/
SELECT a.actor_id, CONCAT(a.first_name, a.last_name) AS name, f.title, f.description, f.release_year
FROM actor AS a
JOIN film_actor
ON film_actor.actor_id = a.actor_id
JOIN film AS f
ON f.film_id = film_actor.film_id
WHERE a.actor_id = '5';

/*4. ¿Qué consulta ejecutaría para obtener todos los clientes en store_id = 1 y dentro de estas ciudades (1, 42, 312 y 459)? Su consulta debe devolver el nombre, apellido, correo electrónico y dirección del cliente.*/
SELECT c.store_id, c.first_name, c.last_name, c.email, a.address
FROM customer AS c
JOIN address AS a
ON a.address_id = c.address_id
JOIN store
ON store.store_id = c.store_id
JOIN city
ON city.city_id = a.city_id
WHERE c.store_id = 1 AND (a.city_id = 1 OR a.city_id = 42 OR a.city_id = 312 OR a.city_id =459);

/*5. ¿Qué consulta realizarías para obtener todas las películas con una "calificación = G" y "característica especial = detrás de escena", unidas por actor_id = 15? Su consulta debe devolver el título de la película, la descripción, el año de lanzamiento, la calificación y la función especial. Sugerencia: puede usar la función LIKE para obtener la parte 'detrás de escena'.*/
SELECT f.title, f.description, f.release_year, f.rating, f.special_features
FROM film AS f
JOIN film_actor 
ON film_actor.film_id = f.film_id
WHERE f.rating = 'G' AND f.special_features LIKE '%Behind the Scenes%' AND actor_id = 15; 

/*6. ¿Qué consulta harías para obtener todos los actores que se unieron en el film_id = 369? Su consulta debe devolver film_id, title, actor_id y actor_name.*/
SELECT fa.film_id, f.title, fa.actor_id, CONCAT(a.first_name, a.last_name) AS actor_name
FROM film_actor AS fa
JOIN film AS f
ON f.film_id = fa.film_id
JOIN actor AS a
ON a.actor_id = fa.actor_id
WHERE fa.film_id = 369;

/*7. ¿Qué consulta harías para obtener todas las películas dramáticas con una tarifa de alquiler de 2.99? Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación, las características especiales y el género (categoría).*/
SELECT f.title, f.description, f.release_year, f.rating, f.special_features, c.name, f.rental_rate
FROM film AS f
JOIN film_category
ON film_category.film_id = f.film_id
JOIN category as c
ON film_category.category_id = c.category_id
WHERE f.rental_rate = 2.99 AND c.name = 'Drama';

/*8. ¿Qué consulta harías para obtener todas las películas de acción a las que se une SANDRA KILMER? Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación, las características especiales, el género (categoría) y el nombre y apellido del actor.*/
SELECT f.title, f.description, f.release_year, f.rating, f.special_features, c.name, a.first_name, a.last_name
FROM film AS f
JOIN film_category
ON film_category.film_id = f.film_id
JOIN category as c
ON film_category.category_id = c.category_id
JOIN film_actor 
ON film_actor.film_id = f.film_id
JOIN actor AS a
ON a.actor_id = film_actor.actor_id
WHERE a.first_name = 'SANDRA' AND a.last_name ='KILMER' AND c.name = 'Action';
