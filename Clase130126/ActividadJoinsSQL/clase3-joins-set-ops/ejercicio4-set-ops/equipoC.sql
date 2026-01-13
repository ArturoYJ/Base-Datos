-- ============================================
-- EJERCICIO 4: SET OPS — EQUIPO C
-- ============================================
-- Enfoque: usuarios y ordenes
-- ============================================

-- ============================================
-- RETO 1: UNION — Usuarios con actividad
-- ============================================
-- Objetivo: Lista de usuarios que tienen órdenes "pendiente"
--           O que tienen órdenes "entregado"
-- Operador: UNION
-- Resultado esperado: Usuarios con cualquiera de esos status

-- Columnas: nombre, 'pendiente'/'entregado' AS tipo_actividad

-- Query 1 (usuarios con órdenes pendientes):
-- Necesitas: usuarios JOIN ordenes WHERE status = 'pendiente'


-- Query 2 (usuarios con órdenes entregadas):
-- Necesitas: usuarios JOIN ordenes WHERE status = 'entregado'


-- Combinación:




-- Verificación: ¿Cuántos usuarios aparecen?


-- ============================================
-- RETO 2: INTERSECT — Clientes frecuentes
-- ============================================
-- Objetivo: Usuarios que tienen órdenes con total > 100
--           QUE TAMBIÉN tienen órdenes con status 'pagado' o 'entregado'
-- Operador: INTERSECT
-- Resultado esperado: Clientes "buenos"

-- Columnas: nombre

-- Query 1 (total > 100):


-- Query 2 (status pagado o entregado):


-- Combinación:




-- Verificación: ¿Los resultados cumplen ambas condiciones?


-- ============================================
-- RETO 3: EXCEPT — Usuarios sin órdenes completadas
-- ============================================
-- Objetivo: Usuarios que NO tienen ninguna orden "entregado"
-- Operador: EXCEPT
-- Resultado esperado: Usuarios sin entregas completas

-- Columnas: nombre

-- Query 1 (todos los usuarios):


-- Query 2 (usuarios con órdenes entregadas):


-- Combinación:




-- Verificación: Ada no debe aparecer (ella tiene entregado)


-- ============================================
-- VERIFICACIÓN FINAL
-- ============================================
-- [ ] Completé los 3 retos
-- [ ] Usé el operador correcto en cada caso
-- [ ] Los resultados tienen sentido
-- 
-- Comentario del equipo:
-- [¿Cuál operador fue más útil para análisis de clientes?]
-- ============================================
