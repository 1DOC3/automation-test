*** Settings ***
Library    AppiumLibrary

*** Variables ***
# BrowserStack Config
${BROWSERSTACK_URL}      https://danielcamilotorr_wIDGbh:zCh9X6DwuYf6WTLji5HP@hub-cloud.browserstack.com/wd/hub
${PLATFORM_NAME}         Android
${DEVICE_NAME}           Samsung Galaxy S22 Ultra
${AUTOMATION_NAME}       UIAutomator2
${APP}                   bs://f9f0c5e79f25e55f2ef8c000044068c82d12c271

# Appium Config (Local Server)
${APPIUM_SERVER}         http://127.0.0.1:4723
${LOCAL_DEVICE_NAME}     ZY236923PJ
${APP_PACKAGE}           com.app1doc3.app1doc3dev
${APP_ACTIVITY}          com.app1doc3.app1doc3.MainActivity

# Test Variables (Empresa y correo)
${USER1_DETAILS}         chayan@yopmail.com
${NAME_COMPANY}          Empresa pruebas

# Continua Con Empresa Locators
${LOGIN_SUBMIT_CONTINUACONEMPRESA}   //android.widget.Button[@content-desc="Continua con tu empresa"]
${LOGIN_EMPRESA_FIELD}               //android.widget.EditText
${LOGIN_SUBMIT_BUTTON_CONTINUAR}     //android.widget.Button[@content-desc="Continuar"]
${COMPANY_SELECTOR}                  Empresa pruebas    # accessibility_id para la empresa
${EMAIL_FIELD}                       //android.widget.EditText  # Localizador para el campo de correo
${VERIFICAR_BUTTON_}     //android.widget.Button[@content-desc="Verificar"]

#Login Locators
${CONTUNIAR_CON_CORREO_BUTTON}       //android.widget.ImageView[@content-desc="Inicia sesión con correo"]

# Main Page Locator (Notificaciones)
${NOTIFICATION_BUTTON}    //android.widget.Button[@resource-id="com.android.permissioncontroller:id/permission_allow_button"]

*** Keywords ***
Abrir Aplicación BrowserStack
    [Arguments]    ${platform}=${PLATFORM_NAME}    ${device}=${DEVICE_NAME}    ${app}=${APP}    ${automation}=${AUTOMATION_NAME}
    [Documentation]    Abre la aplicación en BrowserStack.
    Open Application    ${BROWSERSTACK_URL}    platformName=${platform}    deviceName=${device}    app=${app}    automationName=${automation}

Abrir Aplicación Local
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

Esperar Elemento
    [Arguments]    ${element_locator}
    [Documentation]    Espera hasta que un elemento esté presente en la pantalla.
    Wait Until Page Contains Element    ${element_locator}    timeout=60s

Ingresar Empresa
    [Documentation]    Ingresa el nombre de la empresa en el campo correspondiente.
    Input Text    ${LOGIN_EMPRESA_FIELD}    ${NAME_COMPANY}

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


Esperar Campos de Verificación
    [Documentation]    Espera hasta que los campos de verificación estén visibles.
    Wait Until Page Contains Element   //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.view.View/android.view.View[4]/android.widget.EditText[1]    timeout=10s

Ingresar Código Verificación
    [Arguments]    ${codigo}
    Input Text    //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.view.View/android.view.View[4]/android.widget.EditText[1]    ${codigo[0]}
    Input Text    //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.view.View/android.view.View[4]/android.widget.EditText[2]    ${codigo[1]}
    Input Text    //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.view.View/android.view.View[4]/android.widget.EditText[3]    ${codigo[2]}
    Input Text    //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.view.View/android.view.View[4]/android.widget.EditText[4]    ${codigo[3]}


*** Test Cases ***

Login Empresa en BrowserStack
    [Documentation]    Verifica que el usuario puede iniciar sesión con su empresa en BrowserStack.
    [Tags]    smoke
    Abrir Aplicación BrowserStack
    Esperar Elemento    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Clic en Continuar Empresa
    Esperar Elemento    ${LOGIN_EMPRESA_FIELD}
    Ingresar Empresa
    Seleccionar Empresa
    Clic en Continuar
    Esperar Elemento    ${EMAIL_FIELD}
    Ingresar Correo    ${USER1_DETAILS}
    Clic en Verificar
    Esperar Elemento    ${CONTUNIAR_CON_CORREO_BUTTON}
    Click en    ${CONTUNIAR_CON_CORREO_BUTTON}
    Ingresar Correo    ${USER1_DETAILS}
    Clic en Continuar
    Esperar Campos de Verificación
    Ingresar Código Verificación    1111
    Clic en Verificar
    Cerrar Aplicación



Login Empresa Local
    [Documentation]    Verifica que el usuario puede iniciar sesión con su empresa en un dispositivo local.
    [Tags]    smoke
    Abrir Aplicación Local
    Esperar Elemento    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Clic en Continuar Empresa
    Esperar Elemento    ${LOGIN_EMPRESA_FIELD}
    Ingresar Empresa
    Seleccionar Empresa
    Clic en Continuar
    Esperar Elemento    ${EMAIL_FIELD}
    Ingresar Correo    ${USER1_DETAILS}
    Clic en Verificar
    Esperar Elemento    ${CONTUNIAR_CON_CORREO_BUTTON}
    Click en    ${CONTUNIAR_CON_CORREO_BUTTON}
    Ingresar Correo    ${USER1_DETAILS}
    Clic en Continuar
    Esperar Campos de Verificación
    Ingresar Código Verificación    1111
    Clic en Verificar

