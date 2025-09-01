*** Settings ***
Library         AppiumLibrary
Library         Collections
Library         Process

Resource        ../resources/android/variables/user_financial_assistant.robot
Resource        ../resources/android/keywords/keywords.robot
Resource        ../resources/android/keywords/Keywords_financial_assistant_two.robot  

Suite Setup     Setting timeouts
Test Setup       Before Tests


*** Keywords ***
Subir Imagen y Refrescar Recent
    [Arguments]    ${imagen_pc}=${RUTA_IMAGEN_PC}    ${ruta_android}=${RUTA_IMAGEN_ANDROID}
    Run Process    adb    push    ${imagen_pc}    ${ruta_android}
    Log    Imagen empujada a ${ruta_android}
    # Forzar reindexación en MediaStore
    Run Process    adb    shell    am broadcast -a android.intent.action.MEDIA_SCANNER_SCAN_FILE -d file://${ruta_android}
    Log    MediaStore notificado
    # También se puede reiniciar si lo anterior no funciona
    # Run Process    adb    reboot
    # Sleep    30s


*** Test Cases ***
Flujo De Asistente financiero
    Subir Imagen y Refrescar Recent
    Do login with email    beta010@yopmail.com
    Sleep    4s
    Scroll Until Element Is Found In Safe Position    ${LEGAL_ASSISTANT_SERVICE}    
    ...    start_y=1400  
    ...    end_y=400
    ...    duration=500
    Wait Until Element Is Visible    ${LEGAL_ASSISTANT_SERVICE}
    Click Element    ${LEGAL_ASSISTANT_SERVICE}
    Wait Until Element Is Visible    ${TO_CONSULT}    
    Click Element    ${TO_CONSULT}  
    Wait Until Element Is Visible    ${AHORRO_CONSULTATION} 
    Click Element    ${AHORRO_CONSULTATION} 
    Wait Until Element Is Visible    ${INPUT_DETAIL}
    Input Text    ${INPUT_DETAIL}    ${DETAIL_CONSULTATION}  
    Wait Until Element Is Visible    ${CONTINUE_BUTTON}
    Click Element    ${CONTINUE_BUTTON}
    Wait Until Element Is Visible    ${ATTACH_IMAGE}
    Click Element    ${ATTACH_IMAGE}
    Wait Until Element Is Visible    ${ADD_GALLERY}
    Click Element    ${ADD_GALLERY}
    Wait Until Element Is Visible    ${IMAGES_1}  
    Click Element    ${IMAGES_1} 
    Wait Until Element Is Visible     ${START_CHAT}    15s
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

    Wait Until Element Is Visible    ${LEGAL_ASSISTANT_SERVICE}
    Click Element    ${LEGAL_ASSISTANT_SERVICE}
    Wait Until Element Is Visible    ${TO_CONSULT}    
    Click Element    ${TO_CONSULT}  


    @{CONSULTAS}=    Create List
    ...    ${DEUDAS_CONSULTATION}
    ...    ${FINANZAS_CONSULTATION}  
    ...    ${PRESUPUESTO_CONSULTATION}
    ...    ${CRISIS_CONSULTATION}  
    ...    ${OBLIGACIONES_CONSULTATION} 
    ...    ${OTRAS_CONSULTATION}



        FOR    ${CONSULTA}    IN    @{CONSULTAS}
        ${DETALLE}=    Get From Dictionary    ${CONSULTATION_DETAILS2}    ${CONSULTA}
        Ejecutar Flujo De Consulta Legal    ${CONSULTA}    ${DETALLE}
        Volver A Menu De Orientacion Legal
    END
