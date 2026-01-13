# Ejercicio 2: Bug Hunt — Encuentra y Corrige los Errores

## 🎯 Objetivo
Identificar y corregir errores comunes en consultas SQL con JOINs.

## ⏱️ Tiempo: 25 minutos

## 📋 Roles
| Rol | Responsabilidad |
|-----|-----------------|
| **Driver** | Ejecuta las queries, escribe correcciones |
| **Navigator** | Analiza el error, propone solución |
| **QA** | Verifica resultado esperado vs obtenido |

---

## 🔧 Setup

1. Conectar a la base de datos:
```bash
docker exec -it postgres_container psql -U postgres -d actividad_db
```

2. Abrir el archivo de tu equipo:
   - Equipo A: `equipoA.sql`
   - Equipo B: `equipoB.sql`
   - ... etc.

---

## 📝 Instrucciones

Cada archivo contiene **4 queries con bugs**. Para cada una:

1. **Ejecutar** la query tal cual está
2. **Analizar** por qué el resultado es incorrecto
3. **Documentar** el bug encontrado
4. **Corregir** la query
5. **Verificar** con el resultado esperado

---

## 🐛 Tipos de Bugs a Buscar

| Bug | Descripción | Pista |
|-----|-------------|-------|
| WHERE mata LEFT | Un WHERE en tabla derecha convierte LEFT en INNER | NULLs desaparecen |
| ON incorrecto | La condición de JOIN está mal | Producto cartesiano o datos incorrectos |
| JOIN cruzado | Falta la condición ON | Demasiadas filas |
| INNER vs LEFT | Tipo de JOIN incorrecto para el objetivo | Filas faltantes o sobrantes |

---

## ✅ Formato de Entregable

En tu archivo `equipoX.sql`, edita cada query así:

```sql
-- ============================================
-- BUG 1: [Nombre descriptivo del bug]
-- ============================================

-- QUERY ORIGINAL (con bug):
-- [La query original comentada]

-- BUG ENCONTRADO:
-- [Explicación de cuál es el problema]

-- QUERY CORREGIDA:
SELECT ...
FROM ...
JOIN ...;

-- VERIFICACIÓN:
-- Resultado esperado: X filas
-- Resultado obtenido: X filas ✓
```

---

## 🔍 Cómo Verificar

Cada bug tiene un "resultado esperado" comentado. Usa:
- `COUNT(*)` para verificar número de filas
- `LIMIT 5` para revisar datos de ejemplo
- Compara columnas NULL vs valores

---

## 🚫 Regla Anti-Copy-Paste

Si usas IA para ayudarte, documenta:
```sql
-- IA: "¿Por qué mi LEFT JOIN no muestra NULLs?" 
-- → Aprendí que WHERE filtra después del JOIN
```

---

## ✅ Checkpoint Final

Antes de terminar, verifica:
- [ ] ¿Corregiste las 4 queries?
- [ ] ¿Documentaste cada bug encontrado?
- [ ] ¿Verificaste los resultados?
- [ ] ¿Agregaste comentarios explicativos?

**Continuar con:** [Ejercicio 3: Reportes](../ejercicio3-reportes/README.md)
