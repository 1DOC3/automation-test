*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_url}       https://postman-echo.com
${auth_url}=      https://staging.auth.1doc3.com
${api_url}=       https://staging.apiv3.1doc3.com/licenses
${client_id}=      4qT5lcd73ajsamViwdS4lgbJJ
${client_secret}=  1ahsjaksd2818250518enn
${grant_type}=     client_credentials

*** Test Cases ***
Buscar Todos Los Mojitos
    Create Session    cocktail_api    https://www.thecocktaildb.com
    ${response}=       GET On Session  cocktail_api    url=/api/json/v1/1/search.php?s=mojito
    ${drinks}=           Get From Dictionary    ${response.json()}    drinks 
   
    FOR    ${drink}    IN    @{drinks}
        Log    Nombre: ${drink['strDrink']} 
        Log    Instrucciones: ${drink['strInstructions']} 
        
         # Aquí imprimo  más legible el JSON 
        ${pretty_json}=    Evaluate    json.dumps(${drink}, indent=4)    json
        Log    ${pretty_json}    console=True
        
        
    END


# Aquí pruebo como acceder a una api con bearer 
BasicAuthverify
...  ${auth}=  Create list    postman     password
    create session    mysession    ${base_url}    auth=${auth}
    ${response}=    get on session    mysession    /basic-auth
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    should be equal as strings    ${response.status_code}    200


AutenticarseYListarLicencias
    # Paso 1: Crear el payload en formato JSON (como un diccionario en Robot)
    ${auth_payload}=    create dictionary    client_id=${client_id}    client_secret=${client_secret}    grant_type=${grant_type}

    # Crear sesión de autenticación
    create session    auth    ${auth_url}

    # Agregar encabezados
    ${headers}=    create dictionary    Content-Type=application/json

    # Hacer la solicitud POST para obtener el token
    ${auth_response}=    post request    auth    /token    json=${auth_payload}    headers=${headers}

    # Log de la respuesta para ver qué pasa
    log to console    ${auth_response.status_code}
    log to console    ${auth_response.content}

    # Obtener el token correctamente como string
    ${access_token}=    get from dictionary    ${auth_response.json()}    access_token
    log to console    ${access_token}

    # Concatenar correctamente el token con 'Bearer '
    ${bearer_token}=    set variable    Bearer ${access_token}
    log to console    ${bearer_token}

    # Usar el token para listar las licencias
    ${licencias_headers}=    create dictionary    Authorization=${bearer_token}    Content-Type=application/json
    create session    api    ${api_url}
     # Agregar encabezados
    # ${headers}=    create dictionary    Content-Type=application/json
    ${licencias_response}=    GET On Session   api    /list    headers=${licencias_headers}
    log to console    Status: ${licencias_response.status_code}
    #log to console    Licencias: ${licencias_response.content}
    ${licencias_json}=    evaluate    json.dumps(${licencias_response.json()}, indent=2)    json
    log to console    ${licencias_json}
    
    

  
    