*** Settings ***
Library    AppiumLibrary
Library    String
Library    DateTime
Library    Collections

Resource    ../variables/user_onboarding.robot


*** Keywords ***

Obtener Valor Actual
    [Arguments]    ${locator}
    ${element}=    Get WebElement    ${locator}
    ${valor}=      Get Element Attribute    ${element}    content-desc
    Log To Console    Valor actual: ${valor}
    [Return]    ${valor}

Determinar Dirección
    [Arguments]    ${actual}    ${deseado}
    ${es_numero}=    Run Keyword And Return Status    Should Match Regexp    ${actual}    ^\\d+$

    IF    ${es_numero}
        ${actual}=    Convert To Integer    ${actual}
        ${deseado}=    Convert To Integer    ${deseado}
    END

    ${resultado}=    Run Keyword If    ${actual} > ${deseado}    Set Variable    abajo
    ...              ELSE IF    ${actual} < ${deseado}    Set Variable    arriba
    ...              ELSE    Set Variable    igual

    [Return]    ${resultado}

Obtener Índice Mes
    [Arguments]    ${mes}
    ${indice}=    Get Index From List    ${MESES_ORDENADOS}    ${mes}
    [Return]    ${indice}

Swipe Element
    [Arguments]    ${element_locator}    ${direccion}
    ${element}=    Get WebElement    ${element_locator}
    ${location}=   Get Element Location    ${element}
    ${size}=       Get Element Size        ${element}

    ${x}=          Evaluate    ${location["x"]} + (${size["width"]} / 2)
    ${y}=          Evaluate    ${location["y"]} + (${size["height"]} / 2)

    ${delta}=      Set Variable If    '${direccion}' == 'arriba'    -80    80
    ${end_y}=      Evaluate    ${y} + ${delta}

    Swipe    ${x}    ${y}    ${x}    ${end_y}    800



Ajustar Valor Picker
    [Arguments]    ${deseado}    ${locator}

    FOR    ${i}    IN RANGE    40
        ${actual}=     Obtener Valor Actual    ${locator}
        ${actual}=     Strip String    ${actual}
        ${deseado}=    Strip String    ${deseado}

        # Si el valor actual está en la lista de meses
        ${es_mes}=     Run Keyword And Return Status    List Should Contain Value    ${MESES_ORDENADOS}    ${actual.lower()}

        IF    ${es_mes}
            ${indice_actual}=    Obtener Índice Mes    ${actual.lower()}
            ${indice_deseado}=   Obtener Índice Mes    ${deseado.lower()}
        ELSE
            ${indice_actual}=    Convert To Integer    ${actual}
            ${indice_deseado}=   Convert To Integer    ${deseado}
        END

        Log To Console    ➤ Comparando: actual=${indice_actual} | deseado=${indice_deseado}

        ${direccion}=  Run Keyword If    ${indice_deseado} > ${indice_actual}    Set Variable    arriba
        ...            ELSE IF           ${indice_deseado} < ${indice_actual}    Set Variable    abajo
        ...            ELSE              Set Variable    igual

        Exit For Loop If    ${indice_actual} == ${indice_deseado}

        ${valor_previo}=    Set Variable    ${actual}
        Swipe Element       ${locator}    ${direccion}
        Sleep               1s
        ${nuevo_valor}=     Obtener Valor Actual    ${locator}
        Run Keyword If    '${nuevo_valor}' == '${valor_previo}'    Log To Console    ⚠ El valor no cambió tras swipe

    END

  
Seleccionar Fecha
    [Arguments]    ${dia_deseado}    ${mes_deseado}    ${anio_deseado}

    Log To Console    ⏳ Seleccionando día: ${dia_deseado}
    Ajustar Valor Picker    ${dia_deseado}    ${LOCATOR_DIA}

    Log To Console    ⏳ Seleccionando mes: ${mes_deseado}
    Ajustar Valor Picker    ${mes_deseado}    ${LOCATOR_MES}

    Log To Console    ⏳ Seleccionando año: ${anio_deseado}
    Ajustar Valor Picker    ${anio_deseado}    ${LOCATOR_ANIO}

    Log To Console    ✅ Fecha seleccionada: ${dia_deseado} ${mes_deseado} ${anio_deseado}
