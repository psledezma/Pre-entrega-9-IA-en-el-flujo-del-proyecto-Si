USE Ventas_Tech_DBVersion2
SELECT * FROM VENTAS
SELECT MONTH (fecha_venta) AS mes,SUM(cantidad * precio_unitario) AS total_facturado,COUNT(cantidad) AS cantidad_pedidos,AVG (precio_unitario) AS ticket_promedio FROM ventas GROUP BY MONTH(fecha_venta) ORDER BY mes;
SELECT* FROM VENTAS
SELECT TOP 5 id_producto,SUM(cantidad) AS unidades_vendidas,SUM(cantidad * precio_unitario) AS total_facturado FROM ventas GROUP BY id_producto ORDER BY total_facturado DESC;
SELECT id_cliente,COUNT (*) AS cantidad_pedidos, SUM (cantidad*precio_unitario) AS total_gastado FROM ventas GROUP BY id_cliente HAVING COUNT (*) > 1;
WITH FacturacionMensual AS (SELECT MONTH(fecha_venta) AS Mes,SUM(cantidad * precio_unitario) AS Total_Mes FROM ventas GROUP BY MONTH(fecha_venta))SELECT Mes,Total_Mes AS Total_Facturado,CASE WHEN Total_Mes > (SELECT AVG(Total_Mes) FROM FacturacionMensual)THEN 'Por encima'ELSE 'Por debajo'END AS estado_promedio FROM FacturacionMensual ORDER BY Mes ASC;
Hay 10 pedidos que tienen un ticket promedio de 382.10
Se vendieron mas unidades 2, que es de los mas baratos
El 62,5% de los clientes realizó mas de un pedido

