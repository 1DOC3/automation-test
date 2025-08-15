*** Settings ***
Library         AppiumLibrary
Library         Collections
Library         Process


Resource        ../resources/android/variables/user_legal_guidance.robot
Resource        ../resources/android/keywords/keywords.robot
Resource        ../resources/android/keywords/legal_guidance_keywords_two.robot



Suite Setup     Setting timeouts
Test Setup       Before Tests


*** Keywords ***
Subir Imagen Desde PC
    [Arguments]    ${imagen_pc}    ${ruta_android}
    Run Process    adb    push    ${imagen_pc}    ${ruta_android}
    Log    Imagen subida a ${ruta_android}

Seleccionar Imagen Por Nombre
    [Arguments]    ${nombre_imagen}
    Wait Until Page Contains    ${nombre_imagen}    timeout=10s
    Click Element    ${IMAGES_1} 
    
*** Test Cases ***
Flujo De Orientación Legal Penal
    Subir Imagen Desde PC    C:/Users/Daza/Documents/fotos de pruebas/foto_prueba.png    /sdcard/Recent/foto_prueba.png
    
    Do login with email    nuevamafe@yopmail.com
    Sleep    4s
    Scroll Until Element Is Found In Safe Position    ${SERVICE_LEGAL_GUIDANCE}    
    ...    start_y=1400  
    ...    end_y=400
    ...    duration=500
    Wait Until Element Is Visible    ${SERVICE_LEGAL_GUIDANCE}
    Click Element    ${SERVICE_LEGAL_GUIDANCE}
    Wait Until Element Is Visible    ${TO_CONSULT}    
    Click Element    ${TO_CONSULT}  
    Wait Until Element Is Visible    ${PENAL_CONSULTATION} 
    Click Element    ${PENAL_CONSULTATION} 
    Wait Until Element Is Visible    ${INPUT_DETAIL}
    Input Text    ${INPUT_DETAIL}    ${DETAIL_CONSULTATION}  
    Wait Until Element Is Visible    ${CONTINUE_BUTTON}
    Click Element    ${CONTINUE_BUTTON}
    Wait Until Element Is Visible    ${ATTACH_IMAGE}
    Click Element    ${ATTACH_IMAGE}
    Wait Until Element Is Visible    ${ADD_GALLERY}
    Click Element    ${ADD_GALLERY}
    Wait Until Element Is Visible    ${THREE_POINTS_2}  
    Click Element    ${THREE_POINTS_2}  
    Wait Until Element Is Visible    ${BROUSE_SEND}   
    Click Element    ${BROUSE_SEND}  
    Wait Until Element Is Visible    ${SELECTOR_CLICK}  
    Click Element    ${SELECTOR_CLICK}  
    Wait Until Element Is Visible    ${SEND_BUTTON_2}    10s   
    Click Element    ${SEND_BUTTON_2}     
    Wait Until Element Is Visible    ${CLICK_IMAGE}  
    Click Element    ${CLICK_IMAGE}  
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
    Wait Until Element Is Visible    ${WOULD_HAVE_DONE}    40s
    Click Element    ${WOULD_HAVE_DONE} 
    Wait Until Element Is Visible    ${CTA_CLOSE}
    Click Element    ${CTA_CLOSE}

    Wait Until Element Is Visible    ${SERVICE_LEGAL_GUIDANCE}
    Click Element    ${SERVICE_LEGAL_GUIDANCE}
    Wait Until Element Is Visible    ${TO_CONSULT}    
    Click Element    ${TO_CONSULT}  


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


  