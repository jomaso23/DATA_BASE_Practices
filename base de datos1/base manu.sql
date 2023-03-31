-- comentario de linea

/*
  este es un cometario de bloque
  doid edit
*/
-- esta sentencias selecciona la base de datos sobre la que quiero hacer cosultas
use negocio;
use test;

-- veo las tablas de la base seleccionada

show tables;

-- veo la estrucutura de la tabla clientes
describe clientes;

-- Query(cosultas)
-- en cada tabla el ultimo icono de la derecha podemos ver lo que tiene adentro

select*from clientes;
-- forma de llamar solamente los campos que quiero de una tabla
select nombre, apellido, email from clientes;

select  21 as IVA, -- alias  o titulo de la columna
		'esto es un comentario' as NOTAS,
		articulo,
        precio,
		precio * 1.21 as 'PRECIO CON IVA',
        marca,
        stock
from productos;

-- FILTRO DE REGISTROS
/*
operadores aritmeticos: + - * /
operadoress relacionaes: < > <= >= (!= <>)
operadores logicos: and or not
operador de rango: between(un valor entre dos valores incluye extremos)
operador de lista: in
operador de similitud: like  o  rlike
*/

-- buscamos list de precios cuyo valor sea mayor a 50$

-- select * from productos
-- where precio > 50;
-- select * from productos
-- where color = 'azul'; 

-- listar productos cuyo precio ese entre 100$ y 150$ blue
/*
select *from productos

where precio not between 100 and 150;
*/

-- listar ventas del año 2017

select*from facturas
-- where fecha between '2017-01-01' and '2017-12-31';
-- where fecha rlike '2017';
where year(fecha) = 2017 and month(fecha) between 7 and 12;

-- listra los productos cuyo precio sea de 100 o 120 o 200;

select * from productos
-- where precio = 100 or precio = 120 or precio = 200; -- forma extendida de escribir hay una fom mas corta
 -- where  precio in(100,120,200);
where  precio not  in(100,120,200); -- el complemeto de anterior


-- lista nombre de clientes que empiece com M
-- y termine con Z
select * from clientes -- siempre despues de un like van  ''
where nombre like'm%';
select * from clientes 
where nombre rlike'^m';-- esta expresion es qeuivalente a la anterior

select * from clientes
where apellido like'%z';
select * from clientes 
where apellido rlike'z$';


select * from clientes -- siempre despues de un like van  ''
where nombre like'm%a'; -- el % me permite indicar que me devuelva la cantidad de caracteres indeterminadao y es ua restriccio adicional que me dice, que empiece con m y termine con a
select * from clientes 
where nombre rlike'^m.*a$'; -- expresion equivalente ala anterior con rlike


-- listar el nombre de los clintes que empiece co m, el
-- segundo caracter no importe, el tercder caracter
-- sea una r y no importe como termine

select * from clientes where  nombre like 'm_r%'; -- con cada guion voy saltando caracteres