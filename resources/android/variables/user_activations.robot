*** Variables ***

# Test Variables (Empresa y correo)
${USER1_DETAILS}         tutaina@yopmail.com
${USER_ONBOARDING}       fa1@yopmail.com
${USER_NUMBER}           3203694134
${NAME_COMPANY}          Empresa pruebas
${NAME_COMPANY_TWO}      Google liz
${NAME_COMPANY_THREE}    mario juego
${NAME_NOEXIST}          Ram



# Continua Con Empresa Locators
${LOGIN_SUBMIT_CONTINUACONEMPRESA}   //android.widget.Button[@content-desc="Continúa con tu empresa"]
${LOGIN_COMPANY_FIELD}               //android.widget.EditText
${LOGIN_SUBMIT_BUTTON_CONTINUAR}     //android.widget.Button[@content-desc="Continuar"]
${COMPANY_SELECTOR}                  //android.widget.EditText[@text="empresa pruebas"]
${COMPANY_SELECTOR_PHONE}            //android.widget.ImageView[@content-desc="Google Liz"]
${COMPANY_SELECTOR_DOCUMENT}         //android.widget.ImageView[@content-desc="mario juego"]
${EMAIL_FIELD}                       //android.widget.EditText  
${NUMBER_FIELD}                      //android.widget.EditText
${DOCUMENT_FIELD}                    //android.widget.EditText
${VERIFY_BUTTON}                     //android.widget.Button[@content-desc="Verificar"]
${ERROR_SELECT_COMPANY1}             //android.view.View[@content-desc="Selecciona una empresa"]
${ERROR_SELECT_COMPANY2}             //android.view.View[@content-desc="Para continuar selecciona de la lista el nombre de la empresa a la que perteneces."]
${MSG_VERIFY_USER}                   //android.view.View[@content-desc="Verifica tu usuario"]
${ERROR_NO_COMPANY_EXISTS}           //android.view.View[contains(@content-desc, "No encontramos esta empresa.")]
${ERROR_WRITING_COMPANY}             //android.view.View[contains(@content-desc,"Escribe el nombre de tu empresa para continuar.")]
${CLOSE}                             //android.view.View[@content-desc="Busca tu empresa"]/android.view.View[1]
${PAGE_VERIFY_USER_EMAIL}            //android.view.View[contains(@content-desc,"Ahora, ingresa tu correo electrónico y verifícate en Empresa")]
${PAGE_VERIFY_USER_PHONE}            //android.view.View[contains(@content-desc,"Ahora, ingresa tu número de celular y verifícate en Google Liz.")]
${PAGE_VERIFY_USER_DOCUMENT}          //android.view.View[contains(@content-desc,"Ahora, ingresa tu número de documento y verifícate en mario juego.")]
${ENTER_EMAIL_DATA}                  //android.view.View[@content-desc="Escribe tu correo electrónico para verificarte."]
${ENTER_PHONE_DATA}                  //android.view.View[@content-desc="Escribe tu número de celular para verificarte."]
${ENTER_DOCUMENT_DATA}               //android.view.View[@content-desc="Escribe tu número de documento para verificarte."]
${CODE_VERIFICATION_FIELD}           //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.view.View[4]
${BTN_CONTACT_SUPPORT}               //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View[1]/android.view.View/android.view.View/android.view.View/android.view.View
${VERIFICATION_FIELD}                //android.widget.EditText


#Login Locators
${CONTINUE_WITH_EMAIL_BUTTON}       //android.widget.ImageView[@content-desc="Inicia sesión con correo"]
${CONTINUE_WITH_MOBILE_BUTTON}      //android.widget.ImageView[@content-desc="Inicia sesión con número celular"]
${BTN_ACCOUNT}                      //android.widget.Button[@content-desc="Ya tengo una cuenta"]
${LOGIN_MOBILE_TEXT_FIELD}          //android.widget.EditText
${BTN_MOBILE_LOGIN}                 //android.widget.Button[@content-desc="Continuar"]
${ERROR_FIELD_NUMBER}               //android.view.View[@content-desc="Escribe tu número celular para continuar."]
${ERROR_BANNER}                     //android.view.View[@content-desc="Verifica que ingresaste un número de celular."]
${ERROR_VERIFY_CODE}                //android.view.View[@content-desc="Escribe el código de verificación para continuar."]
${FORWARD_WPP}                      //android.widget.Button[@content-desc="Recibir un código nuevo por WhatsApp"]
${WPP_BANNER_CODE}                  //android.view.View[@content-desc="Ya te enviamos un nuevo código a tu teléfono."]


# Main Page Locator (Notificaciones)
${NOTIFICATION_BUTTON}    //android.widget.Button[@resource-id="com.android.permissioncontroller:id/permission_allow_button"]



