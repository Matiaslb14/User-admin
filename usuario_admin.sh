#!/bin/bash

LOG_FILE="/var/log/usuario_admin.log"

# Función para mostrar ayuda
mostrar_ayuda() {
    echo "Uso: $0 -c usuario -g grupo -e fecha_expiracion -p permisos"
    echo "Opciones:"
    echo "  -c  Crear usuario (nombre)"
    echo "  -g  Asignar a grupo"
    echo "  -e  Expirar cuenta (formato: YYYY-MM-DD)"
    echo "  -p  Permisos (ej: 755 para /home/usuario)"
    echo "  -h  Mostrar ayuda"
    exit 1
}

# Función para registrar logs
log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

# Procesar parámetros
while getopts ":c:g:e:p:h" opcion; do
    case $opcion in
        c) USUARIO="$OPTARG" ;;
        g) GRUPO="$OPTARG" ;;
        e) EXPIRA="$OPTARG" ;;
        p) PERMISOS="$OPTARG" ;;
        h) mostrar_ayuda ;;
        \?) echo "Opción inválida: -$OPTARG" >&2; mostrar_ayuda ;;
        :) echo "Opción -$OPTARG requiere un argumento." >&2; mostrar_ayuda ;;
    esac
done

# Validación mínima
if [ -z "$USUARIO" ]; then
    echo "Debes indicar al menos el nombre del usuario (-c)." >&2
    mostrar_ayuda
fi
# Verificar si el usuario ya existe
if id "$USUARIO" &>/dev/null; then
    echo "El usuario '$USUARIO' ya existe." >&2
    log "Intento fallido: Usuario '$USUARIO' ya existe."
    exit 1
fi

# Crear usuario con directorio home y shell bash
useradd -m -s /bin/bash "$USUARIO"
if [ $? -eq 0 ]; then
    log "Usuario '$USUARIO' creado exitosamente."
    echo "✅ Usuario '$USUARIO' creado."
else
    echo "❌ Error al crear el usuario." >&2
    log "Error al crear el usuario '$USUARIO'."
    exit 1
fi

# Si se especificó un grupo
if [ -n "$GRUPO" ]; then
    # Verificar si el grupo existe, si no lo crea
    if ! getent group "$GRUPO" > /dev/null; then
        groupadd "$GRUPO"
        log "Grupo '$GRUPO' creado."
    fi

    usermod -aG "$GRUPO" "$USUARIO"
    log "Usuario '$USUARIO' agregado al grupo '$GRUPO'."
    echo "📦 Grupo '$GRUPO' asignado a '$USUARIO'."
fi

# Si se especificó una fecha de expiración
if [ -n "$EXPIRA" ]; then
    chage -E "$EXPIRA" "$USUARIO"
    log "Cuenta de '$USUARIO' expirará el $EXPIRA."
    echo "⏳ Expiración de cuenta: $EXPIRA"
fi

# Si se especificaron permisos
if [ -n "$PERMISOS" ]; then
    chmod "$PERMISOS" "/home/$USUARIO"
    chown "$USUARIO":"$USUARIO" "/home/$USUARIO"
    log "Permisos de /home/$USUARIO establecidos en $PERMISOS."
    echo "🔐 Permisos aplicados: $PERMISOS en /home/$USUARIO"
fi

