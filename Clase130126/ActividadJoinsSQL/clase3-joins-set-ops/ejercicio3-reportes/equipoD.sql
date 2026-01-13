-- ============================================
-- EJERCICIO 3: REPORTES — EQUIPO D
-- ============================================
-- Ruta de JOIN: usuarios → ordenes
-- 
-- INSTRUCCIONES:
-- Completa cada reporte con la query correcta
-- ============================================

-- ============================================
-- REPORTE 1: Resumen de clientes
-- ============================================
-- Objetivo: Cada usuario con su número de órdenes y total gastado
-- Resultado esperado: 6 filas (todos los usuarios)
-- Columnas: usuario, num_ordenes, total_gastado

-- Tablas:
-- Tipo de JOIN:
-- Tu query:




-- Verificación: SELECT COUNT(*) ... = 6


-- ============================================
-- REPORTE 2: Órdenes por status
-- ============================================
-- Objetivo: Contar órdenes agrupadas por status
-- Resultado esperado: 4 status distintos
-- Columnas: status, cantidad

-- Tablas:
-- Tipo de JOIN:
-- Nota: Esta NO requiere JOIN
-- Tu query:




-- Verificación: pendiente=1, pagado=2, enviado=1, entregado=1


-- ============================================
-- REPORTE 3: Órdenes recientes con usuario
-- ============================================
-- Objetivo: Órdenes ordenadas por fecha, con nombre de usuario
-- Resultado esperado: 5 filas ordenadas por created_at DESC
-- Columnas: orden_id, usuario, total, created_at

-- Tablas:
-- Tipo de JOIN:
-- Tu query:




-- Verificación: Las fechas deben estar ordenadas DESC


-- ============================================
-- REPORTE 4: Órdenes entregadas
-- ============================================
-- Objetivo: Usuarios con órdenes en status "entregado"
-- Resultado esperado: 1 fila
-- Columnas: usuario, orden_id, total

-- Tablas:
-- Tipo de JOIN:
-- Tu query:




-- Verificación: Debe aparecer "Ada Lovelace"


-- ============================================
-- REPORTE 5: Ticket promedio por usuario
-- ============================================
-- Objetivo: Promedio del total de órdenes por usuario
-- Resultado esperado: 5 filas (usuarios con órdenes)
-- Columnas: usuario, ticket_promedio

-- Tablas:
-- Tipo de JOIN:
-- Tu query:




-- Verificación: Los promedios deben ser razonables


-- ============================================
-- REPORTE 6: Usuarios activos sin órdenes
-- ============================================
-- Objetivo: Usuarios con activo=TRUE que no tienen órdenes
-- Resultado esperado: 1 fila (posiblemente 0 si todos inactivos)
-- Columnas: usuario_nombre, email

-- Tablas:
-- Tipo de JOIN:
-- Técnica: LEFT JOIN + IS NULL + WHERE activo
-- Tu query:




-- Verificación: Revisar manualmente el resultado


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
