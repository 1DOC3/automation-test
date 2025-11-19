*** Settings ***
Library         AppiumLibrary
Library         Collections
Resource        ../../resources/android/variables/user_legal_guidance.robot
Resource        ../../resources/android/keywords/keywords.robot
Resource        ../../resources/android/keywords/legal_guidance_keywords.robot
Resource        ../../resources/android/keywords/Keywords_financial_assistant.robot






*** Test Cases ***


Flujo De Orientación Legal Para Todas Las Consultas
    Scroll Until Element Is Found In Safe Position    ${SERVICE_LEGAL_GUIDANCE}    
    ...    start_y=1400    
    ...    end_y=400
    ...    duration=500
    Wait Until Element Is Visible    ${SERVICE_LEGAL_GUIDANCE}
    Click Element    ${SERVICE_LEGAL_GUIDANCE}
    Handle Terms And Location


    @{CONSULTAS}=    Create List
    ...    ${PENAL_CONSULTATION}
    ...    ${CIVIL_CONSULTATION}
    ...    ${INMOBILIARIA_CONSULTATION}
    ...    ${FAMILIAR_CONSULTATION}
    ...    ${ADMINISTRATIVA_CONSULTATION}
    ...    ${OTRAS_CONSULTATION}


        FOR    ${CONSULTA}    IN    @{CONSULTAS}
        ${DETALLE}=    Get From Dictionary    ${CONSULTATION_DETAILS2}    ${CONSULTA}
        Run Legal Inquiry Workflow   ${CONSULTA}    ${DETALLE}
        Return to Legal Guidance Menu
    END