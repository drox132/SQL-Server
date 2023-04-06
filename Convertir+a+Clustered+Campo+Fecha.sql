USE [BDVentas]
GO
sp_help 'tblventas'
go
sp_help 'tblventas_detalle'
GO

ALTER TABLE tblVentas_Detalle DROP CONSTRAINT FK_tblVentas_Detalle_tblVentas
GO
ALTER TABLE tblVentas DROP CONSTRAINT PK_Ventas_ID
GO
ALTER TABLE tblVentas ADD  CONSTRAINT PK_Ventas_ID PRIMARY KEY NONCLUSTERED (ID)
GO
CREATE CLUSTERED INDEX  IX_Ventas_Fecha ON tblVentas (FECHA)
GO
ALTER TABLE tblVentas_Detalle  ADD CONSTRAINT FK_tblVentas_Detalle_tblVentas FOREIGN KEY(ID)
REFERENCES tblVentas (ID)

