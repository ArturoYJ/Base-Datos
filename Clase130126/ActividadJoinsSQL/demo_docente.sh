#!/bin/bash
# ============================================
# DEMO DOCENTE - Automatización de la Práctica
# ============================================
# Uso: ./demo_docente.sh
# Este script ejecuta toda la práctica paso a paso
# mostrando explicaciones para el docente
# ============================================

set -e  # Detener si hay errores

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # Sin color
BOLD='\033[1m'

# Configuración
CONTAINER_NAME="postgres_container"
DB_NAME="actividad_db"
DB_USER="postgres"

# Función para pausar y explicar
paso() {
    echo ""
    echo -e "${CYAN}════════════════════════════════════════════════════════════${NC}"
    echo -e "${BOLD}${YELLOW}PASO $1: $2${NC}"
    echo -e "${CYAN}════════════════════════════════════════════════════════════${NC}"
    echo -e "${BLUE}📝 $3${NC}"
    echo ""
    read -p "Presiona ENTER para continuar..."
    echo ""
}

exito() {
    echo -e "${GREEN}✅ $1${NC}"
}

error() {
    echo -e "${RED}❌ $1${NC}"
}

info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

ejecutar() {
    echo -e "${YELLOW}$ $1${NC}"
    eval "$1"
}

# ============================================
# INICIO DEL SCRIPT
# ============================================

clear
echo -e "${BOLD}${GREEN}"
echo "╔════════════════════════════════════════════════════════════╗"
echo "║         🎓 DEMO DOCENTE - Práctica PostgreSQL             ║"
echo "║                                                            ║"
echo "║  Este script automatiza toda la práctica y explica        ║"
echo "║  cada paso para que puedas demostrarlo en clase.          ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo -e "${NC}"
echo ""
info "Directorio actual: $(pwd)"
info "Fecha: $(date)"
echo ""
read -p "Presiona ENTER para comenzar la demostración..."

# ============================================
# PASO 1: Verificar Docker
# ============================================
paso "1" "Verificar que Docker está corriendo" \
    "Antes de empezar, verificamos que Docker Desktop esté activo y funcionando."

ejecutar "docker --version"
ejecutar "docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}'"

if docker ps > /dev/null 2>&1; then
    exito "Docker está funcionando correctamente"
else
    error "Docker no está corriendo. Inicia Docker Desktop primero."
    exit 1
fi

# ============================================
# PASO 2: Levantar PostgreSQL
# ============================================
paso "2" "Levantar contenedor de PostgreSQL" \
    "Usamos docker-compose para crear un contenedor con PostgreSQL 16. El archivo docker-compose.yml define las credenciales y el volumen para persistencia."

info "Contenido de docker-compose.yml:"
cat docker-compose.yml | head -20

echo ""
ejecutar "docker compose up -d"

echo ""
info "Esperando que PostgreSQL inicie (5 segundos)..."
sleep 5

ejecutar "docker compose logs postgres | tail -10"

# Verificar que el contenedor está corriendo
if docker ps | grep -q "$CONTAINER_NAME"; then
    exito "Contenedor $CONTAINER_NAME está corriendo"
else
    error "El contenedor no inició correctamente"
    exit 1
fi

# ============================================
# PASO 3: Conectar a PostgreSQL
# ============================================
paso "3" "Verificar conexión a PostgreSQL" \
    "Probamos que podemos conectarnos al contenedor y ejecutar comandos SQL básicos."

info "Listando bases de datos:"
ejecutar "docker exec $CONTAINER_NAME psql -U $DB_USER -c '\l'"

info "Verificando que la base $DB_NAME existe:"
ejecutar "docker exec $CONTAINER_NAME psql -U $DB_USER -d $DB_NAME -c 'SELECT current_database(), current_user, version();'"

exito "Conexión exitosa a la base de datos"

# ============================================
# PASO 4: Ejecutar Schema
# ============================================
paso "4" "Ejecutar schema.sql (DDL)" \
    "Ahora ejecutamos el archivo schema.sql que crea todas las tablas, llaves foráneas, constraints e índices."

info "Vista previa de schema.sql (primeras 30 líneas):"
head -30 db/schema.sql

echo ""
info "Ejecutando schema.sql..."
ejecutar "docker exec -i $CONTAINER_NAME psql -U $DB_USER -d $DB_NAME < db/schema.sql"

echo ""
info "Verificando tablas creadas:"
ejecutar "docker exec $CONTAINER_NAME psql -U $DB_USER -d $DB_NAME -c '\dt'"

exito "Schema creado exitosamente"

# ============================================
# PASO 5: Ejecutar Seeds
# ============================================
paso "5" "Ejecutar seed.sql (DML - Datos iniciales)" \
    "Insertamos datos de prueba coherentes siguiendo el orden correcto: primero catálogos, luego entidades, finalmente relaciones."

info "Vista previa de seed.sql (primeras 30 líneas):"
head -30 db/seed.sql

echo ""
info "Ejecutando seed.sql..."
ejecutar "docker exec -i $CONTAINER_NAME psql -U $DB_USER -d $DB_NAME < db/seed.sql"

echo ""
info "Verificando conteos:"
docker exec $CONTAINER_NAME psql -U $DB_USER -d $DB_NAME -c "
SELECT 'categorias' AS tabla, COUNT(*) AS registros FROM categorias
UNION ALL SELECT 'usuarios', COUNT(*) FROM usuarios
UNION ALL SELECT 'productos', COUNT(*) FROM productos
UNION ALL SELECT 'ordenes', COUNT(*) FROM ordenes
UNION ALL SELECT 'orden_detalles', COUNT(*) FROM orden_detalles
ORDER BY tabla;
"

