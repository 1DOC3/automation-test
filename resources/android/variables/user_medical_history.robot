*** Variables ***

${BUTTON_CONSULTATION}  accessibility_id=Consulta\nPestaña 3 de 5
${BUTTON_CONSULTATIONS}  accessibility_id=Mis consultas\nPestaña 2 de 2
${BUTTON_PROFILE}        //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.widget.ImageView[2]
${OPTION_MY_CONSULTATIONS}  accessibility_id=Mis consultas
${BUTTON_HOME}             accessibility_id=Inicio\nPestaña 1 de 5
${TITLE_CONSULTATIONS}   accessibility_id=Realizadas
${FILTER}                accessibility_id=TODAS LAS CONSULTAS
${FILTER_MODE}          accessibility_id=Filtrar
${BUTTON_CANCEL}        accessibility_id=Cancelar
${OPTION_ALL_CONSULTATIONS}  accessibility_id=Todas las consultas
${OPTION_FINANCIAL_ASSISTANT}  accessibility_id=ASISTENTE FINANCIERO
${OPTION_LEGAL_ASSISTANT}      accessibility_id=ASISTENTE LEGAL
${OPTION_GENERAL_MEDICINE}     accessibility_id=MEDICINA GENERAL
${OPTION_PEDIATRICS}           accessibility_id=PEDIATRÍA
${OPTION_MENTAL_HEALTH}       accessibility_id=SALUD MENTAL
${OPTION_SEXUAL_HEALTH}       accessibility_id=SALUD SEXUAL
${OPTION_VETERINARY}         accessibility_id=VETERINARIA
${FINANCIAL_ASSISTANT}     accessibility_id=Asistente Financiero
${LEGAL_ASSISTANT}        accessibility_id=Asistente Legal
${GENERAL_MEDICINE}      accessibility_id=Medicina General
${PEDIATRICS}           accessibility_id=Pediatría
${MENTAL_HEALTH}        accessibility_id=Salud Mental
${SEXUAL_HEALTH}        accessibility_id=Salud Sexual
${VETERINARY}           accessibility_id=Veterinaria
${BACK}                 accessibility_id=Sombreado



#Consultations#

${FIRTS_CONSULTATIONS_FINANCIAL}  //android.widget.ImageView[contains(@content-desc,"Asistente Financiero\nIA\nCalificación pendiente\nConsulta para: Kevin Danilo")]
${TITLE_CONSULTATION_FINANCIAL}   accessibility_id=Consulta Financiera
${REASON_FOR_CONSULTATIONN_FINANCIAL}  xpath=//android.view.View[contains(@content-desc, "Kevin Danilo")]
${CONSULTATION_SUMMARY_FINANCIAL}            //android.view.View[contains(@content-desc,"Recuerda usar estas recomendaciones como guía inicial.")]
${CONSULTATION_RATING}              accessibility_id=Califica tu consulta
${READ_CHAT}                        accessibility_id=Leer chat
${BUTTON_BACK_CONSULTATION}         //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View[1]/android.view.View
${THIRD_CONSULTATION_LEGAL}         //android.widget.ImageView[contains(@content-desc,"Asistente Legal\nIA\nCalificación pendiente\nConsulta para: Sam Camelo")][3]
${TITLE_CONSULTATION_LEGAL}         accessibility_id=Consulta Legal
${REASON_FOR_CONSULTATIONN_LEGAL}    //android.view.View[contains(@content-desc,"Agosto 1, 2025")]
${EMPTY_STATE}                       //android.widget.ImageView[contains(@content-desc,"No has realizado\nConsultas de salud\nPuedes consultar sobre cualquier tema de salud para ti, tu familia o mascotas.")]