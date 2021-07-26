SELECT user_id, users.first_name, users.last_name, friend_id, amigo.first_name
FROM friendships LEFT JOIN users ON friendships.user_id = users.id
LEFT JOIN users AS amigo ON friendships.friend_id = amigo.id;

/*Devuelva a todos los usuarios que son amigos de Kermit, asegúrese de que sus nombres se muestren en los resultados.*/
SELECT user_id, users.first_name, users.last_name, friend_id, amigo.first_name
FROM friendships LEFT JOIN users ON friendships.user_id = users.id
LEFT JOIN users AS amigo ON friendships.friend_id = amigo.id
WHERE amigo.first_name = 'Kermit' OR users.last_name = 'Kermit';
/*Devuelve el recuento de todas las amistades.*/
SELECT COUNT(friend_id) AS total
FROM friendships;

/*Descubre quién tiene más amigos y devuelve el recuento de sus amigos.*/
SELECT user_id, users.first_name, users.last_name,COUNT(friend_id) AS cuenta
FROM friendships
LEFT JOIN users 
ON friendships.user_id = users.id
LEFT JOIN users AS amigo 
ON friendships.friend_id = amigo.id
GROUP BY user_id;

/*Crea un nuevo usuario y hazlos amigos de Eli Byers, Kermit The Frog y Marky Mark.*/
INSERT INTO users (id, first_name, last_name) 
VALUES(10, 'Claudia', 'Quintana');
INSERT INTO friendships (user_id, friend_id)
VALUES (10, 2);
INSERT INTO friendships (user_id, friend_id)
VALUES (10, 4);
INSERT INTO friendships (user_id, friend_id)
VALUES (10, 5);

/*Devuelve a los amigos de Eli en orden alfabético.*/
SELECT user_id, users.first_name, users.last_name, friend_id, amigo.first_name
FROM friendships LEFT JOIN users ON friendships.user_id = users.id
LEFT JOIN users AS amigo ON friendships.friend_id = amigo.id
WHERE amigo.first_name = 'Eli' OR users.first_name = 'Eli'
ORDER BY users.first_name DESC;
/*Eliminar a Marky Mark de los amigos de Eli.*/
DELETE FROM friendships WHERE user_id = 2 AND friend_id = 5;

/*Devuelve todas las amistades, mostrando solo el nombre y apellido de ambos amigos*/
SELECT users.first_name, users.last_name, amigo.first_name, amigo.last_name
FROM friendships LEFT JOIN users ON friendships.user_id = users.id
LEFT JOIN users AS amigo ON friendships.friend_id = amigo.id;