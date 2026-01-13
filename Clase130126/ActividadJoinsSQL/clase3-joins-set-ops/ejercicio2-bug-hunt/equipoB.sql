-- ============================================
-- EJERCICIO 2: BUG HUNT — EQUIPO B
-- ============================================
-- Ruta de JOIN: categorias → productos
-- 
-- INSTRUCCIONES:
-- 1. Ejecuta cada query
-- 2. Identifica el bug
-- 3. Corrige y documenta
-- ============================================

-- ============================================
-- BUG 1: Productos de electrónica con su categoría
-- Objetivo: Mostrar productos de Electrónica con nombre de categoría
-- Resultado esperado: 6 productos de electrónica
-- ============================================

SELECT p.nombre AS producto, c.nombre AS categoria
FROM productos p
LEFT JOIN categorias c ON p.categoria_id = c.id
WHERE c.nombre = 'Electrónica';

-- ¿Hay diferencia si usas INNER JOIN? _____
-- ¿Por qué LEFT no aporta nada aquí? _____
--
-- BUG ENCONTRADO:
-- [No es error de sintaxis, pero... ¿es el JOIN correcto?]
--
-- OBSERVACIÓN:
-- [Escribe por qué LEFT JOIN es innecesario aquí]


-- ============================================
-- BUG 2: Todas las categorías con precio promedio
-- Objetivo: Mostrar categorías y precio promedio de sus productos
-- Resultado esperado: 5 categorías, algunas con NULL en promedio
-- ============================================

SELECT c.nombre, AVG(p.precio) AS precio_promedio
FROM categorias c
INNER JOIN productos p ON c.id = p.categoria_id
GROUP BY c.nombre;

-- ¿Aparecen las 5 categorías? _____
-- ¿Cuáles faltan? _____
--
-- BUG ENCONTRADO:
-- [Escribe aquí qué está mal]
--
-- QUERY CORREGIDA:
-- [Escribe tu corrección aquí]


-- ============================================
-- BUG 3: Productos con categoría (JOIN implícito mal hecho)
-- Objetivo: Listar productos con nombre de categoría
-- Resultado esperado: 16 productos con su categoría correcta
-- ============================================

SELECT p.nombre AS producto, c.nombre AS categoria
FROM productos p, categorias c;

-- ¿Cuántas filas obtuviste? _____
-- ¿Por qué tantas? _____
--
-- BUG ENCONTRADO:
-- [Escribe aquí qué está mal]
--
-- QUERY CORREGIDA:
-- [Escribe tu corrección aquí]


-- ============================================
-- BUG 4: Categorías con más de 3 productos
-- Objetivo: Categorías que tienen más de 3 productos
-- Resultado esperado: 2 categorías (Electrónica=6, Ropa=5)
-- ============================================

SELECT c.nombre, COUNT(*) AS total
FROM categorias c
LEFT JOIN productos p ON c.id = p.categoria_id
WHERE COUNT(*) > 3
GROUP BY c.nombre;

-- ¿Qué error da PostgreSQL? _____
-- ¿Dónde va la condición de filtro de agregados? _____
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
