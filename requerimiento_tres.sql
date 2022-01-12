-- Clientes que han comprado mas en valor
SELECT identificacion, nombre, apellido, sum(total) as total
FROM app_tienda.facturas f
inner join app_tienda.clientes c using (cliente_id) 
group by identificacion, nombre, apellido
order by 4 desc
limit 10;

-- Clientes que han comprado mas en cantidad
SELECT identificacion, nombre, apellido, count(d.producto_id) as productos_comprados
FROM app_tienda.factura_detalle d
inner join app_tienda.facturas f using (factura_id)
inner join app_tienda.clientes c using (cliente_id) 
group by identificacion, nombre, apellido
order by 4 desc
limit 10;

-- Productos mas vendidos en valor
select codigo, nombre as producto, sum(precio_venta) as total
from app_tienda.factura_detalle d 
inner join app_tienda.productos p using (producto_id)
group by codigo, nombre
order by 3 desc
limit 5;

-- Productos mas vendidos en cantidad
select codigo, nombre as producto, count(producto_id) as cantidad
from app_tienda.factura_detalle d 
inner join app_tienda.productos p using (producto_id)
group by codigo, nombre
order by 3 desc
limit 5;

-- Productos menos vendidos en valor
select codigo, nombre as producto, sum(precio_venta) as total
from app_tienda.factura_detalle d 
inner join app_tienda.productos p using (producto_id)
group by codigo, nombre
order by 3 asc
limit 5;

-- Productos menos vendidos en cantidad
select codigo, nombre as producto, count(producto_id) as cantidad
from app_tienda.factura_detalle d 
inner join app_tienda.productos p using (producto_id)
group by codigo, nombre
order by 3 asc
limit 5;

-- Valor de ventas agrupadas por mes
select EXTRACT(MONTH FROM fecha) as mes, sum(total) as total_ventas
from app_tienda.facturas
group by 1
order by 1;

-- Valor de ventas agrupadas por producto y mes
select EXTRACT(MONTH FROM fecha) as mes, codigo, nombre as producto, sum(total) as total_ventas
from app_tienda.facturas f
inner join app_tienda.factura_detalle d using (factura_id)
inner join app_tienda.productos p using (producto_id)
group by 1,2,3
order by 1;
