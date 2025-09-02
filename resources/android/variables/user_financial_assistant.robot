*** Variables ***
# Variables Consultations


${RUTA_IMAGEN_PC}         C:/Users/Daza/Documents/fotos de pruebas/Foto_financiera.png
${RUTA_IMAGEN_ANDROID}    /sdcard/Download/Foto_financiera.png


${LEGAL_ASSISTANT_SERVICE}      //android.view.View[@content-desc="IA\nAsistente\nFinanciero"]
${TERMS_AND_CONDITIONS }       //android.widget.Button[@content-desc="Continuar"]
${TO_CONSULT}                 //android.widget.ImageView[contains(@content-desc,"Para mí")]
${AHORRO_CONSULTATION}       //android.view.View[@content-desc="Ahorro\nOrientación para ahorrar y planificar tus metas."]
${DEUDAS_CONSULTATION}      //android.view.View[@content-desc="Manejo de deudas\nAprende a gestionar tus deudas de manera efectiva."]
${FINANZAS_CONSULTATION}            //android.view.View[@content-desc="Finanzas personales y familiares\nMejora la administración del dinero en el hogar y la vida diaria."]
${PRESUPUESTO_CONSULTATION}        //android.view.View[@content-desc="Crea un presupuesto\nDiseña un presupuesto para gestionar tus ingresos y gastos."]
${CRISIS_CONSULTATION}            //android.view.View[@content-desc="Crisis financieras\nConoce estrategias para enfrentar situaciones económicas difíciles."]
${OBLIGACIONES_CONSULTATION}     //android.view.View[@content-desc="Obligaciones fiscales\nCumple con tus responsabilidades fiscales y aprovechar beneficios legales."]
${OTRAS_CONSULTATION}           //android.view.View[@content-desc="Otra\nSelecciona esta opción, si tu consulta no se ajusta a ninguna de las áreas anteriores."]

${INPUT_DETAIL}             //android.widget.EditText
${CONTINUE_BUTTON}         //android.widget.Button[@content-desc="Continuar"]
${DETAIL_CONSULTATION}    Si recibo un bono inesperado de $3.000 dolares, ¿cómo debería distribuirlo entre ahorro, inversión y gasto?, mira el archivo adjunto
${ATTACH_IMAGE}          //android.view.View[@content-desc="Adjuntar"]
${ADD_GALLERY}          //android.view.View[@content-desc="Galería"]
${IMAGES_1}            //androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View[5]/android.view.View[2]/android.view.View[2]/android.view.View
${START_CHAT}                 //android.widget.Button[@content-desc="Iniciar chat"]
${INPUT_DETAIL_2}            //android.widget.EditText
${DETAIL_CONSULTATION_2}    Creo que eso es todo por ahora. ¡Gracias por tu ayuda!
${DETAIL_CONSULTATION_3}    Por mi parte no tengo más dudas. Que tengas un buen día.
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
...    ${AHORRO_CONSULTATION}=${AHORRO_DETAIL_1}
...    ${DEUDAS_CONSULTATION}=${DEUDAS_DETAIL_1}
...    ${FINANZAS_CONSULTATION}=${FINANZAS_DETAIL_1}
...    ${PRESUPUESTO_CONSULTATION}=${PRESUPUESTO_DETAIL_1}
...    ${CRISIS_CONSULTATION}=${CRISIS_DETAIL_1}
...    ${OBLIGACIONES_CONSULTATION}=${OBLIGACIONES_DETAIL_1}
...    ${OTRAS_CONSULTATION}=${OTRAS_DETAIL_1}

${AHORRO_DETAIL_1}          Si ahorro $200 dolares al mes con una tasa de interés compuesta anual del 5%, ¿cuánto tendría en 5 años?
${DEUDAS_DETAIL_1}          Tengo una tarjeta con deuda de $5.000 dolares al 28% anual y otra de $3.000 al 18%. ¿Cuál pago primero y por qué?
${FINANZAS_DETAIL_1}        Mi pareja y yo ganamos juntos $4.000 dolares al mes. ¿Qué porcentaje deberíamos destinar a vivienda, transporte y alimentación?
${PRESUPUESTO_DETAIL_1}     ¿Qué es la regla 50/30/20 y cómo la aplico si tengo ingresos variables?
${CRISIS_DETAIL_1}          ¿Es prudente usar una tarjeta de crédito como “respaldo” en una crisis?
${OBLIGACIONES_DETAIL_1}    Si trabajo como independiente, ¿qué gastos puedo deducir legalmente?
${OTRAS_DETAIL_1}           ¿Cuál es la mejor receta para hacer una pizza casera?

&{CONSULTATION_DETAILS2}    
...    ${AHORRO_CONSULTATION}=${AHORRO_DETAIL_2}
...    ${DEUDAS_CONSULTATION}=${DEUDAS_DETAIL_2}
...    ${FINANZAS_CONSULTATION}=${FINANZAS_DETAIL_2}
...    ${PRESUPUESTO_CONSULTATION}=${PRESUPUESTO_DETAIL_2}
...    ${CRISIS_CONSULTATION}=${CRISIS_DETAIL_2}
...    ${OBLIGACIONES_CONSULTATION}=${OBLIGACIONES_DETAIL_2}
...    ${OTRAS_CONSULTATION}=${OTRAS_DETAIL_2}

${AHORRO_DETAIL_2}           Si recibo un bono inesperado de $3.000 dolares, ¿cómo debería distribuirlo entre ahorro, inversión y gasto?    
${DEUDAS_DETAIL_2}           ¿Qué es el método “bola de nieve” y el “avalancha” para pagar deudas?  
${FINANZAS_DETAIL_2}         Si uno de los miembros de la familia pierde el empleo, ¿qué ajustes inmediatos habría que hacer en el presupuesto?
${PRESUPUESTO_DETAIL_2}      Tengo gastos fijos de $1.500 y gasto en ocio $400. Si gano $2.200, ¿cómo puedo ajustar para ahorrar al menos el 10%?
${CRISIS_DETAIL_2}           Si me quedo sin empleo y solo tengo ahorros para 3 meses, ¿cuáles gastos debería recortar primero?
${OBLIGACIONES_DETAIL_2}     ¿Cuál es la diferencia entre evasión y elusión fiscal?
${OTRAS_DETAIL_2}            ¿Qué técnicas sirven para recordar nombres con más facilidad?