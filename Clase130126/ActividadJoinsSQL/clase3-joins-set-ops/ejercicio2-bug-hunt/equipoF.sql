-- ============================================
-- EJERCICIO 2: BUG HUNT — EQUIPO F
-- ============================================
-- Ruta de JOIN: productos → orden_detalles → ordenes → usuarios
-- 
-- INSTRUCCIONES:
-- 1. Ejecuta cada query
-- 2. Identifica el bug
-- 3. Corrige y documenta
-- ============================================

-- ============================================
-- BUG 1: Ventas por categoría
-- Objetivo: Mostrar categoría y productos vendidos de cada una
-- Resultado esperado: Datos de ventas agrupados por categoría
-- ============================================

SELECT c.nombre AS categoria, SUM(od.cantidad) AS unidades_vendidas
FROM categorias c
INNER JOIN productos p ON c.id = p.categoria_id
INNER JOIN orden_detalles od ON p.id = od.producto_id
GROUP BY p.nombre;

-- ¿El GROUP BY es correcto para el objetivo? _____
-- ¿Qué columna deberías agrupar? _____
--
-- BUG ENCONTRADO:
-- [Escribe aquí qué está mal]
--
-- QUERY CORREGIDA:
-- [Escribe tu corrección aquí]


-- ============================================
-- BUG 2: Órdenes con detalle de productos
-- Objetivo: Mostrar cada orden con sus productos
-- Resultado esperado: 10 filas (una por cada detalle)
-- ============================================

SELECT o.id AS orden, p.nombre AS producto, od.cantidad
FROM ordenes o
LEFT JOIN orden_detalles od ON o.usuario_id = od.orden_id
LEFT JOIN productos p ON od.producto_id = p.id;

-- ¿Los productos coinciden con las órdenes? _____
-- ¿Qué columna conecta ordenes con orden_detalles? _____
--
-- BUG ENCONTRADO:
-- [Escribe aquí qué está mal]
--
-- QUERY CORREGIDA:
-- [Escribe tu corrección aquí]


-- ============================================
-- BUG 3: Productos más vendidos
-- Objetivo: Top 5 productos por cantidad vendida
-- Resultado esperado: 5 productos ordenados por ventas
-- ============================================

SELECT p.nombre, SUM(od.cantidad) AS total_vendido
FROM productos p
LEFT JOIN orden_detalles od ON p.id = od.producto_id
WHERE SUM(od.cantidad) > 0
GROUP BY p.nombre
ORDER BY total_vendido DESC
LIMIT 5;

-- ¿Qué error da PostgreSQL? _____
-- ¿Dónde deben ir las condiciones con funciones de agregado? _____
--
-- BUG ENCONTRADO:
-- [Escribe aquí qué está mal]
--
-- QUERY CORREGIDA:
-- [Escribe tu corrección aquí]


-- ============================================
-- BUG 4: Ticket promedio por usuario
-- Objetivo: Calcular el valor promedio de orden por usuario
-- Resultado esperado: 6 usuarios (o 5 si solo los que compraron)
-- ============================================

SELECT u.nombre, AVG(o.total) AS ticket_promedio
FROM usuarios u
INNER JOIN ordenes o ON u.id = o.id
GROUP BY u.nombre;

-- ¿Los promedios tienen sentido? _____
-- ¿La condición del JOIN es correcta? _____
--
-- BUG ENCONTRADO:
-- [Escribe aquí qué está mal]
--
-- QUERY CORREGIDA:
-- [Escribe tu corrección aquí]


-- ============================================
-- VERIFICACIÓN FINAL
-- ============================================
-- [ ] Corregí las 4 queries
-- [ ] Documenté cada bug
-- [ ] Los resultados coinciden con lo esperado
-- 
-- Comentario del equipo:
-- [¿Qué aprendieron de este ejercicio?]
-- ============================================
