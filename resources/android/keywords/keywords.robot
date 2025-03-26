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
    Click Element    ${BTN_ACCOUNT}
    Wait Until Page Contains Element    ${CONTINUE_WITH_EMAIL_BUTTON}
    Click Element    ${CONTINUE_WITH_EMAIL_BUTTON}
    Input Text       ${EMAIL_FIELD}     ${USER_ONBOARDING}
    Click Element    ${LOGIN_SUBMIT_BUTTON_CONTINUAR}
    Wait Until Page Contains Element   ${CODE_VERIFICATION_FIELD}
    Input Verefication Code 
    Click Element    ${VERIFY_BUTTON}
    

Move SeekBar To Value
    [Arguments]    ${seekbar_xpath}    ${percentage}
    ${seekbar}    Get WebElement    ${seekbar_xpath}
    ${location}   Get Element Location    ${seekbar}
    ${size}       Get Element Size    ${seekbar}

    ${start_x}    Set Variable    ${location}[x]
    ${end_x}    Evaluate    ${location}[x] + (${size}[width] * ${percentage})
    ${y}        Evaluate    ${location}[y] + (${size}[height] / 2)

    Swipe    ${start_x}    ${y}    ${end_x}    ${y}    500