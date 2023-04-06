/*1.Comparativo Compresion por Prederterminado , Fila y Pagina*/

USE [BDVentas]
ALTER TABLE [dbo].[tblVentas] REBUILD PARTITION = ALL
WITH 
(DATA_COMPRESSION = page
)
GO


ALTER TABLE [dbo].[tblVentas_dETALLE] REBUILD PARTITION = ALL
WITH 
(DATA_COMPRESSION = page
)

GO
sp_spaceused 'tblventas'
GO
sp_spaceused 'tblventas_detalle'

--se disminuyo en 66%