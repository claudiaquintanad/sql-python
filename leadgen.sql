/*1. ¿Qué consulta ejecutaría para obtener los ingresos totales para marzo de 2012?*/
SELECT MONTHNAME(charged_datetime) AS mes, SUM(amount) AS ingresos
FROM billing
WHERE charged_datetime BETWEEN '2012/03/01' AND '2012/03/31';

/*2. ¿Qué consulta ejecutaría para obtener los ingresos totales recaudados del cliente con una identificación de 2?*/
SELECT client_id, SUM(amount) AS ingreso_total
FROM billing
WHERE client_id = 2;

/*3. ¿Qué consulta ejecutaría para obtener todos los sitios que posee client = 10?*/
SELECT client_id, domain_name
FROM sites
WHERE client_id = 10;

/*4. ¿Qué consulta ejecutaría para obtener el número total de sitios creados por mes por año para el cliente con una identificación de 1? ¿Qué pasa con el cliente = 20?*/
SELECT client_id, COUNT(domain_name) AS cantidad_sitios, MONTHNAME(created_datetime) AS mes_creado, YEAR(created_datetime) AS year_creado
FROM sites
WHERE client_id = 1 
GROUP BY client_id, created_datetime;

SELECT client_id, COUNT(domain_name) AS cantidad_sitios, MONTHNAME(created_datetime) AS mes_creado, YEAR(created_datetime) AS year_creado
FROM sites
WHERE client_id = 20
GROUP BY client_id, created_datetime;

/*5. ¿Qué consulta ejecutaría para obtener el número total de clientes potenciales generados para cada uno de los sitios entre el 1 de enero de 2011 y el 15 de febrero de 2011?*/
SELECT registered_datetime AS fecha, s.domain_name, COUNT(leads_id) AS total_potenciales
FROM leads
JOIN sites AS s
ON s.site_id = leads.site_id
WHERE registered_datetime BETWEEN '2011/01/01' AND '2011/02/15'
GROUP BY fecha, s.domain_name;

/*6. ¿Qué consulta ejecutaría para obtener una lista de nombres de clientes y el número total de clientes potenciales que hemos generado para cada uno de nuestros clientes entre el 1 de enero de 2011 y el 31 de diciembre de 2011?*/
SELECT CONCAT(c.first_name,' ', c.last_name) AS nombre, COUNT(leads_id) AS total_potenciales
FROM leads
JOIN sites AS s
ON s.site_id = leads.site_id
JOIN clients AS c
ON c.client_id = s.client_id
WHERE registered_datetime BETWEEN '2011/01/01' AND '2011/12/31'
GROUP BY nombre;

/*7. ¿Qué consulta ejecutaría para obtener una lista de nombres de clientes y el número total de clientes potenciales que hemos generado para cada cliente cada mes entre los meses 1 y 6 del año 2011?*/
SELECT CONCAT(c.first_name,' ', c.last_name) AS nombre, COUNT(leads_id) AS total_potenciales,  MONTH(registered_datetime) AS mes
FROM leads
JOIN sites AS s
ON s.site_id = leads.site_id
JOIN clients AS c
ON c.client_id = s.client_id
WHERE registered_datetime BETWEEN '2011/01/01' AND '2011/06/30'
GROUP BY nombre, mes;
/*8. ¿Qué consulta ejecutaría para obtener una lista de nombres de clientes y el número total de clientes potenciales que hemos generado para cada uno de los sitios de nuestros clientes entre el 1 de enero de 2011 y el 31 de diciembre de 2011? Solicite esta consulta por ID de cliente. Presente una segunda consulta que muestre todos los clientes, los nombres del sitio y el número total de clientes potenciales generados en cada sitio en todo momento. */
SELECT CONCAT(c.first_name,' ', c.last_name) AS nombre, s.domain_name AS dominio, COUNT(leads_id) AS total_potenciales
FROM leads
JOIN sites AS s
ON s.site_id = leads.site_id
JOIN clients AS c
ON c.client_id = s.client_id
WHERE registered_datetime BETWEEN '2011/01/01' AND '2011/12/31'
GROUP BY nombre, dominio;

SELECT CONCAT(c.first_name,' ', c.last_name) AS nombre, COALESCE(s.domain_name, 'Sin Sitios Registrados') AS dominio, COUNT(leads_id) AS total_potenciales
FROM leads
JOIN sites AS s
ON s.site_id = leads.site_id
RIGHT JOIN clients AS c
ON c.client_id = s.client_id
GROUP BY nombre, dominio;

/*9. Escriba una sola consulta que recupere los ingresos totales recaudados de cada cliente para cada mes del año. Pídalo por ID de cliente.*/
SELECT client_id, MONTHNAME(charged_datetime) AS mes,YEAR(charged_datetime) AS year, SUM(amount) AS ingreso_total
FROM billing
GROUP BY client_id, mes, year
ORDER BY client_id, charged_datetime;

/*como sale en el pdf*/
SELECT CONCAT(c.first_name,' ', c.last_name) AS nombre, MONTHNAME(b.charged_datetime) AS mes,YEAR(b.charged_datetime) AS año, SUM(b.amount) AS ingreso_total
FROM billing AS b
JOIN clients AS c
ON c.client_id = b.client_id
GROUP BY nombre, mes, año
ORDER BY nombre, b.charged_datetime;

/*10. Escriba una sola consulta que recupere todos los sitios que posee cada cliente. Agrupe los resultados para que cada fila muestre un nuevo cliente. Se volverá más claro cuando agregue un nuevo campo llamado 'sitios' que tiene todos los sitios que posee el cliente. (SUGERENCIA: use GROUP_CONCAT)*/
SELECT CONCAT(c.first_name,' ', c.last_name) AS nombre,GROUP_CONCAT(
    DISTINCT COALESCE(s.domain_name, 'Sin Sitios Registrados')
    ORDER BY s.domain_name DESC
    SEPARATOR ' / '
)
FROM sites AS s
RIGHT JOIN clients AS c
ON c.client_id = s.client_id
GROUP BY nombre;
