# **Runbook: Integración de BrowserStack con Robot Framework**

## **Prerrequisitos**

1. **Cuenta en BrowserStack**: Asegúrate de tener una cuenta activa en [BrowserStack](https://www.browserstack.com/).  
2. **Robot Framework**: Debes tener  Robot Framework instalado. Si no lo tienes, puedes instalarlo usando pip:  
   `pip install robotframework`  
3. **Selenium Library**: Asegúrate de tener instalada la biblioteca de Selenium para Robot Framework:  
   `pip install robotframework-seleniumlibrary`

## **Configuración de BrowserStack**

1. **Obtener Credenciales**:  
   * Inicia sesión en tu cuenta de BrowserStack.  
   * Ve a "Access Keys" en la sección de configuración para obtener tu `Username` y `Access Key`.  
2. **Configuración del archivo de prueba**: Crea un archivo de configuración en formato JSON o directamente en tu archivo de prueba para especificar el navegador, versión y otros parámetros.

## **Crear un archivo de prueba en Robot Framework**

1. **Estructura básica de un archivo de prueba**: Crea un archivo con extensión `.robot` (por ejemplo, `browserstack_test.robot`):

   `*** Settings ***`

`Library    SeleniumLibrary`

`*** Variables ***`  
`${BROWSERSTACK_USERNAME}    tu_username`  
`${BROWSERSTACK_ACCESS_KEY}   tu_access_key`  
`${REMOTE_URL}`                 
`https://hub-cloud.browserstack.com/wd/hub`

`*** Test Cases ***`  
`Prueba en BrowserStack`  
    `Open Browser https://www.example.com  chrome    remote_url=${REMOTE_URL}    options={"browserstack.user": "${BROWSERSTACK_USERNAME}", "browserstack.key": "${BROWSERSTACK_ACCESS_KEY}", "browserstack.local": "false", "browserstack.selenium_version": "3.141.59"}`

    `# Aquí van tus acciones de prueba`  
    `Title Should Be    Example Domain`

    `Close Browser`

2. **Ejemplo de Capacidad del Navegador**: Puedes especificar capacidades adicionales como navegador, versión y plataforma. Un ejemplo de configuración:

   `*** Variables ***`

`${CAPABILITIES}    {"browserName": "Chrome", "browserstack.local": "false", "browserstack.debug": "true"}`

`Open Browser    https://www.example.com    chrome    remote_url=${REMOTE_URL}    options=${CAPABILITIES}`

## **Ejecución de Pruebas**

1. **Ejecutar el archivo de prueba**: Puedes ejecutar tu archivo de prueba usando el siguiente comando en la terminal:  
   bash  
   Copiar código  
   `robot browserstack_test.robot`  
2. **Verificar resultados**: BrowserStack te proporcionará un enlace a un dashboard donde podrás ver el resultado de las pruebas, videos, logs y errores.

## **Consejos Adicionales**

* **Revisar la documentación**: Asegúrate de revisar la documentación de BrowserStack y la [documentación de Robot Framework](https://robotframework.org/).  
* **Manejo de errores**: Utiliza técnicas de manejo de errores en Robot Framework para manejar fallos de manera efectiva.  
* **Configuración de Local Testing**: Si necesitas probar aplicaciones locales, puedes habilitar BrowserStack Local en tu configuración.

## **Problemas Comunes**

* **Error de autenticación**: Verifica que tus credenciales sean correctas.  
* **Problemas de conexión**: Asegúrate de que tu firewall o configuración de red no esté bloqueando el acceso a BrowserStack.

