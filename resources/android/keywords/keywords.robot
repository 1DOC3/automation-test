*** Settings ***
Library     AppiumLibrary
Resource    ../variables/variables.robot


*** Keywords ***
Setting timeouts
    Set Appium Timeout    120s

Open Aplication in Browserstack
    [Documentation]    Abre la aplicación en BrowserStack.
    [Arguments]
    ...    ${platform}=${PLATFORM_NAME}
    ...    ${device}=${DEVICE_NAME}
    ...    ${app}=${APP}
    ...    ${automation}=${AUTOMATION_NAME}
    Open Application
    ...    ${BROWSERSTACK_URL}
    ...    platformName=${platform}
    ...    deviceName=${device}
    ...    app=${app}
    ...    automationName=${automation}

Open Aplication in Local Device
    [Documentation]    Abre la aplicación local usando Appium.
    [Arguments]
    ...    ${platform}=${PLATFORM_NAME}
    ...    ${device}=${LOCAL_DEVICE_NAME}
    ...    ${app_package}=${APP_PACKAGE}
    ...    ${app_activity}=${APP_ACTIVITY}
    ...    ${automation}=${AUTOMATION_NAME}
    Open Application
    ...    ${APPIUM_SERVER}
    ...    platformName=${platform}
    ...    deviceName=${device}
    ...    appPackage=${app_package}
    ...    appActivity=${app_activity}
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
    ...    //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.view.View/android.view.View[4]/android.widget.EditText[1]
    ...    ${codigo[0]}
    Input Text
    ...    //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.view.View/android.view.View[4]/android.widget.EditText[2]
    ...    ${codigo[1]}
    Input Text
    ...    //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.view.View/android.view.View[4]/android.widget.EditText[3]
    ...    ${codigo[2]}
    Input Text
    ...    //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.view.View/android.view.View[4]/android.widget.EditText[4]
    ...    ${codigo[3]}
