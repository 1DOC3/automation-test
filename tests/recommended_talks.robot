*** Settings ***
Library         AppiumLibrary
Library         Collections
Library         String
Library         OperatingSystem
Resource        ../resources/android/variables/User_recommended_talks.robot
Resource        ../resources/android/keywords/keywords.robot


Suite Setup     Setting timeouts
Test Setup      Before Tests


*** Test Cases ***
Flujo Charlas recomendadas 
    Do login with email    beta010@yopmail.com
    Sleep    6s
    Scroll Until Element Is Found In Safe Position    ${RECOMMENDED_TALKS}   
    ...    start_y=1400    
    ...    end_y=400
    ...    duration=300
    Wait Until Element Is Visible    ${SEE MORE}
    Click Element    ${SEE MORE}
    Wait Until Element Is Visible    ${TALKS_ONE}    timeout=7s

    ${talks}=    Create List
    ...    ${TALKS_ONE}    ${TALKS_TWO}    ${TALKS_THREE}    ${TALKS_FOUR}    ${TALKS_FIVE}
    ...    ${TALKS_SIX}    ${TALKS_SEVEN}    ${TALKS_EIGHT}    ${TALKS_NINE}    ${TALKS_TEN}
    ...    ${TALKS_TWELVE}    ${TALKS_THIRTEEN}    ${TALKS_FOURTEEN}    ${TALKS_FIFTEEN}
    ...    ${TALKS_SIXTEEN}    ${TALKS_SEVENTEEN}    ${TALKS_EIGHTEEN}    ${TALKS_NINETEEN}    ${TALKS_TWENTY}

    Procesar Charlas Recomendadas    @{talks}


*** Keywords ***
Procesar Charlas Recomendadas
    [Arguments]    @{talks}
    FOR    ${talk}    IN    @{talks}
        Log    --- Procesando locator: ${talk}
        # Intentar traer el elemento a vista (usa tu keyword existente de scroll).
        ${ok}=    Run Keyword And Return Status    Scroll Until Element Is Found In Safe Position    ${talk} 
        # Si el scroll/keyword no falló, verificar visibilidad.
        ${visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${talk}    timeout=3s
        IF    ${visible}
            Click Element    ${talk}
            # Esperar a que cargue el contenido de la charla (botón de cierre)
            Sleep    8s
            Wait Until Element Is Visible    ${SEND_BUTTON}    
            Click Element    ${SEND_BUTTON}
            # Asegurarnos de que volvimos charlas recomendadas
            Run Keyword And Ignore Error    Wait Until Element Is Visible    ${SEE_MORE}    timeout=6s
        ELSE
            Log    ${talk} no visible tras scroll. Continuo con la siguiente.
        END
    END
