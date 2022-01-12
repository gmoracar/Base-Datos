CREATE TABLE IF NOT EXISTS app_tienda.clientes(
    cliente_id bigint NOT NULL DEFAULT nextval('app_tienda.clientes_cliente_id_seq'::regclass),
    identificacion text,
    nombre text,
    apellido text,
    email text,
    direccion text,
    CONSTRAINT clientes_pkey PRIMARY KEY (cliente_id)
)

CREATE TABLE IF NOT EXISTS app_tienda.productos(
    producto_id bigint NOT NULL DEFAULT nextval('app_tienda.productos_producto_id_seq'::regclass),
    codigo text,
    nombre text,
    presentacion text,
    precio double precision,
    impuesto double precision,
    CONSTRAINT productos_pkey PRIMARY KEY (producto_id)
)


CREATE TABLE IF NOT EXISTS app_tienda.facturas(
    factura_id bigint NOT NULL DEFAULT nextval('app_tienda.facturas_factura_id_seq'::regclass),
    fecha timestamp without time zone,
    cliente_id integer,
    total double precision,
    CONSTRAINT facturas_pkey PRIMARY KEY (factura_id),
    CONSTRAINT cliente_fk FOREIGN KEY (cliente_id)
	  REFERENCES app_tienda.clientes (cliente_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

CREATE TABLE IF NOT EXISTS app_tienda.factura_detalle(
    detalle_factura_id bigint NOT NULL DEFAULT nextval('app_tienda.factura_detalle_detalle_factura_id_seq'::regclass),
    factura_id integer NOT NULL,
    producto_id integer NOT NULL,
    precio_venta double precision,
    impuesto_venta double precision,
    CONSTRAINT factura_detalle_pkey PRIMARY KEY (detalle_factura_id, factura_id, producto_id),
    CONSTRAINT factura_fk FOREIGN KEY (factura_id)
        REFERENCES app_tienda.facturas (factura_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT producto_fk FOREIGN KEY (producto_id)
        REFERENCES app_tienda.productos (producto_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

ALTER TABLE app_tienda.clientes OWNER to postgres;
ALTER TABLE app_tienda.productos OWNER to postgres;
ALTER TABLE app_tienda.facturas OWNER to postgres;
ALTER TABLE app_tienda.factura_detalle OWNER to postgres;