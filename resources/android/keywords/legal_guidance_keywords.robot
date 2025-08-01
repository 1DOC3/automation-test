*** Settings ***


Library     AppiumLibrary


Resource    ../variables/user_activations.robot
Resource    ../variables/user_consultation.robot
Resource    ../variables/user_legal_guidance.robot
Resource    ../keywords/keywords.robot


*** Keywords ***


Ejecutar Flujo De Consulta Legal
    [Arguments]    ${TIPO_CONSULTA}    ${DETALLE_CONSULTA}
    Seleccionar Tipo De Consulta    ${TIPO_CONSULTA}
    Wait Until Element Is Visible    ${INPUT_DETAIL}
    Input Text    ${INPUT_DETAIL}    ${DETALLE_CONSULTA}
    Wait Until Element Is Visible    ${CONTINUE_BUTTON}
    Click Element    ${CONTINUE_BUTTON}

# si se realiza el flujo sin adjuntar imagenes, se salta los siguientes pasos de la linea 25 a la 49, es decir borrarlo manualmente 
 
     # Adjuntar imagenes
  Wait Until Element Is Visible    ${ATTACH_IMAGE}
    Click Element    ${ATTACH_IMAGE}

    Wait Until Element Is Visible    ${ADD_GALLERY}
    Click Element    ${ADD_GALLERY}
    Sleep   5s

    # Imagen distinta según el tipo de consulta
     IF    $TIPO_CONSULTA == $PENAL_CONSULTATION     
        Click Element    ${IMAGES_1}
    ELSE IF    $TIPO_CONSULTA == $CIVIL_CONSULTATION
        Click Element    ${IMAGES_2}
    ELSE IF    $TIPO_CONSULTA == $INMOBILIARIA_CONSULTATION
        Click Element    ${IMAGES_3}
    ELSE IF    $TIPO_CONSULTA == $FAMILIAR_CONSULTATION
        Click Element    ${IMAGES_4}
    ELSE IF    $TIPO_CONSULTA == $ADMINISTRATIVA_CONSULTATION
        Click Element    ${IMAGES_5}
    ELSE
        Click Element    ${IMAGES_6}
    END


    Wait Until Element Is Visible    ${START_CHAT}    15s
    Click Element    ${START_CHAT}  
    Wait Until Element Is Visible    ${INPUT_DETAIL}
    Sleep    20s
    Wait Until Element Is Visible    ${THREE_POINTS} 
    Click Element    ${THREE_POINTS} 
    Wait Until Element Is Visible    ${FINISH}  
    Click Element    ${FINISH}  
    Wait Until Element Is Visible    ${FINISH2}  
    Click Element    ${FINISH2}  
    Wait Until Element Is Visible    ${WOULD_HAVE_DONE}    15s
    Click Element    ${WOULD_HAVE_DONE} 
    Wait Until Element Is Visible    ${CTA_CLOSE}
    Click Element    ${CTA_CLOSE}
    

Volver A Menu De Orientacion Legal
    Sleep    1s
    Wait Until Element Is Visible    ${SERVICE_LEGAL_GUIDANCE}
    Click Element    ${SERVICE_LEGAL_GUIDANCE}
    Wait Until Element Is Visible    ${TO_CONSULT}    
    Click Element    ${TO_CONSULT}  

Seleccionar Tipo De Consulta
    [Arguments]    ${TIPO_CONSULTA}
    Scroll Until Element Is Found In Safe Position    ${TIPO_CONSULTA}  
    Wait Until Element Is Visible    ${TIPO_CONSULTA}
    Click Element    ${TIPO_CONSULTA}
