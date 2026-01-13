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

SELECT c.nombre AS categoria, p.nombre AS producto
FROM categorias c
LEFT JOIN productos p ON c.id = p.categoria_id
WHERE p.precio > 0;

-- ¿Cuántas filas obtuviste? _____
-- ¿Aparece la categoría "Libros"? _____
-- 
-- BUG ENCONTRADO:
-- [Escribe aquí qué está mal]
--
-- QUERY CORREGIDA:
-- [Escribe tu corrección aquí]


-- ============================================
-- BUG 2: Productos con nombre de categoría
-- Objetivo: Cada producto debe mostrar su categoría
-- Resultado esperado: 16 productos, cada uno con su categoría
-- ============================================

SELECT p.nombre AS producto, c.nombre AS categoria
FROM productos p
INNER JOIN categorias c ON p.id = c.id;

-- ¿Cuántas filas obtuviste? _____
-- ¿Los datos tienen sentido? _____
--
-- BUG ENCONTRADO:
-- [Escribe aquí qué está mal]
--
-- QUERY CORREGIDA:
-- [Escribe tu corrección aquí]


-- ============================================
-- BUG 3: Categorías y conteo de productos
-- Objetivo: Contar productos por categoría
-- Resultado esperado: 5 filas (una por categoría)
-- ============================================

SELECT c.nombre, COUNT(p.id) AS total_productos
FROM categorias c, productos p
WHERE c.id = p.categoria_id;

-- ¿Cuántas filas obtuviste? _____
-- ¿Qué falta en la query? _____
--
-- BUG ENCONTRADO:
-- [Escribe aquí qué está mal]
--
-- QUERY CORREGIDA:
-- [Escribe tu corrección aquí]


-- ============================================
-- BUG 4: Categorías sin productos
-- Objetivo: Encontrar categorías que NO tienen productos
-- Resultado esperado: 2 categorías (Deportes y Libros)
-- ============================================

SELECT c.nombre AS categoria_sin_productos
FROM categorias c
INNER JOIN productos p ON c.id = p.categoria_id
WHERE p.id IS NULL;

-- ¿Cuántas filas obtuviste? _____
-- ¿Por qué no funciona? _____
--
-- BUG ENCONTRADO:
-- [Escribe aquí qué está mal]
--
-- QUERY CORREGIDA:
-- [Escribe tu corrección aquí]


-- ============================================
-- VERIFICACIÓN FINAL
-- ============================================
-- [ ] Corregí las 4 queries
-- [ ] Documenté cada bug
-- [ ] Los resultados coinciden con lo esperado
-- 
-- Comentario del equipo:
-- [¿Qué aprendieron de este ejercicio?]
-- ============================================
