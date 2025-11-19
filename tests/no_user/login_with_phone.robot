*** Settings ***
Library         AppiumLibrary
Resource        ../../resources/android/variables/user_activations.robot 
Resource        ../../resources/android/keywords/keywords.robot



*** Test Cases ***
Login With Phone
    Click Element    ${BTN_ACCOUNT}
    Wait Until Element Is Visible    ${CONTINUE_WITH_MOBILE_BUTTON}    30s
    Click Element    ${CONTINUE_WITH_MOBILE_BUTTON}
    Wait Until Element Is Visible    ${BTN_MOBILE_LOGIN}
    Click Element    ${BTN_MOBILE_LOGIN}
    Wait Until Element Is Visible    ${ERROR_FIELD_NUMBER}
    Click Element    ${LOGIN_MOBILE_TEXT_FIELD}
    Input Text    ${LOGIN_MOBILE_TEXT_FIELD}    ,,,, 
    Click Element    ${BTN_MOBILE_LOGIN}
    # Esperar a que el banner de error sea visible
    Wait Until Element Is Visible    ${ERROR_BANNER}    10s
    # Obtener el atributo content-desc y verificar que sea el esperado
    ${content_desc}=    Get Element Attribute    ${ERROR_BANNER}    content-desc
    Should Be Equal As Strings    ${content_desc}    Verifica que ingresaste un número de celular.
    Clear Text    ${LOGIN_MOBILE_TEXT_FIELD}
    Verify prefix locator
    Wait Until Element Is Visible  ${LOGIN_MOBILE_TEXT_FIELD}
    Click Element  ${LOGIN_MOBILE_TEXT_FIELD}
    Input Text    ${LOGIN_MOBILE_TEXT_FIELD}    ${USER_NUMBER}
    Click Element    ${BTN_MOBILE_LOGIN}
    Wait Until Element Is Visible    ${VERIFY_BUTTON}    8s
    Click Element    ${VERIFY_BUTTON}
    Wait Until Element Is Visible    ${ERROR_VERIFY_CODE}    5s
    ${code}=    Get Code Environment   ${USER_NUMBER}
    Input Verification Code     ${code}
    sleep  10s
    # Asegurarnos de que la app esté lista antes de reenviar el código
    Wait Until Page Contains Element  ${FORWARD_WPP}    timeout=120s
    Click Element  ${FORWARD_WPP}
    # Esperar dinámicamente el banner
    Wait Until Keyword Succeeds    8x    10s    Wait Until Page Contains Element    ${WPP_BANNER_CODE}    timeout=10s
    ${content_desc}=    Get Element Attribute    ${WPP_BANNER_CODE}    content-desc
    Should Be Equal As Strings    ${content_desc}    Ya te enviamos un nuevo código a tu teléfono.