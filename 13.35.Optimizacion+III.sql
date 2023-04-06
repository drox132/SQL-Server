/*1.Borrar los Indices que no se Ocupan*/
select
  object_name(i.id) as Tabla,
  case i.indid
    when 0 then N'HEAP'
    else i.name
  end as Indice,
  i.Indid,
  i.rowcnt,
  i.dpages * 8/(1024.0) as Tamaño,
  i.*--i.type_desc as Tipo
  ,u.*
  , 'drop index [' + object_name(i.id) + '].[' +
  case i.indid when 0 then N'HEAP' else i.name end +']' as Borrado
from
  sysindexes i with(nolock) inner join
  sys.objects o with(nolock) on i.id = o.object_id left join
  sys.dm_db_index_usage_stats u with(nolock) 
     on i.id = u.object_id and i.indid = u.index_id and u.database_id = db_id()
where 
  o.type = 'u' and i.status & 64 = 0 and i.indid > 1 and
 --u.object_id is null and i.type_desc = 'NONCLUSTERED' and
  (u.user_seeks = 0 and u.user_scans = 0 or u.object_id is null)
order by i.dpages desc, Tabla, i.Indid

