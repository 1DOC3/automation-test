*** Variables ***

#Join to webinar

${BUTTON_JOIN}  //android.view.View[@content-desc="Inscribirme"]
${MODAL_JOIN}  //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View[2]
${ADD_DATE_CALENDAR}  //android.view.View[@content-desc="Agrega esta charla a tu calendario"]
${BODY_DATE_CALENDAR}  //android.view.View[@content-desc="Recuerda estar atento a las notificaciones y conéctate en la fecha y hora indicada."]
${BTN_CALENDAR}  //android.widget.ImageView[@content-desc="Agregar a Calendario"]
${CLOSE}  //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View
${REGISTERED}  //android.widget.ImageView[contains(@content-desc, "Ya estás inscrito")]
${LIVE}  //android.view.View[contains(@content-desc,"EN VIVO")]
${NO_LIVE}  //android.view.View[contains(@content-desc,"ÚLTIMA CHARLA")]
${JOIN_OR_REGISTERED}    xpath=(//android.widget.Button[@content-desc="Unirse"] | //android.widget.ImageView[contains(@content-desc,"Ya estás inscrito")])