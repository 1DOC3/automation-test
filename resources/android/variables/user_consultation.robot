*** Variables ***
# Variables Consultations

${START_X}   500
${START_Y}   1000   
${END_X}     500
${END_Y}     500    
${DURATION}  1000   
${TIMEOUT}   3

${ADDITIONAL_START_X}    500
${ADDITIONAL_START_Y}    800
${ADDITIONAL_END_X}      500
${ADDITIONAL_END_Y}      300
${ADDITIONAL_DURATION}   500

${ALLOW_PERMISSION1}                //android.widget.Button[@resource-id="com.android.permissioncontroller:id/permission_allow_button"]
${ALLOW_PERMISSION2}                //android.widget.Button[@resource-id="com.android.permissioncontroller:id/permission_allow_button"]
${DENY_BUTTON}                      //android.widget.Button[@resource-id="com.android.permissioncontroller:id/permission_deny_button"]
${MEDICINA_BUTTON}                  //android.widget.ImageView[@content-desc="Medicina"]
${FOR_ME_BUTTON}                    //android.widget.ImageView[contains(@content-desc, "Para mí")]
${EMAIL_FIELD_MEDICINE}             //android.widget.EditText
${DESCRIPTION_MEDICINE}    Actualmente sufro de migrañas, me duele la cabeza 3 o 4 veces por semana.
${CONTINUAR_BUTTON}                 //android.widget.Button[@content-desc="Continuar"]
${DOCUMENTS_MEDICINE}               //android.view.View[@content-desc=" Adjunta imágenes o documentos "]
${CTA_ADD_DOCUMENTS}    //android.view.View[@content-desc="Adjuntar"]
${ADD_DOCUMENT}                     //android.view.View[@content-desc="Documento"]
${ADD_IMAGE_CAMARA}                 //android.view.View[@content-desc="Cámara"]
${ADD_IMAGE_GALERY}                 //android.view.View[@content-desc="Galería"]
${FILE_DOCUMENT}                    //android.widget.TextView[@resource-id="android:id/title"]
${CAPTURE_FOTO}                     //android.widget.ImageView[@content-desc="Shutter"]
${CAPTURE_FOTO_DONE}                //android.widget.ImageButton[@content-desc="Done"]
${ADD_IMAGE_GALERY_DONE}            (//android.widget.ImageView[@resource-id="com.google.android.providers.media.module:id/icon_thumbnail"])[2]
${START_CONSULT_MEDICINE}           //android.widget.Button[@content-desc="Iniciar chat"]
${WHATCH_PERFIL}                    //android.view.View[@content-desc="Ver perfil"]
${CLOSE_MODAL_CONSULT}              //android.view.View[@content-desc="Sombreado"]
${OPTIONS_CONSULT}                  //android.widget.Button
${FINISH_CONSULT}                   //android.widget.Button[@content-desc="Finalizar"]
${FINISH_CONSULT_CONFIRM}           //android.view.View[@content-desc="Finalizar"]
${MODAL_QUEREMOS_TU_OPINION}        //android.view.View[@content-desc="Ir a una farmacia"]
${TERMS_AND_CONDITIONS}    //android.view.View[@content-desc="Hemos actualizado nuestros Términos y Condiciones y Políticas de privacidad, te invitamos a leerlos para hacer uso de los servicios de 1DOC3."]
${CTA_TERMS_CONDITIONS}    //android.widget.Button[@content-desc="Continuar"]
${ALARMS & REMINDERS}  //android.widget.ScrollView/android.view.View[2]/android.view.View
${ATRAS}  //android.widget.Button
${INFORMED_CONSENT}    //android.view.View[@content-desc="Consentimiento para atención por teleorientación y telemedicina en 1DOC3"]
${CTA_INFORMED_CONSENT}    //android.widget.Button[@content-desc="Continuar"]
${MODAL_LOCATION}     //android.widget.Button[@content-desc="Continuar"]
