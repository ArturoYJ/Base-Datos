-- ============================================
-- EJERCICIO 3: REPORTES — EQUIPO E
-- ============================================
-- Ruta de JOIN: productos → orden_detalles → ordenes → usuarios
-- 
-- INSTRUCCIONES:
-- Completa cada reporte con la query correcta
-- Este equipo practica JOINs encadenados (múltiples tablas)
-- ============================================

-- ============================================
-- REPORTE 1: Detalle completo de ventas
-- ============================================
-- Objetivo: Mostrar quién compró qué producto
-- Resultado esperado: 10 filas
-- Columnas: usuario, producto, cantidad, subtotal

-- Tablas: usuarios, ordenes, orden_detalles, productos
-- Cadena de JOINs:
-- Tu query:




-- Verificación: SELECT COUNT(*) ... = 10


-- ============================================
-- REPORTE 2: Productos vendidos (únicos)
-- ============================================
-- Objetivo: Lista de productos que se han vendido al menos una vez
-- Resultado esperado: 8 productos distintos
-- Columnas: producto_nombre, codigo

-- Tablas:
-- Tipo de JOIN:
-- Tu query:




-- Verificación: SELECT COUNT(DISTINCT ...) = 8


-- ============================================
-- REPORTE 3: Órdenes con detalle extendido
-- ============================================
-- Objetivo: Cada orden con número de items y suma de cantidades
-- Resultado esperado: 5 filas
-- Columnas: orden_id, usuario, num_items, total_unidades

-- Tablas:
-- Tipo de JOIN:
-- Tu query:




-- Verificación: SELECT COUNT(*) ... = 5


-- ============================================
-- REPORTE 4: Top compradores
-- ============================================
-- Objetivo: Usuarios ordenados por total de subtotales
-- Resultado esperado: 5 filas ordenadas DESC
-- Columnas: usuario, total_comprado

-- Tablas:
-- Tipo de JOIN:
-- Tu query:




-- Verificación: Ada debe estar en top (compró laptop)


-- ============================================
-- REPORTE 5: Ventas por categoría
-- ============================================
-- Objetivo: Suma de unidades vendidas por categoría
-- Resultado esperado: 3 categorías con ventas
-- Columnas: categoria, unidades_vendidas

-- Tablas: categorias, productos, orden_detalles
-- Tipo de JOIN:
-- Tu query:




-- Verificación: Electrónica debe tener más ventas


-- ============================================
-- REPORTE 6: Productos sin ventas
-- ============================================
-- Objetivo: Productos que nunca han sido comprados
-- Resultado esperado: 8 productos
-- Columnas: producto_nombre, categoria

-- Tablas:
-- Tipo de JOIN:
-- Técnica especial: LEFT JOIN + WHERE IS NULL
-- Tu query:




-- Verificación: SELECT COUNT(*) ... = 8


-- ============================================
-- VERIFICACIÓN FINAL
-- ============================================
-- [ ] Completé los 6 reportes
-- [ ] Documenté las cadenas de JOIN
-- [ ] Verifiqué cada resultado
-- 
-- Comentario del equipo:
-- [¿Cuál fue el reporte más difícil?]
-- ============================================
