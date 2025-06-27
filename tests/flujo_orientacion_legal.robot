*** Settings ***
Library         AppiumLibrary
Library         Collections
Resource        ../resources/android/variables/user_legal_guidance.robot
Resource        ../resources/android/keywords/keywords.robot
Resource        ../resources/android/keywords/legal_guidance_keywords.robot






Suite Setup     Setting timeouts
Test Setup       Before Tests




*** Test Cases ***


Flujo De Orientación Legal Para Todas Las Consultas
    Do login with email
    Sleep    8s
    Scroll Until Element Is Found In Safe Position    ${SERVICE_LEGAL_GUIDANCE}    
    ...    start_y=1400    
    ...    end_y=400
    ...    duration=500
    Wait Until Element Is Visible    ${SERVICE_LEGAL_GUIDANCE}
    Click Element    ${SERVICE_LEGAL_GUIDANCE}


    @{CONSULTAS}=    Create List
    ...    ${PENAL_CONSULTATION}
    ...    ${CIVIL_CONSULTATION}
    ...    ${INMOBILIARIA_CONSULTATION}
    ...    ${FAMILIAR_CONSULTATION}
    ...    ${ADMINISTRATIVA_CONSULTATION}
    ...    ${OTRAS_CONSULTATION}


        FOR    ${CONSULTA}    IN    @{CONSULTAS}
        ${DETALLE}=    Get From Dictionary    ${CONSULTATION_DETAILS2}    ${CONSULTA}
        Ejecutar Flujo De Consulta Legal    ${CONSULTA}    ${DETALLE}
        Volver A Menu De Orientacion Legal
    END


