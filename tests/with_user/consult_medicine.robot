*** Settings ***
Library         AppiumLibrary
Resource        ../../resources/android/variables/user_consultation.robot
Resource        ../../resources/android/keywords/keywords.robot




*** Test Cases ***
Set medicina general
    Sleep    3s
    Scroll Until Element Is Found In Safe Position    ${MEDICINA_BUTTON}
    Wait Until Element Is Visible    ${MEDICINA_BUTTON}
    Click Element    ${MEDICINA_BUTTON}
    Informed consent
    Wait Until Element Is Visible    ${FOR_ME_BUTTON}   timeout=5s  
    Click Element    ${FOR_ME_BUTTON}
    Modal location
    Wait Until Element Is Visible  ${EMAIL_FIELD_MEDICINE}
    Click Element    ${EMAIL_FIELD_MEDICINE}
    Input Text       ${EMAIL_FIELD_MEDICINE}     ${DESCRIPTION_MEDICINE}
    Wait Until Element Is Visible    ${CONTINUAR_BUTTON}
    Click Element    ${CONTINUAR_BUTTON}
    Wait Until Page Contains Element    ${CTA_ADD_DOCUMENTS}
    Wait Until Element Is Visible    ${START_CONSULT_MEDICINE}    
    