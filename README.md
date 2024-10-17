**Pruebas automatizadas de la app de 1doc3 con Robot Framework y Appium.**

Este proyecto contiene una suite de pruebas automatizadas para la aplicación móvil de 1DOC3  utilizando  **Robot Framework** y  **Appium**. Las pruebas de momento verifican el Happy path del login y las validaciones de la opción Continua con tu empresa. Su ejecución puede hacerse en dispositivos Android. 

**Estructura del proyecto**

/[docs](https://github.com/1DOC3/automation-test/tree/main/docs) :  Contiene la documentación del proyecto  
/tests :  Casos de prueba agrupados por funcionalidades o módulos de la aplicación.

**Requisitos**  
Antes de ejecutar las pruebas, asegúrate de cumplir con los siguientes requisitos: 

* [**Python 3.x**](https://www.python.org/downloads/)  instalado  
* [**Robot framework**](https://robotframework.org/)  instalado  
* [**Biblioteca de Robot Framework para Appium**](https://docs.robotframework.org/docs/different_libraries/appium) instalado  
* [**Node.js**](http://Node.js) **y [npm](https://nodejs.org/en/learn/getting-started/an-introduction-to-the-npm-package-manager)** instalados  
* [**Appium**](https://appium.io/docs/en/latest/quickstart/install/) instalado globalmente  
* [**Java**](https://www.java.com/es/) instalado y configurado

Si requieres detalles de la instalación completa de Appium y Robot framework consulta el siguiente Runbook :   
[Runbook instalación Robot Framework y Appium](https://github.com/1DOC3/automation-test/blob/main/docs/Runbook_Instalaci%C3%B3n_Robot_Framework_Appium.md)

Para correr las pruebas con [Browserstack](https://www.browserstack.com/) consulta el siguiente Runbook: [Runbook Integración con BrowserStack](https://github.com/1DOC3/automation-test/blob/main/docs/Runbook_%20Integraci%C3%B3n%20de%20BrowserStack%20con%20Robot%20Framework.md)

Si requieres utilizar un emulador para ejecutar las pruebas en local consulta el siguiente Runbook para la instalación de Android studio y su respectiva configuración: [Runbook instalación de Android studio y configuración de variables de entorno](https://github.com/1DOC3/automation-test/blob/main/docs/Runbook_%20Instalaci%C3%B3n%20de%20Android%20Studio%2C%20Configuraci%C3%B3n%20de%20Variables%20de%20Entorno%20y%20Creaci%C3%B3n%20de%20un%20Emulador.md)

**Ejecución de pruebas**

Antes de ejecutar las pruebas asegurate de haber ejecutado el servidor de appium, puedes hacerlo con el siguiente comando: 

`appium`

Esto iniciará el servidor en el puerto 4723 por defecto. Si necesitas cambiar el puerto o alguna configuración, puedes hacerlo especificando opciones en el comando. Ejemplo: 

`appium --address 127.0.0.1 --port 4724`

Una vez que el servidor de Appium esté funcionando, puedes ejecutar las pruebas con Robot Framework. Para ejecutar un script de prueba específico utiliza el comando: 

`robot nombre_del_script.robot`

Para ejecutar todos los scripts de una carpeta, utiliza el siguiente comando: 

`robot nombre_carpeta/`

Este comando ejecutará todos los archivos .robot que se encuentren dentro de la carpeta especificada. Si la carpeta contiene subcarpetas con más pruebas, también las ejecutará de manera recursiva.  
.

**Importante** 

Para que las pruebas funcionen correctamente, debes configurar las **capabilities** de Appium para tu dispositivo o emulador.  Un ejemplo de configuración para un emulador Android es:

{  
  "platformName": "Android",  
  "platformVersion": "10",  
  "deviceName": "emulator-5554",  
  "app": "/ruta/a/la/app.apk",  
  "automationName": "UiAutomator2"  
}