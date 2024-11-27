*** Settings ***
Library         AppiumLibrary
Resource        ../resources/android/variables/variables.robot
Resource        ../resources/android/keywords/keywords.robot

Suite Setup     Setting timeouts


*** Test Cases ***
Login with email Local
    [Documentation]    Verifica que el usuario puede iniciar sesión con su empresa en un dispositivo local.
    [Tags]    smoke
    Open 1doc3 Application
    Wait Until Page Contains Element    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Click Element    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Wait Until Page Contains Element    ${LOGIN_COMPANY_FIELD}
    Input Text       ${LOGIN_COMPANY_FIELD}    ${NAME_COMPANY}
    Click Element    accessibility_id=${COMPANY_SELECTOR}
    Click Element    ${LOGIN_SUBMIT_BUTTON_CONTINUAR}
    Wait Until Page Contains Element    ${EMAIL_FIELD}
    Input Text       ${EMAIL_FIELD}     ${USER1_DETAILS}
    Click Element    ${VERIFY_BUTTON}
    Wait Until Page Contains Element    ${CONTINUE_WITH_EMAIL_BUTTON}
    Click Element    ${CONTINUE_WITH_EMAIL_BUTTON}
    Input Text       ${EMAIL_FIELD}     ${USER1_DETAILS}
    Click Element    ${LOGIN_SUBMIT_BUTTON_CONTINUAR}
    Wait Until Page Contains Element    ${CODE_VERIFICATION_FIELD}
    Input Verefication Code    1111
    Click Element    ${VERIFY_BUTTON}
    Close Application

Login with mobile Local
    [Documentation]    Verifica que el usuario puede iniciar sesión con su empresa en un dispositivo local.
    [Tags]    smoke
    Open 1doc3 Application
    Wait Until Page Contains Element    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Click Element    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Input Text       ${LOGIN_COMPANY_FIELD}    ${NAME_COMPANY}
    Click Element    accessibility_id=${COMPANY_SELECTOR}
    Click Element    ${LOGIN_SUBMIT_BUTTON_CONTINUAR}
    Wait Until Page Contains Element    ${EMAIL_FIELD}
    Input Text       ${EMAIL_FIELD}     ${USER1_DETAILS}
    Click Element    ${VERIFY_BUTTON}
    Wait Until Page Contains Element    ${CONTINUE_WITH_MOBILE_BUTTON}
    Click Element    ${CONTINUE_WITH_MOBILE_BUTTON}
    Wait Until Page Contains Element    ${NUMBER_FIELD}
    Input Text       ${EMAIL_FIELD}     ${USER_NUMBER}
    Click Element    ${LOGIN_SUBMIT_BUTTON_CONTINUAR}
    Wait Until Page Contains Element    ${CODE_VERIFICATION_FIELD}    timeout=10s
    Input Verefication Code    1111
    Click Element    ${VERIFY_BUTTON}
    Close Application
