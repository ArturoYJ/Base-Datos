-- ============================================
-- EJERCICIO 2: BUG HUNT — EQUIPO D
-- ============================================
-- Ruta de JOIN: usuarios → ordenes
-- 
-- INSTRUCCIONES:
-- 1. Ejecuta cada query
-- 2. Identifica el bug
-- 3. Corrige y documenta
-- ============================================

-- ============================================
-- BUG 1: Usuarios y total de compras
-- Objetivo: Sumar el total de todas las órdenes por usuario
-- Resultado esperado: 6 usuarios, algunos con NULL o 0
-- ============================================

SELECT u.nombre, SUM(o.total) AS total_compras
FROM usuarios u
INNER JOIN ordenes o ON u.id = o.usuario_id
GROUP BY u.nombre
ORDER BY total_compras DESC;

-- ¿Cuántos usuarios aparecen? _____
-- ¿Qué pasa con usuarios sin órdenes? _____
--
-- BUG ENCONTRADO:
-- [Escribe aquí qué está mal]
--
-- QUERY CORREGIDA:
-- [Escribe tu corrección aquí]


-- ============================================
-- BUG 2: Órdenes con nombre de usuario
-- Objetivo: Cada orden debe mostrar quién la hizo
-- Resultado esperado: 5 órdenes con nombre de usuario
-- ============================================

SELECT o.id, o.total, u.nombre
FROM ordenes o
LEFT JOIN usuarios u ON o.id = u.id;

-- ¿Los nombres coinciden con los datos del seed? _____
-- ¿Qué columna debería usarse para el JOIN? _____
--
-- BUG ENCONTRADO:
-- [Escribe aquí qué está mal]
--
-- QUERY CORREGIDA:
-- [Escribe tu corrección aquí]


-- ============================================
-- BUG 3: Usuarios activos con órdenes recientes
-- Objetivo: Usuarios activos que hayan ordenado
-- Resultado esperado: 5 usuarios activos con órdenes
-- ============================================

SELECT u.nombre, o.created_at
FROM usuarios u
LEFT JOIN ordenes o ON u.id = o.usuario_id
WHERE u.activo = true
  AND o.created_at IS NOT NULL;

-- ¿Aparece el usuario sin órdenes? _____
-- ¿El WHERE afecta al LEFT JOIN? _____
--
-- BUG ENCONTRADO:
-- [Escribe aquí qué está mal]
--
-- QUERY CORREGIDA (si quieres mantener LEFT JOIN):
-- [Escribe tu corrección aquí]


-- ============================================
-- BUG 4: Producto cartesiano accidental
-- Objetivo: Mostrar usuarios y sus órdenes
-- Resultado esperado: ~6 filas (una por combinación usuario-orden)
-- ============================================

SELECT u.nombre, o.id AS orden_id
FROM usuarios u, ordenes o;

-- ¿Cuántas filas obtuviste? _____
-- ¿Por qué ese número? (pista: 6 usuarios × 5 órdenes = ?)
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
