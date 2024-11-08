
*** Settings ***
Library    AppiumLibrary  
Suite Setup       Configurar Tiempos de Espera
Resource        ../resources/android/variables/variables.robot
Resource         ../resources/android/keywords/keywords.robot

*** Test Cases *** 



Validación mensaje de error al no elegir empresa 
    Abrir Aplicación Local
    Click en    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}  
    Ingresar Empresa    ${NAME_COMPANY}     
    Click en    ${LOGIN_SUBMIT_BUTTON_CONTINUAR}  
    Verificar Mensaje De Error  ${ERROR_SELECCIONA_EMPRESA1} 
    Verificar Mensaje De Error  ${ERROR_SELECCIONA_EMPRESA2} 
    Click en    ${CERRAR_CLOSE}   

  

Validación de error al borrar nombre de empresa
    Abrir Aplicación Local
    Click en    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}  
    Ingresar Empresa    ${NAME_COMPANY}     
    Borrar Campo Empresa
    Click en    ${LOGIN_SUBMIT_BUTTON_CONTINUAR}  
    Verificar Mensaje De Error   ${ERROR_ESCRIBIR_EMPRESA}  

Validación de empresa no existente
    Abrir Aplicación Local
    Click en    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}  
    Ingresar Empresa   ${NAME_NOEXIST}
    Verificar Mensaje De Error   ${ERROR_NO_EXISTE_EMPRESA}
   

Validación ingresar dato de verificación
    Abrir Aplicación Local
    Click en   ${LOGIN_SUBMIT_CONTINUACONEMPRESA}  
    Ingresar Empresa    ${NAME_COMPANY}     
    Click en   ${ELEGIR_COMPANY} 
    Click en   ${LOGIN_SUBMIT_BUTTON_CONTINUAR}  
    Verificar Texto en Elemento  ${PAGE_VERIFY_USER}  ${VERIFY_DATO_EMAIL} 
    Click en  ${VERIFICAR_BUTTON_} 
    Verificar Mensaje De Error   ${INGRESAR_DATO_EMAIL}   

