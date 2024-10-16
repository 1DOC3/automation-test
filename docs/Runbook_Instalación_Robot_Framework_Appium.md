Runbook: Instalación de Robot Framework con Appium

# 1. Propósito

Este runbook proporciona instrucciones detalladas para instalar y configurar Robot Framework con Appium para realizar pruebas automatizadas en aplicaciones móviles.

## 2. Alcance

Aplicable a entornos de desarrollo que requieran la automatización de pruebas en aplicaciones móviles utilizando Robot Framework y Appium.

### 3. Requisitos Previos

Sistema Operativo: Windows, macOS o Linux.

#### 4. Procedimiento de Instalación

#### 4.1. Instalación de Python

Paso 1: Descargar e instalar Python.

Acción: Visita y descarga el instalador para tu sistema operativo. Ejecuta el instalador y selecciona la opción "Add Python to PATH".

Resultado esperado: Python y pip (el gestor de paquetes de Python) están instalados en el sistema.
Como validar la correcta instalación: ingresar en Consola python –version y el resultado debe ser python 3.12.3 (número de versión que tienes instalado)

#### 4.2. Instalación de Robot Framework

Paso 1: Instalar Robot Framework utilizando pip.

Acción: Abre una terminal o línea de comandos y ejecuta el siguiente comando:

pip install robotframework

Resultado esperado: Robot Framework está instalado y disponible para su uso.

#### 4.3. Instalación de Node.js

Paso 1: Descargar e instalar Node.js.

Acción: Visita y descarga el instalador para tu sistema operativo. Ejecuta el instalador y sigue las instrucciones.

Resultado esperado: Node.js y npm (el gestor de paquetes de Node.js) están instalados en el sistema.

#### 4.4. Instalación de Appium

Paso 1: Instalar Appium globalmente utilizando npm.

Acción: Abre una terminal o línea de comandos y ejecuta el siguiente comando:

npm install -g appium

Resultado esperado: Appium está instalado globalmente en el sistema.

#### 4.5. Instalación del Appium-Python-Client

Paso 1: Instalar el cliente de Appium para Python.

Acción: En la terminal o línea de comandos, ejecuta:

pip install Appium-Python-Client

Resultado esperado: El cliente de Appium para Python está instalado y disponible para su uso en Robot Framework.

#### 4.6. Instalación de la Biblioteca de Robot Framework para Appium

Paso 1: Instalar la biblioteca de Robot Framework para Appium.

Acción: Ejecuta el siguiente comando en la terminal o línea de comandos:

pip install robotframework-appiumlibrary

Resultado esperado: La biblioteca de Appium para Robot Framework está instalada.

#### 5. Configuración de Appium

#### 5.1. Configuración de Java y Appium

Paso 1: Verificar la instalación de Java.

Acción: En la terminal o línea de comandos, ejecuta:

java -version

Resultado esperado: La versión de Java debe mostrarse. Asegúrate de tener Java 8 o superior.

Paso 2: Iniciar el servidor de Appium.

Acción: Ejecuta el siguiente comando en la terminal:

appium

Resultado esperado: El servidor de Appium debe iniciarse y estar en funcionamiento. Deberías ver mensajes indicando que Appium está escuchando en el puerto 4723 por defecto.

#### 6. Pruebas de Verificación

#### 6.1. Verificar Instalación de Robot Framework

Paso 1: Ejecutar un comando de prueba para verificar la instalación.

Acción: Ejecuta el siguiente comando en la terminal para verificar la versión instalada:

robot --version

Resultado esperado: La versión de Robot Framework debe mostrarse.

#### 6.2. Verificar Instalación de Appium Library

Paso 1: Ejecutar un script de prueba básico para asegurarse de que la biblioteca se ha instalado correctamente.

Acción: Crea un archivo de prueba simple llamado test_appium.robot con el siguiente contenido:

*** Settings ***

Library    AppiumLibrary

*** Variables ***

${APPIUM_SERVER}        http://127.0.0.1:4723

${PLATFORM_NAME}        Android

${DEVICE_NAME}          emulator-5554

${APP_PACKAGE}          com.app1doc3.app1doc3

${APP_ACTIVITY}         com.app1doc3.app1doc3.MainActivity

${AUTOMATION_NAME}      UIAutomator2

${LOGIN-SUBMIT-BUTTON1}    //android.view.View[@resource-id="android:id/navigationBarBackground"]

*** Test Cases ***

Open Application

[Documentation]    Abre la aplicación especificada en el emulador.

# Abre la aplicación con los detalles especificados.

Open Application    ${APPIUM_SERVER}    platformName=${PLATFORM_NAME}    deviceName=${DEVICE_NAME}    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}    automationName=${AUTOMATION_NAME}

# Espera hasta que el elemento esté presente en la página.

AppiumLibrary.Wait Until Page Contains Element    ${LOGIN-SUBMIT-BUTTON1}    timeout=60s

Paso 2: Ejecuta el script de prueba con el siguiente comando:

robot test_appium.robot

Resultado esperado: El script debe ejecutarse sin errores y confirmar que la integración entre Robot Framework y Appium está funcionando.

#### 7. Solución de Problemas

Problema: Appium no se inicia.

Solución: Verifica que Java esté correctamente instalado y en el PATH. Revisa los registros de errores de Appium para obtener detalles adicionales.

Problema: La biblioteca Appium Library no se encuentra.

Solución: Asegúrate de que  robotframework-appiumlibrary esté correctamente instalado mediante pip.