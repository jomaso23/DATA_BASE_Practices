use pubs;

describe authors;
-- Querys y consultas
-- listar nobre, apellido y telefono de todoos los autores de california

select 
au_fname as nombre, 
au_lname as apellido,
phone as cuernofono, 
city as 'los pagos',
state  as 'de donde so?'  
from authors
where state = 'ca';


-- listar los titulos de cocina que fueroo publicao en 1990

select *from titles;

select*from titles
where type like '%cook%' and  year(pubdate) = 1990 and month(pubdate)  between 1 and 6;

-- listar los datos de los 5 empledos de mayor antiguedad
select*from employee;

select*from employee
 order by hire_date  asc
limit 5;


-- 6

select 
emp_id as 'Numero de empleado',
concat(fname, ' ',lname) as 'nombre empleado',
hire_date as 'fecha de ingreso',
pub_id as 'ID_publicacion'
from employee
where pub_id=877;



-- 7. Mostrar el título, precio bruto y precio con IVA de los libros. Ninguna columna debe contener valores nulos.
 -- las columnas deben estar apodadas por las siguientes palabras: Título, Precio y Precio lVA.

select *from titles;

select
title as titulo,
price as precio,
round(price*1.21, 2) as 'precio con iva'
from titles
where price is not null;

-- 8.  Mostrar los tipos de libros existentes.

select
type  
from titles;

-- 9. Listar los países de residencia de las editoriales. Evitar las repeticiones. 

select *from publishers;

select
distinct country 
from publishers;

-- 10. Listar las ciudades y estados de residencia de los autores. Evitar las repeticiones.

select*
from authors;

select 
distinct  state,
concat(au_fname,' ',au_lname)as autor,
city
from authors;


 
-- 11.   Listar todos los empleados de la editorial número 877. Ordenar por  
   -- nivel de trabajo descendente y por fecha de incorporación ascendente.

use pubs;
select*from employee;

select
concat(fname, ' ',lname) as autor,
job_lvl,
pub_id,
hire_date
from employee
where pub_id = 877
order by job_lvl desc,hire_date asc;


-- 12. Listar el número, apellido, nombre y teléfono de los autores que NO    
-- tengan contrato y que su estado de residencia sea California (CA).  
select*from authors;

select
concat(au_fname,' ',au_lname) as autores,
phone,
contract
from authors
where contract = 1;

-- 13. Listar los empleados cuyo año de incorporación fue 1990 y cuyo nivel  de trabajo esté entre 100 Y 200.

select
concat(fname, ' ',lname) as autor,
job_lvl,
pub_id,
hire_date 
from employee
where job_lvl  between 100 and 200 and year(hire_date)=1990 ;


-- 14. Listar los libros vendidos cuya condición 
-- de pago es sobre facturación y cuya cantidad
-- de venta esté entre 13 y 40. No utilizar el operador BETWEEN.

select*from titles;

select
stor_id,
qty,
payterms
from sales
where payterms  like '%Net 30%' or '%Net 60%' and qty >13 and qty<40 ;



-- 15.Listar número y nombre de las editoriales cuyo estado de residencia contenga valor nulo. 


select

pub_name,
state
from publishers
where state is null;

-- 16.Listar el título y precio de los libros de cocina cuyo 
-- título no figure la palabra "sushi". Ordenar por precio descendente.

select
title,
price,
type
from titles
where type  like '%cook%' and title not like '%sushi%'   order by price desc;

-- 17. Listar todos los empleados cuyo nombre empiece con la letra P y termine con la letra O, y su apellido termine con la letra O. 

select
fname,
lname
from employee
where fname like 'p%o' and lname like '%o' ;


-- 18. Listar todos los autores cuya dirección termine con un número y que la segunda letra de su apellido sea R

select

concat(au_fname,' ',au_lname) as autores,
address
from authors
where address rlike'[0-9]$' and au_lname like '_r%';


-- 19.Mostrar todos los empleados cuyo nombre empiece con la letra P ó A. 
-- La segunda letra no sea A y la última letra esté entre la H y la Z.
select

concat(fname,' ',lname) as empleados


from employee
where fname rlike '^[p,a][^a].*[h-z]$';

-- 20.  Listar todas las facturas que su condición de pago es a 30 días que hayan facturado durante el año 1992 y 1993 ó 
-- los que su condición de pago es a 60 días que han facturado durante el segundo semestre del año 1994. Ordenar la consulta 
-- por código de libro.


select
title_id,
ord_date,
payterms,
stor_id
from sales
where payterms like 'Net 30' and year(ord_date) 
 between 1992 and 1993 or payterms like 'Net 60' 
 and year(ord_date) = 1994 and month(ord_date) between 6 and 12  order by stor_id desc;
 
-- 21. Contar la cantidad de autores que su estado de residencia sea California (CA). Poner un apodo al nombre de columna.
select*from authors; 
select count(state) as cantidad,
concat(au_fname,'  ',au_lname) as autores,
state 
from authors
where state like 'CA';


-- 22. Mostrar la fecha de inicio de facturación y el último número de comprobante emitido. Poner un apodo a cada columna.

select
max(ord_num) 'ultimo comprobante',
min(ord_date) ' inicio de facturacion' 
from sales;
 
-- 23.  Contar la cantidad de países que residen alguna editorial.
select  count(distinct country) paises
from publishers;
 
-- 24. Listar las categorías de libros y el valor promedio para cada tipo de libro.

select 
 type categoria,
 avg(price) promedio
from titles
 group by categoria;
 
-- 25. ldem ejercicio 24 pero no incluir dentro de la lista los libros que no tienen decidida una categoría.

select*from titles;
select 
 type categoria,
 avg(price) promedio
from titles
where type is not null
 group by categoria;

 use pubs;
 
-- 26.  Listar los locales que hayan vendido más de 100 libros.
-- la cantidad de libros que me dice buscar excede todas las ventas que hay en la tabla.
select 
stor_id,
ord_num,
qty
from sales
where qty > 10;

 
-- 27. Listar la cantidad de ejemplares vendidos de cada libro en cada tienda. Poner apodos a las columnas. 
