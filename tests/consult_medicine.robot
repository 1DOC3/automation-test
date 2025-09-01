*** Settings ***
Library         AppiumLibrary
Resource        ../resources/android/variables/user_consultation.robot
Resource        ../resources/android/keywords/keywords.robot

Suite Setup     Setting timeouts
Test Setup       Before Tests
Test Teardown    After Tests


*** Test Cases ***
Set medicina general
    Do login with email  feli@yopmail.com
    Sleep    8s
    Scroll Until Element Is Found In Safe Position    ${MEDICINA_BUTTON}
    Wait Until Element Is Visible    ${MEDICINA_BUTTON}
    Click Element    ${MEDICINA_BUTTON}
    Wait Until Element Is Visible    ${FOR_ME_BUTTON}    
    Click Element    ${FOR_ME_BUTTON}
    Wait Until Element Is Visible    ${EMAIL_FIELD_MEDICINE}    
    Input Text       ${EMAIL_FIELD_MEDICINE}     ${DESCRIPTION_MEDICINE}
    Click Element    ${CONTINUAR_BUTTON}
    Wait Until Element Is Visible    ${DOCUMENTS_MEDICINE}    
    Click Element    ${DOCUMENTS_MEDICINE}
    Wait Until Element Is Visible    ${ADD_DOCUMENT}    
    Click Element    ${ADD_DOCUMENT}
    Wait Until Element Is Visible    ${FILE_DOCUMENT}    
    Click Element    ${FILE_DOCUMENT}
    Wait Until Element Is Visible    ${START_CONSULT_MEDICINE}    
    Click Element    ${START_CONSULT_MEDICINE}
    Wait Until Element Is Visible    ${CLOSE_MODAL_CONSULT}
    Sleep    8s
    Click Element    ${CLOSE_MODAL_CONSULT}
    Wait Until Element Is Visible    ${OPTIONS_CONSULT} 
    Click Element    ${OPTIONS_CONSULT}
    Wait Until Element Is Visible    ${FINISH_CONSULT}
    Click Element    ${FINISH_CONSULT} 
    Wait Until Element Is Visible    ${FINISH_CONSULT_CONFIRM}
    Click Element    ${FINISH_CONSULT_CONFIRM}
    Sleep    5s
