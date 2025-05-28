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
    ${response}=    GET On Session    Login    url=${endpoint}

    Should Be Equal As Strings    ${response.status_code}    200
    ${codigo}=    Get From Dictionary    ${response.json()}    code
    Log To Console   Código: ${codigo}

    Should Not Be Empty    ${codigo}    El código de autenticación no fue recibido.
    RETURN    ${codigo}


