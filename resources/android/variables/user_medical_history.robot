*** Variables ***

${BUTTON_CONSULTATION}  //android.view.View[contains(@content-desc, "Consulta\nPestaña 3 de 5")]
${BUTTON_CONSULTATIONS}  //android.view.View[contains(@content-desc,"Mis consultas\nPestaña 2 de 2")]
${BUTTON_PROFILE}        //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.widget.ImageView[2]
${OPTION_MY_CONSULTATIONS}  //android.view.View[@content-desc="Mis consultas"]
${BUTTON_HOME}             //android.view.View[contains(@content-desc,"Inicio\nPestaña 1 de 5")]
${TITLE_CONSULTATIONS}   //android.view.View[contains(@content-desc,"Realizadas")]
${FILTER}                //android.view.View[@content-desc="TODAS LAS CONSULTAS"]
${FILTER_MODE}          //android.view.View[@content-desc="Filtrar"]
${BUTTON_CANCEL}        //android.view.View[@content-desc="Cancelar"]
${OPTION_ALL_CONSULTATIONS}  //android.view.View[@content-desc="Todas las consultas"]
${OPTION_FINANCIAL_ASSISTANT}  //android.view.View[@content-desc="ASISTENTE FINANCIERO"]
${OPTION_LEGAL_ASSISTANT}      //android.view.View[@content-desc="ASISTENTE LEGAL"]
${OPTION_GENERAL_MEDICINE}     //android.view.View[@content-desc="MEDICINA GENERAL"]
${OPTION_PEDIATRICS}          //android.view.View[@content-desc="PEDIATRÍA"]
${OPTION_MENTAL_HEALTH}       //android.view.View[@content-desc="SALUD MENTAL"]
${OPTION_SEXUAL_HEALTH}       //android.view.View[@content-desc="SALUD SEXUAL"]
${OPTION_VETERINARY}         //android.view.View[@content-desc="VETERINARIA"]
${FINANCIAL_ASSISTANT}     //android.view.View[@content-desc="Asistente Financiero"]
${LEGAL_ASSISTANT}        //android.view.View[@content-desc="Asistente Legal"]
${GENERAL_MEDICINE}      //android.view.View[@content-desc="Medicina General"]
${PEDIATRICS}           //android.view.View[@content-desc="Pediatría"]
${MENTAL_HEALTH}        //android.view.View[@content-desc="Salud Mental"]
${SEXUAL_HEALTH}        //android.view.View[@content-desc="Salud Sexual"]
${VETERINARY}           //android.view.View[@content-desc="Veterinaria"]
${BACK}                 //android.view.View[@content-desc="Sombreado"]



#Consultations#

${FIRTS_CONSULTATIONS_FINANCIAL}  //android.widget.ImageView[contains(@content-desc,"Asistente Financiero\nIA\nCalificación pendiente\nConsulta para: Kevin Danilo")]
${TITLE_CONSULTATION_FINANCIAL}   //android.view.View[@content-desc="Consulta Financiera"]
${REASON_FOR_CONSULTATIONN_FINANCIAL}          //android.view.View[@content-desc="Julio 18, 2025\nConsulta para: Kevin Danilo\nMotivo de consulta\nPuedes indicarme de inversiones de alto riesgo para jóvenes"]
${CONSULTATION_SUMMARY_FINANCIAL}            //android.view.View[@content-desc="Recuerda usar estas recomendaciones como guía inicial. Verifica siempre la información antes de actuar y consulta a un profesional si es necesario.\n¡Si necesitas más ayuda, estaré aquí para..."]
${CONSULTATION_RATING}              //android.view.View[@content-desc="Califica tu consulta"]
${READ_CHAT}                        //android.view.View[@content-desc="Leer chat"]
${BUTTON_BACK_CONSULTATION}         //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View[1]/android.view.View
${THIRD_CONSULTATION_LEGAL}         //android.widget.ImageView[contains(@content-desc,"Asistente Legal\nIA\nCalificación pendiente\nConsulta para: Sam Camelo")][3]
${TITLE_CONSULTATION_LEGAL}         //android.view.View[@content-desc="Consulta Legal"]
${REASON_FOR_CONSULTATIONN_LEGAL}    //android.view.View[@content-desc="Agosto 1, 2025\nConsulta para: Sam Camelo\nMotivo de consulta\nEstoy en proceso de divorcio y necesito orientación sobre la custodia de mis hijos. ¿Qué derechos y deberes tengo?"]
