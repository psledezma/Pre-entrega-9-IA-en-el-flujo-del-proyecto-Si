RetailPro | Análisis de Datos de Ventas
Descripción del proyecto
RetailPro es un proyecto de análisis de datos orientado al sector retail, cuyo objetivo es transformar datos transaccionales en información útil para la toma de decisiones de negocio.
A través de consultas SQL y dashboards interactivos en Power BI, el proyecto permite analizar el comportamiento de las ventas, identificar patrones de compra, evaluar el desempeño de los productos y clientes, y monitorear indicadores clave de rendimiento (KPIs).
El análisis se desarrolla sobre una base de datos relacional que contiene información de clientes, productos, categorías y ventas.
Objetivos de negocio
•	Analizar la facturación y la evolución de las ventas.
•	Identificar los productos con mayor facturación y volumen de unidades vendidas.
•	Evaluar el comportamiento de compra y el gasto por cliente.
•	Detectar clientes que no registran compras y productos sin ventas.
•	Calcular indicadores como facturación total, cantidad de pedidos y ticket promedio.
•	Construir dashboards para facilitar el seguimiento de los resultados comerciales.
•	Identificar oportunidades de mejora y apoyar la toma de decisiones basada en datos.
Tecnologías y herramientas
Tecnología	Aplicación
SQL Server	Almacenamiento y consulta de datos relacionales.
SQL	Extracción, transformación y análisis de datos mediante JOIN, GROUP BY, funciones de agregación, CTE y subconsultas.
Power BI	Creación de dashboards e informes interactivos.
DAX	Desarrollo de medidas e indicadores para el análisis de ventas.
Git y GitHub	Control de versiones, documentación y publicación del proyecto.
Indicadores clave (KPIs)
El proyecto contempla el análisis de los siguientes indicadores:
•	Facturación total: suma de los importes de las ventas.
•	Cantidad de pedidos: número de pedidos registrados, según la definición utilizada en el modelo de datos.
•	Ticket promedio: importe promedio por pedido.
•	Unidades vendidas: cantidad total de productos vendidos.
•	Facturación por producto: ingresos generados por cada producto.
•	Facturación por cliente: importe total asociado a cada cliente.
•	Clientes sin compras: clientes que no registran ventas.
•	Productos sin ventas: productos que no presentan transacciones asociadas.
•	Cumplimiento de objetivos: comparación entre los resultados reales y las metas comerciales, cuando estas estén disponibles.
Descripción de las carpetas: (En este punto realice un cambio colocando los nombres específicos de las 5 carpetas creadas para las diferentes pre-entregas)
•	Pre-entrega 3: Script SQL para esquema normalizado y datos iniciales: creación de tablas en SQL
•	Pre-entrega 4: Consultas SQL de negociopowerbi/: archivo del dashboard y capturas de pantalla de los informes: funciones de agregación.
•	Pre-entrega 5: Consultas con JOINs para el proyecto: utilización de las funciones JOIN en SQL
•	Pre-entrega 6: Pipeline ETL con Power Query y MLos nombres de archivos son sugeridos y pueden adaptarse a los scripts disponibles. Generación archivo PBI
•	Pre-entrega 8: Modelo de datos con relaciones activas y tabla de medidas core en DAX: utilización funciones DAX


Requisitos previos
Antes de ejecutar el proyecto, es necesario disponer de:
1.	SQL Server instalado o acceso a una instancia de SQL Server.
2.	SQL Server Management Studio (SSMS) o una herramienta compatible para ejecutar consultas.
3.	Power BI Desktop para abrir y actualizar el dashboard.
4.	Git, si se desea clonar el repositorio y gestionar versiones localmente.
Instalación y ejecución
Paso 1. Clonar el repositorio
Desde una terminal, ejecutar:
git clone https://github.com/USUARIO/RetailPro.git
cd RetailPro
Reemplazar USUARIO por el nombre de usuario o la organización propietaria del repositorio.
También es posible descargar el proyecto como archivo ZIP desde GitHub.
Paso 2. Crear la base de datos y las tablas
Abrir SQL Server Management Studio y conectarse a la instancia correspondiente.
Ejecutar el script:
sql/01_create_database_tables.sql
Este script debe crear la base de datos y las tablas necesarias para el análisis, por ejemplo:
•	CLIENTES
•	PRODUCTOS
•	CATEGORIAS
•	VENTAS
Las tablas deben crearse respetando las relaciones entre claves primarias y foráneas.
Si la base de datos ya existe, verificar su estructura antes de ejecutar nuevamente el script para evitar errores o pérdida de información.

