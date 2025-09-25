*** Settings ***
Library         AppiumLibrary
Library         Collections
Library         String
Library         OperatingSystem
Resource        ../resources/android/variables/user_join_a_challenge.robot
Resource        ../resources/android/keywords/keywords.robot


Suite Setup     Setting timeouts
Test Setup      Before Tests
Test Teardown    After Tests

   

*** Test Cases ***    

Flujo Insignias ganadas 
    Do login with email    nuevamafe@yopmail.com
    Scroll Until Element Is Found In Safe Position    ${JOIN_CHALLENGE}   
    ...    start_y=1400    
    ...    end_y=400
    ...    duration=500
    Wait Until Element Is Visible    ${JOIN_CHALLENGE}
    Click Element    ${SEE_MORE}
    Wait Until Element Is Visible    ${BADGES}
    Click Element    ${BADGES}
    Sleep    3s
    Wait Until Element Is Visible    ${AWARDED_BADGES}
    ${descripciones}=    Explorar ImageViews En Pantalla
    Log    Descripciones encontradas: ${descripciones}
    
# Flujo Unete A Un Reto 
#     Do login with email    beta010@yopmail.com
#     Scroll Until Element Is Found In Safe Position    ${JOIN_CHALLENGE}   
#     ...    start_y=1400    
#     ...    end_y=400
#     ...    duration=500
#     Wait Until Element Is Visible    ${JOIN_CHALLENGE}
#     Click Element    ${CHALLENGE_ONE} 
#     Wait Until Element Is Visible    ${JOIN_THE_CHALLENGE}    30s
#     Click Element    ${JOIN_THE_CHALLENGE} 
#     Wait Until Element Is Visible    ${GOOGLE_FIT} 
#     Click Element    ${GOOGLE_FIT} 
#     Wait Until Element Is Visible    ${YES_CHANGE} 
#     Click Element    ${YES_CHANGE} 
#     Wait Until Element Is Visible    ${CONNECT_ACTIVITY}  
#     Click Element    ${CONNECT_ACTIVITY}
#     Seleccionar Flujo De Inicio  



*** Keywords ***
# Seleccionar Flujo De Inicio
#     ${existe_input}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${INPUT_DETAIL}    10s
#     Run Keyword If    ${existe_input}    Flujo Con Input
#     Run Keyword If    not ${existe_input}    Flujo Con Seleccion
#     Conectar Flujo Comun


# Flujo Con Input
#     Wait Until Element Is Visible    ${INPUT_DETAIL}    40s
#     Input Text    ${INPUT_DETAIL}    ${DETAIL_MAIL}
#     Wait Until Element Is Visible    ${NEXT}
#     Click Element    ${NEXT}

#     Wait Until Element Is Visible    ${INPUT_DETAIL}    40s
#     Input Text    ${INPUT_DETAIL}    ${DETAIL_MAIL}
#     Wait Until Element Is Visible    ${NEXT}
#     Click Element    ${NEXT}

#     Sleep    8s
#     Wait Until Element Is Visible    ${INPUT_DETAIL_2}
#     Input Text    ${INPUT_DETAIL_2}    ${DETAIL_PASSWORD}
#     Wait Until Element Is Visible    ${NEXT}
#     Click Element    ${NEXT}

#     Wait Until Element Is Visible    ${I_AGREE}
#     Click Element    ${I_AGREE}

#     Wait Until Element Is Visible    ${MORE}    120s
#     Click Element    ${MORE}

#     Wait Until Element Is Visible    ${ACCEPT}
#     Click Element    ${ACCEPT}

# Flujo Con Seleccion
#     Wait Until Element Is Visible    ${CORREO_1}    40s
#     Click Element    ${CORREO_1}

# Conectar Flujo Comun

#     Wait Until Element Is Visible    ${SEND_BUTTON_2}
#     Click Element    ${SEND_BUTTON_2}
#     Wait Until Element Is Visible    ${JOIN_THE_CHALLENGE}    30s
#     Click Element    ${JOIN_THE_CHALLENGE} 
#     Sleep    3s
#     Wait Until Element Is Visible    ${SEND_BUTTON} 
#     Click Element    ${SEND_BUTTON} 


Explorar ImageViews En Pantalla
    ${imagenes}=    Get WebElements    //android.widget.ImageView
    ${cantidad}=    Get Length    ${imagenes}
    Log To Console    \nCantidad de ImageViews encontrados: ${cantidad}

    ${descripciones}=    Create List
    FOR    ${imagen}    IN    @{imagenes}
        ${desc}=    Get Element Attribute    ${imagen}    contentDescription
        Log To Console    \n--> ${desc}
        Append To List    ${descripciones}    ${desc}
    END
    RETURN    ${descripciones}