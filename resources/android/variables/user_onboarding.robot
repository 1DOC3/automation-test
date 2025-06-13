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
${ERROR_AGE_USER}                 Nuestro servicio solo cubre a personas entre 18 y 120 años.


#Page 2 objetives

${OBJECTIVE_1}        Manejar mis emociones
${OBJECTIVE_2}        Desarrollar buenos hábitos
${OBJECTIVE_3}        Aumentar mi actividad física
${OBJECTIVE_4}        Reducir el estrés
${OBJECTIVE_5}        Lograr un peso saludable
${OBJECTIVE_6}        Prevenir enfermedades
${OBJECTIVE_7}        Otro


# Permission

${MESSAGE_ALLOW_NOTIFICATIONS}      com.android.permissioncontroller:id/grant_dialog
${BTN_ALLOW}                        com.android.permissioncontroller:id/permission_allow_button
${BTN_DENY}                         com.android.permissioncontroller:id/permission_deny_button


# Programs 
${FIND_CALM}                  Programa recomendado\nEncuentra la calma\n7 min al día
${STRESS_MANAGEMENT}          Programa recomendado\nGestión del estrés desde el interior\n5 min al día
${HEALTHY_RELATIONSHIPS}      Programa recomendado\nRelaciones saludables\n5 min al día
${START_THE_CHANGE}           Programa recomendado\ininicia el cambio\n10 min al día
${RELATIONSHIP_WITH_FOOD}     Programa recomendado\nMejora tu relación con la comida\n5 min al día
${HOME_TRAINING}              Programa recomendado\nEntrenamiento en casa\n20 min al día
${TAKE_CONTROL}               Programa recomendado\nToma el control de tus pensamientos\n5 min al día