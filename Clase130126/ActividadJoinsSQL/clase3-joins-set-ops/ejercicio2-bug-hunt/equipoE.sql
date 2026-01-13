-- ============================================
-- EJERCICIO 2: BUG HUNT — EQUIPO E
-- ============================================
-- Ruta de JOIN: productos → orden_detalles → ordenes → usuarios
-- 
-- INSTRUCCIONES:
-- 1. Ejecuta cada query
-- 2. Identifica el bug
-- 3. Corrige y documenta
-- ============================================

-- ============================================
-- BUG 1: Productos vendidos con detalle de orden
-- Objetivo: Listar productos que se han vendido
-- Resultado esperado: 8 filas (productos en orden_detalles)
-- ============================================

SELECT p.nombre AS producto, od.cantidad, od.precio_unitario
FROM productos p
LEFT JOIN orden_detalles od ON p.id = od.producto_id
WHERE od.cantidad > 0;

-- ¿Cuántos productos obtuviste? _____
-- ¿Aparecen productos que nunca se vendieron? _____
--
-- BUG ENCONTRADO:
-- [Escribe aquí qué está mal]
--
-- QUERY CORREGIDA (para ver TODOS los productos):
-- [Escribe tu corrección aquí]


-- ============================================
-- BUG 2: Quién compró qué producto
-- Objetivo: Mostrar usuario, producto y cantidad
-- Resultado esperado: 10 filas con datos correctos
-- ============================================

SELECT u.nombre AS comprador, p.nombre AS producto, od.cantidad
FROM usuarios u
INNER JOIN ordenes o ON u.id = o.usuario_id
INNER JOIN orden_detalles od ON o.id = od.id
INNER JOIN productos p ON od.producto_id = p.id;

-- ¿Los datos tienen sentido? _____
-- ¿Qué columna conecta ordenes con orden_detalles? _____
--
-- BUG ENCONTRADO:
-- [Escribe aquí qué está mal]
--
-- QUERY CORREGIDA:
-- [Escribe tu corrección aquí]


-- ============================================
-- BUG 3: Productos nunca vendidos
-- Objetivo: Productos que no aparecen en ninguna orden
-- Resultado esperado: 8 productos nunca vendidos
-- ============================================

SELECT p.nombre AS producto_sin_ventas
FROM productos p
INNER JOIN orden_detalles od ON p.id = od.producto_id
WHERE od.id IS NULL;

-- ¿Devuelve resultados? _____
-- ¿Qué tipo de JOIN encuentras "huérfanos"? _____
--
-- BUG ENCONTRADO:
-- [Escribe aquí qué está mal]
--
-- QUERY CORREGIDA:
-- [Escribe tu corrección aquí]


-- ============================================
-- BUG 4: Reporte completo de ventas (múltiples JOINs)
-- Objetivo: Usuario, orden, producto, cantidad, subtotal
-- Resultado esperado: 10 filas con chain de JOINs correcto
-- ============================================

SELECT 
    u.nombre AS usuario,
    o.id AS orden,
    p.nombre AS producto,
    od.cantidad,
    od.subtotal
FROM usuarios u, ordenes o, orden_detalles od, productos p;

-- ¿Cuántas filas obtuviste? (debería ser muchísimas) _____
-- ¿Por qué es un producto cartesiano? _____
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
