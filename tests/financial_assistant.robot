*** Settings ***
Library         AppiumLibrary
Library         Collections
Resource        ../resources/android/variables/user_financial_assistant.robot
Resource        ../resources/android/keywords/keywords.robot
Resource        ../resources/android/keywords/Keywords_financial_assistant.robot       



Suite Setup     Setting timeouts
Test Setup       Before Tests
Test Teardown    After Tests

*** Test Cases ***


Financial Assistant Workflow 
    Do login with email    nuevamafe@yopmail.com
    Scroll Until Element Is Found In Safe Position    ${FINANCIAL_ASSISTANT_SERVICE}   
    ...    start_y=1400    
    ...    end_y=400
    ...    duration=500
    Wait Until Element Is Visible    ${FINANCIAL_ASSISTANT_SERVICE}
    Click Element    ${FINANCIAL_ASSISTANT_SERVICE}
    Handle Terms And Location
  

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
        Run Financial Inquiry Workflow  ${CONSULTA}    ${DETALLE}
        Return to Financial Guidance Menu
    END