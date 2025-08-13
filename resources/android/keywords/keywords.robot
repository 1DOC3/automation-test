*** Settings ***
Library     AppiumLibrary
Library    String


Resource    ../variables/user_activations.robot
Resource    ../variables/user_consultation.robot
Resource    Keywords_onboarding_flow.robot
Resource    code_requests_email.robot

*** Variables ***
${APPIUM_SERVER}     %{APPIUM_SERVER}
${PLATFORM_NAME}     %{PLATFORM_NAME}
${DEVICE_NAME}       %{DEVICE_NAME}
${AUTOMATION_NAME}   %{AUTOMATION_NAME}
${APP_PATH}          %{APP_PATH}
${ENVIRONMENT}       %{EXEC_ENV}
${API_KEY}           %{API_KEY} 


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
    Open Application
    ...    ${APPIUM_SERVER}
    ...    platformName=${PLATFORM_NAME}
    ...    deviceName=${DEVICE_NAME}
    ...    app=${APP_PATH}
    ...    automationName=${AUTOMATION_NAME}
    ...    autoGrantPermissions=true




Get Code Environment
    [Arguments]    ${data}
    IF    '${ENVIRONMENT}' != 'production'
        ${code}=    Set Variable    1111
    ELSE
        ${code}=    Get authentication code    ${data}
    END
    RETURN    ${code}

Verify Text Equal on Element
    [Arguments]    ${selector}    ${texto_esperado}
    AppiumLibrary.Wait Until Page Contains Element    ${selector}
    ${contenido_desc} =    Get Element Attribute    ${selector}    contentDescription
    Log To Console    El texto obtenido es: ${contenido_desc}
    Should Be Equal As Strings    ${contenido_desc}    ${texto_esperado}


Input Verification Code 
    [Arguments]    ${code}
    [Documentation]    Ingresa el code de 4 digitos
    Should Not Be Empty    ${code}    El código de autenticación no fue recibido.
    Click Element  ${CODE_VERIFICATION_FIELD}
    
    ${code_list}=    Convert To List    ${code}

    FOR    ${d}    IN    @{code_list}
        ${keycode}=    Evaluate    7 + int(${d})
        Press Keycode    ${keycode}
    END
    
  

Do login with email
...  [Arguments]    ${data}    
    Click Element    ${BTN_ACCOUNT}
    Wait Until Page Contains Element    ${CONTINUE_WITH_EMAIL_BUTTON}
    Click Element    ${CONTINUE_WITH_EMAIL_BUTTON}
    Input Text       ${EMAIL_FIELD}     ${data}  
    Click Element    ${LOGIN_SUBMIT_BUTTON_CONTINUAR}
    Wait Until Page Contains Element   ${CODE_VERIFICATION_FIELD}
    ${code}=    Get Code Environment    ${data} 
    Input Verification Code     ${code}  
    Click Element    ${VERIFY_BUTTON}

