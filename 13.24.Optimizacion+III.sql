/*1.Estadísticas SQL SERVER*/

DBCC SHOW_STATISTICS ('tblproductos','IX_TBLVENTAS_NOM_PROD') with stat_header

DBCC SHOW_STATISTICS ('tblproductos','IX_TBLVENTAS_NOM_PROD') with density_vector

update STATISTICS tblproductos with fullscan