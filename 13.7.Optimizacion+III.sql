/*1.Uso de Sentry Plan Explorer*/

--DROP INDEX IX_TBLVENTAS_NOM_PROD ON tblProductos
--CREATE INDEX IX_TBLVENTAS_NOM_PROD ON tblProductos (NOM_PROD)  WITH (DROP_EXISTING=ON)
SELECT * FROM tblProductos tp  WHERE tp.NOM_PROD LIKE 'carne%'
