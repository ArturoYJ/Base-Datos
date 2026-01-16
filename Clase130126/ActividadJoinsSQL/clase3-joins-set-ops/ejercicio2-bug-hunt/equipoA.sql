-- ============================================
-- EJERCICIO 2: BUG HUNT — EQUIPO A
-- ============================================
-- Ruta de JOIN: categorias → productos
-- 
-- INSTRUCCIONES:
-- 1. Ejecuta cada query
-- 2. Identifica el bug
-- 3. Corrige y documenta
-- ============================================

-- ============================================
-- BUG 1: Listar todas las categorías con sus productos
-- Objetivo: Mostrar TODAS las categorías, incluso sin productos
-- Resultado esperado: 5 categorías (algunas con NULL en producto)
-- ============================================

-- QUERY ORIGINAL (con bug):
-- SELECT c.nombre AS categoria, p.nombre AS producto
-- FROM categorias c
-- LEFT JOIN productos p ON c.id = p.categoria_id
-- WHERE p.precio > 0;

-- BUG ENCONTRADO:
-- El filtro WHERE p.precio > 0 se aplica después del JOIN. 
-- Como las categorías sin productos tienen p.precio como NULL, el WHERE las elimina,
-- transformando el LEFT JOIN en un INNER JOIN accidentalmente.

-- QUERY CORREGIDA:
SELECT c.nombre AS categoria, p.nombre AS producto
FROM categorias c
LEFT JOIN productos p ON c.id = p.categoria_id AND p.precio > 0;

-- VERIFICACIÓN:
-- Resultado esperado: 5 categorías (incluyendo Deportes y Libros con NULL)
-- Resultado obtenido: 17 filas (15 productos + 2 categorías con NULL)


-- ============================================
-- BUG 2: Productos con nombre de categoría
-- Objetivo: Cada producto debe mostrar su categoría
-- Resultado esperado: 16 productos, cada uno con su categoría
-- ============================================

-- QUERY ORIGINAL (con bug):
-- SELECT p.nombre AS producto, c.nombre AS categoria
-- FROM productos p
-- INNER JOIN categorias c ON p.id = c.id;

-- BUG ENCONTRADO:
-- La condición de unión está usando p.id (ID del producto) en lugar de p.categoria_id.
-- Esto intenta unir el producto #1 con la categoría #1, lo cual es incorrecto.

-- QUERY CORREGIDA:
SELECT p.nombre AS producto, c.nombre AS categoria
FROM productos p
INNER JOIN categorias c ON p.categoria_id = c.id;

-- VERIFICACIÓN:
-- Resultado esperado: 16 productos
-- Resultado obtenido: 16 filas


-- ============================================
-- BUG 3: Categorías y conteo de productos
-- Objetivo: Contar productos por categoría
-- Resultado esperado: 5 filas (una por categoría)
-- ============================================

-- QUERY ORIGINAL (con bug):
-- SELECT c.nombre, COUNT(p.id) AS total_productos
-- FROM categorias c, productos p
-- WHERE c.id = p.categoria_id;

-- BUG ENCONTRADO:
-- Falta la cláusula GROUP BY para realizar el conteo por categoría. 
-- Además, usa una sintaxis de JOIN antigua que por defecto funciona como INNER JOIN.

-- QUERY CORREGIDA:
SELECT c.nombre, COUNT(p.id) AS total_productos
FROM categorias c
LEFT JOIN productos p ON c.id = p.categoria_id
GROUP BY c.nombre;

-- VERIFICACIÓN:
-- Resultado esperado: 5 filas
-- Resultado obtenido: 5 filas


-- ============================================
-- BUG 4: Categorías sin productos
-- Objetivo: Encontrar categorías que NO tienen productos
-- Resultado esperado: 2 categorías (Deportes y Libros)
-- ============================================

-- QUERY ORIGINAL (con bug):
-- SELECT c.nombre AS categoria_sin_productos
-- FROM categorias c
-- INNER JOIN productos p ON c.id = p.categoria_id
-- WHERE p.id IS NULL;

-- BUG ENCONTRADO:
-- Un INNER JOIN nunca devolverá p.id como NULL porque solo trae coincidencias exactas.
-- Se requiere un LEFT JOIN para encontrar los registros de la izquierda que no tienen par en la derecha.

-- QUERY CORREGIDA:
SELECT c.nombre AS categoria_sin_productos
FROM categorias c
LEFT JOIN productos p ON c.id = p.categoria_id
WHERE p.id IS NULL;

-- VERIFICACIÓN:
-- Resultado esperado: 2 categorías Deportes y Libros
-- Resultado obtenido: 2 filas


-- ============================================
-- VERIFICACIÓN FINAL
-- ============================================
-- [x] Corregí las 4 queries
-- [x] Documenté cada bug
-- [x] Los resultados coinciden con lo esperado
-- 
-- Comentario del equipo:
-- Aprendimos que el orden de ejecución de SQL importa mucho, especialmente cómo 
-- el WHERE puede filtrar registros que el LEFT JOIN intentaba preservar.
-- ============================================
