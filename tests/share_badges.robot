*** Settings ***
Library           AppiumLibrary
Library           Collections
Resource        ../resources/android/variables/user_activations.robot
Resource        ../resources/android/keywords/keywords.robot
Resource        ../resources/android/variables/user_badges.robot


Suite Setup     Setting timeouts
Test Setup       Before Tests
Test Teardown    After Tests

*** Test Cases ***
sharing badges
    Do login with email  tutaina@yopmail.com
    Wait Until Element Is Visible  ${BTN_COMPETE}
    Click Element    ${BTN_COMPETE}
    Wait Until Element Is Visible    ${BTN_BADGES}
    Click Element  ${BTN_BADGES}
    Wait Until Element Is Visible  ${COPY_BADGES}
    sleep  2s
    Wait Until Element Is Visible    ${BTN_FIRST_BADGE}
    Click Element  ${BTN_FIRST_BADGE}
    Element Should Be Visible   ${CONTENT_FIRST_BADGE}
    Wait Until Element Is Visible  ${BTN_SHARE}
    Click Element  ${BTN_SHARE}
    Wait Until Element Is Visible    ${MODAL_SHARE}
    Press Keycode    4  #cerrar la modal con el back de android 
    Wait Until Element Is Visible    ${BTN_BACK_BADGE} 
    Click Element    ${BTN_BACK_BADGE} 
    Wait Until Element Is Visible    ${BTN_SECOND_BADGE}
    Click Element  ${BTN_SECOND_BADGE}
    Element Should Be Visible   ${CONTENT_SECOND_BADGE}
    Wait Until Element Is Visible  ${BTN_SHARE}
    Click Element  ${BTN_SHARE}
    Wait Until Element Is Visible    ${MODAL_SHARE}
    Press Keycode    4  #cerrar la modal con el back de android 
    Wait Until Element Is Visible    ${BTN_BACK_BADGE} 
    Click Element    ${BTN_BACK_BADGE} 
    Wait Until Element Is Visible    ${BTN_THIRD_BADGE}
    Click Element  ${BTN_THIRD_BADGE}
    Element Should Be Visible   ${CONTENT_THIRD_BADGE}
    Wait Until Element Is Visible  ${BTN_SHARE}
    Click Element  ${BTN_SHARE}
    Wait Until Element Is Visible    ${MODAL_SHARE}
    Press Keycode    4  #cerrar la modal con el back de android
    Wait Until Element Is Visible    ${BTN_BACK_BADGE} 
    Click Element    ${BTN_BACK_BADGE} 
    Wait Until Element Is Visible    ${BTN_FOURTH_BADGE}
    Click Element  ${BTN_FOURTH_BADGE}
    Element Should Be Visible   ${CONTENT_FOURTH_BADGE}
    Wait Until Element Is Visible  ${BTN_SHARE}
    Click Element  ${BTN_SHARE}
    Wait Until Element Is Visible    ${MODAL_SHARE}
    Press Keycode    4  #cerrar la modal con el back de android
    Wait Until Element Is Visible    ${BTN_BACK_BADGE} 
    Click Element    ${BTN_BACK_BADGE} 
    Sleep  5s



