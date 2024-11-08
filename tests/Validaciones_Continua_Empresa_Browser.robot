
*** Settings ***
Library    AppiumLibrary  
Suite Setup       Configurar Tiempos de Espera
Resource        ../resources/android/variables/variables.robot
Resource         ../resources/android/keywords/keywords.robot

*** Test Cases *** 



Validación mensaje de error al no elegir empresa 
    Abrir App
    Click En Elemento    ${BTN_CONTINUAR_EMPRESA}
    Ingresar Nombre Empresa    ${NAME_COMPANY}     
    Click En Elemento    ${BTN_CONTINUAR}
    Verificar Mensaje De Error  ${ERROR_SELECCIONA_EMPRESA1} 
    Verificar Mensaje De Error  ${ERROR_SELECCIONA_EMPRESA2} 
    Click En Elemento    ${CERRAR_CLOSE}   

  

Validación de error al borrar nombre de empresa
    Abrir App
    Click En Elemento   ${BTN_CONTINUAR_EMPRESA}
    Ingresar Nombre Empresa    ${NAME_COMPANY}     
    Borrar Campo Empresa
    Click En Elemento    ${BTN_CONTINUAR}
    Verificar Mensaje De Error   ${ERROR_ESCRIBIR_EMPRESA}  

Validación de empresa no existente
    Abrir App
    Click En Elemento    ${BTN_CONTINUAR_EMPRESA}
    Ingresar Nombre Empresa    ${NAME_NOEXIST}
    Verificar Mensaje De Error   ${ERROR_NO_EXISTE_EMPRESA}
   

Validación ingresar dato de verificación
    Abrir App
    Click En Elemento   ${BTN_CONTINUAR_EMPRESA}
    Ingresar Nombre Empresa    ${NAME_COMPANY}     
    Click En Elemento    ${ELEGIR_COMPANY} 
    Click En Elemento    ${BTN_CONTINUAR}
    Verificar Texto en Elemento  ${PAGE_VERIFY_USER}  ${VERIFY_DATO_EMAIL} 
    Click En Elemento  ${BOTON_VERIFICAR}
    Verificar Mensaje De Error   ${INGRESAR_DATO_EMAIL}   

