*** Variables ***
# Variables Consultations



${SERVICE_LEGAL_GUIDANCE}                 //android.widget.ImageView[@content-desc="Orientación\nLegal"]
${TERMS_AND_CONDITIONS }                 //android.widget.Button[@content-desc="Continuar"]
${PENAL_CONSULTATION}                   //android.view.View[@content-desc="Penal\nFaltas como robos o agresiones."]
${CIVIL_CONSULTATION}                  //android.view.View[@content-desc="Civil\nContratos o disputas entre personas o empresas."]
${INMOBILIARIA_CONSULTATION}          //android.view.View[@content-desc="Inmobiliaria\nBienes raíces, compraventa o alquileres."]
${FAMILIAR_CONSULTATION}             //android.view.View[@content-desc="Familiar\nDivorcio, custodia de hijos, adopción o pensión alimenticia."]
${ADMINISTRATIVA_CONSULTATION}      //android.view.View[@content-desc="Administrativa\nTrámites entre entidades gubernamentales, licencias o administración pública."]
${OTRAS_CONSULTATION}              //android.view.View[@content-desc="Otra\nSelecciona esta opción, si tu consulta no se ajusta a ninguna de las áreas anteriores."]




${INPUT_DETAIL}                   //android.widget.EditText
${DETAIL_CONSULTATION}           ayudame a consultar el estado de mi demanda
${ATTACH_IMAGE}                 //android.view.View[@content-desc="Adjunta imágenes"] [2]
${ADD_GALLERY}                 //android.view.View[@content-desc="Galería"]
${IMAGES_1}                   //androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View[5]/android.view.View[7]/android.view.View[2]/android.view.View
${IMAGES_2}                  //androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View[5]/android.view.View[5]/android.view.View[2]/android.view.View
${IMAGES_3}                 //androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View[5]/android.view.View[3]/android.view.View[2]/android.view.View
${IMAGES_4}                //androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View[5]/android.view.View[6]/android.view.View[2]/android.view.View
${IMAGES_5}               //androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View[5]/android.view.View[4]/android.view.View[2]/android.view.View
${IMAGES_6}              //androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View[5]/android.view.View[2]/android.view.View[2]/android.view.View
${CONTINUE_BUTTON}      //android.widget.Button[@content-desc="Continuar"]
${EMAIL_DETAIL}        prueba023@yopmail.com
${SEND_QUERY}         //android.widget.Button[@content-desc="Enviar consulta"]
${CTA_CLOSE}         //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View[1]





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



${PENAL_DETAIL_2}           He sido víctima de un robo en mi domicilio. La persona responsable fue detenida. pero necesito saber que acciones adicionales seguir.
${CIVIL_DETAIL_2}           Firmé un contrato con una empresa para un servicio que no fue entregado. ¿Qué acciones legales puedo tomar para reclamar el cumplimiento o reembolso?
${INMOBILIARIA_DETAIL_2}    Estoy en medio de una negociación para comprar una casa, pero hay disputas con el contrato de compraventa. ¿Cómo debo proceder?
${FAMILIAR_DETAIL_2}        Estoy en proceso de divorcio y necesito orientación sobre la custodia de mis hijos. ¿Qué derechos y deberes tengo?
${ADMINISTRATIVA_DETAIL_2}  Necesito obtener una licencia para abrir mi negocio, pero he encontrado problemas con los trámites. ¿Qué puedo hacer para acelerar el proceso?
${OTRAS_DETAIL_2}           Mi consulta no encaja en ninguna categoría anterior, mira el documento que te voy a adjuntar.


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