Paso 3. Cargar los datos
Ejecutar:
sql/02_load_data.sql
Este archivo debe contener las instrucciones necesarias para cargar los registros en las tablas.
Si los datos provienen de archivos CSV, verificar previamente las rutas de acceso, los permisos y el formato de las columnas.
Después de la carga, comprobar que los registros se hayan insertado correctamente.
Paso 4. Validar la calidad de los datos
Ejecutar:
sql/03_data_quality_checks.sql
Este script puede utilizarse para verificar:
•	Cantidad de registros por tabla.
•	Valores nulos en columnas importantes.
•	Duplicados en claves o identificadores.
•	Integridad de las relaciones entre clientes, productos, categorías y ventas.
•	Coherencia de los importes calculados.
Por ejemplo, el importe de cada línea de venta puede calcularse como:
SELECT
    id_venta,
    cantidad,
    precio_unitario,
    cantidad * precio_unitario AS total_venta
FROM VENTAS;
Paso 5. Ejecutar las consultas de análisis
Ejecutar:
sql/04_sales_analysis.sql
Este script puede incluir consultas para analizar:
•	Facturación total y evolución mensual.
•	Cantidad de pedidos y ticket promedio.
•	Productos con mayor facturación.
•	Unidades vendidas por producto.
•	Clientes con mayor gasto.
•	Clientes sin compras.
•	Productos sin ventas.
•	Comparaciones por categoría, región o canal, siempre que existan los datos necesarios.
Los resultados deben contrastarse con los datos originales para verificar que los indicadores sean consistentes.
Paso 6. Abrir el dashboard en Power BI
1.	Abrir Power BI Desktop.
2.	Seleccionar Obtener datos y elegir SQL Server.
3.	Introducir el nombre del servidor y la base de datos.
4.	Seleccionar las tablas o vistas necesarias para el análisis.
5.	Configurar las relaciones entre las tablas si no se han detectado automáticamente.
6.	Crear las medidas DAX necesarias.
7.	Abrir o desarrollar el informe powerbi/RetailPro_Dashboard.pbix.
8.	Actualizar los datos y verificar que los indicadores coincidan con los resultados de SQL.
Los nombres de servidor, las credenciales y las rutas de conexión deben configurarse para cada entorno. No deben almacenarse contraseñas en el repositorio.
Ejemplos de medidas DAX (En este punto modifique los ejemplos generales, por DAX utilizados en la pre-entrega 8)
Para calcular el total ventas:
Total Ventas =SUM(Fact_Ventas[total_venta])

Para calcular las ventas online
Ventas Online =CALCULATE(    [Total Ventas],    Fact_Ventas[canal] = "Online")
Para calcular las ventas acumuladas anuales
Ventas YTD =TOTALYTD(    [Total Ventas],    Dim_Fechas[Date])

Resultados esperados (en este caso ajuste los resultados para que sea acorde al protecto real)
Al completar la ejecución, el proyecto debería permitir:
•	Consultar indicadores comerciales desde SQL Server.
•	Analizar el desempeño de productos y clientes.
•	Detectar oportunidades de mejora en la gestión comercial.
•	Visualizar los KPIs en un dashboard interactivo.
•	Documentar hallazgos y respaldar decisiones mediante datos.
•	Establecer decisiones verificando las ventas comparando lo online y lo presencial
•	Poder comparar las ventas entre 2023 y 2024 y verificar la variación interanual
Los resultados concretos dependerán de los datos cargados, las reglas de negocio y las consultas implementadas.
Buenas prácticas
•	Mantener los scripts SQL ordenados y numerados según su secuencia de ejecución.
•	Validar los resultados de las consultas antes de utilizarlos en informes.
•	Documentar las fórmulas y definiciones de cada KPI.
•	Evitar subir información personal, credenciales o datos comerciales confidenciales.
•	Utilizar Git para registrar los cambios en scripts, documentación y modelos.
•	Verificar que las medidas DAX coincidan con los cálculos realizados en SQL.
________________________________________
RetailPro es un proyecto de análisis de datos orientado a demostrar habilidades en SQL Server, modelado de datos, Power BI, DAX y comunicación de hallazgos de negocio.

