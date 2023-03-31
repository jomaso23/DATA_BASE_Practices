/*
1 - Basándose en la tabla productos obtener los siguientes listados.
a- artículos con precio mayor a 100
b- artículos con precio entre 20 y 40 (usar < y >)
c- artículos con precio entre 40 y 60 (usar BETWEEN)
d- artículos con precio = 20 y stock mayor a 30
e- artículos con precio (12,20,30) no usar IN
f- artículos con precio (12,20,30) usar el IN
g- artículos que su precio no sea (12,20,30)
*/

use negocio;
select * from productos;
 

select *
from productos
	-- PUNTO A
-- where precio >100;

	-- PUNTO B 
-- where precio > 20 and precio < 40 ;

	-- PUNTO C 
-- where precio between 40 and 60;

	-- PUNTO D 
-- where precio= 20 and stock > 30;

	-- PUNTO E 
-- where precio =12 or precio = 20 or precio = 30;    

	-- PUNTO F 
 -- where precio in(12, 20, 30);
 
	-- PUNTO G 
  where precio not  in(12, 20, 30);
 
 
 /*
 2- Listar los artículos ordenados por precio de mayor a menor,
 y si hubiera precio iguales deben quedar ordenados por nombre.

 */
 
 select *
 
 from productos
 
 order by 3 desc, 2 ;
 
 
 
 /*
 3- Listar todos los artículos incluyendo una columna denominada precio con IVA,
 la cual deberá tener el monto con el iva del producto.
 */
 
 select  
		idproducto,
        articulo,
        1.21 as IVA,
        precio,
        precio *1.21 as 'PRECIO CON IVA',
        marca,
        stock,
        color,
        talle
 from productos;
 
 /*
 4- Listar todos los artículos incluyendo una columna denominada “cantidad de cuotas” y otra “valor de cuota”,
 la cantidad es fija y es 3, el valor de cuota corresponde a 1/3 del monto con un 5% de interés. 
 */
 
 select
 
	 articulo,
	 3 as 'cantidad de cuotas',
     precio,
	 precio*(1/3) as 'valor de cuota',
 
 from productos;
  
