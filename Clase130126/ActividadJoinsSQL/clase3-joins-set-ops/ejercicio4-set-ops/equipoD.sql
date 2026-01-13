-- ============================================
-- EJERCICIO 4: SET OPS — EQUIPO D
-- ============================================
-- Enfoque: usuarios y ordenes
-- ============================================

-- ============================================
-- RETO 1: UNION — Órdenes por status agrupado
-- ============================================
-- Objetivo: Lista de órdenes "activas" (pendiente, pagado)
--           y órdenes "completadas" (enviado, entregado)
-- Operador: UNION
-- Resultado esperado: Todas las órdenes con etiqueta

-- Columnas: orden_id, total, 'activa'/'completada' AS estado

-- Query 1 (órdenes activas):


-- Query 2 (órdenes completadas):


-- Combinación:




-- Verificación: ¿5 órdenes en total?


-- ============================================
-- RETO 2: INTERSECT — Usuarios VIP
-- ============================================
-- Objetivo: Emails de usuarios activos (activo = true)
--           QUE TAMBIÉN tienen al menos una orden
-- Operador: INTERSECT
-- Resultado esperado: Usuarios activos con compras

-- Columnas: email

-- Query 1 (usuarios activos):


-- Query 2 (usuarios con órdenes):


-- Combinación:




-- Verificación: ¿Cuántos usuarios VIP hay?


-- ============================================
-- RETO 3: EXCEPT — Status sin usar
-- ============================================
-- Objetivo: ¿Hay algún status definido que no tenga órdenes?
-- Operador: EXCEPT
-- Nota: El schema define 5 status, ¿todos se usan?
-- Resultado esperado: 'cancelado' (nadie ha cancelado)

-- Columnas: status

-- Query 1 (todos los status posibles - hardcoded):
-- SELECT 'pendiente' UNION SELECT 'pagado' UNION ...


-- Query 2 (status que sí se usan):


-- Combinación:




-- Verificación: ¿Solo 'cancelado' no se ha usado?


-- ============================================
-- VERIFICACIÓN FINAL
-- ============================================
-- [ ] Completé los 3 retos
-- [ ] Usé el operador correcto en cada caso
-- [ ] Los resultados tienen sentido
-- 
-- Comentario del equipo:
-- [¿El EXCEPT sirve para validar datos?]
-- ============================================
