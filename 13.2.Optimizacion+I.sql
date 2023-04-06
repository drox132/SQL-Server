/*1.Optimizar La busqueda A través de indices del campo NOM_PROD de la tabla tblProductos*/
--sp_help 'tblproductos'

SET STATISTICS IO ON

--CREATE INDEX IX_TBLVENTAS_NOM_PROD ON tblProductos (NOM_PROD)
SELECT * FROM tblProductos tp  WHERE tp.NOM_PROD LIKE '%carne%'

SET STATISTICS IO OFF