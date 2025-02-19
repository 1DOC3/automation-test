*** Settings ***
Library         AppiumLibrary
Library         FakerLibrary
Resource        ../resources/android/variables/user_activations.robot 
Resource        ../resources/android/keywords/keywords.robot

Suite Setup     Setting timeouts


*** Test Cases ***
Validation error message when not choosing a company
    Open 1doc3 Application
    Wait Until Element Is Visible    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Click Element    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Input Text       ${LOGIN_COMPANY_FIELD}    ${NAME_COMPANY}
    Click Element    ${LOGIN_SUBMIT_BUTTON_CONTINUAR}
    Wait Until Element is visible    ${ERROR_SELECT_COMPANY1}
    Wait Until Element is visible    ${ERROR_SELECT_COMPANY2}
    Click Element    ${CLOSE}
    Close Application

Error validation when deleting company name
    Open 1doc3 Application
    Wait Until Element Is Visible   ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Click Element    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Input Text       ${LOGIN_COMPANY_FIELD}    ${NAME_COMPANY}
    Clear Text       ${LOGIN_COMPANY_FIELD}
    Click Element    ${LOGIN_SUBMIT_BUTTON_CONTINUAR}
    Wait Until Element is visible    ${ERROR_WRITING_COMPANY}
    Close Application

Validation of non-existent company
    Open 1doc3 Application
    Wait Until Element Is Visible   ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Click Element    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Input Text       ${LOGIN_COMPANY_FIELD}    ${NAME_NOEXIST}
    Wait Until Element is visible    ${ERROR_NO_COMPANY_EXISTS}
    Close Application

Validation verification email data
    Open 1doc3 Application 
    Wait Until Element Is Visible   ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Click Element    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Input Text       ${LOGIN_COMPANY_FIELD}    ${NAME_COMPANY}
    Wait Until Element Is Visible   ${COMPANY_SELECTOR}
    Click Element    ${COMPANY_SELECTOR}
    Click Element    ${LOGIN_SUBMIT_BUTTON_CONTINUAR}
    Verify Text Equal on Element    ${PAGE_VERIFY_USER_EMAIL}       Ahora, ingresa tu correo electrónico y verifícate en Empresa pruebas.
    Click Element    ${VERIFY_BUTTON}
    Wait Until Element is visible    ${ENTER_EMAIL_DATA}
    ${email}         FakerLibrary.Email   -- se crea un correo aleatorio
    Input Text       ${VERIFICATION_FIELD}       ${email}   
    Click Element    ${VERIFY_BUTTON}
    ${NO_LICENSE_FOUND}  Set Variable    No fue posible realizar la verificación con el dato:${email}\nSi el dato que ingresas es el correcto y aún no puedes verificarte, comunícate con nuestro equipo de soporte vía WhatsApp para más ayuda.
    Wait Until Element is visible  ${BTN_CONTACT_SUPPORT}
    Should Contain    ${NO_LICENSE_FOUND}    ${email}
    Close Application
    

Validation verification phone data
    Open 1doc3 Application 
    Wait Until Element Is Visible   ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Click Element    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Input Text       ${LOGIN_COMPANY_FIELD}    ${NAME_COMPANY_TWO}
    Wait Until Element Is Visible   ${COMPANY_SELECTOR_PHONE}   
    Click Element    ${COMPANY_SELECTOR_PHONE}   
    Click Element    ${LOGIN_SUBMIT_BUTTON_CONTINUAR}
    Wait Until Element Is Visible   ${PAGE_VERIFY_USER_PHONE}
    Verify Text Equal on Element    ${PAGE_VERIFY_USER_PHONE}       Ahora, ingresa tu número de celular y verifícate en Google Liz.
    Click Element    ${VERIFY_BUTTON}
    Wait Until Element is visible    ${ENTER_PHONE_DATA}   
    ${Phone_number}   FakerLibrary.Basic Phone Number  
    Input Text       ${VERIFICATION_FIELD}      ${Phone_number}    
    Click Element    ${VERIFY_BUTTON}
    ${NO_LICENSE_FOUND}  Set Variable    No fue posible realizar la verificación con el dato:${Phone_number}\nSi el dato que ingresas es el correcto y aún no puedes verificarte, comunícate con nuestro equipo de soporte vía WhatsApp para más ayuda.
    Wait Until Element is visible  ${BTN_CONTACT_SUPPORT}
    Should Contain    ${NO_LICENSE_FOUND}    ${Phone_number}  
    Close Application

Validation verification Document data
    Open 1doc3 Application 
    Wait Until Element Is Visible   ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Click Element    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Input Text       ${LOGIN_COMPANY_FIELD}    ${NAME_COMPANY_THREE}
    Wait Until Element Is Visible   ${COMPANY_SELECTOR_DOCUMENT}   
    Click Element    ${COMPANY_SELECTOR_DOCUMENT}     
    Click Element    ${LOGIN_SUBMIT_BUTTON_CONTINUAR}
    Wait Until Element Is Visible   ${PAGE_VERIFY_USER_DOCUMENT}
    Verify Text Equal on Element    ${PAGE_VERIFY_USER_DOCUMENT}       Ahora, ingresa tu número de documento y verifícate en mario juego.
    Click Element    ${VERIFY_BUTTON}
    Wait Until Element is visible    ${ENTER_DOCUMENT_DATA}     
    ${document_number}    FakerLibrary.Passport Number  
    Input Text       ${VERIFICATION_FIELD}     ${document_number}  
    Click Element    ${VERIFY_BUTTON}
    ${NO_LICENSE_FOUND}  Set Variable    No fue posible realizar la verificación con el dato:${document_number}\nSi el dato que ingresas es el correcto y aún no puedes verificarte, comunícate con nuestro equipo de soporte vía WhatsApp para más ayuda.
    Wait Until Element is visible  ${BTN_CONTACT_SUPPORT} 
    ${document_number}    Convert To String    ${document_number} 
    Should Contain    ${NO_LICENSE_FOUND}      ${document_number} 
    Close Application