*** Variables ***

# Test Variables (Empresa y correo)
${USER1_DETAILS}  tutaina@yopmail.com
${USER1_PHONE}  kmontana@1doc3.com
${USER_ONBOARDING}  fa1@yopmail.com
${USER_NUMBER}  3128167733
${USER_NUMBER_TWO}  3219005389
${NAME_COMPANY}  LKJM
${NAME_COMPANY_TWO}   UAT
${NAME_COMPANY_THREE}   Momo S.A
${NAME_COMPANY_FOUR}  1DOC3 empresa
${NAME_NOEXIST}  Rucardi
${LICENSE_NOT_EXIST}  004@yopmail.com



# Continua Con Empresa Locators
${LOGIN_SUBMIT_CONTINUACONEMPRESA}   accessibility_id=Continúa con tu empresa
${LOGIN_COMPANY_FIELD}               //android.widget.EditText
${LOGIN_SUBMIT_BUTTON_CONTINUAR}     accessibility_id=Continuar
${COMPANY_SELECTOR}                  accessibility_id=LKJM
${COMPANY_SELECTOR_PHONE}            accessibility_id=UAT
${COMPANY_SELECTOR_DOCUMENT}         accessibility_id=Momo S.A
${COMPANY_SELECTOR_EMAIL}            accessibility_id=1DOC3 empresa
${EMAIL_FIELD}                       //android.widget.EditText  
${NUMBER_FIELD}                      //android.widget.EditText
${DOCUMENT_FIELD}                    //android.widget.EditText
${VERIFY_BUTTON}                     //android.widget.Button[@content-desc="Verificar"]
${LOG_IN_BUTTON}                      //android.widget.Button[@content-desc="Iniciar sesión"]
${ERROR_SELECT_COMPANY1}             accessibility_id=Selecciona una empresa
${ERROR_SELECT_COMPANY2}             accessibility_id=Para continuar selecciona de la lista el nombre de la empresa a la que perteneces.
${MSG_VERIFY_USER}                   accessibility_id=Verifica tu usuario
${ERROR_NO_COMPANY_EXISTS}           //android.view.View[contains(@content-desc, "No encontramos esta empresa.")]
${ERROR_WRITING_COMPANY}             //android.view.View[contains(@content-desc,"Escribe el nombre de tu empresa para continuar.")]
${CLOSE}                             //android.view.View[@content-desc="Busca tu empresa"]/android.view.View[1]
${PAGE_VERIFY_USER_EMAIL}            //android.view.View[contains(@content-desc,"Ahora, ingresa tu correo electrónico y verifícate en LKJM")]
${PAGE_VERIFY_USER_PHONE}            //android.view.View[contains(@content-desc,"Ahora, ingresa tu número de celular y verifícate en UAT.")]
${PAGE_VERIFY_USER_DOCUMENT}          //android.view.View[contains(@content-desc,"Ahora, ingresa tu número de documento y verifícate en Momo S.A.")]
${ENTER_EMAIL_DATA}                  accessibility_id=Escribe tu correo electrónico para verificarte.
${ENTER_PHONE_DATA}                  accessibility_id=Escribe tu número de celular para verificarte.
${ENTER_DOCUMENT_DATA}               accessibility_id=Escribe tu número de documento para verificarte.
${CODE_VERIFICATION_FIELD}           //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.view.View[4]
${BTN_CONTACT_SUPPORT}               //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View[1]/android.view.View/android.view.View/android.view.View/android.view.View
${VERIFICATION_FIELD}                //android.widget.EditText
${VERIFY_BUTTON_CONTINUAR}           //android.widget.Button[@content-desc="Continuar"]
${BUTTON_BACK}                       //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]
${PAGE_FOUND_COMPANY}                accessibility_id=Busca tu empresa
${BUTTON_LOGIN}                      accessibility_id=Iniciar sesión
${SUPPORT_MESSAGE}                   accessibility_id=¿Necesitas ayuda? \nContacta a soporte

#Login Locators
${CONTINUE_WITH_EMAIL_BUTTON}       //android.widget.ImageView[@content-desc="Inicia sesión con correo"]
${CONTINUE_WITH_GOOGLE_BUTTON}      //android.widget.ImageView[@content-desc="Inicia sesión con Google"]
${CONTINUE_WITH_MOBILE_BUTTON}      //android.widget.ImageView[@content-desc="Inicia sesión con número celular"]
${BTN_ACCOUNT}                      //android.widget.Button[@content-desc="Ya tengo una cuenta"]
${BTN_GOOGLE_ACCOUNT}               xpath=(//android.widget.LinearLayout[@resource-id="com.google.android.gms:id/container"])[3]
${LOGIN_MOBILE_TEXT_FIELD}          //android.widget.EditText
${LOGIN_GOOGLE_TEXT_FIELD}          //android.widget.EditText
${BTN_MOBILE_LOGIN}                 //android.widget.Button[@content-desc="Continuar"]
${ERROR_FIELD_NUMBER}               //android.view.View[@content-desc="Escribe tu número celular para continuar."]
${ERROR_BANNER}                     //android.view.View[@content-desc="Verifica que ingresaste un número de celular."]
${ERROR_VERIFY_CODE}                //android.view.View[@content-desc="Escribe el código de verificación para continuar."]
${FORWARD_WPP}                      accessibility_id=Recibir un código nuevo por WhatsApp
${WPP_BANNER_CODE}                  accessibility_id=Ya te enviamos un nuevo código a tu teléfono.
${PREFIX_LOCATOR}  xpath=//android.view.View[starts-with(@content-desc, "+")]
${VALOR_ESPERADO}  +57

# Main Page Locator (Notificaciones)
${NOTIFICATION_BUTTON}    //android.widget.Button[@resource-id="com.android.permissioncontroller:id/permission_allow_button"]

#Licenses no exist Locator
${INVALID_DATA_CTA}    //android.widget.Button[@content-desc="Continuar"]
${PHONE_INFO}    //android.widget.EditText
${SEND_CTA}    //android.widget.Button[@content-desc="Enviar"]
${CONFIRMATION_MESSAGE}    //android.view.View[@content-desc="En unos minutos te enviaremos los pasos a seguir a tu WhatsApp."]
${TAP_OUTSIDE}    //android.view.View[@content-desc="Sombreado"]
${PHONE_LICENCES}    //android.view.View[@content-desc="Escribe tu número celular para continuar."]


