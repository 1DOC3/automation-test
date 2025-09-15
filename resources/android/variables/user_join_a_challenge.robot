*** Variables ***
# Variables Consultations



${JOIN_CHALLENGE}     //android.view.View[@content-desc="BIENESTAR\n¡Únete a un reto!"]
${SEE_MORE}          //android.view.View[@content-desc="VER MÁS"]
${RANKING}          //android.view.View[@content-desc="Ranking\nPestaña 2 de 3"]
${BADGES}          //android.view.View[@content-desc="Insignias\nPestaña 3 de 3"]
${JOIN_THE_CHALLENGE}    //android.widget.Button[@content-desc="Unirme al reto"]
${SEND_BUTTON}          //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View[1]
${ALARMS & REMINDERS}  //android.widget.ScrollView/android.view.View[2]/android.view.View
${ATRAS}              //android.widget.Button

${INSIGNIA}              //android.widget.ImageView[contains(@content-desc,"Únete")]
${BADGES_ONE}           //android.widget.ImageView[@content-desc="Únete al movimiento"]
${AWARDED_BADGES}      //android.view.View[@content-desc="Ganadas\nCada vez que alcances un objetivo, recibirás una insignia que encontrarás acá."]
${DISPONIBLES}        //android.view.View[@content-desc="Disponibles"]
${OUTPUT_FILE}        ${EXECDIR}/insignias_ganadas.csv

${CHALLENGE_ONE}        //android.widget.ImageView[contains(@content-desc,"Reto recomendado")]
${CHALLENGE_TWO}       //android.widget.ImageView[@content-desc="Agosto en movimiento\nReto recomendado"]
${CHALLENGE_THREE}    //android.widget.ImageView[@content-desc="¡A volar cometa!\nReto recomendado"]
${CHALLENGE_FOUR}    //android.widget.ImageView[@content-desc="Desafío épico\nReto recomendado"]
${CHALLENGE_FIVE}     //android.widget.ImageView[@content-desc="40mil pasos: Subiendo de nivel\nReto recomendado"]
${CHALLENGE_CARD}    //android.widget.ImageView[contains(@content-desc,"Reto recomendado")]

# sincronizacion 

${PODOMETRO}            //android.widget.ImageView[@content-desc="Usaré mi celular\nLlévalo contigo y contará tus pasos automáticamente."]
${GOOGLE_FIT}          //android.widget.ImageView[@content-desc="Google Fit"]
${SAMSUNG_HEALTH}     //android.widget.ImageView[@content-desc="Samsung Health"]
${GARMIN_CONNECT}    //android.widget.ImageView[@content-desc="Garmin Connect"]
${YES_CHANGE}       //android.widget.Button[@content-desc="Sí"]
${NO_CHANGE}       //android.widget.Button[@content-desc="No"]
${CONNECT_ACTIVITY}    //android.widget.Button[@content-desc="Conectar mi actividad"]
${CORREO_1}           //android.widget.LinearLayout[@resource-id="com.google.android.gms:id/container"] [1]/android.widget.LinearLayout
${SELECT_ALL}        //android.widget.CheckBox[@text="Select all"]
${CONTINUE_BUTTON}    //android.widget.Button[@text="Continue"]
${SEND_BUTTON_2}     //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View[1]

# play store 

${INPUT_DETAIL}     //android.widget.EditText[@resource-id="identifierId"]
${DETAIL_MAIL}     qatecnologiaqa@gmail.com
${NEXT}           //android.widget.Button[@text="NEXT"]
${INPUT_DETAIL_2}     //android.widget.EditText
${DETAIL_PASSWORD}   Triangulo9
${YES_I’M_IN}       //android.widget.Button[@text="Yes, I’m in"]
${I_AGREE}         //android.widget.Button[@text="I agree"]
${MORE}           //android.widget.Button[@text="MORE"]
${ACCEPT}        //android.widget.Button[@text="ACCEPT"]
