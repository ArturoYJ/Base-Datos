/*
Archivo: db/queries_agg_team_D.sql
Propósito: Reportes de agregación para Clase 4 (GROUP BY, HAVING, subconsultas) + VERIFY.
Cómo ejecutar (ajusta usuario, db y contenedor):
  docker compose ps
  docker exec -i <postgres_container> psql -U <user> -d <db> < db/queries_agg_team_D.sql

Regla "evidence mindset":
- Cada reporte declara el grain (una fila representa qué).
- Cada reporte incluye VERIFY con consultas de control.
*/

/*
REPORTE 1: Top 5 usuarios por promedio de monto de orden
Qué devuelve: Los 5 usuarios con mayor promedio de total por orden.
Grain (una fila representa): Un usuario.
Métrica(s): AVG(ordenes.total)
Por qué GROUP BY / HAVING / subconsulta: GROUP BY para calcular el promedio por usuario.
*/

-- QUERY
SELECT
  u.id AS usuario_id,
  u.nombre AS usuario_nombre,
  AVG(o.total) AS promedio_total
FROM usuarios u
JOIN ordenes o ON o.usuario_id = u.id
GROUP BY u.id, u.nombre
ORDER BY promedio_total DESC, u.id ASC
LIMIT 5;

-- VERIFY: Conteo de filas del top N (debe ser 5 o menos).
SELECT COUNT(*) AS filas
FROM (
  SELECT u.id
  FROM usuarios u
  JOIN ordenes o ON o.usuario_id = u.id
  GROUP BY u.id
  ORDER BY AVG(o.total) DESC, u.id ASC
  LIMIT 5
) t;

-- VERIFY: Recalculo del promedio para el usuario top.
WITH top AS (
  SELECT u.id AS usuario_id, AVG(o.total) AS promedio_total
  FROM usuarios u
  JOIN ordenes o ON o.usuario_id = u.id
  GROUP BY u.id
  ORDER BY AVG(o.total) DESC, u.id ASC
  LIMIT 1
)
SELECT
  t.usuario_id,
  t.promedio_total,
  AVG(o.total) AS recompute_promedio
FROM top t
JOIN ordenes o ON o.usuario_id = t.usuario_id
GROUP BY t.usuario_id, t.promedio_total;

/*
REPORTE 2: Productos frecuentes (>= 5 ordenes distintas)
Qué devuelve: Productos que aparecen en al menos 5 ordenes distintas.
Grain (una fila representa): Un producto.
Métrica(s): COUNT(DISTINCT orden_detalles.orden_id)
Por qué GROUP BY / HAVING / subconsulta: GROUP BY para contar ordenes distintas por producto y HAVING para filtrar el umbral.
*/

-- QUERY
SELECT
  p.id AS producto_id,
  p.nombre AS producto_nombre,
  COUNT(DISTINCT od.orden_id) AS ordenes_distintas
FROM productos p
JOIN orden_detalles od ON od.producto_id = p.id
GROUP BY p.id, p.nombre
HAVING COUNT(DISTINCT od.orden_id) >= 5
ORDER BY ordenes_distintas DESC, p.id;

-- VERIFY: Conteo de filas de productos frecuentes.
SELECT COUNT(*) AS filas
FROM (
  SELECT p.id
  FROM productos p
  JOIN orden_detalles od ON od.producto_id = p.id
  GROUP BY p.id
  HAVING COUNT(DISTINCT od.orden_id) >= 5
) t;

-- VERIFY: Caso puntual con sus detalles para verificar el conteo.
WITH frecuentes AS (
  SELECT p.id AS producto_id, COUNT(DISTINCT od.orden_id) AS ordenes_distintas
  FROM productos p
  JOIN orden_detalles od ON od.producto_id = p.id
  GROUP BY p.id
  HAVING COUNT(DISTINCT od.orden_id) >= 5
  ORDER BY COUNT(DISTINCT od.orden_id) DESC, p.id
  LIMIT 1
)
SELECT
  f.producto_id,
  f.ordenes_distintas,
  od.orden_id,
  od.cantidad,
  od.precio_unitario,
  od.subtotal
FROM frecuentes f
JOIN orden_detalles od ON od.producto_id = f.producto_id
ORDER BY od.orden_id;

/*
REPORTE 3: Usuarios inactivos en los ultimos 120 dias
Qué devuelve: Usuarios sin ordenes en los ultimos 120 dias.
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
    AND o.created_at >= CURRENT_DATE - INTERVAL '120 days'
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
      AND o.created_at >= CURRENT_DATE - INTERVAL '120 days'
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
      AND o.created_at >= CURRENT_DATE - INTERVAL '120 days'
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
      AND o.created_at >= CURRENT_DATE - INTERVAL '120 days'
  ) AS ordenes_en_ventana,
  (
    SELECT COUNT(*)
    FROM ordenes o
    WHERE o.usuario_id = i.usuario_id
  ) AS ordenes_total
FROM inactivos i;
