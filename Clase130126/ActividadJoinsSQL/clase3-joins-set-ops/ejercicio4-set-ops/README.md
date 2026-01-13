# Ejercicio 4: Operadores de Conjuntos

## 🎯 Objetivo
Dominar los operadores de conjuntos SQL: UNION, INTERSECT, EXCEPT.

## ⏱️ Tiempo: 30 minutos

## 📋 Roles
| Rol | Responsabilidad |
|-----|-----------------|
| **Driver** | Escribe las queries |
| **Navigator** | Explica la lógica de conjuntos |
| **QA** | Verifica que los resultados tengan sentido |

---

## 📚 Teoría Rápida

### UNION — Combinar resultados (sin duplicados)
```sql
SELECT nombre FROM tabla_a
UNION
SELECT nombre FROM tabla_b;
-- Devuelve todos los nombres de ambas tablas, sin repetir
```

### UNION ALL — Combinar CON duplicados
```sql
SELECT nombre FROM tabla_a
UNION ALL
SELECT nombre FROM tabla_b;
-- Incluye duplicados (más rápido)
```

### INTERSECT — Solo los que están en AMBOS
```sql
SELECT nombre FROM tabla_a
INTERSECT
SELECT nombre FROM tabla_b;
-- Solo nombres que aparecen en las dos tablas
```

### EXCEPT — Los de A que NO están en B
```sql
SELECT nombre FROM tabla_a
EXCEPT
SELECT nombre FROM tabla_b;
-- Nombres de A que no existen en B
```

---

## ⚠️ Reglas Importantes

1. **Mismas columnas**: Los SELECT deben tener el mismo número de columnas
2. **Tipos compatibles**: Las columnas deben tener tipos compatibles
3. **ORDER BY al final**: Solo se puede usar al final de todo

```sql
-- ✅ CORRECTO
SELECT nombre, precio FROM productos WHERE precio > 100
UNION
SELECT nombre, precio FROM productos WHERE stock < 50
ORDER BY precio;  -- ORDER BY va al final

-- ❌ INCORRECTO
SELECT nombre FROM productos  -- 1 columna
UNION
SELECT nombre, precio FROM productos;  -- 2 columnas (ERROR)
```

---

## 🔍 Diagrama Mental

```
UNION:      A ∪ B    (todo lo de A + todo lo de B)
INTERSECT:  A ∩ B    (solo lo que está en ambos)
EXCEPT:     A - B    (lo de A que no está en B)
```

---

## 📝 Instrucciones

Tu archivo tiene **3 mini-retos**. Para cada uno:

1. **Leer** el objetivo
2. **Identificar** qué operador usar
3. **Escribir** las dos queries y el operador
4. **Verificar** el resultado

---

## 🔧 Setup

```bash
docker exec -it postgres_container psql -U postgres -d actividad_db
```

---

## 💡 Tips

- Prueba cada SELECT por separado primero
- Verifica que ambos SELECT tengan las mismas columnas
- Usa `ORDER BY` al final si necesitas ordenar

---

## ✅ Checkpoint Final

- [ ] ¿Completaste los 3 retos?
- [ ] ¿Explicaste por qué usaste cada operador?
- [ ] ¿Verificaste los resultados?

---

## 🏁 ¡Terminaste la Clase 3!

Revisa el [README principal](../README.md) para la discusión final.
