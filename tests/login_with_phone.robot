*** Settings ***
Library         AppiumLibrary
Resource        ../resources/android/variables/user_activations.robot 
Resource        ../resources/android/keywords/keywords.robot

Suite Setup     Setting timeouts

Test Setup    Before Tests
Test Teardown    After Tests

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
    Input Text    ${LOGIN_MOBILE_TEXT_FIELD}    ${USER_NUMBER}
    Click Element    ${BTN_MOBILE_LOGIN}
    Wait Until Element Is Visible    ${VERIFY_BUTTON}    8s
    Click Element    ${VERIFY_BUTTON}
    Wait Until Element Is Visible    ${ERROR_VERIFY_CODE}    5s
    ${code}=    Get authentication code    ${USER1_DETAILS}
    Input Verification Code Produ    ${code}
    #Reenviar Código por WPP
    Sleep    15s
    Wait Until Element Is Visible    ${FORWARD_WPP}    
    Click Element    ${FORWARD_WPP}
    Wait Until Element Is Visible    ${WPP_BANNER_CODE}    10s
    ${content_desc}=    Get Element Attribute    ${WPP_BANNER_CODE}    content-desc
    Should Be Equal As Strings    ${content_desc}    Ya te enviamos un nuevo código a tu teléfono.
    Click Element    ${VERIFY_BUTTON}