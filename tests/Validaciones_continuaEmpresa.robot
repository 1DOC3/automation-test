*** Settings ***
Library    AppiumLibrary  

*** Variables ***

#*** Open Application ***
${BROWSERSTACK_URL}    https://qamedico_zUp2qI:nSAMegsxpAnQKWj5f8Y3@hub-cloud.browserstack.com/wd/hub
${PLATFORM_NAME}       Android
${DEVICE_NAME}         Samsung Galaxy S22 Ultra
${AUTOMATION_NAME}     UIAutomator2
${APP}                 bs://90a058bfbc53af5825acd531582352fecefc27d2


#*** Test Variables *** #Correo  y nombre de la empresa
${USER1-DETAILS}    chayan@yopmail.com
${NAME_COMPANY}     Empresa pruebas
${NAME_NOEXIST}     RAM
# Continua Con Empresa Locators
${LOGIN_SUBMIT_CONTINUACONEMPRESA}   //android.widget.Button[@content-desc="Continua con tu empresa"]
${LOGIN_EMPRESA_FIELD}               //android.widget.EditText
${LOGIN_SUBMIT_BUTTON_CONTINUAR}     //android.widget.Button[@content-desc="Continuar"]
${MENSAJE_ERROR_ELEGIR_COMPANY}      //android.view.View[@content-desc="Selecciona una empresa"]
${MENSAJE_ERROR_ELEGIR_COMPANY2}     //android.view.View[@content-desc="Para continuar selecciona de la lista el nombre de la empresa a la que perteneces."]
${COMPANY_SELECTOR}                   Empresa pruebas    # accessibility_id para la empresa
${ERROR_ESCRIBIR_NOMBRE_COMPANY2}     //android.view.View[contains(@content-desc,"Escribe el nombre de tu empresa para continuar.")]
${EMAIL_FIELD}                       //android.widget.EditText  # Localizador para el campo de correo
${VERIFICAR_BUTTON_}                 //android.widget.Button[@content-desc="Verificar"]
${BORRAR_NOMBRE_COMPANY}            //android.widget.EditText[@text="Empresa pruebas"]/android.view.View
${CERRAR_CLOSE}                     //android.view.View[contains(@content-desc, "Escribe el nombre de tu empresa para continuar.")]/android.view.View[1]
${NO_ENCONTRAR_EMPRESA}             //android.view.View[contains(@content-desc, "No encontramos esta empresa.")]
${ELEGIR_COMPANY}                   //android.widget.ImageView[@content-desc="Empresa pruebas"]
${PAGE_VERIFY_USER}                 //android.view.View[@content-desc="Verifica tu usuario"]
${BOTON_ATRAS}                      //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]
${PAGE_FOUND_COMPANY}               //android.view.View[@content-desc="Busca tu empresa"]



*** Test Cases *** 
Test Validación mensaje de error elegir empresa
  Abrir la aplicación en BrowserStack
  Esperar para ver que este el btn Continua con tu empresa
  Seleccionar el btn Continuar con tu empresa
  Ingresar el nombre de una empresa
  Seleccionar el botón Continuar
  Ver mensaje de error de elegir empresa   

Test Validación mensaje de error escribir empresa
  Abrir la aplicación en BrowserStack
  Esperar para ver que este el btn Continua con tu empresa
  Seleccionar el btn Continuar con tu empresa
  Ingresar el nombre de una empresa
  Borrar el nombre de la empresa
  Seleccionar el botón Continuar
  Ver mensaje de escribir una empresa
  Cerrar el close de la vista

Test validación no encontrar empresa
  Abrir la aplicación en BrowserStack
  Esperar para ver que este el btn Continua con tu empresa
  Seleccionar el btn Continuar con tu empresa
  Ingresar nombre de empresa no existente
  Ver mensaje de no encontrar empresa

Test ir a vista verifica tu usuario
  Abrir la aplicación en BrowserStack
  Esperar para ver que este el btn Continua con tu empresa
  Seleccionar el btn Continuar con tu empresa
  Ingresar el nombre de una empresa
  Seleccionar empresa
  Seleccionar el botón Continuar
  Ver vista de Verifica tu usuario  

Ir a la vista anterior de Busca tu empresa
  Abrir la aplicación en BrowserStack
  Esperar para ver que este el btn Continua con tu empresa
  Seleccionar el btn Continuar con tu empresa
  Ingresar el nombre de una empresa
  Seleccionar empresa
  Seleccionar el botón Continuar
  Seleccionar botón atrás



*** Keywords ***
Abrir la aplicación en BrowserStack
    #Abre la aplicación en BrowserStack
    AppiumLibrary.Open Application  ${BROWSERSTACK_URL}    platformName=${PLATFORM_NAME}    deviceName=${DEVICE_NAME}    app=${APP}  automationName=${AUTOMATION_NAME}  
   
 Esperar para ver que este el btn Continua con tu empresa
    # Espera hasta que el elemento esté presente en la página.
   AppiumLibrary.Wait Until Page Contains Element    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}    timeout=60s


Seleccionar el btn Continuar con tu empresa
    # Da clic en el CTA Ingresa con continua con tu empresa
    Click Element    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}

Ingresar el nombre de una empresa

  #Ingresar el nombre de la empresa 
  Input Text    ${LOGIN_EMPRESA_FIELD}    ${NAME_COMPANY}

Ingresar nombre de empresa no existente
...        Input Text    ${LOGIN_EMPRESA_FIELD}  ${NAME_NOEXIST}   

Seleccionar el botón Continuar

    #Da click en el botón continuar
    Click Element  ${LOGIN_SUBMIT_BUTTON_CONTINUAR}

Ver mensaje de error de elegir empresa  
  AppiumLibrary.Wait Until Page Contains Element  ${MENSAJE_ERROR_ELEGIR_COMPANY}   timeout=120s
  AppiumLibrary.Wait Until Page Contains Element  ${MENSAJE_ERROR_ELEGIR_COMPANY2}   timeout=120s

Borrar el nombre de la empresa

    #Borrar el nombre de la empresa
    Click Element  ${BORRAR_NOMBRE_COMPANY}
    
Ver mensaje de escribir una empresa
...        AppiumLibrary.Wait Until Element is visible  ${ERROR_ESCRIBIR_NOMBRE_COMPANY2}    timeout=120s
Cerrar el close de la vista
...  Click Element  ${CERRAR_CLOSE}    

Ver mensaje de no encontrar empresa
...        AppiumLibrary.Wait Until Element is visible   ${NO_ENCONTRAR_EMPRESA}   timeout=120s 

Seleccionar empresa
...    Click Element  ${ELEGIR_COMPANY} 

Ver vista de Verifica tu usuario  
...  AppiumLibrary.Wait Until Page Contains Element  ${PAGE_VERIFY_USER}  timeout=120s  
     ${content_desc} =    Get element attribute   //android.view.View[contains(@content-desc,"Ahora, ingresa tu correo electrónico y verifícate en Empresa pruebas.")]   contentDescription
     Log To Console    El texto obtenido es: ${content_desc}
     Should Be Equal As Strings    ${content_desc}   Ahora, ingresa tu correo electrónico y verifícate en Empresa pruebas.
     
Seleccionar botón atrás
    Click Element   ${BOTON_ATRAS}   
    AppiumLibrary.Wait Until Page Contains Element   ${PAGE_FOUND_COMPANY}  timeout=120s 

