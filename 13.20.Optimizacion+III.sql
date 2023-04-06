/*1.Lecturas L�gicas*/
SET STATISTICS IO ON
SET STATISTICS TIME ON
SET DATEFORMAT DMY;
--https://miblogtecnico.wordpress.com/tag/fill-factor/
--sp_help 'tblventas_detalle'
--DROP INDEX IX_TBLVENTAS_DETALLE_ID ON TBLVENTAS_DETALLE
--CREATE nonCLUSTERED  INDEX IX_TBLVENTAS_DETALLE_ID ON TBLVENTAS_DETALLE(ID) INCLUDE(CANTIDAD,VALOR,COSTO) WITH(DATA_COMPRESSION=PAGE)
SELECT P.ANNO, ISNULL(P.[1-ENERO],0) AS [1-ENERO], P.[2-FEBRERO], P.[3-MARZO], 
       P.[4-ABRIL], P.[5-MAYO], P.[6-JUNIO],
	   P.[7-JULIO], P.[8-AGOSTO], P.[9-SEPTIEMBRE], 
	   P.[10-OCTUBRE], P.[11-NOVIEMBRE], P.[12-DICIEMBRE]
FROM(
			SELECT year(tv.fecha) AS ANNO,
				   CAST(MONTH(TV.FECHA) AS varchar(10)) + '-'+ DATENAME(mm,tv.FECHA) AS MES,
				   SUM(tvd.CANTIDAD*tvd.valor-tvd.CANTIDAD*tvd.COSTO) AS TOTALUTILIDAD
			from tblVentas tv 
				 INNER JOIN
			   tblVentas_Detalle tvd  ON tv.ID = tvd.ID
			WHERE TV.FECHA BETWEEN '01/01/2014' AND '31/12/2015'
			GROUP BY year(tv.fecha),MONTH(TV.FECHA),DATENAME(mm,tv.FECHA)
	) S
	PIVOT
	(
	     SUM(S.TOTALUTILIDAD) FOR S.MES IN ([1-ENERO],[2-FEBRERO],[3-MARZO],
                                          [4-ABRIL],[5-MAYO],[6-JUNIO],
                                          [7-JULIO],[8-AGOSTO],[9-SEPTIEMBRE],
                                          [10-OCTUBRE],[11-NOVIEMBRE],[12-DICIEMBRE])
	) AS P
	
	SET STATISTICS IO OFF
	SET STATISTICS TIME OFF
