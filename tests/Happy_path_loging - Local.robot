*** Settings ***
Library    AppiumLibrary  
Suite Setup       Configurar Tiempos de Espera
Resource        ../resources/android/variables/variables.robot
Resource         ../resources/android/keywords/keywords.robot


*** Test Cases ***


Login Con Correo Local
    [Documentation]    Verifica que el usuario puede iniciar sesión con su empresa en un dispositivo local.
    [Tags]    smoke
    Open Aplication in Local Device
    Wait Until Page Contains Element    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Click Element    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Wait Until Page Contains Element    ${LOGIN_EMPRESA_FIELD}
    Input Text    ${LOGIN_EMPRESA_FIELD}     ${NAME_COMPANY}
    Click Element    accessibility_id=${COMPANY_SELECTOR}
    Click Element    ${LOGIN_SUBMIT_BUTTON_CONTINUAR}
    Wait Until Page Contains Element    ${EMAIL_FIELD}
    Input Text    ${EMAIL_FIELD}    ${USER1_DETAILS}
    Click Element    ${VERIFICAR_BUTTON_}
    Wait Until Page Contains Element    ${CONTUNIAR_CON_CORREO_BUTTON}
    Click Element   ${CONTUNIAR_CON_CORREO_BUTTON}
    Input Text    ${EMAIL_FIELD}    ${USER1_DETAILS}
    Click Element    ${LOGIN_SUBMIT_BUTTON_CONTINUAR}
    Wait Until Page Contains Element    ${CODE_VERIFICATION_FIELD}
    Input Verefication Code   1111
    Click Element    ${VERIFICAR_BUTTON_}
    Close Application



Login Con Celular Local
    [Documentation]    Verifica que el usuario puede iniciar sesión con su empresa en un dispositivo local.
    [Tags]    smoke
    Open Aplication in Local Device
     Wait Until Page Contains Element    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Click Element    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Input Text    ${LOGIN_EMPRESA_FIELD}     ${NAME_COMPANY}
    Click Element    accessibility_id=${COMPANY_SELECTOR}
    Click Element    ${LOGIN_SUBMIT_BUTTON_CONTINUAR}
    Wait Until Page Contains Element    ${EMAIL_FIELD}
    Input Text    ${EMAIL_FIELD}    ${USER1_DETAILS}
    Click Element    ${VERIFICAR_BUTTON_}
    Wait Until Page Contains Element   ${CONTUNIAR_CON_CELULAR_BUTTON}
    Click Element   ${CONTUNIAR_CON_CELULAR_BUTTON}
    Wait Until Page Contains Element    ${NUMBER_FIELD} 
    Input Text    ${EMAIL_FIELD}  ${USER_NUMBER} 
    Click Element    ${LOGIN_SUBMIT_BUTTON_CONTINUAR} 
    Wait Until Page Contains Element    ${CODE_VERIFICATION_FIELD}  timeout=10s
    Input Verefication Code    1111
    Click Element    ${VERIFICAR_BUTTON_}
    Close Application
    

