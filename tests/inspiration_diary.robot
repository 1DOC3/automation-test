*** Settings ***
Library         AppiumLibrary
Resource        ../resources/android/variables/user_activations.robot 
Resource        ../resources/android/keywords/keywords.robot
Resource        ../resources/android/variables/user_daily_inspiration.robot
Library    FakerLibrary

Suite Setup     Setting timeouts

Test Setup    Before Tests
Test Teardown    After Tests

*** Test Cases ***
Unopened inspiration
    Do login with email    durant@yopmail.com
    Sleep    8s
    Click Inspiration Banner
    Wait Until Page Contains Element    ${SHARE}

    Log To Console    📸 Compartiendo inspiración...
    Click Element    ${SHARE}
    Wait Until Page Contains Element    ${SHARING_IMAGE}
    Wait Until Page Contains Element    ${CLOSE_SHARING_IMAGE}
    Click Element    ${CLOSE_SHARING_IMAGE}

    Press Keycode    4
    Log To Console    🕐 Esperando que aparezca botón KEEP...
    Wait Until Element Is Visible    ${KEEP}    timeout=20s

    Log To Console    🖱️ Haciendo clic en KEEP...
    Click Element    ${KEEP}
    Sleep    2s

    # Validación inmediata para detectar si el clic funcionó
    ${after_keep}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${RETURN_IMAGE}    timeout=10s
    IF    not ${after_keep}
        Log To Console    ⚠️ El clic en KEEP no produjo cambio de pantalla o el elemento RETURN_IMAGE no apareció.
        Capture Page Screenshot
        Fail    No se detectó transición tras hacer clic en KEEP.
    END

    Log To Console    ✅ RETURN_IMAGE visible. Continuando flujo...
    Click Element    ${RETURN_IMAGE}


*** Keywords ***
Click Inspiration Banner
    [Documentation]    Verifica si el banner 'Tu inspiración diaria' está visible arriba.
    ...    Si no está, hace scroll hacia abajo hasta encontrarlo y luego hace click.

    ${is_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${BANNER_INSPIRATION}    3s
    IF    ${is_visible}
        Click Element    ${BANNER_INSPIRATION}
        ELSE
        FOR    ${index}    IN RANGE    5
            Swipe    500    1500    500    500    1000
            ${found}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${BANNER_INSPIRATION}    2s
            IF    ${found}
                Click Element    ${BANNER_INSPIRATION}
                Exit For Loop
            END
        END
    END

