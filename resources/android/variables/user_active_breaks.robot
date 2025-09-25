*** Variables ***

${Active_banner}  //android.view.View[@content-desc="Pausa activa\nDale un respiro a tu cuerpo y a tu mente. ¡Nosotros te guiamos!"]
${Button_start_break}  //android.widget.Button[@content-desc="Comenzar pausa"]
${Title_break}  //android.view.View[@content-desc="¿Qué te gustaría hacer?"]
${Boddy_break}  //android.view.View[@content-desc="Piensa en cómo te sientes… eso te ayudará a elegir la mejor pausa para ti."]
${First_option}  //android.widget.ImageView[@content-desc="Mover y estirar el cuerpo\nActiva tu cuerpo y libera tensiones con movimientos suaves."]
${Second_option}  //android.widget.ImageView[@content-desc="Respirar y relajarte\nEncuentra la calma con ejercicios de respiración y reflexión."]
${Third_option}  //android.widget.ImageView[@content-desc="Jugar y activar la atención\nEntrena tu mente y mejora el enfoque con juegos divertidos."]
${Title_recomendations}  //android.view.View[@content-desc="Nuestros recomendados"]
${Description_activities}  //android.view.View[@content-desc="Elige un ejercicio para comenzar tu pausa activa."]
${close_view}  //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View[1]/android.view.View[1]
${Back_view}  //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View/android.view.View
${Activity_complete}    //android.widget.ImageView[contains(@content-desc,"¡Ejercicio hecho!")]
${Button_is_okay}  //android.view.View[@content-desc="¡Estuvo bien por ahora!"]
${Modal_congratulations}  //android.widget.ImageView[@content-desc="¡Genial!\nCompletaste esta pausa activa\nRecuerda que puedes hacerla nuevamente en otro momento del día si lo consideras necesario."]
${Close_modal}  //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View[1]/android.view.View[1]

#Don't lose your streak
${Title_not_lose_streak}  //android.view.View[@content-desc="¡No pierdas tu racha!"]
${Description}  //android.view.View[@content-desc="Elige una hora para que te recordemos hacer tu pausa activa y mantener tu racha y el equilibrio en tu día."]
${Button_Confirm}  //android.view.View[@content-desc="Confirmar horario"]
${Button_not_remember}  //android.view.View[@content-desc="No quiero que me recuerden"]


# Title and content of first option
${Content_first}  //android.view.View[@content-desc="Mover y estirar el cuerpo"]
${Description_first_option}  //android.view.View[@content-desc="Activa tu cuerpo y libera tensiones con movimientos suaves."]

# Title and content of second option

${Content_second}  //android.view.View[@content-desc="Respirar y relajarte"]
${Description_second_option}  //android.view.View[@content-desc="Encuentra la calma con ejercicios de respiración y reflexión."]

# Title and content of third option

${Content_third}  //android.view.View[@content-desc="Jugar y activar la atención"]
${Description_third_option}  //android.view.View[@content-desc="Entrena tu mente y mejora el enfoque con juegos divertidos."]

# without taking active breaks for 3 days
${Banner_not_active_break}  //android.widget.ImageView[contains(@content-desc,"Llevas varios días sin hacer una pausa. ¡Recarga baterías!")]