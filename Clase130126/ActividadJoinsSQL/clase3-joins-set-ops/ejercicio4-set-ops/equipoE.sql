-- ============================================
-- EJERCICIO 4: SET OPS — EQUIPO E
-- ============================================
-- Enfoque: cadena completa (productos, ordenes, usuarios)
-- ============================================

-- ============================================
-- RETO 1: UNION — Productos de diferentes categorías
-- ============================================
-- Objetivo: Lista de productos de "Electrónica"
--           Y productos de "Hogar" (combinados)
-- Operador: UNION
-- Resultado esperado: 11 productos (6 elect + 5 hogar)

-- Columnas: nombre, categoria

-- Query 1 (productos de Electrónica):
-- Requiere JOIN con categorias


-- Query 2 (productos de Hogar):
-- Requiere JOIN con categorias


-- Combinación:




-- Verificación: ¿11 productos en total?


-- ============================================
-- RETO 2: INTERSECT — Producto comprado por múltiples usuarios
-- ============================================
-- Objetivo: Productos comprados por Ada (usuario_id=1)
--           QUE TAMBIÉN fueron comprados por Margaret (usuario_id=5)
-- Operador: INTERSECT
-- Resultado esperado: "Laptop Pro 15" (ambas lo compraron)

-- Columnas: nombre

-- Query 1 (productos de Ada):
-- Requiere: productos → orden_detalles → ordenes (usuario_id=1)


-- Query 2 (productos de Margaret):
-- Requiere: productos → orden_detalles → ordenes (usuario_id=5)


-- Combinación:




-- Verificación: ¿Solo aparece Laptop?


-- ============================================
-- RETO 3: EXCEPT — Productos exclusivos de Ada
-- ============================================
-- Objetivo: Productos que compró Ada
--           QUE NO compró ningún otro usuario
-- Operador: EXCEPT
-- Resultado esperado: Mouse y Teclado (solo Ada los compró)

-- Columnas: nombre

-- Query 1 (productos de Ada):


-- Query 2 (productos de otros usuarios):


-- Combinación:




-- Verificación: ¿Mouse y Teclado aparecen?


-- ============================================
-- VERIFICACIÓN FINAL
-- ============================================
-- [ ] Completé los 3 retos
-- [ ] Usé JOINs para conectar las tablas
-- [ ] Los resultados tienen sentido
-- 
-- Comentario del equipo:
-- [¿Cómo combinas JOINs con Set Ops?]
-- ============================================
