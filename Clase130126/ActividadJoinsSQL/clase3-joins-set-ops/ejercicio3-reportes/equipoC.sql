-- ============================================
-- EJERCICIO 3: REPORTES — EQUIPO C
-- ============================================
-- Ruta de JOIN: usuarios → ordenes
-- 
-- INSTRUCCIONES:
-- Completa cada reporte con la query correcta
-- ============================================

-- ============================================
-- REPORTE 1: Órdenes por usuario
-- ============================================
-- Objetivo: Contar órdenes por usuario (solo quienes tienen)
-- Resultado esperado: 5 filas
-- Columnas: usuario, total_ordenes

-- Tablas:
-- Tipo de JOIN:
-- Tu query:




-- Verificación: SELECT COUNT(*) ... = 5


-- ============================================
-- REPORTE 2: Todos los usuarios con conteo
-- ============================================
-- Objetivo: TODOS los usuarios, mostrando 0 si no tienen órdenes
-- Resultado esperado: 6 filas
-- Columnas: usuario, total_ordenes

-- Tablas:
-- Tipo de JOIN:
-- Tu query:




-- Verificación: SELECT COUNT(*) ... = 6


-- ============================================
-- REPORTE 3: Detalle de órdenes
-- ============================================
-- Objetivo: Cada orden con nombre de usuario
-- Resultado esperado: 5 filas
-- Columnas: orden_id, total, status, usuario_nombre

-- Tablas:
-- Tipo de JOIN:
-- Tu query:




-- Verificación: SELECT COUNT(*) ... = 5


-- ============================================
-- REPORTE 4: Órdenes pendientes
-- ============================================
-- Objetivo: Usuarios con órdenes en status "pendiente"
-- Resultado esperado: 1 fila
-- Columnas: usuario, orden_id, total

-- Tablas:
-- Tipo de JOIN:
-- Tu query:




-- Verificación: Debe aparecer "Linus Torvalds"


-- ============================================
-- REPORTE 5: Total gastado por usuario
-- ============================================
-- Objetivo: Suma del total de órdenes por usuario
-- Resultado esperado: 5 filas (con compras)
-- Columnas: usuario, total_gastado

-- Tablas:
-- Tipo de JOIN:
-- Tu query:




-- Verificación: Ada debe tener el mayor total


-- ============================================
-- REPORTE 6: Usuarios sin órdenes
-- ============================================
-- Objetivo: Encontrar usuarios que NUNCA han ordenado
-- Resultado esperado: 1 fila
-- Columnas: usuario_nombre, email

-- Tablas:
-- Tipo de JOIN:
-- Técnica especial: LEFT JOIN + WHERE IS NULL
-- Tu query:




-- Verificación: Debe ser el usuario con email largo


-- ============================================
-- VERIFICACIÓN FINAL
-- ============================================
-- [ ] Completé los 6 reportes
-- [ ] Documenté tablas y tipo de JOIN
-- [ ] Verifiqué cada resultado
-- 
-- Comentario del equipo:
-- [¿Cuál fue el reporte más difícil?]
-- ============================================
