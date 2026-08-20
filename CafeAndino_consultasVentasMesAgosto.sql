--Ventas del Mes

SELECT SUM(total) AS total_vendido_agosto
FROM pedidos
WHERE fecha >= '2026-08-01' AND fecha < '2026-09-01';


--Cantidad de Pedidos y ticket Promedio

SELECT COUNT(*) AS cantidad_pedidos,
       ROUND(AVG(total), 2) AS ticket_promedio
FROM pedidos
WHERE fecha >= '2026-08-01' AND fecha < '2026-09-01';

--Total vendido por cliente

SELECT c.nombre, SUM(p.total) AS total_cliente
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.id
GROUP BY c.nombre
ORDER BY total_cliente DESC;


--Pedido mas caro y mas barato del mes

SELECT MAX(total) AS pedido_mas_caro,
       MIN(total) AS pedido_mas_barato
FROM pedidos
WHERE fecha >= '2026-08-01' AND fecha < '2026-09-01';


--Clientes con 2 o más pedidos
SELECT c.nombre, COUNT(p.id) AS cantidad_pedidos
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.id
GROUP BY c.nombre
HAVING COUNT(p.id) >= 2;


--Total vendido por dia

SELECT DATE(fecha) AS dia, SUM(total) AS total_dia
FROM pedidos
GROUP BY DATE(fecha)
ORDER BY dia;