Do Login new user
   [Arguments]    ${data} 
    Wait Until Page Contains Element    ${BTN_ACCOUNT} 
    Click Element    ${BTN_ACCOUNT}
    Wait Until Page Contains Element    ${CONTINUE_WITH_EMAIL_BUTTON}
    Click Element    ${CONTINUE_WITH_EMAIL_BUTTON}
    Input Text       ${EMAIL_FIELD}     ${data} 
    Click Element    ${LOGIN_SUBMIT_BUTTON_CONTINUAR}
    Wait Until Page Contains Element   ${CODE_VERIFICATION_FIELD}
    ${code}=    Get Code Environment   ${data} 
    Input Verification Code     ${code}
    Click Element    ${VERIFY_BUTTON}
    Wait Until Page Contains Element  ${FIELD_NAME}
    Wait Until Page Contains Element  ${FIELD_LAST_NAME}
    Wait Until Element Is Visible     ${FIELD_GENDER}
    Wait Until Element Is Visible     ${FIELD_DATE_OF_BIRTH}
    Input Text       ${INPUT_NAME}           'Liz Dahianna'
    Wait Until Page Contains Element  ${INPUT_LAST_NAME} 
    Click Element    ${INPUT_LAST_NAME} 
    Input Text       ${INPUT_LAST_NAME}      'Giraldo'
    Wait Until Element Is Visible  ${FIELD_GENDER}
    Click Element  ${FIELD_GENDER}
    Click Element     ${WOMEN_OPTION}
    Wait Until Element Is Visible     ${FIELD_DATE_OF_BIRTH}
    Click Element  ${FIELD_DATE_OF_BIRTH}
    Seleccionar Fecha    5   abril  1996
    Wait Until Element Is Visible  ${BTN_SAVED}
    Click Element  ${BTN_SAVED}
    Wait Until Element Is Visible  ${BTN_CONTINUE}
    Click Element  ${BTN_CONTINUE}
    Wait Until Element Is Visible    //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View
    Wait Until Element Is Visible   ${OBJECTIVE_1}       
    Wait Until Element Is Visible   ${OBJECTIVE_2}     
    Wait Until Element Is Visible   ${OBJECTIVE_3} 
    Wait Until Element Is Visible   ${OBJECTIVE_4}  
    Wait Until Element Is Visible   ${OBJECTIVE_5} 
    Wait Until Element Is Visible   ${OBJECTIVE_6}
    Wait Until Element Is Visible   ${OBJECTIVE_7}    
    Click Element                   ${OBJECTIVE_3}
    Sleep  5s
 
Scroll Until Element Is Found In Safe Position
    [Arguments]  ${element_xpath}  ${start_x}=500  ${start_y}=1000  ${end_x}=500  ${end_y}=500
    ...  ${duration}=1000  ${timeout}=3  ${additional_scroll}=${True}
    ...  ${additional_start_x}=500  ${additional_start_y}=800
    ...  ${additional_end_x}=500  ${additional_end_y}=300  ${additional_duration}=500



    WHILE  True
        Log    Trying to find element...
        ${element_found}=  Run Keyword And Ignore Error  Wait Until Element Is Visible  ${element_xpath}  ${timeout}
        ${status}=  Set Variable  ${element_found[0]}
        Run Keyword If  '${status}' == 'PASS'  Exit For Loop
        Log    Element not found, scrolling...
        Swipe  ${start_x}  ${start_y}  ${end_x}  ${end_y}  ${duration}
    END



    Log  Element found!



    Run Keyword If  '${additional_scroll}' == 'True'
    ...    Swipe  ${additional_start_x}  ${additional_start_y}  ${additional_end_x}  ${additional_end_y}  ${additional_duration}

Do Login with mobile
   [Arguments]    ${data} 
    Sleep    8s
    Click Element    ${BTN_ACCOUNT}
    Wait Until Element Is Visible    ${CONTINUE_WITH_MOBILE_BUTTON}    30s
    Click Element    ${CONTINUE_WITH_MOBILE_BUTTON}
    Wait Until Element Is Visible    ${LOGIN_MOBILE_TEXT_FIELD}
    Input Text    ${LOGIN_MOBILE_TEXT_FIELD}    ${data} 
    Wait Until Element Is Visible    ${BTN_MOBILE_LOGIN}
    Click Element    ${BTN_MOBILE_LOGIN}
    Wait Until Page Contains Element   ${CODE_VERIFICATION_FIELD}
    ${code}=    Get Code Environment   ${data} 
    Input Verification Code     ${code}
    Click Element    ${VERIFY_BUTTON}

Flow Until Verify
    Wait Until Page Contains Element    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Click Element    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Wait Until Page Contains Element    ${LOGIN_COMPANY_FIELD}
    Input Text    ${LOGIN_COMPANY_FIELD}    ${NAME_COMPANY}
    Sleep    5s
    Click Element    ${COMPANY_SELECTOR}
    Click Element    ${LOGIN_SUBMIT_BUTTON_CONTINUAR}
    Wait Until Page Contains Element    ${EMAIL_FIELD}
    Input Text    ${EMAIL_FIELD}    ${LICENSE_NOT_EXIST}
    Click Element    ${VERIFY_BUTTON}
