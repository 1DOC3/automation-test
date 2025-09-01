*** Settings ***
Library         AppiumLibrary
Library         Collections
Resource        ../resources/android/variables/user_financial_assistant.robot
Resource        ../resources/android/keywords/keywords.robot
Resource        ../resources/android/keywords/Keywords_financial_assistant.robot       



Suite Setup     Setting timeouts
Test Setup       Before Tests

*** Test Cases ***


Flujo De Asistente finaciero 
    Do login with email    nuevamafe@yopmail.com
    Sleep    8s
    Scroll Until Element Is Found In Safe Position    ${LEGAL_ASSISTANT_SERVICE}   
    ...    start_y=1400    
    ...    end_y=400
    ...    duration=500
    Wait Until Element Is Visible    $${LEGAL_ASSISTANT_SERVICE}
    Click Element    $${LEGAL_ASSISTANT_SERVICE}
    Wait Until Element Is Visible    ${TO_CONSULT}    
    Click Element    ${TO_CONSULT}  

    @{CONSULTAS}=    Create List
    ...    ${AHORRO_CONSULTATION} 
    ...    ${DEUDAS_CONSULTATION}
    ...    ${FINANZAS_CONSULTATION}  
    ...    ${PRESUPUESTO_CONSULTATION}
    ...    ${CRISIS_CONSULTATION}  
    ...    ${OBLIGACIONES_CONSULTATION} 
    ...    ${OTRAS_CONSULTATION}


        FOR    ${CONSULTA}    IN    @{CONSULTAS}
        ${DETALLE}=    Get From Dictionary    ${CONSULTATION_DETAILS1}    ${CONSULTA}
        Ejecutar Flujo De Consulta Legal    ${CONSULTA}    ${DETALLE}
        Volver A Menu De Orientacion Legal
    END