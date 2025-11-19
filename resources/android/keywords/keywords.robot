*** Settings ***
Library     AppiumLibrary
Library    String
Library    FakerLibrary
Library    Process
Library  DateTime


Resource    ../variables/user_activations.robot
Resource    ../variables/user_consultation.robot
Resource    ../variables/user_daily_inspiration.robot
Resource    Keywords_onboarding_flow.robot
Resource    code_requests_email.robot
Resource    ../variables/user_explore.robot



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


Initialize Session
    Open 1doc3 Application
    Do login with email  fa1@yopmail.com
    Setting timeouts
  
    
Open 1doc3 Application

    Open Application
    ...    ${APPIUM_SERVER}
    ...    platformName=${PLATFORM_NAME}
    ...    deviceName=${DEVICE_NAME}
    ...    app=${APP_PATH}
    ...    automationName=${AUTOMATION_NAME}
    ...    autoGrantPermissions=${True}
    ...    enforceXPath1=${True}
    ...    adbExecTimeout=60000
    ...    uiautomator2ServerLaunchTimeout= 60000

    Sleep    3




Measure App Loading Time
    [Arguments]    ${locator_app}
    Open 1doc3 Application
    Close Application
    Open 1doc3 Application
    ${inicio}=    Get Current Date    result_format=epoch
    Wait Until Element Is Visible    ${locator_app}    timeout=5s
    ${fin}=    Get Current Date    result_format=epoch

    ${duracion}=    Evaluate    round(${fin} - ${inicio}, 2)
    Should Be True    ${duracion} <= 3    msg=⛔ La app se demoró demasiado en cargar (${duracion} segundos)
    Log To Console   msg=🆗 La app se demoró en cargar (${duracion} segundos)


Define login
...  [Arguments]    ${correo_o_celular}
    ${correo_o_celular}=    Evaluate    "${correo_o_celular}".strip()

    ${es_email}=    Run Keyword And Return Status    Should Contain    ${correo_o_celular}    @
    IF    ${es_email}
        Log To Console    \n🔑 Ejecutando login con CORREO: ${correo_o_celular}
        Do login with email    ${correo_o_celular}
    ELSE
        Log To Console    \n🔑 Ejecutando login con CELULAR: ${correo_o_celular}
        Do login with mobile    ${correo_o_celular}
    END


   

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
    Sleep    8s
    Permission notifications
    Sleep    8s
    Alarms & Reminders
    Sleep    8s
    Terms and conditions

Scroll Until Element Is Found In Safe Position
    [Arguments]  ${element_xpath}  ${start_x}=500  ${start_y}=1000  ${end_x}=500  ${end_y}=500
    ...  ${duration}=1000  ${timeout}=3  ${additional_scroll}=${True}
    ...  ${additional_start_x}=500  ${additional_start_y}=800
    ...  ${additional_end_x}=500  ${additional_end_y}=300  ${additional_duration}=500

    WHILE  True
        Log    Trying to find element...    level=INFO
        ${element_found}=  Run Keyword And Ignore Error  Wait Until Element Is Visible  ${element_xpath}  ${timeout}
        ${status}=  Set Variable  ${element_found[0]}
        Run Keyword If  '${status}' == 'PASS'  Exit For Loop
        Log    Element not found, scrolling...    level=INFO
        Swipe  ${start_x}  ${start_y}  ${end_x}  ${end_y}  ${duration}
    END

    Log    Element found!    level=INFO

    Run Keyword If  '${additional_scroll}' == 'True'
    ...    Swipe  ${additional_start_x}  ${additional_start_y}  ${additional_end_x}  ${additional_end_y}  ${additional_duration}



Verify prefix locator 
    # Esperar un tiempo
    Wait Until Page Contains Element    ${PREFIX_LOCATOR}    10s  error=❌ No se encontró el prefijo en ${TIMEOUT}
     # Obtiene el valor actual del atributo content-desc
    ${valor_actual}=    Get Element Attribute    ${PREFIX_LOCATOR}    content-desc
    Log To Console    El prefijo actual es: ${valor_actual}

    # Compara si es diferente a +57
    IF    '${valor_actual}' != '${VALOR_ESPERADO}'
        Log To Console    ⚠️ Prefijo diferente, se cambiará a ${VALOR_ESPERADO}
        Click Element    ${PREFIX_LOCATOR}
        Wait Until Element Is Visible  accessibility_id=+57 - Colombia
        Click Element    accessibility_id=+57 - Colombia
    ELSE
        Log To Console    ✅ El prefijo ya es ${VALOR_ESPERADO}, no se hace nada
    END
