
use CodigosPostalesMX;

-- 1. Muestra todos los registros de la tabla estado.

select * from MEXICO_CP.ESTADO;

-- 2. Obtén solo los nombres de las ciudades de la tabla estados.

select ESTADO.name from MEXICO_CP.ESTADO;

-- 3. Lista todos los municipios.

select MEXICO_CP.MUNICIPIO.name from MEXICO_CP.MUNICIPIO;

-- 4. Muestra todos los asentamientos con su código postal.

select name, CODIGO_POSTAL from MEXICO_CP.ASENTAMIENTO;

-- 5. Filtra los asentamientos con código postal '01000'.

select 
name, 
CODIGO_POSTAL 
from MEXICO_CP.ASENTAMIENTO
where CODIGO_POSTAL = '01000';

-- 6. Muestra los municipios junto con el estado al que pertenecen.
select * from MEXICO_CP.ESTADO;
select * from MEXICO_CP.MUNICIPIO;

select 
e.name as 'Estado',
m.name as 'Municipio'
from 
MEXICO_CP.ESTADO as e
inner join
MEXICO_CP.MUNICIPIO as m
on m.fk_ESTADO = e.id;

-- 7. Muestra los asentamientos junto con su municipio.

select * from MEXICO_CP.ASENTAMIENTO;
select * from MEXICO_CP.MUNICIPIO;

select 
m.name as 'Municipio',
a.name as 'Asentamiento'
from
MEXICO_CP.ASENTAMIENTO as a
inner join
MEXICO_CP.MUNICIPIO as m
on a.fk_MUNICIPIO = m.id
order by m.id;

-- 8. Obtén el nombre del asentamiento y su tipo de asentamiento.

select * from MEXICO_CP.ASENTAMIENTO;
select * from MEXICO_CP.TIPO_ASENTAMIENTO;

select
a.name as 'Asentamientos',
t.name as 'Tipo de Asentamiento'
from
MEXICO_CP.ASENTAMIENTO as a
inner join
MEXICO_CP.TIPO_ASENTAMIENTO as t
on t.id = a.fk_TIPO_ASENTAMIENTO;


select * from MEXICO_CP.ESTADO;
select * from MEXICO_CP.MUNICIPIO;
select * from MEXICO_CP.ASENTAMIENTO
select * from MEXICO_CP.CIUDAD;
-- 9. Muestra ciudad, municipio y estado en una sola consulta.
select 
e.name as 'Estado',
m.name as 'Municipio',
c.name as 'Ciudad'
from 
MEXICO_CP.ESTADO as e
inner join 
MEXICO_CP.MUNICIPIO as m
on m.fk_ESTADO = e.id 
inner join
MEXICO_CP.ASENTAMIENTO as a
on m.id = a.fk_MUNICIPIO
inner join 
MEXICO_CP.CIUDAD as c
on a.fk_CIUDAD = c.id;


-- 10. Lista todos los asentamientos que pertenecen a un municipio específico (por ejemplo id = 5).

select
m.name as 'Municipio',
a.name as 'Asentamiento al que pertenecen'
from 
MEXICO_CP.MUNICIPIO as m
inner join
MEXICO_CP.ASENTAMIENTO as a
on m.id = a.fk_MUNICIPIO
where a.fk_MUNICIPIO = 5;

-- 11. Cuenta cuántos municipios hay por estado.

select 
e.name as 'Estado',
Count(*) as 'Municipios por estado'
from 
MEXICO_CP.ESTADO as e
inner join 
MEXICO_CP.MUNICIPIO as m
on m.fk_ESTADO = e.id
group by e.name;

-- 12. Cuenta cuántos asentamientos hay por municipio.

select 
e.name as 'Estado',
Count(*) as 'Municipios por Estado'
from 
MEXICO_CP.ESTADO as e
inner join 
MEXICO_CP.MUNICIPIO as m
on m.fk_ESTADO = e.id
group by e.name;

-- 13. Muestra los estados que tienen más de 20 municipios.

select 
e.name as 'Estado',
Count(*) as 'Municipios por Estado'
from 
MEXICO_CP.ESTADO as e
inner join 
MEXICO_CP.MUNICIPIO as m
on m.fk_ESTADO = e.id
group by e.name
having Count(*) >= 20;

-- 14. Obtén los municipios que tienen más de 50 asentamientos.

select 
m.name as 'Municipios',
Count(*) as 'Numero de Asentamientos'
from 
MEXICO_CP.MUNICIPIO as m
inner join
MEXICO_CP.ASENTAMIENTO as a
on m.id = a.fk_MUNICIPIO
group by m.name
having Count(*) >=50;

-- 15. Lista los tipos de asentamiento y cuántos asentamientos hay de cada tipo.

-- select * from MEXICO_CP.ASENTAMIENTO
-- select * from MEXICO_CP.TIPO_ASENTAMIENTO

select 
[at].[name] as 'Tipos de Asentamientos',
Count(*) as 'Asentamientos totales'
from
MEXICO_CP.ASENTAMIENTO as a
inner join
MEXICO_CP.TIPO_ASENTAMIENTO as [at]
on a.fk_MUNICIPIO = at.id
group by [at].name;

-- 16. Muestra asentamiento, tipo, municipio, ciudad y estado en una sola consulta.

select 
m.name as 'Municipio',
[at].name as 'Tipo de Municipio',
e.name as 'Estado',
c.name as 'Ciudad'
from 
MEXICO_CP.ESTADO as e
inner join 
MEXICO_CP.MUNICIPIO as m
on m.fk_ESTADO = e.id 
inner join
MEXICO_CP.ASENTAMIENTO as a
on m.id = a.fk_MUNICIPIO
inner join 
MEXICO_CP.CIUDAD as c
on a.fk_CIUDAD = c.id
inner join MEXICO_CP.TIPO_ASENTAMIENTO as [at]
on a.fk_TIPO_ASENTAMIENTO = [at].id;

-- 17. Obtén los asentamientos cuyo código postal empiece con '44'.

select 
a.name as 'Asentamiento',
a.CODIGO_POSTAL as 'Codigo Postal'
from 
MEXICO_CP.ASENTAMIENTO as a
where a.CODIGO_POSTAL LIKE '44___';

-- 18. Muestra los municipios que pertenecen a un estado llamado 'Jalisco'.

-- select * from MEXICO_CP.MUNICIPIO

select 
e.name as 'Estado',
m.name 'Municipio'
from 
MEXICO_CP.ESTADO as e
inner join 
MEXICO_CP.MUNICIPIO as m
on m.fk_ESTADO = e.id
where e.name = 'Jalisco';


-- 19. Encuentra el estado con mayor número de municipios.
-- select * from MEXICO_CP.ESTADO
-- select * from MEXICO_CP.MUNICIPIO

select TOP 1
e.name as 'Estado',
count(*) as 'Numero de Municipios'
-- max(count(fk_ESTADO))
from 
MEXICO_CP.ESTADO as e
inner join 
MEXICO_CP.MUNICIPIO as m
on m.fk_ESTADO = e.id
group by e.name
order by count(*) DESC
-- having Count(*) = MAX(COUNT(*));

-- 20. Encuentra el municipio con mayor número de asentamientos y muestra su nombre junto con el total.


select top 1
m.name as 'Municipios',
Count(*) as 'Numero de Asentamientos'
from 
MEXICO_CP.MUNICIPIO as m
inner join
MEXICO_CP.ASENTAMIENTO as a
on m.id = a.fk_MUNICIPIO
group by m.name
order by COUNT(*) desc;