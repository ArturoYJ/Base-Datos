-- ============================================
-- EJERCICIO 3: REPORTES — EQUIPO F
-- ============================================
-- Ruta de JOIN: productos → orden_detalles → ordenes → usuarios
-- 
-- INSTRUCCIONES:
-- Completa cada reporte con la query correcta
-- Este equipo practica JOINs encadenados (múltiples tablas)
-- ============================================

-- ============================================
-- REPORTE 1: Historial de compras por usuario
-- ============================================
-- Objetivo: Detalle de qué compró cada usuario
-- Resultado esperado: 10 filas
-- Columnas: usuario, orden_id, producto, cantidad, precio_unitario

-- Tablas: usuarios, ordenes, orden_detalles, productos
-- Cadena de JOINs:
-- Tu query:




-- Verificación: SELECT COUNT(*) ... = 10


-- ============================================
-- REPORTE 2: Productos más vendidos
-- ============================================
-- Objetivo: Top 5 productos por cantidad vendida
-- Resultado esperado: 5 filas ordenadas DESC
-- Columnas: producto, total_vendido

-- Tablas:
-- Tipo de JOIN:
-- Tu query:




-- Verificación: El top debe tener productos de Electrónica


-- ============================================
-- REPORTE 3: Ingresos por producto
-- ============================================
-- Objetivo: Suma de subtotales por producto
-- Resultado esperado: 8 productos (los vendidos)
-- Columnas: producto, ingresos_totales

-- Tablas:
-- Tipo de JOIN:
-- Tu query:




-- Verificación: Laptop debe tener los mayores ingresos


-- ============================================
-- REPORTE 4: Análisis de órdenes
-- ============================================
-- Objetivo: Cada orden con usuario, # productos y valor promedio por item
-- Resultado esperado: 5 filas
-- Columnas: orden_id, usuario, num_productos, valor_promedio_item

-- Tablas:
-- Tipo de JOIN:
-- Tu query:




-- Verificación: SELECT COUNT(*) ... = 5


-- ============================================
-- REPORTE 5: Categorías más vendidas
-- ============================================
-- Objetivo: Total de ingresos por categoría
-- Resultado esperado: 3 categorías con ventas
-- Columnas: categoria, total_ingresos

-- Tablas: categorias, productos, orden_detalles
-- Tipo de JOIN:
-- Tu query:




-- Verificación: Electrónica debe liderar


-- ============================================
-- REPORTE 6: Análisis de stock vs ventas
-- ============================================
-- Objetivo: Productos con su stock actual vs unidades vendidas
-- Resultado esperado: 16 filas (todos los productos)
-- Columnas: producto, stock_actual, unidades_vendidas (NULL si no vendido)

-- Tablas:
-- Tipo de JOIN:
-- Tu query:




-- Verificación: 8 productos deben tener NULL en ventas


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
