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
    Click Element    ${SHARE}
    Wait Until Page Contains Element    ${SHARING_IMAGE}
    Wait Until Page Contains Element    ${CLOSE_SHARING_IMAGE}
    Click Element    ${CLOSE_SHARING_IMAGE}
    Press Keycode    4
    Wait Until Page Contains Element    ${KEEP}
    Click Element    ${KEEP}
    Wait Until Element Is Visible    ${RETURN_IMAGE}    timeout=180s  error=No se encontró el botón de retorno después de 3 minutos
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

