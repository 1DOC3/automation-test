*** Settings ***
Library     AppiumLibrary
Resource    ../variables/variables.robot


*** Keywords ***
Setting timeouts
    Set Appium Timeout    120s

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

Verify Text on Element
    [Arguments]    ${selector}    ${texto_esperado}
    AppiumLibrary.Wait Until Page Contains Element    ${selector}
    ${contenido_desc} =    Get Element Attribute    ${selector}    contentDescription
    Log To Console    El texto obtenido es: ${contenido_desc}
    Should Be Equal As Strings    ${contenido_desc}    ${texto_esperado}

Input Verefication Code
    [Documentation]    Ingresa el codigo de 4 digitos
    [Arguments]    ${codigo}
    Input Text
    ...   //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.view.View/android.view.View[4]/android.view.View[1]/android.widget.EditText
    ...    ${codigo[0]}
    Input Text
    ...    //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.view.View/android.view.View[4]/android.view.View[2]/android.widget.EditText
    ...    ${codigo[1]}
    Input Text
    ...    //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.view.View/android.view.View[4]/android.view.View[3]/android.widget.EditText
    ...    ${codigo[2]}
    Input Text
    ...   //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.view.View/android.view.View[4]/android.view.View[4]/android.widget.EditText
    ...    ${codigo[3]}
