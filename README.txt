1) Clientes con reservas activas.
select c.Nombre,c.Apellido,v.Codigo,v.Fecha_vuelo from cliente c, tarjeta_embarque te,vuelo v where te.Codigo_vuelo=v.Codigo AND te.DPI_cliente=c.DPI And v.Fecha_vuelo >= NOW();

2) Clientes que viajan a un aeropuerto en una fecha específica.
ESTE ESTA MALO XDXD PUSE codigo de vuelo y es fecha
SELECT `Nombre` FROM `aviteca`.`cliente` c INNER JOIN `aviteca`.`tarjeta_embarque` t  WHERE t.`DPI_cliente` = c.`DPI` AND t.`Codigo_vuelo` = 'VUL-1';
Este es el bueno
SELECT c.Nombre FROM cliente c , tarjeta_embarque t, vuelo v, aeropuerto a  WHERE t.DPI_cliente = c.DPI AND t.Codigo_vuelo = v.Codigo AND v.Aeropuerto_entrada = a.Codigo AND a.pais = 'Guatemala' AND v.Fecha_vuelo = '2020-01-01';

3) Porcentaje de ocupación diario de los aviones seleccionados en un intervalo de tiempo.

select a.codigo,count(*) as asientos_ocupados, acl.total_asientos, (count(*)/acl.total_asientos)*100 as porcentaje
from avion a, piso p,reserva_viaje r,asiento s,(select codigo_avion, sum(Cantidad_asientos) as total_asientos from avion_clase group by codigo_avion) acl
WHERE
 r.Codigo_asiento =s.codigo AND
s.Codigo_piso = p.codigo AND
p.Codigo_avion = a.codigo AND 
a.codigo = acl.codigo_avion AND
r.Fecha_reserva BETWEEN ' 2020-01-01' AND ' 2020-11-04'
GROUP BY a.codigo;


4) Los 10 aviones que más viajes han realizado a un país en específico.
SELECT `Codigo_Avion`, count(`Codigo_Avion`) AS 'veces' FROM `aviteca`.`vuelo` GROUP BY (`Codigo_Avion`) LIMIT 10;


5) La clase más ocupada en un intervalo de tiempo según el país de destino.
SELECT cl.Nombre, COUNT(cl.Nombre) FROM clase cl, asiento asi, reserva_viaje r, tarjeta_embarque t, vuelo v, aeropuerto a where cl.Codigo = asi.Codigo_clase AND asi.Codigo = r.Codigo_asiento AND t.ID = r.Codigo_tarjeta AND t.Codigo_vuelo = v.Codigo AND a.Codigo = v.Aeropuerto_entrada AND a.pais = 'Guatemala' GROUP BY (cl.Nombre) LIMIT 1;

PRUEBA PARA BETWEEN

SELECT cl.Nombre, COUNT(cl.Nombre) FROM clase cl, asiento asi, reserva_viaje r, tarjeta_embarque t, vuelo v, aeropuerto a 
where cl.Codigo = asi.Codigo_clase 
AND (asi.Codigo = r.Codigo_asiento)
AND (t.ID = r.Codigo_tarjeta)
AND (t.Codigo_vuelo = v.Codigo) 
AND (a.Codigo = v.Aeropuerto_entrada )
AND (a.pais = 'Guatemala')
AND (v.Fecha_vuelo BETWEEN '2020-01-01' AND '2020-01-02')
GROUP BY (cl.Nombre) LIMIT 1;
