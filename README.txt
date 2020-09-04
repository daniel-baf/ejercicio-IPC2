hola
select c.Nombre,c.Apellido,v.Codigo,v.Fecha_vuelo from cliente c, tarjeta_embarque te,vuelo v where te.Codigo_vuelo=v.Codigo AND te.DPI_cliente=c.DPI And v.Fecha_vuelo >= NOW();

SELECT `Nombre` FROM `aviteca`.`cliente` c INNER JOIN `aviteca`.`tarjeta_embarque` t  WHERE t.`DPI_cliente` = c.`DPI` AND t.`Codigo_vuelo` = 'VUL-1';
