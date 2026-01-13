-- ============================================
-- EJERCICIO 4: SET OPS — EQUIPO B
-- ============================================
-- Enfoque: categorias y productos
-- ============================================

-- ============================================
-- RETO 1: UNION ALL — Inventario por tipo
-- ============================================
-- Objetivo: Lista de productos con etiqueta de "premium" (precio > 200)
--           y "económico" (precio < 30)
-- Operador: UNION ALL (queremos ver todos, incluso si hay overlap)
-- Resultado esperado: Lista con etiquetas

-- Columnas: nombre, precio, 'premium'/'economico' AS tipo

-- Query 1 (premium):


-- Query 2 (económico):


-- Combinación:




-- Verificación: ¿Hay overlap? ¿UNION vs UNION ALL?


-- ============================================
-- RETO 2: INTERSECT — Productos de Electrónica caros
-- ============================================
-- Objetivo: Productos de Electrónica QUE TAMBIÉN cuestan > 50
-- Operador: INTERSECT
-- Resultado esperado: Productos Electrónica caros

-- Columnas: nombre

-- Query 1 (productos de Electrónica - requiere JOIN):


-- Query 2 (productos > 50):


-- Combinación:




-- Verificación: ¿Todos son de Electrónica Y > 50?


-- ============================================
-- RETO 3: EXCEPT — Productos nunca agotados
-- ============================================
-- Objetivo: Productos cuyo stock NUNCA ha llegado a 0
--           (Todos con stock > 0 EXCEPT el que tiene stock = 0)
-- Operador: EXCEPT
-- Resultado esperado: ~15 productos

-- Columnas: nombre

-- Query 1 (todos los productos):


-- Query 2 (productos con stock = 0):


-- Combinación:




-- Verificación: ¿El producto con stock 0 quedó fuera?


-- ============================================
-- VERIFICACIÓN FINAL
-- ============================================
-- [ ] Completé los 3 retos
-- [ ] Usé el operador correcto en cada caso
-- [ ] Los resultados tienen sentido
-- 
-- Comentario del equipo:
-- [¿Cuándo usarías UNION vs UNION ALL?]
-- ============================================
