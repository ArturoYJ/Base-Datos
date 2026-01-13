-- ============================================
-- EJERCICIO 4: SET OPS — EQUIPO A
-- ============================================
-- Enfoque: categorias y productos
-- ============================================

-- ============================================
-- RETO 1: UNION — Productos destacados
-- ============================================
-- Objetivo: Lista de productos que son "caros" (precio > 100)
--           O tienen "bajo stock" (stock < 50)
-- Operador: UNION
-- Resultado esperado: ~10 productos (puede haber overlap)

-- Columnas: nombre, precio, stock, 'caro'/'bajo stock' AS motivo

-- Query 1 (productos caros):


-- Query 2 (bajo stock):


-- Combinación:




-- Verificación: ¿Aparecen productos en ambas categorías?


-- ============================================
-- RETO 2: INTERSECT — Productos populares y disponibles
-- ============================================
-- Objetivo: Productos con precio entre 20 y 100
--           QUE TAMBIÉN tienen stock > 100
-- Operador: INTERSECT
-- Resultado esperado: Productos que cumplen AMBAS condiciones

-- Columnas: nombre, precio

-- Query 1 (precio entre 20 y 100):


-- Query 2 (stock > 100):


-- Combinación:




-- Verificación: ¿Los resultados cumplen ambas condiciones?


-- ============================================
-- RETO 3: EXCEPT — Categorías sin productos
-- ============================================
-- Objetivo: Categorías que NO tienen ningún producto asociado
-- Operador: EXCEPT
-- Resultado esperado: 2 categorías (Deportes, Libros)

-- Columnas: nombre_categoria

-- Query 1 (todas las categorías):


-- Query 2 (categorías que SÍ tienen productos):


-- Combinación:




-- Verificación: ¿Son exactamente Deportes y Libros?


-- ============================================
-- VERIFICACIÓN FINAL
-- ============================================
-- [ ] Completé los 3 retos
-- [ ] Usé el operador correcto en cada caso
-- [ ] Los resultados tienen sentido
-- 
-- Comentario del equipo:
-- [¿Cuál operador fue más útil?]
-- ============================================
