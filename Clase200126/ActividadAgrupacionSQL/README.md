# Clase 4 - Agregaciones + Evidence Mindset

## Seccion A - Objetivo
- Definir el grain (una fila representa que).
- Elegir la metrica correcta (COUNT / COUNT DISTINCT / SUM / AVG).
- Justificar WHERE vs HAVING.
- Verificar resultados con evidencia (VERIFY).

## Seccion B - SQL on paper (8-10 min)
Tabla mini:

| cliente | orden_id | total | fecha_orden |
| ------: | -------: | ----: | :---------- |
| A       | 101      | 250   | 2026-01-01 |
| A       | 102      | 100   | 2026-01-03 |
| B       | 103      | 80    | 2026-01-03 |
| C       | 104      | 300   | 2026-01-04 |
| B       | 105      | 120   | 2026-01-05 |
| A       | 106      | 60    | 2026-01-06 |

Preguntas:
1. Que se agrupa?
2. Que metrica se calcula?
3. WHERE o HAVING y por que?

## Seccion C - Laboratorio (35 min)
Cada equipo trabaja en su archivo:
- `db/queries_agg_team_A.sql`
- `db/queries_agg_team_B.sql`
- `db/queries_agg_team_C.sql`
- `db/queries_agg_team_D.sql`
- `db/queries_agg_team_E.sql`
- `db/queries_agg_team_F.sql`

Completen o ajusten sus 3 reportes y ejecuten el archivo completo.

## Seccion D - Como ejecutar
```bash
docker compose up -d
docker compose ps
docker exec -i <postgres_container> psql -U <user> -d <db> < db/queries_agg_team_X.sql
```

## Seccion E - Que entregar
Su archivo `db/queries_agg_team_X.sql` con:
- 3 reportes completos
- comentarios de grain y metrica
- VERIFY funcionando

## Seccion F - Evidence mindset (rubrica rapida)
No se evalua que "corra y ya". Se evalua:
- explicacion del grain
- justificacion WHERE/HAVING
- VERIFY con evidencia real
- evitar conteos inflados (COUNT DISTINCT cuando aplique)
