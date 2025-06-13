*** Settings ***
Library         AppiumLibrary
Library          Collections
Resource        ../resources/android/variables/user_activations.robot
Resource        ../resources/android/variables/user_onboarding.robot
Resource        ../resources/android/keywords/keywords.robot

Suite Setup     Setting timeouts
Test Setup       Before Tests
Test Teardown    After Tests

*** Test Cases ***
Field validations
    Do Login new user
    Wait Until Page Contains Element  ${COPY_TITLE}
    Wait Until Page Contains Element  ${FIELD_NAME}
    Wait Until Page Contains Element  ${FIELD_LAST_NAME}
    Wait Until Element Is Visible     ${FIELD_GENDER}
    Wait Until Element Is Visible     ${FIELD_DATE_OF_BIRTH}
    Wait Until Element Is Visible     ${COPY_INFORMATION}
    Wait Until Page Contains Element  ${BTN_CONTINUE}
    Input Text       ${INPUT_NAME}           'Liz Dahianna'
    Wait Until Page Contains Element  ${INPUT_LAST_NAME} 
    Click Element    ${INPUT_LAST_NAME} 
    Input Text       ${INPUT_LAST_NAME}      'Giraldo'
    Wait Until Element Is Visible  ${FIELD_GENDER}
    Click Element  ${FIELD_GENDER}
    Click Element     ${WOMEN_OPTION}
    Wait Until Element Is Visible     ${FIELD_DATE_OF_BIRTH}
    Click Element  ${FIELD_DATE_OF_BIRTH}
    Seleccionar Fecha Completa   24    Febrero    1996
    Click Element   ${BTN_SAVED}
    Wait Until Element Is Visible    //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View
    Wait Until Element Is Visible   ${OBJECTIVE_1}       
    Wait Until Element Is Visible   ${OBJECTIVE_2}     
    Wait Until Element Is Visible   ${OBJECTIVE_3} 
    Wait Until Element Is Visible   ${OBJECTIVE_4}  
    Wait Until Element Is Visible   ${OBJECTIVE_5} 
    Wait Until Element Is Visible   ${OBJECTIVE_6}
    Wait Until Element Is Visible   ${OBJECTIVE_7}    
    Click Element                   ${OBJECTIVE_3}


*** Variables ***
&{MONTHS}    Enero=1    Febrero=2    Marzo=3    Abril=4    Mayo=5    Junio=6    Julio=7    Agosto=8    Septiembre=9    Octubre=10    Noviembre=11    Diciembre=12

${LOCATOR_DIA}    xpath=(//android.widget.SeekBar)[1]
${LOCATOR_MES}    xpath=(//android.widget.SeekBar)[2]
${LOCATOR_AÑO}    xpath=(//android.widget.SeekBar)[3]

*** Keywords ***

# Obtiene el valor numérico actual visible (día o año)
Obtener Valor Actual Numerico
    [Arguments]    ${locator}
    ${text}=    Get Element Attribute    ${locator}    content-desc
    Log    Valor actual del picker: ${text}
    ${is_number}=    Run Keyword And Return Status    Should Match Regexp    ${text}    ^\d+$
    Run Keyword If    '${is_number}'    Return From Keyword    ${text}
    Fail    El texto obtenido '${text}' no es un número válido para día/año

# Obtiene el mes actual en número desde texto
Obtener Mes Actual Numerico
    [Arguments]    ${locator}
    ${mes_text}=    Get Element Attribute    ${locator}    content-desc
    Log    Mes actual visible: ${mes_text}
    ${mes_num}=    Get From Dictionary    ${MONTHS}    ${mes_text}
    [Return]    ${mes_num}

# Swipe hacia arriba
Swipe Up En Picker
    [Arguments]    ${x}    ${y_start}    ${y_end}    ${duration}=500ms
    Swipe    ${x}    ${y_start}    ${x}    ${y_end}    ${duration}

# Swipe hacia abajo
Swipe Down En Picker
    [Arguments]    ${x}    ${y_start}    ${y_end}    ${duration}=500ms
    Swipe    ${x}    ${y_start}    ${x}    ${y_end}    ${duration}

# Selecciona un valor en picker haciendo swipe según diferencia actual vs objetivo
Seleccionar Valor En Picker
    [Arguments]    ${locator}    ${target_value}    ${swipe_x}    ${swipe_y_start}    ${swipe_y_end}    ${tipo}=${'num'}    ${max_intentos}=${15}
    Log    Llamando a Seleccionar Valor En Picker con tipo: ${tipo} y target_value: ${target_value}
    FOR    ${i}    IN RANGE    ${max_intentos}
        IF    '${tipo}' == 'mes'
            ${current}=    Obtener Mes Actual Numerico    ${locator}
        ELSE IF    '${tipo}' == 'año'
            ${current}=    Obtener Valor Actual Numerico    ${locator}
        ELSE
            ${current}=    Obtener Valor Actual Numerico    ${locator}
        END

        Log    Valor actual: ${current}, valor objetivo: ${target_value}

        # Verificar que current y target_value no estén vacíos
        Run Keyword If    '${current}' == ''    Fail    El valor actual del picker está vacío.
        Run Keyword If    '${target_value}' == ''    Fail    El valor objetivo está vacío.

        # Asegúrate de que ambos valores sean convertibles a enteros
        ${current_int}=    Convert To Integer    ${current}
        ${target_value_int}=    Convert To Integer    ${target_value}

        # Log para verificar los tipos y valores
        Log    current_int: ${current_int} (tipo: ${current_int.__class__}), target_value_int: ${target_value_int} (tipo: ${target_value_int.__class__})

        # Verificar que la conversión fue exitosa
        Run Keyword If    '${current_int}' == 'None'    Fail    La conversión de current a entero falló.
        Run Keyword If    '${target_value_int}' == 'None'    Fail    La conversión de target_value a entero falló.

        ${delta}=    Evaluate    ${target_value_int} - ${current_int}

        # Log para verificar el valor de delta
        Log    delta: ${delta} (tipo: ${delta.__class__})

        Run Keyword If    ${delta} > 0    Swipe Down En Picker    ${swipe_x}    ${swipe_y_start}    ${swipe_y_end}
        Run Keyword If    ${delta} < 0    Swipe Up En Picker    ${swipe_x}    ${swipe_y_end}    ${swipe_y_start}
        Sleep    0.5s
    END
    Fail    No se pudo seleccionar el valor ${target_value} en el picker luego de ${max_intentos} intentos

# Selecciona la fecha completa (día, mes, año)
Seleccionar Fecha Completa
    [Arguments]    ${dia}    ${mes_text}    ${año}
    ${mes_target}=    Get From Dictionary    ${MONTHS}    ${mes_text}

    Seleccionar Valor En Picker    ${LOCATOR_DIA}    ${dia}    200    1500    1200    num
    Seleccionar Valor En Picker    ${LOCATOR_MES}    ${mes_target}    500    1500    1200    mes
    Seleccionar Valor En Picker    ${LOCATOR_AÑO}    ${año}    800    1500    1200    año
