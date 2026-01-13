-- ============================================
-- EJERCICIO 3: REPORTES — EQUIPO A
-- ============================================
-- Ruta de JOIN: categorias → productos
-- 
-- INSTRUCCIONES:
-- Completa cada reporte con la query correcta
-- ============================================

-- ============================================
-- REPORTE 1: Productos por categoría
-- ============================================
-- Objetivo: Listar cada categoría con la cantidad de productos
-- Resultado esperado: 3 filas (solo categorías CON productos)
-- Tipo de JOIN sugerido: INNER

-- Tablas:
-- Tipo de JOIN:
-- Tu query:




-- Verificación: SELECT COUNT(*) ... = 3


-- ============================================
-- REPORTE 2: Todas las categorías con conteo
-- ============================================
-- Objetivo: TODAS las categorías, mostrando 0 si no tienen productos
-- Resultado esperado: 5 filas (todas las categorías)
-- Tipo de JOIN sugerido: LEFT

-- Tablas:
-- Tipo de JOIN:
-- Tu query:




-- Verificación: SELECT COUNT(*) ... = 5


-- ============================================
-- REPORTE 3: Catálogo completo
-- ============================================
-- Objetivo: Cada producto con su nombre de categoría
-- Resultado esperado: 16 filas
-- Columnas: producto_nombre, categoria_nombre, precio

-- Tablas:
-- Tipo de JOIN:
-- Tu query:




-- Verificación: SELECT COUNT(*) ... = 16


-- ============================================
-- REPORTE 4: Productos de Electrónica
-- ============================================
-- Objetivo: Solo productos de la categoría "Electrónica"
-- Resultado esperado: 6 filas
-- Columnas: codigo, nombre, precio, stock

-- Tablas:
-- Tipo de JOIN:
-- Tu query:




-- Verificación: SELECT COUNT(*) ... = 6


-- ============================================
-- REPORTE 5: Precio promedio por categoría
-- ============================================
-- Objetivo: Calcular precio promedio de productos por categoría
-- Resultado esperado: 5 filas (NULL para categorías vacías)
-- Columnas: categoria, precio_promedio

-- Tablas:
-- Tipo de JOIN:
-- Tu query:




-- Verificación: SELECT COUNT(*) ... = 5


-- ============================================
-- REPORTE 6: Categorías vacías
-- ============================================
-- Objetivo: Encontrar categorías SIN productos
-- Resultado esperado: 2 filas (Deportes, Libros)
-- Columnas: categoria_nombre

-- Tablas:
-- Tipo de JOIN:
-- Técnica especial: LEFT JOIN + WHERE IS NULL
-- Tu query:




-- Verificación: SELECT COUNT(*) ... = 2


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
