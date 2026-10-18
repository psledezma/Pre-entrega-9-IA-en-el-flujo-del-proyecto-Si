USE Ventas_Tech_DBVersion2;
SELECT * FROM CATEGORIAS;
SELECT * FROM CLIENTES;
SELECT * FROM productos;
SELECT* FROM VENTAS;


SELECT ventas.fecha_venta,clientes.nombre AS NOMBRE_CLIENTE, CATEGORIAS.descripcion AS CATEGORIA,PRODUCTOS.nombre_producto,ventas.precio_unitario,VENTAS.CANTIDAD,SUM(VENTAS.cantidad*VENTAS.precio_unitario) as TOTAL_VENTAS,CLIENTES. ciudad AS DIMENSION_GEOGRAFICA, CASE WHEN clientes.ciudad = 'Buenos Aires' THEN 'CABA' WHEN clientes.ciudad IN ('La Plata')THEN 'GBA' ELSE'Interior'
  END AS region
FROM VENTAS
JOIN CLIENTES ON clientes.id_cliente= ventas.id_cliente
JOIN productos ON productos. id_producto= ventas. id_producto
JOIN CATEGORIAS ON categorias.id_categoria=productos. id_categoria
GROUP BY ventas.fecha_venta,clientes.nombre,CATEGORIAS.descripcion,PRODUCTOS.nombre_producto, VENTAS.precio_unitario,VENTAS.cantidad,
CLIENTES. ciudad, CASE WHEN clientes.ciudad = 'Buenos Aires' THEN 'CABA' WHEN clientes.ciudad IN ('La Plata')THEN 'GBA' ELSE'Interior'
  END,
    categorias.descripcion,
    productos.nombre_producto,
    ventas.precio_unitario,
    ventas.cantidad;


    SELECT CLIENTES.nombre,CLIENTES.email,CLIENTES.fecha_registro
    FROM CLIENTES LEFT JOIN VENTAS ON CLIENTES.id_cliente=ventas.id_cliente
    WHERE ventas.id_cliente IS NULL;


    SELECT productos.nombre_producto,categorias.nombre_categoria,productos.precio
    FROM productos LEFT JOIN VENTAS ON productos.id_producto=ventas.id_producto
    LEFT JOIN CATEGORIAS ON PRODUCTOS.id_categoria=categorias.id_categoria
    WHERE ventas.id_producto IS NULL;


    WITH VENTAS_POR_CANAL AS(
    SELECT fecha_venta,CANTIDAD*precio_unitario AS TOTAL,'Online' AS canal FROM VENTAS WHERE DAY(fecha_venta) BETWEEN 1 AND 10
    UNION ALL  SELECT fecha_VENTA, CANTIDAD*precio_unitario AS TOTAL, 'Presencial' AS canal FROM ventas WHERE DAY(FECHA_VENTA) BETWEEN 11 AND 15)
    SELECT 
    canal,
    COUNT(*) AS cantidad_ventas,
    SUM(total) AS total_facturado
FROM ventas_por_canal
GROUP BY canal;
  


    
    