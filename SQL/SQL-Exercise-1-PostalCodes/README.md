# SQL Exercise 1 — Postal Codes Mexico (CodigosPostalesMX)

Dataset: `CodigosPostalesMX` — tablas ESTADO, MUNICIPIO, ASENTAMIENTO, CIUDAD, TIPO_ASENTAMIENTO.

---

## Query 1 — Muestra todos los registros de la tabla ESTADO

```sql
select * from MEXICO_CP.ESTADO;
```

![Query 1](assets/query-01.png)

---

## Query 2 — Obtén solo los nombres de las ciudades de la tabla ESTADO

```sql
select ESTADO.name from MEXICO_CP.ESTADO;
```

![Query 2](assets/query-02.png)

---

## Query 3 — Lista todos los municipios

```sql
select MEXICO_CP.MUNICIPIO.name from MEXICO_CP.MUNICIPIO;
```

![Query 3](assets/query-03.png)

---

## Query 4 — Muestra todos los asentamientos con su código postal

```sql
select name, CODIGO_POSTAL from MEXICO_CP.ASENTAMIENTO;
```

![Query 4](assets/query-04.png)

---

## Query 5 — Filtra los asentamientos con código postal '01000'

```sql
select name, CODIGO_POSTAL
from MEXICO_CP.ASENTAMIENTO
where CODIGO_POSTAL = '01000';
```

![Query 5](assets/query-05.png)

---

## Query 6 — Muestra los municipios junto con el estado al que pertenecen

```sql
select e.name as 'Estado', m.name as 'Municipio'
from MEXICO_CP.ESTADO as e
inner join MEXICO_CP.MUNICIPIO as m on m.fk_ESTADO = e.id;
```

![Query 6](assets/query-06.png)

---

## Query 7 — Muestra los asentamientos junto con su municipio

```sql
select m.name as 'Municipio', a.name as 'Asentamiento'
from MEXICO_CP.ASENTAMIENTO as a
inner join MEXICO_CP.MUNICIPIO as m on a.fk_MUNICIPIO = m.id
order by m.id;
```

![Query 7](assets/query-07.png)

---

## Query 8 — Obtén el nombre del asentamiento y su tipo de asentamiento

```sql
select a.name as 'Asentamientos', t.name as 'Tipo de Asentamiento'
from MEXICO_CP.ASENTAMIENTO as a
inner join MEXICO_CP.TIPO_ASENTAMIENTO as t on t.id = a.fk_TIPO_ASENTAMIENTO;
```

![Query 8](assets/query-08.png)

---

## Query 9 — Muestra ciudad, municipio y estado en una sola consulta

```sql
select e.name as 'Estado', m.name as 'Municipio', c.name as 'Ciudad'
from MEXICO_CP.ESTADO as e
inner join MEXICO_CP.MUNICIPIO as m on m.fk_ESTADO = e.id
inner join MEXICO_CP.ASENTAMIENTO as a on m.id = a.fk_MUNICIPIO
inner join MEXICO_CP.CIUDAD as c on a.fk_CIUDAD = c.id;
```

![Query 9](assets/query-09.png)

---

## Query 10 — Lista todos los asentamientos que pertenecen a un municipio específico (id = 5)

```sql
select m.name as 'Municipio', a.name as 'Asentamiento al que pertenecen'
from MEXICO_CP.MUNICIPIO as m
inner join MEXICO_CP.ASENTAMIENTO as a on m.id = a.fk_MUNICIPIO
where a.fk_MUNICIPIO = 5;
```

![Query 10](assets/query-10.png)

---

## Query 11 — Cuenta cuántos municipios hay por estado

```sql
select e.name as 'Estado', Count(*) as 'Municipios por estado'
from MEXICO_CP.ESTADO as e
inner join MEXICO_CP.MUNICIPIO as m on m.fk_ESTADO = e.id
group by e.name;
```

![Query 11](assets/query-11.png)

---

## Query 12 — Cuenta cuántos asentamientos hay por municipio

