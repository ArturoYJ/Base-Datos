/*
Archivo: db/queries_agg_team_C.sql
Propósito: Reportes de agregación para Clase 4 (GROUP BY, HAVING, subconsultas) + VERIFY.
Cómo ejecutar (ajusta usuario, db y contenedor):
  docker compose ps
  docker exec -i <postgres_container> psql -U <user> -d <db> < db/queries_agg_team_C.sql

Regla "evidence mindset":
- Cada reporte declara el grain (una fila representa qué).
- Cada reporte incluye VERIFY con consultas de control.
*/

/*
REPORTE 1: Top 3 productos por ventas no canceladas
Qué devuelve: Los 3 productos con mayor total de ventas en ordenes no canceladas.
Grain (una fila representa): Un producto.
Métrica(s): SUM(orden_detalles.subtotal)
Por qué GROUP BY / HAVING / subconsulta: GROUP BY para sumar ventas por producto y filtro por status.
*/

-- QUERY
SELECT
  p.id AS producto_id,
  p.nombre AS producto_nombre,
  SUM(od.subtotal) AS total_ventas
FROM productos p
JOIN orden_detalles od ON od.producto_id = p.id
JOIN ordenes o ON o.id = od.orden_id
WHERE o.status <> 'cancelado'
GROUP BY p.id, p.nombre
ORDER BY total_ventas DESC
LIMIT 3;

-- VERIFY: Conteo de filas del top N (debe ser 3 o menos).
SELECT COUNT(*) AS filas
FROM (
  SELECT p.id
  FROM productos p
  JOIN orden_detalles od ON od.producto_id = p.id
  JOIN ordenes o ON o.id = od.orden_id
  WHERE o.status <> 'cancelado'
  GROUP BY p.id, p.nombre
  ORDER BY SUM(od.subtotal) DESC
  LIMIT 3
) t;

-- VERIFY: Recalculo del total para el producto top.
WITH top AS (
  SELECT p.id AS producto_id, SUM(od.subtotal) AS total_ventas
  FROM productos p
  JOIN orden_detalles od ON od.producto_id = p.id
  JOIN ordenes o ON o.id = od.orden_id
  WHERE o.status <> 'cancelado'
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
JOIN ordenes o ON o.id = od.orden_id
WHERE o.status <> 'cancelado'
GROUP BY t.producto_id, t.total_ventas;

/*
REPORTE 2: Usuarios frecuentes (>= 3 ordenes distintas)
Qué devuelve: Usuarios con al menos 3 ordenes distintas.
Grain (una fila representa): Un usuario.
Métrica(s): COUNT(DISTINCT ordenes.id)
Por qué GROUP BY / HAVING / subconsulta: Se usa COUNT DISTINCT para evitar inflado por el JOIN con orden_detalles.
*/

-- QUERY
SELECT
  u.id AS usuario_id,
  u.nombre AS usuario_nombre,
  u.email,
  COUNT(DISTINCT o.id) AS ordenes_distintas
FROM usuarios u
JOIN ordenes o ON o.usuario_id = u.id
JOIN orden_detalles od ON od.orden_id = o.id
GROUP BY u.id, u.nombre, u.email
HAVING COUNT(DISTINCT o.id) >= 3
ORDER BY ordenes_distintas DESC, u.id;

-- VERIFY: Conteo de filas de usuarios frecuentes.
SELECT COUNT(*) AS filas
FROM (
  SELECT u.id
  FROM usuarios u
  JOIN ordenes o ON o.usuario_id = u.id
  JOIN orden_detalles od ON od.orden_id = o.id
  GROUP BY u.id
  HAVING COUNT(DISTINCT o.id) >= 3
) t;

-- VERIFY: Caso puntual con sus ordenes para verificar el conteo.
WITH frecuentes AS (
  SELECT u.id AS usuario_id, COUNT(DISTINCT o.id) AS ordenes_distintas
  FROM usuarios u
  JOIN ordenes o ON o.usuario_id = u.id
  JOIN orden_detalles od ON od.orden_id = o.id
  GROUP BY u.id
  HAVING COUNT(DISTINCT o.id) >= 3
  ORDER BY COUNT(DISTINCT o.id) DESC, u.id
  LIMIT 1
)
SELECT
  f.usuario_id,
  f.ordenes_distintas,
  o.id AS orden_id,
  o.status,
  o.created_at
FROM frecuentes f
JOIN ordenes o ON o.usuario_id = f.usuario_id
ORDER BY o.created_at, o.id;

/*
REPORTE 3: Usuarios inactivos en los ultimos 90 dias
Qué devuelve: Usuarios sin ordenes en los ultimos 90 dias.
Grain (una fila representa): Un usuario.
Métrica(s): No aplica (listado de usuarios).
Por qué GROUP BY / HAVING / subconsulta: Se usa LEFT JOIN + IS NULL para detectar ausencia en ventana.
*/

-- QUERY
SELECT
  u.id AS usuario_id,
  u.nombre AS usuario_nombre,
  u.email
FROM usuarios u
LEFT JOIN ordenes o
  ON o.usuario_id = u.id
  AND o.created_at >= CURRENT_DATE - INTERVAL '90 days'
WHERE o.id IS NULL
ORDER BY u.id;

-- VERIFY: Conteo total de inactivos.
SELECT COUNT(*) AS filas
FROM (
  SELECT u.id
  FROM usuarios u
  LEFT JOIN ordenes o
    ON o.usuario_id = u.id
    AND o.created_at >= CURRENT_DATE - INTERVAL '90 days'
  WHERE o.id IS NULL
) t;

-- VERIFY: Caso puntual con ordenes en ventana y total historico.
WITH inactivos AS (
  SELECT u.id AS usuario_id
  FROM usuarios u
  LEFT JOIN ordenes o
    ON o.usuario_id = u.id
    AND o.created_at >= CURRENT_DATE - INTERVAL '90 days'
  WHERE o.id IS NULL
  ORDER BY u.id
  LIMIT 1
)
SELECT
  i.usuario_id,
  (
    SELECT COUNT(*)
    FROM ordenes o
    WHERE o.usuario_id = i.usuario_id
      AND o.created_at >= CURRENT_DATE - INTERVAL '90 days'
  ) AS ordenes_en_ventana,
  (
    SELECT COUNT(*)
    FROM ordenes o
    WHERE o.usuario_id = i.usuario_id
  ) AS ordenes_total
FROM inactivos i;
