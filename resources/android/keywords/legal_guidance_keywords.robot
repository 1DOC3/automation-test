*** Settings ***


Library     AppiumLibrary


Resource    ../variables/user_activations.robot
Resource    ../variables/user_consultation.robot
Resource    ../variables/user_legal_guidance.robot
Resource    ../keywords/keywords.robot


*** Keywords ***

Run Legal Inquiry Workflow
    [Arguments]    ${TIPO_CONSULTA}    ${DETALLE_CONSULTA}
    Select type of consultation    ${TIPO_CONSULTA}
    Wait Until Element Is Visible    ${INPUT_DETAIL}
    Input Text    ${INPUT_DETAIL}    ${DETALLE_CONSULTA}
    Wait Until Element Is Visible    ${CONTINUE_BUTTON}
    Click Element    ${CONTINUE_BUTTON}


    Wait Until Element Is Visible    ${START_CHAT}    15s
    Click Element    ${START_CHAT}  
    Sleep    20s
    Wait Until Element Is Visible    ${THREE_POINTS} 
    Click Element    ${THREE_POINTS} 
    Wait Until Element Is Visible    ${FINISH}  
    Click Element    ${FINISH}  
    Wait Until Element Is Visible    ${FINISH2}  
    Click Element    ${FINISH2}  
    Wait Until Element Is Visible  ${WOULD_HAVE_DONE}    30s
    Click Element  ${WOULD_HAVE_DONE} 
    Wait Until Element Is Visible  ${CTA_CLOSE}
    Click Element  ${CTA_CLOSE}
    

Return to Legal Guidance Menu
    Sleep    1s
    Wait Until Element Is Visible    ${SERVICE_LEGAL_GUIDANCE}
    Click Element    ${SERVICE_LEGAL_GUIDANCE}
    Wait Until Element Is Visible    ${TO_CONSULT}    
    Click Element    ${TO_CONSULT}  

Select type of consultation
    [Arguments]    ${TIPO_CONSULTA}
    Scroll Until Element Is Found In Safe Position    ${TIPO_CONSULTA}  
    Wait Until Element Is Visible    ${TIPO_CONSULTA}
    Click Element    ${TIPO_CONSULTA}
