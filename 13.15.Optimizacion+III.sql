/*1.Comparativo Compresion por Prederterminado , Fila y Pagina*/

USE [BDVentas]
ALTER TABLE [dbo].[tblVentas] REBUILD PARTITION = ALL
WITH 
(DATA_COMPRESSION = row
)
GO


ALTER TABLE [dbo].[tblVentas_dETALLE] REBUILD PARTITION = ALL
WITH 
(DATA_COMPRESSION = row
)
GO
sp_spaceused 'tblventas'
GO
sp_spaceused 'tblventas_detalle'

--Se disminuyo en 18%