Do Login with mobile
   [Arguments]    ${data} 
    Sleep    8s
    Click Element    ${BTN_ACCOUNT}
    Wait Until Element Is Visible    ${CONTINUE_WITH_MOBILE_BUTTON}    30s
    Click Element    ${CONTINUE_WITH_MOBILE_BUTTON}
    Wait Until Element Is Visible    ${LOGIN_MOBILE_TEXT_FIELD}
    Verify prefix locator
    Input Text    ${LOGIN_MOBILE_TEXT_FIELD}    ${data} 
    Wait Until Element Is Visible    ${BTN_MOBILE_LOGIN}
    Click Element    ${BTN_MOBILE_LOGIN}
    Wait Until Page Contains Element   ${CODE_VERIFICATION_FIELD}
    ${code}=    Get Code Environment   ${data} 
    Input Verification Code     ${code}
    Click Element    ${VERIFY_BUTTON}
    Sleep    8s
    Permission notifications
    Sleep    8s
    Alarms & Reminders
    Sleep    8s
    Terms and conditions

Flow Until Verify
    Wait Until Page Contains Element    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Click Element    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Wait Until Page Contains Element    ${LOGIN_COMPANY_FIELD}
    Input Text    ${LOGIN_COMPANY_FIELD}    ${NAME_COMPANY}
    Sleep    5s
    Click Element    ${COMPANY_SELECTOR}
    Click Element    ${LOGIN_SUBMIT_BUTTON_CONTINUAR}
    Wait Until Page Contains Element    ${EMAIL_FIELD}
    Aleatory
    Click Element    ${VERIFY_BUTTON}

Aleatory
    ${result}=    Run Keyword And Ignore Error    Set Variable    ${EMAIL_GENERATED}
    ${status}=    Set Variable    ${result}[0]
    IF    '${status}' == 'FAIL'
        ${email}=    FakerLibrary.Email
        Set Suite Variable    ${EMAIL_GENERATED}    ${email}
    END
    Input Text    ${EMAIL_FIELD}    ${EMAIL_GENERATED}

Permission notifications
    ${is_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${DENY_BUTTON}    timeout=3s
    Run Keyword If    ${is_visible}    Click Element    ${DENY_BUTTON}

Terms and conditions
    ${is_visible}=    Run Keyword And Return Status    Wait Until Page Contains Element    ${CTA_TERMS_CONDITIONS}    timeout=3s
    Run Keyword If    ${is_visible}    Click Element    ${CTA_TERMS_CONDITIONS}

Alarms & Reminders
    ${is_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${ALARMS & REMINDERS}    timeout=3s
    Run Keyword If    ${is_visible}    Click Element    ${ATRAS}


Informed consent
    ${is_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${CTA_INFORMED_CONSENT}    timeout=3s
    Run Keyword If    ${is_visible}    Click Element    ${CTA_INFORMED_CONSENT}

Modal location
    ${is_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${MODAL_LOCATION}   5s
    Run Keyword If    ${is_visible}    Click Element    ${MODAL_LOCATION}
    ...    ELSE    Log    Modal no encontrada, continuar flujo
    ...    

Return To Home Public
    ${is_running}=    Run Keyword And Return Status    App Should Be Running    com.app1doc3.app1doc3

    IF    not ${is_running}
        Activate Application    com.app1doc3.app1doc3
    ELSE
        Terminate Application    com.app1doc3.app1doc3
        Sleep    1s
        Activate Application    com.app1doc3.app1doc3
    END

    Wait Until Keyword Succeeds    30s    1s    Page Should Contain Element    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}



Return To Home
    ${is_running}=    Run Keyword And Return Status    App Should Be Running    com.app1doc3.app1doc3

    IF    not ${is_running}
        Activate Application    com.app1doc3.app1doc3
    ELSE
        Terminate Application    com.app1doc3.app1doc3
        Sleep    1s
        Activate Application    com.app1doc3.app1doc3
    END

    Wait Until Keyword Succeeds    30s    1s    Page Should Contain Element    ${HELP}


App Should Be Running
    [Arguments]    ${package}
    ${output}=    Run Process    adb    shell    pidof ${package}    stdout=YES    stderr=NO
    Should Not Be Empty    ${output.stdout}
    


