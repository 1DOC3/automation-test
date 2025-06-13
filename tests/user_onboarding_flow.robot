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
    Wait Until Page Contains Element  ${BTN_CONTINUE}
    Input Text       ${INPUT_NAME}           'Liz Dahianna'
    Wait Until Page Contains Element  ${INPUT_LAST_NAME} 
    Click Element    ${INPUT_LAST_NAME} 
    Input Text       ${INPUT_LAST_NAME}      'Giraldo'
    Wait Until Element Is Visible  ${FIELD_GENDER}
    Click Element  ${FIELD_GENDER}
    Click Element     ${WOMEN_OPTION}
    Wait Until Element Is Visible     ${FIELD_DATE_OF_BIRTH}
    Click Element  ${FIELD_DATE_OF_BIRTH}
    Seleccionar Fecha    5   abril  1996
    Wait Until Element Is Visible  ${BTN_SAVED}
    Click Element  ${BTN_SAVED}
    Wait Until Element Is Visible  //android.view.View[@content-desc="Mujer"]
    Click Element  //android.view.View[@content-desc="Mujer"]
    Click Element  ${MEN_OPTION}
    Wait Until Element Is Visible  //android.view.View[@content-desc="Hombre"]
    Click Element  //android.view.View[@content-desc="Hombre"]
    Click Element  ${UNDETERMINED OPTION}
    Click Element    //android.view.View[@content-desc="05/04/1996"]
    Seleccionar Fecha    5   abril  2023
    Click Element  ${BTN_SAVED}
    Wait Until Page Contains Element    ${ERROR_AGE_USER}
    Seleccionar Fecha    5   abril  1996
    Click Element  ${BTN_SAVED}
    Wait Until Element Is Visible  ${BTN_CONTINUE}
    Click Element  ${BTN_CONTINUE}
    Wait Until Element Is Visible    //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View
    Wait Until Element Is Visible   ${OBJECTIVE_1}       
    Wait Until Element Is Visible   ${OBJECTIVE_2}     
    Wait Until Element Is Visible   ${OBJECTIVE_3} 
    Wait Until Element Is Visible   ${OBJECTIVE_4}  
    Wait Until Element Is Visible   ${OBJECTIVE_5} 
    Wait Until Element Is Visible   ${OBJECTIVE_6}
    Wait Until Element Is Visible   ${OBJECTIVE_7}    
    Click Element                   ${OBJECTIVE_3}
    Sleep  5s
 


