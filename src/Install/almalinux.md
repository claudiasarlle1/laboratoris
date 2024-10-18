# Instalación del sistema operativo AlmaLinux 9

En este laboratorio, instalaremos **AlmaLinux 9** en una máquina virtual y veremos todos los pasos necesarios, explicados de forma muy simple. Esta instalación será la base para todos los laboratorios que haremos en este curso. En algunos casos, te pediré que cambies algunos ajustes para adaptarlos a las necesidades del laboratorio.

## Configuración de la máquina virtual con VMWare

1. **Abre VMWare** (puedes usar VMWare Workstation Player o VMWare Fusion, según lo que tengas instalado en tu computadora).
2. **Haz clic en “Create a New Virtual Machine”** (esto significa crear una nueva máquina virtual).
3. **Selecciona la opción "Install from disc or image"**. Esto significa que vamos a usar un archivo de imagen para instalar el sistema.
4. **Selecciona el archivo ISO de AlmaLinux 9**. El archivo ISO es como un "disco virtual" que contiene el sistema operativo que vamos a instalar. Si aún no lo tienes, asegúrate de descargarlo desde la página oficial de AlmaLinux.
5. **Configura los recursos de la máquina virtual**. Aquí se te pedirá que configures cuánta memoria (RAM), espacio en disco y cuántos núcleos de CPU quieres asignar a la máquina virtual. Para este curso, con 2 GB de RAM y 20 GB de disco es suficiente, pero ajusta según tus necesidades.

## Instalación del sistema operativo AlmaLinux 9

1. **Inicia la máquina virtual** que acabas de crear. Verás una pantalla que te da varias opciones. Debes seleccionar la opción **Install AlmaLinux 9**. Esto iniciará el proceso de instalación.
   
2. **Selecciona el idioma de instalación**. Aquí debes escoger en qué idioma quieres que te aparezcan todas las instrucciones. Escoge **Español** si prefieres español, o cualquier otro idioma que te resulte más cómodo.

3. **Configura tu ubicación geográfica**. Esto es para que el sistema sepa en qué parte del mundo estás y ajuste cosas como la hora y la moneda. Escoge **España** si es tu país.

4. **Selecciona la disposición del teclado**. Aquí debes escoger el tipo de teclado que tienes. Si usas un teclado normal español, selecciona **Español**. Esto es importante para que el sistema sepa dónde están todas las teclas (como los acentos y las ñ).

5. **Configuración de la red**:

    - **Nombre de la máquina (hostname)**: Este es el nombre que identificará tu máquina en la red, es decir, cómo la llamará el sistema. Si es solo para prácticas, puedes ponerle cualquier nombre, por ejemplo, `mi-almalinux`. Esto solo sirve para diferenciar esta máquina de otras si tienes varias.
    
    > 💡 **Consejo**: Si trabajas en un entorno con muchos servidores, es importante poner nombres que tengan sentido para poder identificarlos fácilmente. Por ejemplo, si tu máquina es un servidor de bases de datos, puedes llamarlo `db-server`.

6. **Crea el usuario administrador (root)**:

    - En este paso, te pide que pongas una contraseña para el usuario `root`, que es el usuario principal con todos los permisos para hacer cambios importantes en el sistema. Si no quieres crear este usuario, puedes dejar la contraseña en blanco. Si decides crear uno, usa una contraseña sencilla como `1234` para este laboratorio, pero **en entornos reales siempre usa contraseñas seguras**.
    
    > ⚠️ **Importante**: Si dejas este campo en blanco, el sistema creará un usuario normal con permisos especiales (sudo) para que puedas hacer tareas de administrador sin ser `root`.

7. **Crea un usuario normal**:

    - **Nombre completo**: Puedes escribir tu nombre completo aquí o cualquier otro que quieras.
    - **Nombre de usuario**: Este es el nombre que usarás para iniciar sesión en el sistema. Por ejemplo, podrías usar algo como `juan` o `miusuario`.
    - **Contraseña**: Pon una contraseña para este usuario. Puede ser la misma que usaste antes o una diferente.

8. **Configura la zona horaria**: Aquí debes seleccionar la zona horaria de tu país o región. Si estás en España, selecciona **Madrid**.

9. **Configura el disco duro**:

    - En este paso, puedes elegir cómo se va a usar el espacio en el disco duro de la máquina virtual. Si no sabes mucho sobre particiones (cómo se organiza el espacio del disco), selecciona la opción **Particionamiento automático**. Esto le permitirá al sistema hacer todo por ti.
    - **Particionamiento automático**: Selecciona esta opción si no quieres complicarte. El sistema asignará todo el espacio del disco de forma automática y segura.

    > ℹ️ **Nota**: Más adelante aprenderemos a hacer particionamiento manual y otras configuraciones más avanzadas como LVM o RAID. De momento, usaremos la opción automática.

10. **Configura el gestor de paquetes**:

    - AlmaLinux usa un sistema llamado **DNF** para instalar y gestionar programas. Durante la instalación, te pedirá que selecciones un servidor de paquetes. Esto es básicamente de dónde el sistema descargará los programas y actualizaciones. Escoge el servidor más cercano a ti (el sistema te sugerirá uno automáticamente según tu ubicación).
    - Si estás en una red con un proxy, este es el momento para configurarlo. Un proxy es como un "puente" que controla tu conexión a Internet. Si no sabes si usas uno, probablemente no lo necesites configurar.

11. **Selecciona qué programas quieres instalar**:

    - Aquí puedes elegir entre una instalación mínima (sin entorno gráfico) o con entorno gráfico. Si no sabes mucho de líneas de comandos, es recomendable que selecciones la opción con **interfaz gráfica** para que tengas un escritorio como en Windows o macOS.
    - También es recomendable activar el servicio **SSH**. Este servicio te permitirá conectarte a tu máquina de forma remota (muy útil si más adelante quieres manejarla desde otro equipo).

12. **Inicia la instalación**:

    - Una vez hayas hecho todas estas configuraciones, confirma y la instalación comenzará. Es posible que tarde unos minutos, dependiendo de la velocidad de tu máquina.
  
13. **Finaliza la instalación**:

    - Cuando termine la instalación, el sistema te pedirá que reinicies la máquina virtual. Haz clic en "Reiniciar" y espera a que la máquina se reinicie.

14. **Primer inicio**:

    - Cuando el sistema se reinicie, verás una pantalla llamada **GRUB**. Es un gestor que te permite elegir qué sistema operativo iniciar (si solo tienes AlmaLinux instalado, solo verás esa opción).
    - Selecciona **AlmaLinux** y presiona Enter para arrancar el sistema.

15. **Inicia sesión**:

    - Una vez que el sistema haya arrancado, verás una pantalla para iniciar sesión. Introduce el nombre de usuario y la contraseña que creaste durante la instalación.
    - Si todo va bien, deberías poder entrar a tu sistema y comenzar a usarlo.
    
    > **GRUB**: El gestor de arranque GRUB es muy útil cuando tienes varios sistemas operativos instalados en la misma máquina. Te permite elegir cuál quieres arrancar. En este caso, solo deberías ver AlmaLinux.

