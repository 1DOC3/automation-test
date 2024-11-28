### **Runbook: Instalación de Android Studio, Configuración de Variables de Entorno y Creación de un Emulador**

#### **Requisitos previos**

* Sistema operativo compatible: Windows, macOS o Linux.  
* 4 GB de RAM como mínimo (8 GB recomendados).  
* Al menos 2 GB de espacio en disco, y 4 GB de espacio en disco para el emulador de Android.  
* Conexión a internet para la descarga de paquetes.

### **1\. Descarga e instalación de Android Studio**

#### **Paso 1: Descarga Android Studio**

1. Visita el sitio oficial de Android Studio: [Descarga Android Studio](https://developer.android.com/studio)  
2. Haz clic en el botón de descarga. El sitio detectará tu sistema operativo (Windows, macOS o Linux) y descargará la versión correspondiente.

#### **Paso 2: Instalación en Windows**

1. Ejecuta el archivo descargado (`.exe`).  
2. Sigue las instrucciones del asistente de instalación.  
3. Asegúrate de marcar la opción que incluye el SDK de Android, el emulador y las herramientas de línea de comandos.  
4. Haz clic en **Instalar** y espera a que termine.

#### **Instalación en macOS**

1. Abre el archivo descargado (`.dmg`).  
2. Arrastra Android Studio a la carpeta de Aplicaciones.  
3. Abre Android Studio desde la carpeta de Aplicaciones y sigue los pasos del asistente.

#### **Instalación en Linux**

Descomprime el archivo `.zip` descargado en la ubicación que prefieras.  
bash

`unzip android-studio-ide-<version>-linux.zip`

1. Navega a la carpeta `android-studio/bin` y ejecuta el script de instalación:  
   bash

   `cd android-studio/bin./studio.sh`  
   

### **2\. Configuración de variables de entorno (Windows y Linux)**

#### **Configuración en Windows**

1. Abre el **Panel de control** → **Sistema y seguridad** → **Sistema**.  
2. Haz clic en **Configuración avanzada del sistema** en el menú de la izquierda.  
3. En la ventana de Propiedades del sistema, haz clic en **Variables de entorno**.  
4. En "Variables del sistema", selecciona **Nuevo**.  
5. Añade una nueva variable con el nombre `ANDROID_HOME` y establece su valor como la ruta de instalación del SDK de Android. Por ejemplo:

   `C:\Users\<tu_usuario>\AppData\Local\Android\Sdk`

6. En la misma sección, selecciona la variable `Path` y haz clic en **Editar**.  
   Añade las siguientes rutas a la lista:

   `%ANDROID_HOME%\tools`  
   `%ANDROID_HOME%\platform-tools`

#### **Configuración en Linux/macOS**

1. Abre el archivo `~/.bashrc` o `~/.zshrc` (dependiendo del shell que uses) en un editor de texto:

   `nano ~/.bashrc`

2. Añade las siguientes líneas al final del archivo:

   `export ANDROID_HOME=$HOME/Android/Sdk`

`export PATH=$PATH:$ANDROID_HOME/tools`  
`export PATH=$PATH:$ANDROID_HOME/platform-tools`

3. Guarda los cambios y cierra el archivo.

Aplica los cambios ejecutando:  
	  
	`source ~/.bashrc`

### **3\. Creación de un emulador de Android**

#### **Paso 1: Abrir el AVD Manager**

1. Inicia **Android Studio**.  
2. Ve al menú **Tools** (Herramientas) y selecciona **AVD Manager** (Administrador de Dispositivos Virtuales).  
3. Haz clic en **Create Virtual Device** (Crear Dispositivo Virtual).

#### **Paso 2: Selección del hardware**

1. Elige el tipo de dispositivo que deseas emular (teléfonos, tablets, wearables, etc.).  
2. Selecciona un dispositivo de la lista, como el Pixel **4**, y haz clic en **Next**.

#### **Paso 3: Selección de la imagen del sistema**

1. Selecciona una imagen del sistema basada en **x86** o **x86\_64** (recomendado para mejor rendimiento con Intel HAXM o Hypervisor).  
2. Si no tienes una imagen del sistema descargada, haz clic en **Download** para obtener la versión deseada (puedes elegir la última versión estable de Android o una versión específica).  
3. Una vez descargada, selecciona la imagen y haz clic en **Next**.

#### **Paso 4: Configuración del emulador**

1. Asigna un nombre a tu dispositivo virtual y configura otras opciones como la cantidad de RAM, tamaño de la pantalla, etc.  
2. Opcionalmente, puedes habilitar la **aceleración de hardware** si tu equipo la soporta.  
3. Haz clic en **Finish** para crear el emulador.

#### **Paso 5: Iniciar el emulador**

1. En el **AVD Manager**, verás el emulador que acabas de crear.  
2. Haz clic en el ícono de **Play** para iniciarlo.

#### **Paso 6: Verificación**

1. El emulador debería arrancar y mostrar la pantalla de inicio de Android.  
2. Ahora puedes usar este dispositivo virtual para ejecutar tus aplicaciones.  
3. 

### **4\. Comprobación de la instalación y variables de entorno**

#### **Verificación del SDK de Android**

Para asegurarte de que el SDK está correctamente configurado, abre una terminal o línea de comandos y ejecuta:

`sdkmanager --list`

Esto debería mostrar una lista de los paquetes instalados del SDK.

#### **Verificación del emulador**

Ejecuta el siguiente comando para listar los emuladores disponibles:

`emulator -list-avds`

Esto mostrará los AVD (Dispositivos Virtuales Android) que has creado.

### **Notas adicionales**

* Si estás utilizando un sistema Windows, es posible que debas instalar **Intel HAXM** (Hardware Accelerated Execution Manager) para mejorar el rendimiento del emulador.  
* Si estás en Linux, es recomendable usar KVM (Kernel-based Virtual Machine) para acelerar el emulador. Puedes instalarlo ejecutando:

  `sudo apt-get install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils`

