*** Variables ***

# Appium Config (Local Server)
${APPIUM_SERVER}         http://127.0.0.1:4723
${PLATFORM_NAME}         Android
${AUTOMATION_NAME}       UIAutomator2
${LOCAL_DEVICE_NAME}     ZY236923PJ
${APP_PACKAGE}           com.app1doc3.app1doc3dev
${APP_ACTIVITY}          com.app1doc3.app1doc3.MainActivity

#*** Browser stack ***
${BROWSERSTACK_URL}    https://equipoqa_RtWBXE:gKapRxsD88zBzdDSJ6Ei@hub-cloud.browserstack.com/wd/hub
${DEVICE_NAME}         Samsung Galaxy S22 Ultra
${APP}                 bs://eb9dec054f8a5f0cc76d54505815104cc26760a7



# Test Variables (Empresa y correo)
${USER1_DETAILS}         chayan@yopmail.com
${USER_NUMBER}           3158776270
${NAME_COMPANY}          Empresa pruebas
${NAME_NOEXIST}          Ram

# Continua Con Empresa Locators
${LOGIN_SUBMIT_CONTINUACONEMPRESA}    //android.widget.Button[@content-desc="Continúa con tu empresa"]
${LOGIN_EMPRESA_FIELD}               //android.widget.EditText
${LOGIN_SUBMIT_BUTTON_CONTINUAR}     //android.widget.Button[@content-desc="Continuar"]
${COMPANY_SELECTOR}                  Empresa pruebas    # accessibility_id para la empresa
${EMAIL_FIELD}                       //android.widget.EditText  # Localizador para el campo de correo
${NUMBER_FIELD}                      //android.widget.EditText
${VERIFICAR_BUTTON_}                 //android.widget.Button[@content-desc="Verificar"]
${ERROR_SELECCIONA_EMPRESA1}         //android.view.View[@content-desc="Selecciona una empresa"]
${ERROR_SELECCIONA_EMPRESA2}         //android.view.View[@content-desc="Para continuar selecciona de la lista el nombre de la empresa a la que perteneces."]
${MSG_VERIFICAR_USUARIO}             //android.view.View[@content-desc="Verifica tu usuario"]
${BOTON_ATRAS}                       //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]
${ERROR_NO_EXISTE_EMPRESA}           //android.view.View[contains(@content-desc, "No encontramos esta empresa.")]
${ERROR_ESCRIBIR_EMPRESA}            //android.view.View[contains(@content-desc,"Escribe el nombre de tu empresa para continuar.")]
${CERRAR_CLOSE}                      //android.view.View[@content-desc="Busca tu empresa"]/android.view.View[1]
${ELEGIR_COMPANY}                    //android.widget.ImageView[@content-desc="Empresa pruebas"] 
${PAGE_VERIFY_USER}                  //android.view.View[contains(@content-desc,"Ahora, ingresa tu correo electrónico y verifícate en Empresa")]
${VERIFY_DATO_EMAIL}                 Ahora, ingresa tu correo electrónico y verifícate en Empresa pruebas.
${INGRESAR_DATO_EMAIL}               //android.view.View[@content-desc="Escribe tu correo electrónico para verificarte."]
${CODE_VERIFICATION_FIELD}           //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.view.View/android.view.View[4]/android.widget.EditText[1]


#Login Locators
${CONTUNIAR_CON_CORREO_BUTTON}       //android.widget.ImageView[@content-desc="Inicia sesión con correo"]
${CONTUNIAR_CON_CELULAR_BUTTON}      //android.widget.ImageView[@content-desc="Inicia sesión con número celular"]

# Main Page Locator (Notificaciones)
${NOTIFICATION_BUTTON}    //android.widget.Button[@resource-id="com.android.permissioncontroller:id/permission_allow_button"]



