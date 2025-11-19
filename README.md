**Pruebas automatizadas de la app de 1doc3 con Robot Framework y Appium.**

Proyecto de automatización móvil para la app 1DOC3 utilizando Robot Framework y Appium, con el objetivo de validar flujos críticos de usuario y asegurar calidad en releases. Las pruebas están organizadas por módulo y tipo de usuario, permitiendo escalabilidad y ejecución independiente.

**Estructura del proyecto**


```bash
├── docs/                                # Documentación del proyecto
├── resources/
│   └── android/
│       ├── keywords/                    # Keywords de Robot Framework reutilizables
│       └── variables/                   # Variables por módulo o tipo de usuario
├── scripts/
│   └── device_farm_upload.sh            # Script para subir pruebas a DeviceFarm
├── tests/
│   ├── isolated_tests/                  # Pruebas independientes
│   │   ├── __init__.robot
│   │   ├── medical_history_flow.robot
│   │   ├── onboarding_flow.robot
│   │   ├── onboarding_validation_flow.robot
│   │   └── share_badges.robot
│   ├── no_user/                         # Flujos sin autenticación
│   │   ├── __init__.robot
│   │   ├── charging_time.robot
│   │   ├── company_validation_flow.robot
│   │   ├── login_continue_with_your_company.robot
│   │   └── login_with_phone.robot
│   └── with_user/                       # Flujos con usuario autenticado
│       ├── __init__.robot
│       ├── active_breaks_flow.robot
│       ├── consult_medicine.robot
│       ├── explore_validation_flow.robot
│       ├── financial_assistant.robot
│       ├── inspiration_diary.robot
│       ├── legal_guidance.robot
│       └── webinars_flow.robot
├── .gitignore
└── README.md
```


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