```sql
select e.name as 'Estado', Count(*) as 'Municipios por Estado'
from MEXICO_CP.ESTADO as e
inner join MEXICO_CP.MUNICIPIO as m on m.fk_ESTADO = e.id
group by e.name;
```

![Query 12](assets/query-12.png)

---

## Query 13 — Muestra los estados que tienen más de 20 municipios

```sql
select e.name as 'Estado', Count(*) as 'Municipios por Estado'
from MEXICO_CP.ESTADO as e
inner join MEXICO_CP.MUNICIPIO as m on m.fk_ESTADO = e.id
group by e.name
having Count(*) >= 20;
```

![Query 13](assets/query-13.png)

---

## Query 14 — Obtén los municipios que tienen más de 50 asentamientos

```sql
select m.name as 'Municipios', Count(*) as 'Numero de Asentamientos'
from MEXICO_CP.MUNICIPIO as m
inner join MEXICO_CP.ASENTAMIENTO as a on m.id = a.fk_MUNICIPIO
group by m.name
having Count(*) >= 50;
```

![Query 14](assets/query-14.png)

---

## Query 15 — Lista los tipos de asentamiento y cuántos asentamientos hay de cada tipo

```sql
select [at].[name] as 'Tipos de Asentamientos', Count(*) as 'Asentamientos totales'
from MEXICO_CP.ASENTAMIENTO as a
inner join MEXICO_CP.TIPO_ASENTAMIENTO as [at] on a.fk_MUNICIPIO = at.id
group by [at].name;
```

![Query 15](assets/query-15.png)

---

## Query 16 — Muestra asentamiento, tipo, municipio, ciudad y estado en una sola consulta

```sql
select m.name as 'Municipio', [at].name as 'Tipo de Municipio',
       e.name as 'Estado', c.name as 'Ciudad'
from MEXICO_CP.ESTADO as e
inner join MEXICO_CP.MUNICIPIO as m on m.fk_ESTADO = e.id
inner join MEXICO_CP.ASENTAMIENTO as a on m.id = a.fk_MUNICIPIO
inner join MEXICO_CP.CIUDAD as c on a.fk_CIUDAD = c.id
inner join MEXICO_CP.TIPO_ASENTAMIENTO as [at] on a.fk_TIPO_ASENTAMIENTO = [at].id;
```

![Query 16](assets/query-16.png)

---

## Query 17 — Obtén los asentamientos cuyo código postal empiece con '44'

```sql
select a.name as 'Asentamiento', a.CODIGO_POSTAL as 'Codigo Postal'
from MEXICO_CP.ASENTAMIENTO as a
where a.CODIGO_POSTAL LIKE '44___';
```

![Query 17](assets/query-17.png)

---

## Query 18 — Muestra los municipios que pertenecen a un estado llamado 'Jalisco'

```sql
select e.name as 'Estado', m.name 'Municipio'
from MEXICO_CP.ESTADO as e
inner join MEXICO_CP.MUNICIPIO as m on m.fk_ESTADO = e.id
where e.name = 'Jalisco';
```

![Query 18](assets/query-18.png)

---

## Query 19 — Encuentra el estado con mayor número de municipios

```sql
select TOP 1 e.name as 'Estado', count(*) as 'Numero de Municipios'
from MEXICO_CP.ESTADO as e
inner join MEXICO_CP.MUNICIPIO as m on m.fk_ESTADO = e.id
group by e.name
order by count(*) DESC;
```

![Query 19](assets/query-19.png)

---

## Query 20 — Encuentra el municipio con mayor número de asentamientos

```sql
select top 1 m.name as 'Municipios', Count(*) as 'Numero de Asentamientos'
from MEXICO_CP.MUNICIPIO as m
inner join MEXICO_CP.ASENTAMIENTO as a on m.id = a.fk_MUNICIPIO
group by m.name
order by COUNT(*) desc;
```

![Query 20](assets/query-20.png)