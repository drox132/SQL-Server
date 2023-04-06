/*1.Saber los Indices que se necesita*/
select
db_name(d.database_id) as DB,
object_name(d.object_id, d.database_id) tabla,
s.avg_user_impact, s.user_seeks,
d.equality_columns, d.inequality_columns, d.included_columns,
p.row_count, l.num_esperas, l.ms_esperas, s.last_user_seek,
create_index = replace('create nonclustered index IX_' +
object_name(d.object_id, d.database_id) +'_A# on ' +
object_name(d.object_id, d.database_id) + ' (' +
isnull(d.equality_columns + ',', '') + isnull(d.inequality_columns, '') + ') ' +
isnull('include (' + d.included_columns + ')', '') +
' with(online = on)', ',)', ')')
from
sys.dm_db_missing_index_details d left join
sys.dm_db_missing_index_groups g on d.index_handle =g.index_handle left join
sys.dm_db_missing_index_group_stats s on g.index_group_handle = s.group_handle left
join
sys.dm_db_partition_stats p on d.object_id = p.object_id and p.index_id < 2 left join
(select
database_id,
object_id,
row_number() over (partition by database_id
order by sum(page_io_latch_wait_in_ms) desc) as row_number,
sum(page_io_latch_wait_count) as num_esperas,
sum(page_io_latch_wait_in_ms) as ms_esperas,
sum(range_scan_count) as range_scans,
sum(singleton_lookup_count) as index_lookups
from sys.dm_db_index_operational_stats(NULL, NULL, NULL, NULL)
where page_io_latch_wait_count > 0
group by database_id, object_id) l
on d.object_id = l.object_id and d.database_id = l.database_id
where
d.database_id = db_id()
and s.last_user_seek > dateadd(dd, -7, getdate())
order by --floor(s.avg_user_impact) desc,
s.user_seeks desc
