*** Settings ***
Library    AppiumLibrary  
Suite Setup       Configurar Tiempos de Espera
Resource        ../resources/android/variables/variables.robot
Resource         ../resources/android/keywords/keywords.robot



*** Test Cases ***

Login Con Correo BrowserStack
    [Documentation]    Verifica que el usuario puede iniciar sesión con su empresa en BrowserStack.
    [Tags]    smoke
    Abrir Aplicación BrowserStack
    Esperar Elemento    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Clic en Continuar Empresa
    Esperar Elemento    ${LOGIN_EMPRESA_FIELD}
    Ingresar Empresa    ${NAME_COMPANY}
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


Login Con Celular BrowserStack
    [Documentation]    Verifica que el usuario puede iniciar sesión con su empresa en un dispositivo local.
    [Tags]    smoke
    Abrir Aplicación BrowserStack
    Esperar Elemento    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Clic en Continuar Empresa
    Esperar Elemento    ${LOGIN_EMPRESA_FIELD}
    Ingresar Empresa    ${NAME_COMPANY}
    Seleccionar Empresa
    Clic en Continuar
    Esperar Elemento    ${EMAIL_FIELD}
    Ingresar Correo    ${USER1_DETAILS}
    Clic en Verificar
    Esperar Elemento    ${CONTUNIAR_CON_CELULAR_BUTTON}
    Click en   ${CONTUNIAR_CON_CELULAR_BUTTON}
    Esperar Elemento    ${NUMBER_FIELD} 
    Ingresar numero    ${USER_NUMBER} 
    Clic en Continuar 
    Esperar Campos de Verificación
    Ingresar Código Verificación    1111
    Clic en Verificar

