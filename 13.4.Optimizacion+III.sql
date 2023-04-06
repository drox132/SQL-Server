/*1.Optimizar La busqueda A través de indices del campo NOM_PROD de la tabla tblProductos,
 Plan de Ejecución*/
--sp_help 'tblproductos'

SET STATISTICS IO ON
SET STATISTICS TIME ON
--DROP INDEX IX_TBLVENTAS_NOM_PROD ON tblProductos
--CREATE INDEX IX_TBLVENTAS_NOM_PROD ON tblProductos (NOM_PROD) WITH (DROP_EXISTING=ON)
--SELECT * FROM tblProductos tp WITH(INDEX(IX_TBLVENTAS_NOM_PROD)) WHERE tp.NOM_PROD LIKE '%carne%'
SELECT * FROM tblProductos tp  WHERE tp.NOM_PROD LIKE 'carne%'

SET STATISTICS IO OFF
SET STATISTICS TIME OFF