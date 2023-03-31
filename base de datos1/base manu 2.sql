use negocio;

/*
de  la tabla productos elija de la columna articulo todo los elementos menos el pantalon,
cuyo precio este ordenado de forma
descendente y los articulos de forma ascendente alfabeticamente
y se limite a mostrarme solo 5 articulos.
*/

select articulo, marca, precio, stock
from productos
-- where articulo not like '%pantalon%'
where articulo not in ('pantalon') -- expresion equivivalente a la de arriba
order by 3 desc, 1 -- en esta ultima parte por defecto esta de forma ascendente.
limit 2, 3;

-- lstar todas las ventas del 2017
describe facturas;

-- de la tabla facturas solicitar los elementos  del 2017 entre los meses 7 y 12
select  *
from facturas
-- where  fecha between '2017-01-01' and '2017-12-31';
-- where year(fecha) = 2017;
-- order by 3;
	where not year(fecha) between 2010 and 2015 and month(fecha) between 7 and 12;

-- listar todos los prodcutos de la marca nike o zara o adidas
describe productos;
select * 
from productos
-- where articulo not like '%zara%', '%adidas%' , '%adidas%'
-- where marca in('Adidas', 'Nike', 'Zara');
where marca not in('Adidas', 'Nike', 'Zara');

select *
from clientes 
-- where nombre like 'a%';
where nombre rlike '^a';
-- % es un comodin que me indica qeu un palabra debe empezar con esa letra y  devuelva hasa N caracteres
-- ^ indic que una expresion con un caracter o conjunto de cracteres
-- listar clientes cuyo nombre empiece con a o m 
select *
from clientes
-- where nombre rlike '^[a,m]';
where nombre not rlike '^[a,m]';


-- decir enunciado

select *
 from clientes
 -- where apellido rlike '^[^j-z]'; -- ningun crter que estte entre j y z
 where apellido rlike '^[a-i]';-- expresion equivalente a la de arriba
