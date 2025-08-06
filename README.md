# 🧑‍💻 Proyecto 02 - Administrador de Usuarios en Bash

## 📌 Descripción

Script Bash para automatizar la gestión de usuarios en sistemas Linux. Permite:

- Crear usuarios
- Asignarlos a grupos
- Establecer permisos de su carpeta personal
- Configurar fecha de expiración de cuenta
- Registrar todas las acciones en un log (/var/log/usuario_admin.log)

Este proyecto es parte de mi camino de especialización en **Ciberseguridad + Automatización Linux**, aprovechando Bash como herramienta clave para tareas de SysAdmin.

---

## ⚙️ Uso

```bash
sudo ./usuario_admin.sh -c usuario -g grupo -e fecha_expiracion -p permisos

📘 Opciones:

Flag	Descripción
-c	Nombre del usuario a crear
-g	Grupo al que se asignará
-e	Fecha de expiración de la cuenta (YYYY-MM-DD)
-p	Permisos para /home/usuario (ej: 700)
-h	Mostrar ayuda

📝 Ejemplo

sudo ./usuario_admin.sh -c juanito -g redes -e 2025-12-31 -p 700

Resultado:

Crea el usuario juanito

Crea y asigna al grupo redes (si no existe)

Expira la cuenta el 31 de diciembre de 2025

Establece permisos 700 en su carpeta personal

Registra todo en /var/log/usuario_admin.log


🧠 Comandos utilizados

useradd, groupadd, usermod, chage

chmod, chown, getent

getopts, logger, date

📁 Registro de Acciones

Se guarda en: /var/log/usuario_admin.log

Ejemplo de log:

2025-08-06 14:10:02 - Usuario 'juanito' creado exitosamente.
2025-08-06 14:10:02 - Grupo 'redes' creado.
2025-08-06 14:10:02 - Usuario 'juanito' agregado al grupo 'redes'.
2025-08-06 14:10:02 - Cuenta de 'juanito' expirará el 2025-12-31.
2025-08-06 14:10:02 - Permisos de /home/juanito establecidos en 700.
