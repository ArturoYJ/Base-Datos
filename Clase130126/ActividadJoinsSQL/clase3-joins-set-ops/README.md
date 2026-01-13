# Clase 3: JOINs SQL y Operadores de Conjuntos

## 🎯 Objetivos de Aprendizaje

Al finalizar esta clase, serás capaz de:
1. Comprender y aplicar los diferentes tipos de JOIN (INNER, LEFT, RIGHT, FULL)
2. Identificar y corregir errores comunes en consultas con JOIN
3. Crear reportes que combinen datos de múltiples tablas
4. Utilizar operadores de conjuntos (UNION, INTERSECT, EXCEPT)

---

## ⏱️ Duración Total: 2.5 horas

| Ejercicio | Tiempo | Descripción |
|-----------|--------|-------------|
| 1. SQL on Paper | 20 min | Teoría + Diagramas Venn |
| 2. Bug Hunt | 25 min | Encontrar y corregir errores en queries |
| 3. Reportes | 45 min | Crear consultas de reportes reales |
| 4. Set Ops | 30 min | UNION, INTERSECT, EXCEPT |
| Buffer/Discusión | 20 min | Revisión grupal |

---

## 🔧 Setup Inicial (TODOS los equipos)

### 1. Levantar PostgreSQL
```bash
# Desde la raíz del repositorio
docker compose up -d

# Verificar que está corriendo
docker compose ps
```

### 2. Conectar a la Base de Datos
```bash
# Opción A: Desde terminal
docker exec -it postgres_container psql -U postgres -d actividad_db

# Opción B: Desde fuera del container
psql -h 127.0.0.1 -p 5433 -U postgres -d actividad_db
# Password: postgres123
```

### 3. Verificar Datos
```sql
-- Ejecutar dentro de psql para confirmar datos
SELECT COUNT(*) FROM usuarios;      -- Esperado: 6
SELECT COUNT(*) FROM productos;     -- Esperado: 16
SELECT COUNT(*) FROM ordenes;       -- Esperado: 5
SELECT COUNT(*) FROM orden_detalles; -- Esperado: 10
```

---

## 👥 Equipos y Variantes

Cada equipo tiene archivos específicos con variantes distintas del mismo ejercicio:

| Equipo | Ruta de JOIN principal | Archivos |
|--------|------------------------|----------|
| A | categorias → productos | equipoA.sql |
| B | categorias → productos | equipoB.sql |
| C | usuarios → ordenes | equipoC.sql |
| D | usuarios → ordenes | equipoD.sql |
| E | productos → detalles → ordenes → usuarios | equipoE.sql |
| F | productos → detalles → ordenes → usuarios | equipoF.sql |

---

## 📋 Roles por Ejercicio

Para cada ejercicio, rotar roles:

| Rol | Responsabilidad |
|-----|-----------------|
| **Driver** | Escribe el código, comparte pantalla |
| **Navigator** | Dicta la lógica, revisa sintaxis |
| **QA** | Verifica resultados, documenta |

> **Regla**: El Driver NO puede escribir código propio — solo lo que dicte el Navigator.

---

## 📂 Estructura de Ejercicios

```
clase3-joins-set-ops/
├── ejercicio1-sql-paper/   ← Teoría y diagramas
├── ejercicio2-bug-hunt/    ← Queries rotas a corregir
├── ejercicio3-reportes/    ← Reportes con JOINs
└── ejercicio4-set-ops/     ← UNION, INTERSECT, EXCEPT
```

---

## 🚫 Reglas Anti-Copy-Paste

1. **Bitácora IA**: Si usas ChatGPT/Copilot, documéntalo en tu archivo con:
   ```sql
   -- IA: [Prompt usado] → [Qué aprendí]
   ```

2. **Comentario obligatorio**: Cada query debe tener un comentario que explique:
   ```sql
   -- Este JOIN conecta productos con categorías
   -- para mostrar el nombre de categoría junto al producto
   ```

---

## ✅ Entregables por Ejercicio

| Ejercicio | Entregable | Dónde |
|-----------|------------|-------|
| 1 | Nada — solo discusión | N/A |
| 2 | Archivo corregido | `ejercicio2-bug-hunt/equipoX.sql` |
| 3 | Queries completadas | `ejercicio3-reportes/equipoX.sql` |
| 4 | Mini-retos resueltos | `ejercicio4-set-ops/equipoX.sql` |

---

## 💡 Tips

- Usa `LIMIT 5` para probar queries antes de ejecutar completo
- Usa `\x` en psql para formato expandido (más legible)
- Si una query tarda, presiona `Ctrl+C` para cancelar

---

## 🆘 ¿Problemas?

1. **Container no inicia**: `docker compose down -v && docker compose up -d`
2. **No hay datos**: Ejecutar `\i /scripts/seed.sql` dentro de psql
3. **Error de conexión**: Verificar que el puerto 5433 no esté ocupado

¡Comienza con [Ejercicio 1: SQL on Paper](./ejercicio1-sql-paper/README.md)!
