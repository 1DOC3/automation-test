*** Variables ***
# Variables Consultations



${SERVICE_LEGAL_GUIDANCE}                  //android.view.View[@content-desc="IA\nAsistente\nLegal"]
${TERMS_AND_CONDITIONS }                  //android.widget.Button[@content-desc="Continuar"]
${TO_CONSULT}                            //android.widget.ImageView[@content-desc="Para mí\nNicolas López"]
${PENAL_CONSULTATION}                   //android.view.View[@content-desc="Penal\nFaltas como robos o agresiones."]
${CIVIL_CONSULTATION}                  //android.view.View[@content-desc="Civil\nContratos o disputas entre personas o empresas."]
${INMOBILIARIA_CONSULTATION}          //android.view.View[@content-desc="Inmobiliaria\nBienes raíces, compraventa o alquileres."]
${FAMILIAR_CONSULTATION}             //android.view.View[@content-desc="Familiar\nDivorcio, custodia de hijos, adopción o pensión alimenticia."]
${ADMINISTRATIVA_CONSULTATION}      //android.view.View[@content-desc="Administrativa\nTrámites entre entidades gubernamentales, licencias o administración pública."]
${OTRAS_CONSULTATION}              //android.view.View[@content-desc="Otra\nSelecciona esta opción, si tu consulta no se ajusta a ninguna de las áreas anteriores."]


${INPUT_DETAIL}                     //android.widget.EditText
${DETAIL_CONSULTATION}             ¿Puedes explicar brevemente en qué casos una conducta se considera delito penal y qué vías existen para que una persona recupere legalmente activos obtenidos ilícitamente?, mira el archivo adjunto 
${ATTACH_IMAGE}                   //android.view.View[@content-desc="Adjuntar"]
${ADD_GALLERY}                   //android.view.View[@content-desc="Galería"]
${IMAGE_PC_PATH}                C:/Users/Daza/OneDrive/1DOC3/automation-test/legal_images/default.png
${IMAGE_DEVICE_PATH}           //sdcard/Download/legal_upload.png
${IMAGES_1}                   //androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View[5]/android.view.View[2]/android.view.View[2]/android.view.View
${IMAGES_2}                  //androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View[5]/android.view.View[5]/android.view.View[2]/android.view.View
${IMAGES_3}                 //androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View[5]/android.view.View[3]/android.view.View[2]/android.view.View
${IMAGES_4}                //androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View[5]/android.view.View[6]/android.view.View[2]/android.view.View
${IMAGES_5}               //androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View[5]/android.view.View[4]/android.view.View[2]/android.view.View
${IMAGES_6}              //androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View[5]/android.view.View[2]/android.view.View[2]/android.view.View


${CONTINUE_BUTTON}             //android.widget.Button[@content-desc="Continuar"]
${START_CHAT}                 //android.widget.Button[@content-desc="Iniciar chat"]
${INPUT_DETAIL_2}            //android.widget.EditText
${DETAIL_CONSULTATION_2}    eso es todo, gracias 
${SEND_BUTTON}            //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[7]
${THREE_POINTS}          //android.widget.Button
${THREE_POINTS_2}       //androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View[4]/android.widget.Button
${BROUSE_SEND}         //android.widget.ScrollView/android.view.View[1]


${SELECTOR_CLICK}     //android.widget.FrameLayout[@content-desc="Preview the file foto_prueba.png"]/android.widget.ImageView
${SEND_BUTTON_2}     //android.widget.ImageButton[@content-desc="Navigate up"]
${CLICK_IMAGE}      //android.widget.ImageView[@resource-id="com.google.android.documentsui:id/icon_thumb"]
${THREE_LINES}     //android.widget.ImageButton[@content-desc="Show roots"]
${DOWNLOADS}      //android.widget.ListView[@resource-id="com.google.android.documentsui:id/roots_list"]/android.widget.LinearLayout[2]


${FINISH}               //android.widget.Button[@content-desc="Finalizar"]
${FINISH2}             //android.view.View[@content-desc="Finalizar"]
${WOULD_HAVE_DONE}    //android.view.View[@content-desc="Consultar en internet"]
${WOULD_HAVE_DONE2}      //android.view.View[@content-desc="Preguntar a un amigo"]
${WOULD_HAVE_DONE3}     //android.view.View[@content-desc="Contratar un profesional"]
${WOULD_HAVE_DONE4}    //android.view.View[@content-desc="Quedarme con la duda"]
${CTA_CLOSE}          //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View[1]/android.view.View


