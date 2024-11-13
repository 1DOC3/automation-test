*** Settings ***
Library         AppiumLibrary
Resource        ../resources/android/variables/variables.robot
Resource        ../resources/android/keywords/keywords.robot

Suite Setup     Setting timeouts


*** Test Cases ***
Validation error message when not choosing a company
    Open Aplication in Local Device
    Click Element    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Input Text       ${LOGIN_COMPANY_FIELD}    ${NAME_COMPANY}
    Click Element    ${LOGIN_SUBMIT_BUTTON_CONTINUAR}
    Wait Until Element is visible    ${ERROR_SELECT_COMPANY1}
    Wait Until Element is visible    ${ERROR_SELECT_COMPANY2}
    Click Element    ${CLOSE}
    Close Application

Error validation when deleting company name
    Open Aplication in Local Device
    Click Element    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Input Text       ${LOGIN_COMPANY_FIELD}    ${NAME_COMPANY}
    Clear Text       ${NAME_COMPANY}
    Click Element    ${LOGIN_SUBMIT_BUTTON_CONTINUAR}
    Wait Until Element is visible    ${ERROR_WRITING_COMPANY}
    Close Application

Validation of non-existent company
    Open Aplication in Local Device
    Click Element    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Input Text       ${LOGIN_COMPANY_FIELD}    ${NAME_NOEXIST}
    Wait Until Element is visible    ${ERROR_NO_COMPANY_EXISTS}
    Close Application

Validation input verification data
    Open Aplication in Local Device
    Click Element    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Input Text       ${LOGIN_COMPANY_FIELD}    ${NAME_COMPANY}
    Click Element    ${COMPANY_SELECTOR}
    Click Element    ${LOGIN_SUBMIT_BUTTON_CONTINUAR}
    Verify Text on Element    ${PAGE_VERIFY_USER}    ${VERIFY_DATO_EMAIL}
    Click Element    ${VERIFY_BUTTON}
    Wait Until Element is visible    ${ENTER_EMAIL_DATA}
    Close Application