exito "Datos insertados exitosamente"

# ============================================
# PASO 6: Ejecutar Verificaciones
# ============================================
paso "6" "Ejecutar verify.sql (Queries de verificación)" \
    "Corremos queries que validan la integridad de los datos: JOINs, agregaciones y verificaciones de FKs."

info "Ejecutando verify.sql..."
ejecutar "docker exec -i $CONTAINER_NAME psql -U $DB_USER -d $DB_NAME < db/verify.sql"

exito "Verificaciones completadas"

# ============================================
# PASO 7: Demostrar Constraints
# ============================================
paso "7" "Demostrar que los constraints funcionan" \
    "Intentamos insertar datos inválidos para mostrar cómo PostgreSQL rechaza violaciones de integridad."

info "Intento 1: Insertar email duplicado (debe fallar por UNIQUE)"
echo ""
docker exec $CONTAINER_NAME psql -U $DB_USER -d $DB_NAME -c "
INSERT INTO usuarios (email, nombre, password_hash) 
VALUES ('ada@example.com', 'Ada Duplicada', 'hash');
" 2>&1 || echo -e "${GREEN}✅ Constraint UNIQUE funcionó correctamente${NC}"

echo ""
info "Intento 2: Insertar precio negativo (debe fallar por CHECK)"
echo ""
docker exec $CONTAINER_NAME psql -U $DB_USER -d $DB_NAME -c "
INSERT INTO productos (codigo, nombre, precio, stock, categoria_id) 
VALUES ('FAIL-001', 'Producto Inválido', -50.00, 10, 1);
" 2>&1 || echo -e "${GREEN}✅ Constraint CHECK funcionó correctamente${NC}"

echo ""
info "Intento 3: Insertar FK inválida (debe fallar por FOREIGN KEY)"
echo ""
docker exec $CONTAINER_NAME psql -U $DB_USER -d $DB_NAME -c "
INSERT INTO productos (codigo, nombre, precio, stock, categoria_id) 
VALUES ('FAIL-002', 'Sin Categoría', 10.00, 5, 999);
" 2>&1 || echo -e "${GREEN}✅ Constraint FK funcionó correctamente${NC}"

exito "Constraints demostrados exitosamente"

# ============================================
# PASO 8: Mostrar un Query Complejo
# ============================================
paso "8" "Query de ejemplo complejo" \
    "Mostramos un query con JOINs múltiples que combina varias tablas."

info "Query: Órdenes con detalle completo"
docker exec $CONTAINER_NAME psql -U $DB_USER -d $DB_NAME -c "
SELECT 
    u.nombre AS cliente,
    o.id AS orden,
    p.nombre AS producto,
    c.nombre AS categoria,
    od.cantidad,
    od.precio_unitario,
    od.subtotal,
    o.status
FROM ordenes o
JOIN usuarios u ON o.usuario_id = u.id
JOIN orden_detalles od ON o.id = od.orden_id
JOIN productos p ON od.producto_id = p.id
JOIN categorias c ON p.categoria_id = c.id
ORDER BY o.id, p.nombre
LIMIT 15;
"

exito "Query ejecutado exitosamente"

# ============================================
# PASO 9: Demostrar Reset
# ============================================
paso "9" "Demostrar reset de base de datos" \
    "Mostramos cómo reiniciar la práctica usando reset.sql (borra todo y recrea)."

info "Este paso es DESTRUCTIVO - reinicia toda la base de datos"
read -p "¿Deseas ejecutar el reset? (s/N): " respuesta

if [[ "$respuesta" =~ ^[Ss]$ ]]; then
    ejecutar "docker exec -i $CONTAINER_NAME psql -U $DB_USER -d $DB_NAME < db/reset.sql"
    exito "Base de datos reiniciada"
else
    info "Reset omitido"
fi

# ============================================
# RESUMEN FINAL
# ============================================
echo ""
echo -e "${BOLD}${GREEN}"
echo "╔════════════════════════════════════════════════════════════╗"
echo "║              ✅ DEMOSTRACIÓN COMPLETADA                    ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo -e "${NC}"
echo ""
echo -e "${BOLD}Resumen de lo que se demostró:${NC}"
echo "  1. ✅ Verificación de Docker"
echo "  2. ✅ Levantamiento de PostgreSQL con docker-compose"
echo "  3. ✅ Conexión y verificación de base de datos"
echo "  4. ✅ Ejecución de schema.sql (DDL)"
echo "  5. ✅ Ejecución de seed.sql (DML)"
echo "  6. ✅ Verificaciones con verify.sql"
echo "  7. ✅ Prueba de constraints (UNIQUE, CHECK, FK)"
echo "  8. ✅ Query complejo con múltiples JOINs"
echo "  9. ✅ Reset de base de datos"
echo ""
echo -e "${BOLD}Comandos útiles para la clase:${NC}"
echo "  📌 docker compose up -d          # Levantar PostgreSQL"
echo "  📌 docker compose down           # Detener contenedor"
echo "  📌 docker compose down -v        # Detener y borrar volumen"
echo "  📌 docker exec -it $CONTAINER_NAME psql -U $DB_USER -d $DB_NAME"
echo ""
echo -e "${CYAN}¡Listo para la clase! 🎓${NC}"
