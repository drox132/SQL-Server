/*se pueden tomar los siguientes valores:

Si está fragmentado menos de un 10% no es necesario hacer nada.
Si está fragmentado entre un 10% y un 30% es mejor reoganizar el índice
Si está fragmentado más de un 30% es mejor reconstruir el índice*/

select CURRENT_TIMESTAMP as Fecha,
        DB_NAME(db_id()) as DatabaseName,
	    @@servername Servidor, 
		b.name as IndexName, 
		obj.name as ObjectName,
        a.avg_fragmentation_in_percent as '%Frag', 
	    a.page_count as NumeroPaginas ,
	    a.fragment_count as PromPagFrag,
		a.index_type_desc as TipoIndice,
        a.avg_fragment_size_in_pages,
		a.partition_number
FROM  sys.dm_db_index_physical_stats(db_id(), NULL, NULL, NULL, 'limited') as a
      INNER JOIN sys.indexes as b
      ON a.object_id = b.object_id AND a.index_id = b.index_id
      INNER JOIN sys.objects as Obj
ON  a.object_id = Obj.object_id

--ALTER INDEX PK_Grupos_COD_GRUP ON TBLGRUPOS REBUILD
--ALTER INDEX PK_Clientes_COD_ID ON tblClientes REORGANIZE