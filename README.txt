1) Clientes con reservas activas.
select c.Nombre,c.Apellido,v.Codigo,v.Fecha_vuelo from cliente c, tarjeta_embarque te,vuelo v where te.Codigo_vuelo=v.Codigo AND te.DPI_cliente=c.DPI And v.Fecha_vuelo >= NOW();

2) Clientes que viajan a un aeropuerto en una fecha específica.
ESTE ESTA MALO XDXD PUSE codigo de vuelo y es fecha
SELECT `Nombre` FROM `aviteca`.`cliente` c INNER JOIN `aviteca`.`tarjeta_embarque` t  WHERE t.`DPI_cliente` = c.`DPI` AND t.`Codigo_vuelo` = 'VUL-1';

3) Porcentaje de ocupación diario de los aviones seleccionados en un intervalo de tiempo.


4) Los 10 aviones que más viajes han realizado a un país en específico.
SELECT `Codigo_Avion`, count(`Codigo_Avion`) AS 'veces' FROM `aviteca`.`vuelo` GROUP BY (`Codigo_Avion`) LIMIT 10;


5) La clase más ocupada en un intervalo de tiempo según el país de destino.
SELECT a.`Codigo_clase`, count(a.`Codigo_clase`) FROM `aviteca`.`asiento` a INNER JOIN `aviteca`.`reserva_viaje` r ON r.`Codigo_asiento` = a.`Codigo`  GROUP BY (`Codigo_clase`) LIMIT 1;
