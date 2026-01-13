# Ejercicio 1: SQL on Paper — Diagramas Venn y JOINs

## 🎯 Objetivo
Comprender visualmente cómo funcionan los diferentes tipos de JOIN antes de escribir código.

## ⏱️ Tiempo: 20 minutos

## 📋 Roles
- **Facilitador** (1 persona): Lee las preguntas en voz alta
- **Equipo**: Dibuja/discute las respuestas

---

## 📚 Teoría: Los 4 Tipos de JOIN

### Tablas de Ejemplo
```
TABLA A (izquierda)     TABLA B (derecha)
+----+--------+         +----+--------+------+
| id | nombre |         | id | item   | a_id |
+----+--------+         +----+--------+------+
| 1  | Ada    |         | 1  | Mouse  | 1    |
| 2  | Bob    |         | 2  | Laptop | 1    |
| 3  | Carol  |         | 3  | Silla  | 4    |  ← a_id=4 NO existe en A
+----+--------+         +----+--------+------+
```

---

### 1️⃣ INNER JOIN
> "Dame solo las filas donde **HAY MATCH** en ambas tablas"

```
     ┌─────────────────────────┐
     │    A         B         │
     │   ┌───┐   ┌───┐        │
     │   │   │▓▓▓│   │        │
     │   │   │▓▓▓│   │        │
     │   └───┘   └───┘        │
     │          ↑             │
     │     Solo esto          │
     └─────────────────────────┘
```

```sql
SELECT a.nombre, b.item
FROM tabla_a a
INNER JOIN tabla_b b ON a.id = b.a_id;
```

**Resultado:**
```
| nombre | item   |
|--------|--------|
| Ada    | Mouse  |
| Ada    | Laptop |
```
✅ Bob y Carol NO aparecen (no tienen items)
✅ Silla NO aparece (a_id=4 no existe)

---

### 2️⃣ LEFT JOIN (LEFT OUTER JOIN)
> "Dame **TODAS las filas de A**, y si hay match en B, inclúyelo"

```
     ┌─────────────────────────┐
     │    A         B         │
     │   ┌───┐   ┌───┐        │
     │   │▓▓▓│▓▓▓│   │        │
     │   │▓▓▓│▓▓▓│   │        │
     │   └───┘   └───┘        │
     │   ↑                    │
     │   Todo A + match B     │
     └─────────────────────────┘
```

```sql
SELECT a.nombre, b.item
FROM tabla_a a
LEFT JOIN tabla_b b ON a.id = b.a_id;
```

**Resultado:**
```
| nombre | item   |
|--------|--------|
| Ada    | Mouse  |
| Ada    | Laptop |
| Bob    | NULL   |  ← Aparece aunque no tiene items
| Carol  | NULL   |  ← Aparece aunque no tiene items
```

---

### 3️⃣ RIGHT JOIN (RIGHT OUTER JOIN)
> "Dame **TODAS las filas de B**, y si hay match en A, inclúyelo"

```
     ┌─────────────────────────┐
     │    A         B         │
     │   ┌───┐   ┌───┐        │
     │   │   │▓▓▓│▓▓▓│        │
     │   │   │▓▓▓│▓▓▓│        │
     │   └───┘   └───┘        │
     │              ↑         │
     │   Match A + todo B     │
     └─────────────────────────┘
```

```sql
SELECT a.nombre, b.item
FROM tabla_a a
RIGHT JOIN tabla_b b ON a.id = b.a_id;
```

**Resultado:**
```
| nombre | item   |
|--------|--------|
| Ada    | Mouse  |
| Ada    | Laptop |
| NULL   | Silla  |  ← Aparece aunque a_id=4 no existe
```

---

### 4️⃣ FULL OUTER JOIN
> "Dame **TODAS las filas de ambas**, con o sin match"

```
     ┌─────────────────────────┐
     │    A         B         │
     │   ┌───┐   ┌───┐        │
     │   │▓▓▓│▓▓▓│▓▓▓│        │
     │   │▓▓▓│▓▓▓│▓▓▓│        │
     │   └───┘   └───┘        │
     │   ↑           ↑        │
     │   Todo A + Todo B      │
     └─────────────────────────┘
```

```sql
SELECT a.nombre, b.item
FROM tabla_a a
FULL OUTER JOIN tabla_b b ON a.id = b.a_id;
```

**Resultado:**
```
| nombre | item   |
|--------|--------|
| Ada    | Mouse  |
| Ada    | Laptop |
| Bob    | NULL   |
| Carol  | NULL   |
| NULL   | Silla  |
```

---

## ✏️ Ejercicio en Papel

Sin ejecutar SQL, predice el resultado de estas consultas usando las tablas del schema real:

### Pregunta 1
```sql
SELECT c.nombre AS categoria, p.nombre AS producto
FROM categorias c
INNER JOIN productos p ON c.id = p.categoria_id
WHERE c.nombre = 'Libros';
```

**Tu predicción:**
- ¿Cuántas filas devuelve? _____
- ¿Por qué? _____________________

---

### Pregunta 2
```sql
SELECT u.nombre, o.id AS orden_id
FROM usuarios u
LEFT JOIN ordenes o ON u.id = o.usuario_id;
```

**Tu predicción:**
- ¿Aparecerán usuarios sin órdenes? _____
- ¿Con NULL o sin fila? _____

---

### Pregunta 3

Si cambio `LEFT JOIN` por `INNER JOIN` en la Pregunta 2:
- ¿Cambiará el resultado? _____
- ¿Cómo? _____________________

---

## 🔍 Verificación (después de discutir)

Ejecuta las queries en psql para verificar tus predicciones:

```bash
docker exec -it postgres_container psql -U postgres -d actividad_db
```

---

## 💡 Regla de Oro

> **LEFT JOIN + WHERE en tabla derecha = INNER JOIN accidental**

```sql
-- ❌ INCORRECTO: El WHERE "mata" el LEFT JOIN
SELECT u.nombre, o.id
FROM usuarios u
LEFT JOIN ordenes o ON u.id = o.usuario_id
WHERE o.status = 'pendiente';  -- Esto filtra los NULL

-- ✅ CORRECTO: Mover condición al ON
SELECT u.nombre, o.id
FROM usuarios u
LEFT JOIN ordenes o ON u.id = o.usuario_id 
                    AND o.status = 'pendiente';
```

---

## ✅ Checkpoint

Antes de continuar, asegúrate de poder responder:
1. ¿Cuál es la diferencia entre INNER y LEFT JOIN?
2. ¿Qué pasa con los NULL en un LEFT JOIN?
3. ¿Por qué un WHERE puede "romper" un LEFT JOIN?

**Continuar con:** [Ejercicio 2: Bug Hunt](../ejercicio2-bug-hunt/README.md)
