/*
Archivo: db/queries_agg_team_F.sql
Propósito: Reportes de agregación para Clase 4 (GROUP BY, HAVING, subconsultas) + VERIFY.
Cómo ejecutar (ajusta usuario, db y contenedor):
  docker compose ps
  docker exec -i <postgres_container> psql -U <user> -d <db> < db/queries_agg_team_F.sql

Regla "evidence mindset":
- Cada reporte declara el grain (una fila representa qué).
- Cada reporte incluye VERIFY con consultas de control.
*/

/*
REPORTE 1: Top 5 productos por monto de ventas
Qué devuelve: Los 5 productos con mayor total de ventas (suma de subtotal).
Grain (una fila representa): Un producto.
Métrica(s): SUM(orden_detalles.subtotal)
Por qué GROUP BY / HAVING / subconsulta: GROUP BY para sumar ventas por producto.
*/

-- QUERY
SELECT
  p.id AS producto_id,
  p.nombre AS producto_nombre,
  SUM(od.subtotal) AS total_ventas
FROM productos p
JOIN orden_detalles od ON od.producto_id = p.id
GROUP BY p.id, p.nombre
ORDER BY total_ventas DESC
LIMIT 5;

-- VERIFY: Conteo de filas del top N (debe ser 5 o menos).
SELECT COUNT(*) AS filas
FROM (
  SELECT p.id
  FROM productos p
  JOIN orden_detalles od ON od.producto_id = p.id
  GROUP BY p.id, p.nombre
  ORDER BY SUM(od.subtotal) DESC
  LIMIT 5
) t;

-- VERIFY: Recalculo del total para el producto top.
WITH top AS (
  SELECT p.id AS producto_id, SUM(od.subtotal) AS total_ventas
  FROM productos p
  JOIN orden_detalles od ON od.producto_id = p.id
  GROUP BY p.id
  ORDER BY SUM(od.subtotal) DESC
  LIMIT 1
)
SELECT
  t.producto_id,
  t.total_ventas,
  SUM(od.subtotal) AS recompute_total
FROM top t
JOIN orden_detalles od ON od.producto_id = t.producto_id
GROUP BY t.producto_id, t.total_ventas;

-- VERIFY: Inspeccion rapida del top con LIMIT 5.
SELECT
  p.id AS producto_id,
  p.nombre AS producto_nombre,
  SUM(od.subtotal) AS total_ventas
FROM productos p
JOIN orden_detalles od ON od.producto_id = p.id
GROUP BY p.id, p.nombre
ORDER BY total_ventas DESC
LIMIT 5;

/*
REPORTE 2: Usuarios frecuentes (>= 2 ordenes)
Qué devuelve: Usuarios con al menos 2 ordenes.
Grain (una fila representa): Un usuario.
Métrica(s): COUNT(ordenes.id)
Por qué GROUP BY / HAVING / subconsulta: GROUP BY para contar ordenes por usuario y HAVING para filtrar el umbral.
*/

-- QUERY
SELECT
  u.id AS usuario_id,
  u.nombre AS usuario_nombre,
  u.email,
  COUNT(o.id) AS ordenes_count
FROM usuarios u
JOIN ordenes o ON o.usuario_id = u.id
GROUP BY u.id, u.nombre, u.email
HAVING COUNT(o.id) >= 2
ORDER BY ordenes_count DESC, u.id;

-- VERIFY: Conteo de filas de usuarios frecuentes.
SELECT COUNT(*) AS filas
FROM (
  SELECT u.id
  FROM usuarios u
  JOIN ordenes o ON o.usuario_id = u.id
  GROUP BY u.id
  HAVING COUNT(o.id) >= 2
) t;

-- VERIFY: Caso puntual con sus ordenes para verificar el conteo.
WITH frecuentes AS (
  SELECT u.id AS usuario_id, COUNT(o.id) AS ordenes_count
  FROM usuarios u
  JOIN ordenes o ON o.usuario_id = u.id
  GROUP BY u.id
  HAVING COUNT(o.id) >= 2
  ORDER BY COUNT(o.id) DESC, u.id
  LIMIT 1
)
SELECT
  f.usuario_id,
  f.ordenes_count,
  o.id AS orden_id,
  o.status,
  o.created_at
FROM frecuentes f
JOIN ordenes o ON o.usuario_id = f.usuario_id
ORDER BY o.created_at, o.id;

/*
REPORTE 3: Usuarios inactivos en los ultimos 180 dias
Qué devuelve: Usuarios sin ordenes en los ultimos 180 dias.
Grain (una fila representa): Un usuario.
Métrica(s): No aplica (listado de usuarios).
Por qué GROUP BY / HAVING / subconsulta: Se usa NOT EXISTS para detectar ausencia en ventana.
*/

-- QUERY
SELECT
  u.id AS usuario_id,
  u.nombre AS usuario_nombre,
  u.email
FROM usuarios u
WHERE NOT EXISTS (
  SELECT 1
  FROM ordenes o
  WHERE o.usuario_id = u.id
    AND o.created_at >= CURRENT_DATE - INTERVAL '180 days'
)
ORDER BY u.id;

-- VERIFY: Conteo total de inactivos.
SELECT COUNT(*) AS filas
FROM (
  SELECT u.id
  FROM usuarios u
  WHERE NOT EXISTS (
    SELECT 1
    FROM ordenes o
    WHERE o.usuario_id = u.id
      AND o.created_at >= CURRENT_DATE - INTERVAL '180 days'
  )
) t;

-- VERIFY: Caso puntual con ordenes en ventana y total historico.
WITH inactivos AS (
  SELECT u.id AS usuario_id
  FROM usuarios u
  WHERE NOT EXISTS (
    SELECT 1
    FROM ordenes o
    WHERE o.usuario_id = u.id
      AND o.created_at >= CURRENT_DATE - INTERVAL '180 days'
  )
  ORDER BY u.id
  LIMIT 1
)
SELECT
  i.usuario_id,
  (
    SELECT COUNT(*)
    FROM ordenes o
    WHERE o.usuario_id = i.usuario_id
      AND o.created_at >= CURRENT_DATE - INTERVAL '180 days'
  ) AS ordenes_en_ventana,
  (
    SELECT COUNT(*)
    FROM ordenes o
    WHERE o.usuario_id = i.usuario_id
  ) AS ordenes_total
FROM inactivos i;
