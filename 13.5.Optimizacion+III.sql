/*1.Optimizar La busqueda A través de indices del campo NOM_PROD de la tabla tblProductos,
 Plan de Ejecución,NON-SARGABLE esta palabra provienen de SARG  que significa Search Argument 
 y se refiere a una clausula WHERE que compara una columna con una constante).*/
--sp_help 'tblproductos'

SET STATISTICS IO ON
SET STATISTICS TIME ON
--DROP INDEX IX_TBLVENTAS_NOM_PROD ON tblProductos
--CREATE INDEX IX_TBLVENTAS_NOM_PROD ON tblProductos (NOM_PROD) WITH (DROP_EXISTING=ON)
--SELECT * FROM tblProductos tp WITH(INDEX(IX_TBLVENTAS_NOM_PROD)) WHERE tp.NOM_PROD LIKE '%carne%'
SELECT * FROM tblProductos tp  WHERE tp.NOM_PROD LIKE 'carne%'
SELECT * FROM tblProductos tp  WHERE SUBSTRING(tp.NOM_PROD,1,5)='carne'

SET STATISTICS IO OFF
SET STATISTICS TIME OFF