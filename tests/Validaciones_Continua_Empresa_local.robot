*** Settings ***
Library    AppiumLibrary  
Suite Setup       Configurar Tiempos de Espera


*** Variables ***

#*** Abrir aplicación ***
${APPIUM_SERVER}         http://127.0.0.1:4723
${PLATFORM_NAME}         Android
${AUTOMATION_NAME}       UIAutomator2
${LOCAL_DEVICE_NAME}     ZY236923PJ
${APP_PACKAGE}           com.app1doc3.app1doc3dev
${APP_ACTIVITY}          com.app1doc3.app1doc3.MainActivity


#*** Test Variables *** #Correo  y nombre de la empresa
${USER1-DETAILS}    chayan@yopmail.com
${NAME_NOEXIST}     RAM
${COMPANY_NAME}     Empresa pruebas

# Selectores
${BTN_CONTINUAR_EMPRESA}       //android.widget.Button[@content-desc="Continúa con tu empresa"]
${FIELD_NOMBRE_EMPRESA}        //android.widget.EditText
${BTN_CONTINUAR}               //android.widget.Button[@content-desc="Continuar"]
${ERROR_SELECCIONA_EMPRESA1}   //android.view.View[@content-desc="Selecciona una empresa"]
${ERROR_SELECCIONA_EMPRESA2}   //android.view.View[@content-desc="Para continuar selecciona de la lista el nombre de la empresa a la que perteneces."]
${MSG_VERIFICAR_USUARIO}       //android.view.View[@content-desc="Verifica tu usuario"]
${BOTON_ATRAS}                 //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]
${ERROR_NO_EXISTE_EMPRESA}     //android.view.View[contains(@content-desc, "No encontramos esta empresa.")]
${ERROR_ESCRIBIR_EMPRESA}      //android.view.View[contains(@content-desc,"Escribe el nombre de tu empresa para continuar.")]
${CERRAR_CLOSE}                //android.view.View[contains(@content-desc, "Escribe el nombre de tu empresa para continuar.")]/android.view.View[1]
${ELEGIR_COMPANY}             //android.widget.ImageView[@content-desc="Empresa pruebas"] 
${PAGE_VERIFY_USER}           //android.view.View[contains(@content-desc,"Ahora, ingresa tu correo electrónico y verifícate en Empresa")]
${VERIFY_DATO_EMAIL}          Ahora, ingresa tu correo electrónico y verifícate en Empresa pruebas.

*** Test Cases *** 



Validación mensaje de error al no elegir empresa 
    Abrir App
    Click En Elemento    ${BTN_CONTINUAR_EMPRESA}
    Ingresar Nombre Empresa    ${COMPANY_NAME}
    Click En Elemento    ${BTN_CONTINUAR}
    Verificar Mensaje De Error  ${ERROR_SELECCIONA_EMPRESA1} 
    Verificar Mensaje De Error  ${ERROR_SELECCIONA_EMPRESA2} 
    Click En Elemento    ${CERRAR_CLOSE}   

  

Validación de error al borrar nombre de empresa
    Abrir App
    Click En Elemento   ${BTN_CONTINUAR_EMPRESA}
    Ingresar Nombre Empresa    ${COMPANY_NAME}
    Borrar Campo Empresa
    Click En Elemento    ${BTN_CONTINUAR}
    Verificar Mensaje De Error   ${ERROR_ESCRIBIR_EMPRESA}  

Validación de empresa no existente
    Abrir App
    Click En Elemento    ${BTN_CONTINUAR_EMPRESA}
    Ingresar Nombre Empresa    ${NAME_NOEXIST}
    Verificar Mensaje De Error   ${ERROR_NO_EXISTE_EMPRESA}
   

Validación ingresar dato de verificación
    Abrir App
    Click En Elemento   ${BTN_CONTINUAR_EMPRESA}
    Ingresar Nombre Empresa    ${COMPANY_NAME}
    Click En Elemento    ${ELEGIR_COMPANY} 
    Click En Elemento    ${BTN_CONTINUAR}
    Verificar Texto en Elemento  ${PAGE_VERIFY_USER}  ${VERIFY_DATO_EMAIL} 
    Click En Elemento  ${BOTON_VERIFICAR}
    Verificar Mensaje De Error   ${INGRESAR_DATO_EMAIL}   




*** Keywords ***
Configurar Tiempos de Espera
  Set Appium Timeout    120s
Abrir App
    AppiumLibrary.Open Application  ${APPIUM_SERVER}    platformName=${PLATFORM_NAME}    deviceName=${LOCAL_DEVICE_NAME}    app_package=${APP_PACKAGE}  app_activity=${APP_ACTIVITY}  automationName=${AUTOMATION_NAME} 

Click En Elemento
    [Arguments]    ${elemento}
    AppiumLibrary.Wait Until Page Contains Element   ${elemento}
    Click Element  ${elemento}

Ingresar Nombre Empresa
    [Arguments]    ${nombre_empresa}
    Input Text    ${FIELD_NOMBRE_EMPRESA}    ${nombre_empresa}

Borrar Campo Empresa
    Clear Text   ${FIELD_NOMBRE_EMPRESA}

Verificar Mensaje De Error
  [Arguments]    ${element}
  AppiumLibrary.Wait Until Page Contains Element  ${element}   

Verificar Texto en Elemento
    [Arguments]    ${selector}    ${texto_esperado}
    AppiumLibrary.Wait Until Page Contains Element    ${selector}
    ${contenido_desc} =    Get Element Attribute    ${selector}    contentDescription
    Log To Console    El texto obtenido es: ${contenido_desc}
    Should Be Equal As Strings    ${contenido_desc}    ${texto_esperado}
