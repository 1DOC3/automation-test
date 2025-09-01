*** Settings ***
Library         AppiumLibrary
Resource        ../resources/android/variables/user_activations.robot 
Resource        ../resources/android/keywords/keywords.robot

Suite Setup     Setting timeouts

Test Setup    Before Tests
Test Teardown    After Tests

*** Test Cases ***
Login With Google
    Click Element    ${BTN_ACCOUNT}
    Wait Until Element Is Visible    ${CONTINUE_WITH_GOOGLE_BUTTON}    30s
    Click Element    ${CONTINUE_WITH_GOOGLE_BUTTON}
    Wait Until Element Is Visible    ${BTN_GOOGLE_ACCOUNT}
    Click Element    ${BTN_GOOGLE_ACCOUNT}
    Sleep     5s