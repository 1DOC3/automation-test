*** Settings ***
Library     AppiumLibrary

Resource    ../variables/user_activations.robot
Resource    ../variables/user_consultation.robot


*** Keywords ***
Setting timeouts
    Set Appium Timeout    140s

Before Tests
    Open 1doc3 Application
    Wait Until Page Contains Element    ${BTN_ACCOUNT}  

After Tests
    Close Application

Open 1doc3 Application
    [Documentation]    Abre la aplicación de 1doc3 basandose en las variables de entorno.
    [Arguments]
    ...    ${platform}=${PLATFORM_NAME}
    ...    ${device}=${DEVICE_NAME}
    ...    ${app}=${APP_PATH}
    ...    ${automation}=${AUTOMATION_NAME}
    Open Application
    ...    ${APPIUM_SERVER}
    ...    platformName=${platform}
    ...    deviceName=${device}
    ...    app=${app}
    ...    automationName=${automation}
    ...    autoGrantPermissions=true

Verify Text Equal on Element
    [Arguments]    ${selector}    ${texto_esperado}
    AppiumLibrary.Wait Until Page Contains Element    ${selector}
    ${contenido_desc} =    Get Element Attribute    ${selector}    contentDescription
    Log To Console    El texto obtenido es: ${contenido_desc}
    Should Be Equal As Strings    ${contenido_desc}    ${texto_esperado}


Input Verefication Code
    [Documentation]    Ingresa el codigo de 4 digitos
    Click Element  ${CODE_VERIFICATION_FIELD}
    Press Keycode    8  
    Press Keycode    8  
    Press Keycode    8  
    Press Keycode    8


Do login with email    
    Click Element    ${BTN_ACCOUNT}
    Wait Until Page Contains Element    ${CONTINUE_WITH_EMAIL_BUTTON}
    Click Element    ${CONTINUE_WITH_EMAIL_BUTTON}
    Input Text       ${EMAIL_FIELD}     ${USER1_DETAILS}
    Click Element    ${LOGIN_SUBMIT_BUTTON_CONTINUAR}
    Wait Until Page Contains Element   ${CODE_VERIFICATION_FIELD}
    Input Verefication Code   
    Click Element    ${VERIFY_BUTTON}

Do Login new user
    Wait Until Page Contains Element    ${BTN_ACCOUNT} 
    Click Element    ${BTN_ACCOUNT}
    Wait Until Page Contains Element    ${CONTINUE_WITH_EMAIL_BUTTON}
    Click Element    ${CONTINUE_WITH_EMAIL_BUTTON}
    Input Text       ${EMAIL_FIELD}     ${USER_ONBOARDING}
    Click Element    ${LOGIN_SUBMIT_BUTTON_CONTINUAR}
    Wait Until Page Contains Element   ${CODE_VERIFICATION_FIELD}
    Input Verefication Code   
    Click Element    ${VERIFY_BUTTON}


Scroll Until Element Is Found In Safe Position
    [Arguments]    ${element_xpath}
    WHILE    "True"
        ${element_found}=    Run Keyword And Ignore Error    Wait Until Element Is Visible   ${element_xpath}    ${TIMEOUT}
        ${status}=    Set Variable    ${element_found[0]}  # Extraer solo 'PASS' o 'FAIL'
        Run Keyword If    '${status}' == 'PASS'    Exit For Loop If    True
        Swipe  ${START_X}  ${START_Y}  ${END_X}  ${END_Y}  ${DURATION}
    END
    Log    Element found!
    # Hacer scroll adicional para asegurar que el elemento no esté cubierto por el banner
    Swipe  ${ADDITIONAL_START_X}  ${ADDITIONAL_START_Y}  ${ADDITIONAL_END_X}  ${ADDITIONAL_END_Y}  ${ADDITIONAL_DURATION}



    
    