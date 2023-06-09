SET STATISTICS IO ON
SET STATISTICS TIME ON
--CREATE COLUMNSTORE INDEX IX_tblVentas_Detalle ON tblVentas_Detalle([ID],[COD_PROD],[NUM_LIN],[CANTIDAD],[COSTO],[VALOR])
SELECT V.*
FROM (
		SELECT ts.Sucursal, tv.COD_DIA, tv.NUM_DOC, tv.FECHA,
				tc.NOMBRE AS Cliente, tz.ZONA, tv2.NOM_VEND, tvd.COD_PROD, 
				tp.NOM_PROD, tl.NOM_LIN, tg.NOM_GRUP, tvd.CANTIDAD,
				TotalVenta = tvd.CANTIDAD*tvd.VALOR,
				TotalCosto = tvd.CANTIDAD*tvd.COSTO,
				TotalUtilidad = tvd.CANTIDAD*tvd.VALOR*tvd.CANTIDAD*tvd.COSTO
		FROM dbo.tblVentas AS tv
		INNER JOIN 
		dbo.tblVentas_Detalle AS tvd 
		ON tvd.ID = tv.ID COLLATE DATABASE_DEFAULT
		INNER JOIN
		dbo.tblClientes AS tc
		ON tc.COD_ID = tv.COD_ID COLLATE DATABASE_DEFAULT
		INNER JOIN
		dbo.tblProductos AS tp
		ON tp.COD_PROD = tvd.COD_PROD COLLATE DATABASE_DEFAULT
		INNER JOIN
		dbo.tblLineas AS tl
		ON tl.COD_LIN = tp.COD_LIN COLLATE DATABASE_DEFAULT
		INNER JOIN
		dbo.tblGrupos AS tg
		ON tg.COD_GRUP = tp.COD_GRUP COLLATE DATABASE_DEFAULT
		INNER JOIN
		dbo.tblZonas AS tz
		ON tz.COD_ZON = tc.COD_ZON
		INNER JOIN
		dbo.tblSucursales AS ts
		ON ts.COD_SUC = tv.COD_SUC COLLATE DATABASE_DEFAULT
		INNER JOIN
		dbo.tblVendedores AS tv2
		ON tv2.COD_VEND = tc.COD_VEND COLLATE DATABASE_DEFAULT
		WHERE tv.FECHA BETWEEN'20130101' AND '20191103'
) v 
WHERE v.COD_PROD IN ('CETOLA','CEVILLA','GATO20')
SET STATISTICS TIME ON
SET STATISTICS IO OFF