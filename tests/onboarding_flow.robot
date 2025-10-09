*** Settings ***
Library           AppiumLibrary
Library           Collections
Library           DateTime
Resource        ../resources/android/variables/user_activations.robot
Resource        ../resources/android/variables/user_onboarding.robot
Resource        ../resources/android/keywords/keywords.robot
Resource        ../resources/android/keywords/Keywords_onboarding_flow.robot

Suite Setup     Setting timeouts
Test Setup       Before Tests
Test Teardown    After Tests

*** Test Cases ***
Field validations
    Wait Until Page Contains Element    ${BTN_ACCOUNT} 
    Click Element    ${BTN_ACCOUNT}
    Wait Until Page Contains Element    ${CONTINUE_WITH_EMAIL_BUTTON}
    Click Element    ${CONTINUE_WITH_EMAIL_BUTTON}
    Input Text       ${EMAIL_FIELD}     ${USER_ONBOARDING}
    Click Element    ${LOGIN_SUBMIT_BUTTON_CONTINUAR}
    Wait Until Page Contains Element   ${CODE_VERIFICATION_FIELD}
    ${code}=    Get Code Environment   ${USER_ONBOARDING}
    Input Verification Code     ${code}
    Click Element    ${VERIFY_BUTTON}
    Wait Until Page Contains Element  ${COPY_TITLE}
    Wait Until Page Contains Element  ${FIELD_NAME}
    Wait Until Page Contains Element  ${FIELD_LAST_NAME}
    Wait Until Element Is Visible     ${FIELD_GENDER}
    Wait Until Element Is Visible     ${FIELD_DATE_OF_BIRTH}
    Wait Until Element Is Visible     ${COPY_INFORMATION}
    Input Text       ${INPUT_NAME}           'Kevin Chayane'
    Wait Until Page Contains Element  ${INPUT_LAST_NAME} 
    Click Element    ${INPUT_LAST_NAME} 
    Input Text       ${INPUT_LAST_NAME}      'Giraldo'
    Wait Until Element Is Visible  ${FIELD_GENDER}
    Click Element  ${FIELD_GENDER}
    Click Element     ${WOMEN_OPTION}
    Wait Until Element Is Visible     ${FIELD_DATE_OF_BIRTH}
    Click Element  ${FIELD_DATE_OF_BIRTH}
    sleep  5s
    Seleccionar Fecha    5   abril  1996
    Wait Until Element Is Visible  ${BTN_SAVED}
    Click Element  ${BTN_SAVED}
    Wait Until Element Is Visible    xpath=//*[contains(@content-desc, "Continuar")]    20s
    Click Element                    xpath=//*[contains(@content-desc, "Continuar")]
    Wait Until Element Is Visible    //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View
    Wait Until Element Is Visible   ${OBJECTIVE_1}       
    Wait Until Element Is Visible   ${OBJECTIVE_2}     
    Wait Until Element Is Visible   ${OBJECTIVE_3} 
    Wait Until Element Is Visible   ${OBJECTIVE_4}  
    Wait Until Element Is Visible   ${OBJECTIVE_5} 
    Wait Until Element Is Visible   ${OBJECTIVE_6}
    Wait Until Element Is Visible   ${OBJECTIVE_7}    
    Click Element                   ${OBJECTIVE_3}
    Wait Until Page Contains Element    ${COPY_TITLE_NOTIFICATIONS}
    Wait Until Element Is Visible       ${BTN_ENABLE_NOTIFICATIONS}
    Wait Until Element Is Visible       ${BTN_SKIP_NOTIFICATIONS}
    Click Element                       ${BTN_SKIP_NOTIFICATIONS}
    Wait Until Element Is Visible    ${BTN_GOOGLE_FIT}    5s
    Click Element                    ${BTN_GOOGLE_FIT}
    Sleep  5s