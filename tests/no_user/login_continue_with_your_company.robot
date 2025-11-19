*** Settings ***
Library         AppiumLibrary
Resource        ../../resources/android/variables/user_activations.robot 
Resource        ../../resources/android/keywords/keywords.robot




*** Test Cases ***
Login with email Local
    [Documentation]    Verifica que el usuario puede iniciar sesión con su empresa en un dispositivo local.
    [Tags]    smoke
    Wait Until Page Contains Element    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Click Element    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Wait Until Element Is Visible  ${LOGIN_COMPANY_FIELD}
    Input Text       ${LOGIN_COMPANY_FIELD}  ${NAME_COMPANY}
    Click Element    ${COMPANY_SELECTOR}
    Click Element    ${LOGIN_SUBMIT_BUTTON_CONTINUAR}
    Wait Until Page Contains Element    ${EMAIL_FIELD}
    Input Text       ${EMAIL_FIELD}     ${USER1_DETAILS}
    Click Element    ${VERIFY_BUTTON}
    Wait Until Element Is Visible    ${LOG_IN_BUTTON}
    Click Element    ${LOG_IN_BUTTON} 
    Wait Until Page Contains Element    ${CONTINUE_WITH_EMAIL_BUTTON}
    Click Element    ${CONTINUE_WITH_EMAIL_BUTTON}
    Input Text       ${EMAIL_FIELD}     ${USER1_DETAILS}
    Click Element    ${LOGIN_SUBMIT_BUTTON_CONTINUAR}
    Wait Until Page Contains Element    ${CODE_VERIFICATION_FIELD}
    ${code}=    Get Code Environment   ${USER1_DETAILS}
    Input Verification Code    ${code}
    Click Element    ${VERIFY_BUTTON}


Login with mobile Local
    [Documentation]    Verifica que el usuario puede iniciar sesión con su empresa en un dispositivo local.
    [Tags]    smoke
    Wait Until Page Contains Element    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Click Element    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Input Text       ${LOGIN_COMPANY_FIELD}  ${NAME_COMPANY}
    Wait Until Element Is Visible  ${COMPANY_SELECTOR}
    Click Element    ${COMPANY_SELECTOR}
    Click Element    ${LOGIN_SUBMIT_BUTTON_CONTINUAR}
    Wait Until Page Contains Element    ${EMAIL_FIELD}
    Input Text       ${EMAIL_FIELD}     ${USER1_DETAILS}
    Click Element    ${VERIFY_BUTTON}
    Wait Until Element Is Visible    ${LOG_IN_BUTTON}
    Click Element  ${LOG_IN_BUTTON} 
    Wait Until Page Contains Element    ${CONTINUE_WITH_MOBILE_BUTTON}
    Click Element    ${CONTINUE_WITH_MOBILE_BUTTON}
    Verify prefix locator
    Wait Until Page Contains Element    ${NUMBER_FIELD}
    Click Element  ${NUMBER_FIELD}
    Input Text  ${NUMBER_FIELD}     ${USER_NUMBER}
    Wait Until Element Is Visible  ${LOGIN_SUBMIT_BUTTON_CONTINUAR}
    Click Element  ${LOGIN_SUBMIT_BUTTON_CONTINUAR}
    Wait Until Element Is Visible  ${CODE_VERIFICATION_FIELD}    timeout=10s
    ${code}=    Get Code Environment   ${USER_NUMBER}
    Input Verification Code     ${code}
    Click Element    ${VERIFY_BUTTON}
    

