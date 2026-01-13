# Ejercicio 3: Reportes con JOINs

## 🎯 Objetivo
Crear consultas de reportes reales combinando datos de múltiples tablas.

## ⏱️ Tiempo: 45 minutos

## 📋 Roles
| Rol | Responsabilidad |
|-----|-----------------|
| **Driver** | Escribe las queries |
| **Navigator** | Diseña la lógica del JOIN |
| **QA** | Verifica resultados con COUNT/LIMIT |

---

## 🔧 Setup

```bash
docker exec -it postgres_container psql -U postgres -d actividad_db
```

---

## 📝 Instrucciones

Tu archivo tiene **6 reportes** para completar. Para cada uno:

1. **Leer** el objetivo del reporte
2. **Identificar** qué tablas necesitas
3. **Determinar** el tipo de JOIN (INNER vs LEFT)
4. **Escribir** la query
5. **Verificar** con el resultado esperado

---

## 🔍 Guía de Verificación

| Técnica | Cuándo usar |
|---------|-------------|
| `COUNT(*)` | Para verificar número de filas |
| `LIMIT 5` | Para revisar datos de muestra |
| `ORDER BY ... DESC LIMIT 1` | Para verificar máximos |
| `WHERE ... IS NULL` | Para verificar huérfanos |

---

## ✏️ Formato de Entregable

```sql
-- ============================================
-- REPORTE 1: [Nombre del reporte]
-- ============================================
-- Tablas usadas: [lista de tablas]
-- Tipo de JOIN: [INNER/LEFT/RIGHT]
-- Resultado esperado: [X filas]

SELECT ...
FROM ...
JOIN ...;

-- Verificación: COUNT(*) = X ✓
```

---

## 💡 Tips por Tipo de JOIN

### INNER JOIN → Cuando necesitas datos de AMBAS tablas
```sql
-- Ejemplo: Productos CON categoría (todos tienen)
SELECT p.nombre, c.nombre
FROM productos p
INNER JOIN categorias c ON p.categoria_id = c.id;
```

### LEFT JOIN → Cuando la tabla izquierda puede no tener match
```sql
-- Ejemplo: Usuarios con o sin órdenes
SELECT u.nombre, o.id
FROM usuarios u
LEFT JOIN ordenes o ON u.id = o.usuario_id;
```

### LEFT JOIN + IS NULL → Para encontrar "huérfanos"
```sql
-- Ejemplo: Usuarios SIN órdenes
SELECT u.nombre
FROM usuarios u
LEFT JOIN ordenes o ON u.id = o.usuario_id
WHERE o.id IS NULL;
```

---

## 🚫 Regla Anti-Copy-Paste

Si usas IA, documenta:
```sql
-- IA: [prompt] → [qué aprendí]
```

---

## ✅ Checkpoint Final

- [ ] ¿Completaste los 6 reportes?
- [ ] ¿Documentaste tablas y tipo de JOIN?
- [ ] ¿Verificaste cada resultado?
- [ ] ¿Agregaste comentarios explicativos?

**Continuar con:** [Ejercicio 4: Set Ops](../ejercicio4-set-ops/README.md)
