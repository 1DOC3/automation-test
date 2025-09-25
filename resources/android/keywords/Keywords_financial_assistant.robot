*** Settings ***


Library     AppiumLibrary


Resource    ../variables/user_activations.robot
Resource    ../variables/user_financial_assistant.robot
Resource    ../keywords/keywords.robot


*** Keywords ***

Run Financial Inquiry Workflow
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
    Wait Until Element Is Visible    ${WOULD_HAVE_DONE}    20s
    Click Element    ${WOULD_HAVE_DONE} 
    Wait Until Element Is Visible    ${CTA_CLOSE}
    Click Element    ${CTA_CLOSE}
    

Return to Financial Guidance Menu
    Sleep    1s
    Wait Until Element Is Visible    ${FINANCIAL_ASSISTANT_SERVICE} 
    Click Element    ${FINANCIAL_ASSISTANT_SERVICE} 
    Wait Until Element Is Visible    ${TO_CONSULT}    
    Click Element    ${TO_CONSULT}  

Select type of consultation
    [Arguments]    ${TIPO_CONSULTA}
    Scroll Until Element Is Found In Safe Position    ${TIPO_CONSULTA}  
    Wait Until Element Is Visible    ${TIPO_CONSULTA}
    Click Element    ${TIPO_CONSULTA}

Handle Terms And Location
    # Manejar Términos si aparecen
    ${terms_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${TERMS_AND_CONDITIONS}
    Run Keyword If    ${terms_visible}    Click Element    ${TERMS_AND_CONDITIONS}

    # Si no aparecieron términos, ir directo a Consultar
    Run Keyword If    not ${terms_visible}    Run Keywords
    ...    Wait Until Element Is Visible    ${TO_CONSULT}    timeout=5s
    ...    AND    Click Element    ${TO_CONSULT}

    # Dar un pequeño tiempo para que cargue la siguiente vista (puede aparecer Location)
    Sleep    2s

    # Manejar Location si aparece
    ${location_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${LOCATION}
    Run Keyword If    ${location_visible}    Click Element    ${LOCATION}