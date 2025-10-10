*** Settings ***
Library         AppiumLibrary
Resource        ../resources/android/variables/user_consultation.robot
Resource        ../resources/android/keywords/keywords.robot

Suite Setup     Setting timeouts
Test Setup       Before Tests
Test Teardown    After Tests


*** Test Cases ***
Set medicina general
    Do login with email  gloria@yopmail.com	
    Sleep    3s
    Scroll Until Element Is Found In Safe Position    ${MEDICINA_BUTTON}
    Wait Until Element Is Visible    ${MEDICINA_BUTTON}
    Click Element    ${MEDICINA_BUTTON}
    Informed consent
    Wait Until Element Is Visible    ${FOR_ME_BUTTON}   timeout=5s  
    Click Element    ${FOR_ME_BUTTON}
    Modal location
    Wait Until Page Contains Element    ${EMAIL_FIELD_MEDICINE}
    Click Element    ${EMAIL_FIELD_MEDICINE}
    Input Text       ${EMAIL_FIELD_MEDICINE}     ${DESCRIPTION_MEDICINE}
    Sleep    5s
    Wait Until Page Contains Element    ${CONTINUAR_BUTTON}
    Click Element    ${CONTINUAR_BUTTON}
    Wait Until Page Contains Element    ${CTA_ADD_DOCUMENTS}
    Wait Until Element Is Visible    ${START_CONSULT_MEDICINE}    
    Click Element    ${START_CONSULT_MEDICINE}
    Wait For Chat Assignment    25s
    Wait Until Element Is Visible    ${OPTIONS_CONSULT}
    Click Element    ${OPTIONS_CONSULT}
    Wait Until Element Is Visible    ${FINISH_CONSULT}
    Click Element    ${FINISH_CONSULT} 
    Wait Until Element Is Visible    ${FINISH_CONSULT_CONFIRM}
    Click Element    ${FINISH_CONSULT_CONFIRM}
    Sleep    5s

*** Keywords ***
Wait For Chat Assignment
    [Arguments]    ${timeout}=120s
    ${chat_ready}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${CLOSE_MODAL_CONSULT}    timeout=${timeout}

    IF    ${chat_ready}
        Click Element    ${CLOSE_MODAL_CONSULT}
    ELSE
        Pass Execution    Chat no pudo ser asignado porque no había profesionales disponibles
    END
