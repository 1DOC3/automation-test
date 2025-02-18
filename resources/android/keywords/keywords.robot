*** Settings ***
Library     AppiumLibrary
Resource    ../variables/Screen_Activation.robot



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

Verify Text Equal on Element
    [Arguments]    ${selector}    ${texto_esperado}
    AppiumLibrary.Wait Until Page Contains Element    ${selector}
    ${contenido_desc} =    Get Element Attribute    ${selector}    contentDescription
    Log To Console    El texto obtenido es: ${contenido_desc}
    Should Be Equal As Strings    ${contenido_desc}    ${texto_esperado}




Input Verefication Code
    [Documentation]    Ingresa el codigo de 4 digitos
    [Arguments]    ${codigo}
    Input Text
    ...    //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.view.View/android.view.View[4]/android.view.View[1]/android.widget.EditText  ${codigo[0]} 
    Input Text
    ...   //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.view.View/android.view.View[4]/android.view.View[2]/android.widget.EditText   ${codigo[1]}
    Input Text
    ...   //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.view.View/android.view.View[4]/android.view.View[3]/android.widget.EditText   ${codigo[2]}
    Input Text
    ...    //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.view.View/android.view.View[4]/android.view.View[4]/android.widget.EditText  ${codigo[3]}
    
Do login with email    
    Click Element    ${BTN_ACCOUNT}
    Wait Until Page Contains Element    ${CONTINUE_WITH_EMAIL_BUTTON}
    Click Element    ${CONTINUE_WITH_EMAIL_BUTTON}
    Input Text       ${EMAIL_FIELD}     ${USER1_DETAILS}
    Click Element    ${LOGIN_SUBMIT_BUTTON_CONTINUAR}
    Wait Until Page Contains Element   ${CODE_VERIFICATION_FIELD}
    Input Verefication Code    1111
    Click Element    ${VERIFY_BUTTON}

Do Login new user
    Wait Until Page Contains Element    ${BTN_ACCOUNT} 
    Click Element    ${BTN_ACCOUNT}
    Wait Until Page Contains Element    ${CONTINUE_WITH_EMAIL_BUTTON}
    Click Element    ${CONTINUE_WITH_EMAIL_BUTTON}
    Input Text       ${EMAIL_FIELD}     ${USER_ONBOARDING}
    Click Element    ${LOGIN_SUBMIT_BUTTON_CONTINUAR}
    Wait Until Page Contains Element   ${CODE_VERIFICATION_FIELD}
    Input Verefication Code    1111
    Click Element    ${VERIFY_BUTTON}
    
    