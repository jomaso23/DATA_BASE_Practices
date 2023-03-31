use pubs;

-- clausula distinct
select * from publishers;

-- listar los paises en los cuales hay editoriales
select country from publishers;

-- evita las repeticiones de un campo
select distinct country from publishers;
select distinct(country) from publishers;

