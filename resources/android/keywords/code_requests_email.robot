*** Settings ***
Library    RequestsLibrary
Library    Collections
Library     AppiumLibrary

Resource     ./keywords.robot
Resource    ../variables/user_activations.robot
Resource    ../variables/user_consultation.robot
   

*** Variables ***
${BASE_URL}      https://qaservice.1doc3.com


*** Keywords ***
Get authentication code
    [Arguments]    ${contact}

    # Detectar si es un correo electrónico (contiene @)
    ${es_email}=    Run Keyword And Return Status    Should Contain    ${contact}    @

    Run Keyword If    ${es_email}    Log To Console    Enviando código a email: ${contact}
    ...    ELSE    Log To Console    Enviando código a celular: ${contact}

    # Construir endpoint con Set Variable If
    ${endpoint}=    Set Variable If    ${es_email}    /code?email=${contact}    /code?phoneNumber=+57${contact}

    ${headers}=    Create Dictionary    x-api-key=${API_KEY}
    Create Session    Login    ${BASE_URL}    headers=${headers}

    # Reintenta hasta que la respuesta sea 200
    Wait Until Keyword Succeeds    5x    5s    GET On Session Y Verificar    ${endpoint}

    ${codigo}=    Get From Dictionary    ${response.json()}    code
    Log To Console   Código: ${codigo}

    Should Not Be Empty    ${codigo}    El código de autenticación no fue recibido.
    RETURN    ${codigo}


GET On Session Y Verificar
    [Arguments]    ${endpoint}
    ${response}=    GET On Session    Login    url=${endpoint}

    # Registrar detalles si la respuesta no es 200
    Run Keyword Unless    '${response.status_code}' == '200'    Log To Console    Status recibido: ${response.status_code}
    Run Keyword Unless    '${response.status_code}' == '200'    Log To Console    Cuerpo de respuesta: ${response.content}

    Should Be Equal As Strings    ${response.status_code}    200
    Set Test Variable    ${response}
