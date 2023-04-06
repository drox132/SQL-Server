/*1.Optimizando Subconsulta*/
SET STATISTICS IO ON
SELECT tv.ID, 
	    tv.COD_SUC,
		ts.Sucursal,		
		tv.COD_DIA,
		tv.NUM_DOC, 
		tv.CONDICIONES, 
		tv.COD_ID,
		tc.Nombre		
FROM tblVentas tv INNER JOIN tblSucursales ts ON tv.COD_SUC = ts.COD_SUC COLLATE DATABASE_DEFAULT
     INNER JOIN tblClientes tc ON tv.COD_ID = tc.COD_ID COLLATE DATABASE_DEFAULT
SET STATISTICS IO ON