*** Settings ***
Library         AppiumLibrary
Resource        ../../resources/android/variables/user_activations.robot 
Resource        ../../resources/android/keywords/keywords.robot
Library    FakerLibrary

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
    Aleatory
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
    Set Suite Variable    ${EMAIL_GENERATED}    None

Activate licences validations
    Wait Until Page Contains Element    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Click Element    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Wait Until Page Contains Element    ${VERIFY_BUTTON_CONTINUAR}
    Click Element    ${VERIFY_BUTTON_CONTINUAR}
    Wait Until Page Contains Element    ${ERROR_WRITING_COMPANY}
    Sleep    3s
    Wait Until Page Contains Element    ${LOGIN_COMPANY_FIELD}
    Click Element    ${LOGIN_COMPANY_FIELD}
    Sleep    3s
    Input Text       ${LOGIN_COMPANY_FIELD}    ${NAME_COMPANY}
    Click Element    ${VERIFY_BUTTON_CONTINUAR}
    Wait Until Page Contains Element    ${ERROR_SELECT_COMPANY2}
    Click Element    ${COMPANY_SELECTOR}
    Click Element    ${LOGIN_SUBMIT_BUTTON_CONTINUAR}
    Wait Until Page Contains Element    ${VERIFY_BUTTON}
    Click Element    ${VERIFY_BUTTON}
    Wait Until Page Contains Element    ${ENTER_EMAIL_DATA}
    Wait Until Page Contains Element    ${EMAIL_FIELD}
    Click Element    ${EMAIL_FIELD}
    Aleatory
    Click Element    ${VERIFY_BUTTON}
    Wait Until Page Contains Element    ${INVALID_DATA_CTA}
    Click Element    ${TAP_OUTSIDE}
    Wait Until Page Contains Element    ${EMAIL_FIELD}
    Click Element    ${EMAIL_FIELD}
    Aleatory
    Click Element    ${VERIFY_BUTTON}
    Wait Until Page Contains Element    ${INVALID_DATA_CTA}
    Click Element    ${INVALID_DATA_CTA}
    Wait Until Page Contains Element    ${SEND_CTA}
    Click Element    ${SEND_CTA}
    Wait Until Page Contains Element    ${PHONE_LICENCES}
    Wait Until Page Contains Element    ${PHONE_INFO}
    Click Element    ${PHONE_INFO}
    Input Text    ${PHONE_INFO}    ${USER_NUMBER_TWO}
    Wait Until Page Contains Element    ${SEND_CTA}
    Click Element    ${SEND_CTA}
    Sleep    5s
    Wait Until Page Contains Element    ${CONFIRMATION_MESSAGE}