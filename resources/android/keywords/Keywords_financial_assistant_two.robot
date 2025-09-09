*** Settings ***


Library     AppiumLibrary


Resource    ../variables/user_activations.robot
Resource    ../variables/user_financial_assistant.robot
Resource    ../keywords/keywords.robot


*** Keywords ***

Ejecutar Flujo De Consulta Legal
    [Arguments]    ${TIPO_CONSULTA}    ${DETALLE_CONSULTA}
    Seleccionar Tipo De Consulta    ${TIPO_CONSULTA}
    Wait Until Element Is Visible    ${INPUT_DETAIL}
    Input Text    ${INPUT_DETAIL}    ${DETALLE_CONSULTA}
    Wait Until Element Is Visible    ${CONTINUE_BUTTON}
    Click Element    ${CONTINUE_BUTTON}
    Wait Until Element Is Visible    ${ATTACH_IMAGE}
    Click Element    ${ATTACH_IMAGE}
    Wait Until Element Is Visible    ${ADD_GALLERY}
    Click Element    ${ADD_GALLERY}

    Wait Until Element Is Visible    ${IMAGES_1}  
    Click Element    ${IMAGES_1}  
        
    Wait Until Element Is Visible    ${START_CHAT}    15s
    Click Element    ${START_CHAT}  
    Wait Until Element Is Visible    ${INPUT_DETAIL_2}
    Input Text    ${INPUT_DETAIL_2}    ${DETAIL_CONSULTATION_2}  
    Wait Until Element Is Visible    ${SEND_BUTTON}  
    Click Element    ${SEND_BUTTON}
    Wait Until Element Is Visible    ${INPUT_DETAIL_2}
    Input Text    ${INPUT_DETAIL_2}    ${DETAIL_CONSULTATION_3}    
    Wait Until Element Is Visible    ${SEND_BUTTON}  
    Click Element    ${SEND_BUTTON}
    Wait Until Element Is Visible    ${WOULD_HAVE_DONE}    40s
    Click Element    ${WOULD_HAVE_DONE} 
    Wait Until Element Is Visible    ${CTA_CLOSE}
    Click Element    ${CTA_CLOSE}

    

Volver A Menu De Orientacion Legal
    Sleep    1s
    Wait Until Element Is Visible    ${LEGAL_ASSISTANT_SERVICE} 
    Click Element    ${LEGAL_ASSISTANT_SERVICE} 
    Wait Until Element Is Visible    ${TO_CONSULT}    
    Click Element    ${TO_CONSULT}  

Seleccionar Tipo De Consulta
    [Arguments]    ${TIPO_CONSULTA}
    Scroll Until Element Is Found In Safe Position    ${TIPO_CONSULTA}  
    Wait Until Element Is Visible    ${TIPO_CONSULTA}
    Click Element    ${TIPO_CONSULTA}
