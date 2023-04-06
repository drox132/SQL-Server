/*1.Subconsultas*/
SET STATISTICS IO ON
SELECT tv.ID, 
	    tv.COD_SUC,
		(SELECT ts.Sucursal 
		FROM tblSucursales ts 
		WHERE ts.COD_SUC=tv.cod_suc 
		COLLATE DATABASE_DEFAULT ) AS SUCURSAL,
		tv.COD_DIA,
		tv.NUM_DOC, 
		tv.CONDICIONES, 
		tv.COD_ID,
		(SELECT tc.NOMBRE 
		FROM tblClientes tc 
		WHERE TC.COD_ID=TV.COD_ID) AS CLIENTE
FROM tblVentas tv
SET STATISTICS IO ON