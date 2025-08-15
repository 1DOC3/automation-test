*** Variables ***
# Page 1 personal data

${COPY_TITLE}              //android.view.View[@content-desc="Confirma tus datos"]
${FIELD_NAME}               //android.view.View[@content-desc="Nombre"]
${FIELD_LAST_NAME}          //android.view.View[@content-desc="Apellido"]
${FIELD_GENDER}             xpath= (//android.view.View[@content-desc="Selecciona"])[1] 
${FIELD_DATE_OF_BIRTH}      xpath= (//android.view.View[@content-desc="Selecciona" and @index="5"])  
${COPY_INFORMATION}         //android.view.View[@content-desc="Utilizamos esta información para personalizar tu experiencia y hacerte recomendaciones."]
${INPUT_NAME}               //android.view.View[@content-desc="Nombre"]/android.widget.EditText
${INPUT_LAST_NAME}          //android.view.View[@content-desc="Apellido"]/android.widget.EditText
${BTN_CONTINUE}             //android.widget.Button[@content-desc="Continuar"]
${WOMEN_OPTION}             //android.widget.ImageView[@content-desc="Mujer"]
${MEN_OPTION}               //android.widget.ImageView[@content-desc="Hombre"]
${UNDETERMINED OPTION}      //android.widget.ImageView[@content-desc="Indefinido"]
${BTN_SAVED}                //android.widget.Button[@content-desc="Guardar"]
${COPY_INFORMATION_DATE_OF_BIRTH}   //android.view.View[contains(@content-desc, "Fecha de nacimiento Debes ser mayor de 18 años para continuar")]
${ERROR_AGE_USER}                  //android.view.View[contains(@content-desc, "Nuestro servicio solo cubre a personas entre 18 y 120 años.")]


# Date 
@{MESES_ORDENADOS}    enero    febrero    marzo    abril    mayo    junio    julio    agosto    septiembre    octubre    noviembre    diciembre

${LOCATOR_DIA}    xpath=(//android.widget.SeekBar)[1]
${LOCATOR_MES}    xpath=(//android.widget.SeekBar)[2]
${LOCATOR_ANIO}    xpath=(//android.widget.SeekBar)[3]

#Page 2 objetives

${OBJECTIVE_1}        //android.widget.ImageView[@content-desc="Manejar mis emociones"]
${OBJECTIVE_2}        //android.widget.ImageView[@content-desc="Desarrollar buenos hábitos"]
${OBJECTIVE_3}        //android.widget.ImageView[@content-desc="Aumentar mi actividad física"]
${OBJECTIVE_4}        //android.widget.ImageView[@content-desc="Reducir el estrés"]
${OBJECTIVE_5}        //android.widget.ImageView[@content-desc="Lograr un peso saludable"]
${OBJECTIVE_6}        //android.widget.ImageView[@content-desc="Prevenir enfermedades"]
${OBJECTIVE_7}        //android.widget.ImageView[@content-desc="Otro"]


# Page 3 notifications

${COPY_TITLE_NOTIFICATIONS}           //android.view.View[@content-desc="¡No te pierdas nada de 1DOC3!"]
${COPY_DESCRIPTION_NOTIFICATIONS}     //android.view.View[contains(@content-desc, "Activa las notificaciones para estar al tanto de tus consultas")]
${BTN_ENABLE_NOTIFICATIONS}           //android.view.View[@content-desc="Activar notificaciones"]
${BTN_SKIP_NOTIFICATIONS}            //android.view.View[@content-desc="No por ahora"]

# Page 4 daily steps goal

${COPY_TITLE_DAILY_STEPS}             //android.view.View[@content-desc="Objetivo de pasos diarios"]
${LOCATOR_PASO}                       xpath=//android.widget.ScrollView
${STEPS_7000}                         //android.view.View[@content-desc="7.000"]
${BTN_CONTINUAR_PASOS}    //android.view.View[@content-desc="Continuar"]



# Page 5 synchronize

${BTN_GOOGLE_FIT}    //android.widget.ImageView[contains(@content-desc,"Google Fit")]



# Programs 
${FIND_CALM}                  Programa recomendado\nEncuentra la calma\n7 min al día
${STRESS_MANAGEMENT}          Programa recomendado\nGestión del estrés desde el interior\n5 min al día
${HEALTHY_RELATIONSHIPS}      Programa recomendado\nRelaciones saludables\n5 min al día
${START_THE_CHANGE}           Programa recomendado\ininicia el cambio\n10 min al día
${RELATIONSHIP_WITH_FOOD}     Programa recomendado\nMejora tu relación con la comida\n5 min al día
${HOME_TRAINING}              Programa recomendado\nEntrenamiento en casa\n20 min al día
${TAKE_CONTROL}               Programa recomendado\nToma el control de tus pensamientos\n5 min al día


#Profile
${BTN_PROFILE}  //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.widget.ImageView/android.widget.ImageView[2]
${BTN_SACCOUNT}  //android.widget.Button[@content-desc="Ver cuenta"]
${BTN_DELETE}  xpath=(//android.view.View[contains(@content-desc, 'Eliminar cuenta')])[last()]
${MESSAGE_DELETE}  //android.view.View[contains(@content-desc,"¿Realmente deseas eliminar tu cuenta? Recuerda que tus datos serán borrados, junto con las preguntas y respuestas")]
${BTN_YES}  //android.widget.Button[@content-desc="Si"]
${BTN_NO}   //android.widget.Button[@content-desc="No"]





#Alarms and reminders

${MESSAGE_ALLOW_SETTING}  //android.widget.TextView[@text="Allow setting alarms and reminders"]
${BTN_ALLOW_SETTING}  //android.widget.ScrollView/android.view.View[2]/android.view.View