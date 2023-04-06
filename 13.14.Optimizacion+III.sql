/*1.Comparativo Compresion por Prederterminado , Fila y Pagina*/

USE [BDVentas]
ALTER TABLE [dbo].[tblVentas] REBUILD PARTITION = ALL
WITH 
(DATA_COMPRESSION = none
)
GO


ALTER TABLE [dbo].[tblVentas_dETALLE] REBUILD PARTITION = ALL
WITH 
(DATA_COMPRESSION = none
)
GO
sp_spaceused 'tblventas'
GO
sp_spaceused 'tblventas_detalle'