*** Settings ***
Library    AppiumLibrary  
Resource    ../variables/variables.robot

*** Keywords ***
Configurar Tiempos de Espera
  Set Appium Timeout    120s 

Open Aplication in Browserstack
    [Arguments]    ${platform}=${PLATFORM_NAME}    ${device}=${DEVICE_NAME}    ${app}=${APP}    ${automation}=${AUTOMATION_NAME}
    [Documentation]    Abre la aplicación en BrowserStack.
    Open Application    ${BROWSERSTACK_URL}    platformName=${platform}    deviceName=${device}    app=${app}    automationName=${automation}

Open Aplication in Local Device
    [Arguments]    ${platform}=${PLATFORM_NAME}    ${device}=${LOCAL_DEVICE_NAME}    ${app_package}=${APP_PACKAGE}    ${app_activity}=${APP_ACTIVITY}    ${automation}=${AUTOMATION_NAME}
    [Documentation]    Abre la aplicación local usando Appium.
    Open Application    ${APPIUM_SERVER}    platformName=${platform}    deviceName=${device}    appPackage=${app_package}    appActivity=${app_activity}    automationName=${automation}


Cerrar Aplicación
    [Documentation]    Cierra la aplicación.
    Close Application

Click en
    [Arguments]    ${element_locator}
    [Documentation]    Click en el elemento.
    Click Element    ${element_locator}


Ingresar Empresa
    [Documentation]    Ingresa el nombre de la empresa en el campo correspondiente.
    [Arguments]    ${nombre_empresa}
    Input Text    ${LOGIN_EMPRESA_FIELD}    ${nombre_empresa}

Borrar Campo Empresa
    Clear Text   ${LOGIN_EMPRESA_FIELD}

Verificar Mensaje De Error
  [Arguments]    ${element}
  AppiumLibrary.Wait Until Element is visible  ${element}   

Verificar Texto en Elemento
    [Arguments]    ${selector}    ${texto_esperado}
    AppiumLibrary.Wait Until Page Contains Element    ${selector}
    ${contenido_desc} =    Get Element Attribute    ${selector}    contentDescription
    Log To Console    El texto obtenido es: ${contenido_desc}
    Should Be Equal As Strings    ${contenido_desc}    ${texto_esperado}


Esperar Elemento
    [Arguments]    ${element_locator}
    [Documentation]    Espera hasta que un elemento esté presente en la pantalla.
    Wait Until Page Contains Element    ${element_locator}    timeout=60s


Seleccionar Empresa
    [Documentation]    Selecciona la empresa correcta utilizando el `accessibility_id`.
    Wait Until Element Is Visible    accessibility_id=${COMPANY_SELECTOR}    timeout=10s
    Click Element    accessibility_id=${COMPANY_SELECTOR}

Clic en Continuar Empresa
    [Documentation]    Da clic en el botón para continuar con tu empresa.
    Click Element    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}

Clic en Continuar
    [Documentation]    Da clic en el botón continuar.
    Click Element    ${LOGIN_SUBMIT_BUTTON_CONTINUAR}

Clic en Verificar
    [Documentation]    Da clic en el botón verificar.
    Click Element    ${VERIFICAR_BUTTON_}

Ingresar Correo
    [Arguments]    ${correo}
    [Documentation]    Ingresa el correo electrónico en el campo correspondiente.
    Input Text    ${EMAIL_FIELD}    ${correo}

Ingresar numero
    [Arguments]    ${numero}
    [Documentation]    Ingresa el numero telefonico en el campo correspondiente.
    Input Text    ${NUMBER_FIELD}    ${numero}

Esperar Campos de Verificación
    [Documentation]    Espera hasta que los campos de verificación estén visibles.
    Wait Until Page Contains Element   //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.view.View/android.view.View[4]/android.widget.EditText[1]    timeout=10s

Input Verefication Code
    [Documentation]  Ingresa el codigo de 4 digitos 
    [Arguments]    ${codigo}
    Input Text    //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.view.View/android.view.View[4]/android.widget.EditText[1]    ${codigo[0]}
    Input Text    //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.view.View/android.view.View[4]/android.widget.EditText[2]    ${codigo[1]}
    Input Text    //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.view.View/android.view.View[4]/android.widget.EditText[3]    ${codigo[2]}
    Input Text    //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.view.View/android.view.View[4]/android.widget.EditText[4]    ${codigo[3]}
