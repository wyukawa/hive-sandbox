set hive.stats.autogather=false;
set hive.exec.parallel=true;

drop table choiki_name_table;

create table choiki_name_table (
  choiki_name string,
  sum int
);

drop table choson_name_table;

create table choson_name_table (
  choson_name string,
  sum int
);

drop table todoufuken_name_table;

create table todoufuken_name_table (
  todoufuken_name string,
  sum int
);

from
 (
  select
    choiki_name,
    choson_name,
    todoufuken_name
  from
    postdata
 )tab

insert overwrite table choiki_name_table
select
  choiki_name,
  count(1)
group by choiki_name

insert overwrite table choson_name_table
select
  choson_name,
  count(1)
group by choson_name

insert overwrite table todoufuken_name_table
select
  todoufuken_name,
  count(1)
group by todoufuken_name
