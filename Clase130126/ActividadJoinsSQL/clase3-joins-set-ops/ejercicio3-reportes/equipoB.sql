-- ============================================
-- EJERCICIO 3: REPORTES — EQUIPO B
-- ============================================
-- Ruta de JOIN: categorias → productos
-- 
-- INSTRUCCIONES:
-- Completa cada reporte con la query correcta
-- ============================================

-- ============================================
-- REPORTE 1: Inventario valorizado por categoría
-- ============================================
-- Objetivo: Total de inventario (precio × stock) por categoría
-- Resultado esperado: 3 filas (categorías con productos)
-- Columnas: categoria, valor_inventario

-- Tablas:
-- Tipo de JOIN:
-- Tu query:




-- Verificación: La suma total debe ser significativa


-- ============================================
-- REPORTE 2: Stock total por categoría
-- ============================================
-- Objetivo: Sumar stock de productos por categoría
-- Resultado esperado: 5 filas (incluir categorías sin productos)
-- Columnas: categoria, stock_total

-- Tablas:
-- Tipo de JOIN:
-- Tu query:




-- Verificación: SELECT COUNT(*) ... = 5


-- ============================================
-- REPORTE 3: Productos ordenados por precio
-- ============================================
-- Objetivo: Lista de productos con categoría, ordenados por precio DESC
-- Resultado esperado: 16 filas ordenadas
-- Columnas: producto, categoria, precio

-- Tablas:
-- Tipo de JOIN:
-- Tu query:




-- Verificación: El producto más caro debe ser Laptop


-- ============================================
-- REPORTE 4: Productos de Ropa
-- ============================================
-- Objetivo: Solo productos de la categoría "Ropa"
-- Resultado esperado: 5 filas
-- Columnas: codigo, nombre, precio

-- Tablas:
-- Tipo de JOIN:
-- Tu query:




-- Verificación: SELECT COUNT(*) ... = 5


-- ============================================
-- REPORTE 5: Categorías con más de 3 productos
-- ============================================
-- Objetivo: Categorías que tienen más de 3 productos
-- Resultado esperado: 2 filas (Electrónica=6, Ropa=5)
-- Columnas: categoria, total_productos

-- Tablas:
-- Tipo de JOIN:
-- Cláusula especial: HAVING
-- Tu query:




-- Verificación: SELECT COUNT(*) ... = 2


-- ============================================
-- REPORTE 6: Producto más caro por categoría
-- ============================================
-- Objetivo: El producto más caro de cada categoría
-- Resultado esperado: 3 filas (una por categoría con productos)
-- Columnas: categoria, max_precio

-- Tablas:
-- Tipo de JOIN:
-- Tu query:




-- Verificación: Electrónica debe tener max ~1299.99


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
