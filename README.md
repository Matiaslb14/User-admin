# 🧑‍💻 User Management in Bash  
### (Gestión de Usuarios en Bash)

---

## 📌 Description / Descripción  

**EN:**  
Bash script to automate user management in Linux systems.  
Features include:  
- Create users  
- Assign them to groups  
- Set permissions for their home directory  
- Configure account expiration date  
- Log all actions to `/var/log/user_admin.log`  

This project is part of my specialization in **Cybersecurity + Linux Automation**, leveraging Bash as a key tool for SysAdmin tasks.  

**ES:**  
Script en Bash para automatizar la gestión de usuarios en sistemas Linux.  
Incluye las siguientes funciones:  
- Crear usuarios  
- Asignarlos a grupos  
- Establecer permisos para su directorio personal  
- Configurar la fecha de expiración de la cuenta  
- Registrar todas las acciones en `/var/log/user_admin.log`  

Este proyecto forma parte de mi especialización en **Ciberseguridad + Automatización Linux**, utilizando Bash como herramienta principal para tareas de administración del sistema.

---

## ⚙️ Usage / Uso  

**EN:**  
Run the script with elevated permissions:  

```bash
sudo ./user_admin.sh -c username -g group -e expiration_date -p permissions