&{CONSULTATION_DETAILS1}    
...    ${PENAL_CONSULTATION}=${PENAL_DETAIL_1}
...    ${CIVIL_CONSULTATION}=${CIVIL_DETAIL_1}
...    ${INMOBILIARIA_CONSULTATION}=${INMOBILIARIA_DETAIL_1}
...    ${FAMILIAR_CONSULTATION}=${FAMILIAR_DETAIL_1}
...    ${ADMINISTRATIVA_CONSULTATION}=${ADMINISTRATIVA_DETAIL_1}
...    ${OTRAS_CONSULTATION}=${OTRAS_DETAIL_1}


${PENAL_DETAIL_1}           Necesito ayuda con una denuncia penal reciente.
${CIVIL_DETAIL_1}           Tengo un conflicto contractual con una empresa.
${INMOBILIARIA_DETAIL_1}    Quiero consultar sobre un contrato de arrendamiento.
${FAMILIAR_DETAIL_1}        Necesito orientación sobre un proceso de divorcio.
${ADMINISTRATIVA_DETAIL_1}  Tengo dudas sobre un trámite con la alcaldía.
${OTRAS_DETAIL_1}           Mi consulta no encaja en ninguna categoría anterior.


&{CONSULTATION_DETAILS2}    
...    ${PENAL_CONSULTATION}=${PENAL_DETAIL_2}
...    ${CIVIL_CONSULTATION}=${CIVIL_DETAIL_2}
...    ${INMOBILIARIA_CONSULTATION}=${INMOBILIARIA_DETAIL_2}
...    ${FAMILIAR_CONSULTATION}=${FAMILIAR_DETAIL_2}
...    ${ADMINISTRATIVA_CONSULTATION}=${ADMINISTRATIVA_DETAIL_2}
...    ${OTRAS_CONSULTATION}=${OTRAS_DETAIL_2}


${PENAL_DETAIL_2}           ¿Puedes explicar brevemente en qué casos una conducta se considera delito penal y qué vías existen para que una persona recupere legalmente activos obtenidos ilícitamente?
${CIVIL_DETAIL_2}           ¿Cómo interpretaría un incumplimiento contractual y cómo debería calcularse una indemnización por daños y perjuicios en un contrato de compraventa entre personas físicas?
${INMOBILIARIA_DETAIL_2}    ¿Puedes detallar los pasos principales para reclamar el cumplimiento de un contrato de arrendamiento e indicar posibles sanciones por incumplimiento del propietario o del inquilino?
${FAMILIAR_DETAIL_2}        ¿Qué criterios claves utiliza el sistema judicial para asignar la custodia de menores en un proceso de divorcio y cómo afecta esto a la pensión alimenticia?
${ADMINISTRATIVA_DETAIL_2}  ¿Podrías explicar los plazos y recurso correspondiente para impugnar una sanción administrativa impuesta por una entidad gubernamental?
${OTRAS_DETAIL_2}           ¿Podrías indicarme cuál área del derecho podría corresponder (como laboral, tributario, ambiental, propiedad intelectual, sucesiones u otra) y qué información adicional necesitarías que yo te proporcione para ayudarte de forma más precisa?”

&{CONSULTATION_DETAILS3}    
...    ${PENAL_CONSULTATION}=${PENAL_DETAIL_3}
...    ${CIVIL_CONSULTATION}=${CIVIL_DETAIL_3}
...    ${INMOBILIARIA_CONSULTATION}=${INMOBILIARIA_DETAIL_3}
...    ${FAMILIAR_CONSULTATION}=${FAMILIAR_DETAIL_3}
...    ${ADMINISTRATIVA_CONSULTATION}=${ADMINISTRATIVA_DETAIL_3}
...    ${OTRAS_CONSULTATION}=${OTRAS_DETAIL_3}


${PENAL_DETAIL_3}           Si robo mi propia bicicleta, ¿puedo demandarme a mí mismo? Mira el documento que te voy a adjuntar.
${CIVIL_DETAIL_3}           ¿Es legal casarse con una empanada si hay amor verdadero?
${INMOBILIARIA_DETAIL_3}    ¿Puedo declarar mi nevera como arrendataria para pagar menos arriendo?
${FAMILIAR_DETAIL_3}        ¿Los duendes cuentan como parte del núcleo familiar? Mira el documento que te voy a adjuntar.
${ADMINISTRATIVA_DETAIL_3}  ¿La alcaldía me puede multar por tener un gato que maúlla en alemán?
${OTRAS_DETAIL_3}           ¿Dónde se registra oficialmente una pelea de almohadas? Mira el documento que te voy a adjuntar.


