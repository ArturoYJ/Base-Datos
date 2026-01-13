-- ============================================
-- EJERCICIO 4: SET OPS — EQUIPO F
-- ============================================
-- Enfoque: cadena completa (productos, ordenes, usuarios)
-- ============================================

-- ============================================
-- RETO 1: UNION — Análisis de inventario
-- ============================================
-- Objetivo: Productos que han sido vendidos
--           JUNTO CON productos que nunca se vendieron
--           (etiquetados diferente)
-- Operador: UNION
-- Resultado esperado: 16 productos etiquetados

-- Columnas: nombre, 'vendido'/'sin vender' AS estado

-- Query 1 (productos vendidos):
-- Requiere: productos JOIN orden_detalles


-- Query 2 (productos sin vender):
-- Requiere: productos LEFT JOIN orden_detalles WHERE NULL


-- Combinación:




-- Verificación: ¿16 productos con etiquetas correctas?


-- ============================================
-- RETO 2: INTERSECT — Categorías con ventas completas
-- ============================================
-- Objetivo: Categorías donde hay productos vendidos
--           QUE TAMBIÉN tienen stock > 0 en algún producto
-- Operador: INTERSECT
-- Resultado esperado: Categorías "saludables"

-- Columnas: nombre_categoria

-- Query 1 (categorías con ventas):


-- Query 2 (categorías con stock):


-- Combinación:




-- Verificación: ¿Qué categorías aparecen?


-- ============================================
-- RETO 3: EXCEPT — Productos nunca vendidos
-- ============================================
-- Objetivo: Todos los productos EXCEPT los que aparecen en orden_detalles
-- Operador: EXCEPT
-- Resultado esperado: 8 productos sin ventas

-- Columnas: nombre

-- Query 1 (todos los productos):


-- Query 2 (productos en orden_detalles):


-- Combinación:




-- Verificación: ¿Exactamente 8 productos?


-- ============================================
-- RETO BONUS: EXCEPT doble
-- ============================================
-- Objetivo: Productos de Electrónica que NO se han vendido
-- Operador: EXCEPT (combinado con JOIN)

-- Primero: Productos de Electrónica
-- Luego: EXCEPT productos vendidos

-- Tu query:




-- Verificación: ¿Cuántos productos de Electrónica sin ventas?


-- ============================================
-- VERIFICACIÓN FINAL
-- ============================================
-- [ ] Completé los 3 retos (y el bonus)
-- [ ] Usé JOINs correctamente con Set Ops
-- [ ] Los resultados tienen sentido
-- 
-- Comentario del equipo:
-- [¿Qué aprendieron sobre combinar JOINs y Set Ops?]
-- ============================================
