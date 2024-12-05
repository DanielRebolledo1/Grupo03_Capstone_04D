CREATE TABLE "Cuenta" (
  "id" integer PRIMARY KEY,
  "id_rol" integer,
  "nombre" varchar,
  "apellido" varchar,
  "numero_telefono" integer,
  "email" varchar,
  "direccion" varchar,
  "ciudad" varchar,
  "foto_perfil" image
);

CREATE TABLE "Rol" (
  "id_rol" integer PRIMARY KEY,
  "rol" varchar
);

CREATE TABLE "Categoria" (
  "id" integer PRIMARY KEY,
  "nombre_categoria" varchar UNIQUE,
  "slug" varchar UNIQUE,
  "descripcion" text,
  "cat_imagen" varchar
);

CREATE TABLE "Producto" (
  "id" integer PRIMARY KEY,
  "nombre_producto" varchar UNIQUE,
  "slug" varchar UNIQUE,
  "descripcion" text,
  "precio" integer,
  "imagen" varchar,
  "stock" integer,
  "disponible" boolean,
  "categoria_id" integer,
  "fecha_creacion" timestamp,
  "fecha_modificacion" timestamp
);

CREATE TABLE "Variante" (
  "id" integer PRIMARY KEY,
  "producto_id" integer,
  "variante_categoria" varchar,
  "variante_precio" integer,
  "variante_value" varchar,
  "is_active" boolean,
  "fecha_creacion" timestamp
);

CREATE TABLE "ReseñaCalificacion" (
  "id" integer PRIMARY KEY,
  "producto_id" integer,
  "user_id" integer,
  "asunto" varchar,
  "reseña" text,
  "calificacion" float,
  "ip" varchar,
  "estado" boolean,
  "creado_en" timestamp,
  "actualizado_en" timestamp
);

CREATE TABLE "Carro" (
  "id" integer PRIMARY KEY,
  "carro_id" varchar,
  "fecha_agregado" timestamp
);

CREATE TABLE "ItemCarro" (
  "id" integer PRIMARY KEY,
  "user_id" integer,
  "producto_id" integer,
  "carro_id" integer,
  "cantidad" integer,
  "is_active" boolean
);

CREATE TABLE "Pago" (
  "id" integer PRIMARY KEY,
  "user_id" integer,
  "pago_id" varchar,
  "metodo_pago" varchar,
  "monto_pagado" varchar,
  "estado" varchar,
  "creado_en" timestamp
);

CREATE TABLE "Pedido" (
  "id" integer PRIMARY KEY,
  "user_id" integer,
  "pago_id" integer,
  "num_pedido" varchar,
  "primer_nombre" varchar,
  "apellido" varchar,
  "telefono" varchar,
  "correo" varchar,
  "direccion" text,
  "ciudad" varchar,
  "indicaciones" text,
  "nota_pedido" text,
  "total_pedido" float,
  "subtotal" float,
  "iva" float,
  "estado" varchar,
  "ip" varchar,
  "ordenado" boolean,
  "creado_en" timestamp,
  "actualizado_en" timestamp
);

CREATE TABLE "PedidoProducto" (
  "id" integer PRIMARY KEY,
  "pedido_id" integer,
  "pago_id" integer,
  "user_id" integer,
  "producto_id" integer,
  "cantidad" integer,
  "precio_producto" float,
  "ordenado" boolean,
  "creado_en" timestamp,
  "actualizado_en" timestamp
);

COMMENT ON COLUMN "Categoria"."cat_imagen" IS 'Ruta de la imagen';

COMMENT ON COLUMN "Producto"."imagen" IS 'Ruta de la imagen';

ALTER TABLE "Cuenta" ADD FOREIGN KEY ("id_rol") REFERENCES "Rol" ("id_rol");

ALTER TABLE "Producto" ADD FOREIGN KEY ("categoria_id") REFERENCES "Categoria" ("id");

ALTER TABLE "Variante" ADD FOREIGN KEY ("producto_id") REFERENCES "Producto" ("id");

ALTER TABLE "ReseñaCalificacion" ADD FOREIGN KEY ("producto_id") REFERENCES "Producto" ("id");

ALTER TABLE "ReseñaCalificacion" ADD FOREIGN KEY ("user_id") REFERENCES "Cuenta" ("id");

ALTER TABLE "ItemCarro" ADD FOREIGN KEY ("user_id") REFERENCES "Cuenta" ("id");

ALTER TABLE "ItemCarro" ADD FOREIGN KEY ("producto_id") REFERENCES "Producto" ("id");

ALTER TABLE "ItemCarro" ADD FOREIGN KEY ("carro_id") REFERENCES "Carro" ("id");

ALTER TABLE "Pago" ADD FOREIGN KEY ("user_id") REFERENCES "Cuenta" ("id");

ALTER TABLE "Pedido" ADD FOREIGN KEY ("user_id") REFERENCES "Cuenta" ("id");

ALTER TABLE "Pedido" ADD FOREIGN KEY ("pago_id") REFERENCES "Pago" ("id");

ALTER TABLE "PedidoProducto" ADD FOREIGN KEY ("pedido_id") REFERENCES "Pedido" ("id");

ALTER TABLE "PedidoProducto" ADD FOREIGN KEY ("pago_id") REFERENCES "Pago" ("id");

ALTER TABLE "PedidoProducto" ADD FOREIGN KEY ("user_id") REFERENCES "Cuenta" ("id");

ALTER TABLE "PedidoProducto" ADD FOREIGN KEY ("producto_id") REFERENCES "Producto" ("id");
