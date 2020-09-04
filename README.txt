hola
select c.Nombre,c.Apellido,v.Codigo,v.Fecha_vuelo from cliente c, tarjeta_embarque te,vuelo v where te.Codigo_vuelo=v.Codigo AND te.DPI_cliente=c.DPI And v.Fecha_vuelo >= NOW();