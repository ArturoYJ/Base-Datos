-- ============================================
-- EJERCICIO 2: BUG HUNT — EQUIPO C
-- ============================================
-- Ruta de JOIN: usuarios → ordenes
-- 
-- INSTRUCCIONES:
-- 1. Ejecuta cada query
-- 2. Identifica el bug
-- 3. Corrige y documenta
-- ============================================

-- ============================================
-- BUG 1: Todos los usuarios con sus órdenes
-- Objetivo: Listar TODOS los usuarios, incluso sin órdenes
-- Resultado esperado: 6 usuarios (uno sin orden)
-- ============================================

SELECT u.nombre, o.id AS orden_id, o.total
FROM usuarios u
LEFT JOIN ordenes o ON u.id = o.usuario_id
WHERE o.total > 0;

-- ¿Cuántos usuarios obtuviste? _____
-- ¿Aparece el usuario sin órdenes? _____
--
-- BUG ENCONTRADO:
-- [Escribe aquí qué está mal]
--
-- QUERY CORREGIDA:
-- [Escribe tu corrección aquí]


-- ============================================
-- BUG 2: Usuarios con órdenes pendientes
-- Objetivo: Usuarios que tienen al menos una orden pendiente
-- Resultado esperado: 1 usuario (Linus con orden pendiente)
-- ============================================

SELECT u.nombre, o.status
FROM usuarios u
INNER JOIN ordenes o ON u.email = o.status;

-- ¿Da resultados? _____
-- ¿La condición ON tiene sentido? _____
--
-- BUG ENCONTRADO:
-- [Escribe aquí qué está mal]
--
-- QUERY CORREGIDA:
-- [Escribe tu corrección aquí]


-- ============================================
-- BUG 3: Conteo de órdenes por usuario
-- Objetivo: Cuántas órdenes tiene cada usuario
-- Resultado esperado: 6 usuarios con conteo (algunos con 0)
-- ============================================

SELECT u.nombre, COUNT(*) AS total_ordenes
FROM usuarios u
INNER JOIN ordenes o ON u.id = o.usuario_id
GROUP BY u.nombre;

-- ¿Aparecen usuarios con 0 órdenes? _____
-- ¿Qué tipo de JOIN necesitas? _____
--
-- BUG ENCONTRADO:
-- [Escribe aquí qué está mal]
--
-- QUERY CORREGIDA:
-- [Escribe tu corrección aquí]


-- ============================================
-- BUG 4: Usuarios sin órdenes
-- Objetivo: Encontrar usuarios que nunca han comprado
-- Resultado esperado: 1 usuario
-- ============================================

SELECT u.nombre AS usuario_sin_ordenes
FROM usuarios u
INNER JOIN ordenes o ON u.id = o.usuario_id
WHERE o.id IS NULL;

-- ¿Devuelve algún resultado? _____
-- ¿Puede un INNER JOIN tener NULLs en la otra tabla? _____
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
