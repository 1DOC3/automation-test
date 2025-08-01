*** Settings ***
Library         AppiumLibrary
Resource        ../resources/android/variables/user_activations.robot 
Resource        ../resources/android/keywords/keywords.robot

Suite Setup     Setting timeouts

Test Setup    Before Tests
#Test Teardown    After Tests

*** Test Cases ***
Activate licences Happy Path
    Wait Until Page Contains Element    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Click Element    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Wait Until Page Contains Element    ${LOGIN_COMPANY_FIELD}
    Input Text       ${LOGIN_COMPANY_FIELD}    ${NAME_COMPANY}
    Sleep    5s    
    Click Element    ${COMPANY_SELECTOR}
    Click Element    ${LOGIN_SUBMIT_BUTTON_CONTINUAR}
    Wait Until Page Contains Element    ${EMAIL_FIELD}
    Input Text       ${EMAIL_FIELD}     ${LICENSE_NOT_EXIST}
    Click Element    ${VERIFY_BUTTON}
    Wait Until Page Contains Element    ${INVALID_DATA_CTA}
    Click Element    ${INVALID_DATA_CTA}
    Wait Until Page Contains Element    ${PHONE_INFO}
    Click Element    ${PHONE_INFO}
    Input Text    ${PHONE_INFO}    ${USER_NUMBER_TWO}
    Wait Until Page Contains Element    ${SEND_CTA}
    Click Element    ${SEND_CTA}
    Sleep    5s
    Wait Until Page Contains Element    ${CONFIRMATION_MESSAGE}
    Close Application
    Sleep    305s
    Open 1doc3 Application
    Flow Until Verify

