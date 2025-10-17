*** Settings ***
Library         AppiumLibrary
Library         FakerLibrary
Resource        ../../resources/android/variables/user_activations.robot 
Resource        ../../resources/android/keywords/keywords.robot

Suite Setup     Setting timeouts
Test Setup       Before Tests
Test Teardown    After Tests

*** Test Cases ***
Validation error message when not choosing a company
    Wait Until Element Is Visible    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Click Element    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Input Text       ${LOGIN_COMPANY_FIELD}  ${NAME_COMPANY}
    Click Element    ${LOGIN_SUBMIT_BUTTON_CONTINUAR}
    Wait Until Element is visible    ${ERROR_SELECT_COMPANY1}
    Wait Until Element is visible    ${ERROR_SELECT_COMPANY2}
    Click Element    ${CLOSE}
    

Error validation when deleting company name
    Wait Until Element Is Visible  ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Click Element    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Input Text       ${LOGIN_COMPANY_FIELD}    ${NAME_COMPANY}
    Clear Text       ${LOGIN_COMPANY_FIELD}
    Click Element    ${LOGIN_SUBMIT_BUTTON_CONTINUAR}
    Wait Until Element is visible    ${ERROR_WRITING_COMPANY}


Validation of non-existent company
    Wait Until Element Is Visible   ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Click Element    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Wait Until Element Is Visible  ${LOGIN_COMPANY_FIELD}
    Input Text       ${LOGIN_COMPANY_FIELD}    ${NAME_NOEXIST}
    Wait Until Element is visible    ${ERROR_NO_COMPANY_EXISTS}
    

Validation verification email data 
    Wait Until Element Is Visible   ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Click Element    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Input Text       ${LOGIN_COMPANY_FIELD}  ${NAME_COMPANY}
    Wait Until Element Is Visible  ${COMPANY_SELECTOR}  21s
    Click Element  ${COMPANY_SELECTOR}
    Click Element  ${LOGIN_SUBMIT_BUTTON_CONTINUAR}
    Wait Until Element Is Visible  ${PAGE_VERIFY_USER_EMAIL} 
    Verify Text Equal on Element  ${PAGE_VERIFY_USER_EMAIL}  Ahora, ingresa tu correo electrónico y verifícate en LKJM.
    Click Element    ${VERIFY_BUTTON}
    Wait Until Element is visible  ${ENTER_EMAIL_DATA}
    ${email}  FakerLibrary.Email   -- se crea un correo aleatorio
    Input Text  ${VERIFICATION_FIELD}  ${email}   
    Click Element    ${VERIFY_BUTTON}
    ${NO_LICENSE_FOUND}  Set Variable  No fue posible realizar la verificación con el dato:${email}\nSi el dato que ingresas es el correcto o aún no puedes verificarte, continua para ayudarte a crear tu cuenta
    Wait Until Element is visible  ${VERIFY_BUTTON_CONTINUAR}
    Should Contain  ${NO_LICENSE_FOUND}  ${email}
     
    

Validation verification phone data
    Wait Until Element Is Visible   ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Click Element    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Input Text       ${LOGIN_COMPANY_FIELD}    ${NAME_COMPANY_TWO}
    Wait Until Element Is Visible   ${COMPANY_SELECTOR_PHONE}   
    Click Element    ${COMPANY_SELECTOR_PHONE}   
    Click Element    ${LOGIN_SUBMIT_BUTTON_CONTINUAR}
    Wait Until Element Is Visible   ${PAGE_VERIFY_USER_PHONE}
    Verify Text Equal on Element  ${PAGE_VERIFY_USER_PHONE}  Ahora, ingresa tu número de celular y verifícate en UAT.
    Click Element    ${VERIFY_BUTTON}
    Wait Until Element is visible    ${ENTER_PHONE_DATA}   
    ${Phone_number}   FakerLibrary.Basic Phone Number  
    Input Text  ${VERIFICATION_FIELD}  ${Phone_number}    
    Click Element    ${VERIFY_BUTTON}
    ${NO_LICENSE_FOUND}  Set Variable    No fue posible realizar la verificación con el dato:${Phone_number}\nSi el dato que ingresas es el correcto o aún no puedes verificarte, continua para ayudarte a crear tu cuenta
    Wait Until Element is visible  ${VERIFY_BUTTON_CONTINUAR} 
    Should Contain    ${NO_LICENSE_FOUND}    ${Phone_number}  
    

Validation verification Document data 
    Wait Until Element Is Visible   ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Click Element    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Input Text       ${LOGIN_COMPANY_FIELD}    ${NAME_COMPANY_THREE}
    Wait Until Element Is Visible   ${COMPANY_SELECTOR_DOCUMENT}   
    Click Element    ${COMPANY_SELECTOR_DOCUMENT}     
    Click Element    ${LOGIN_SUBMIT_BUTTON_CONTINUAR}
    Wait Until Element Is Visible   ${PAGE_VERIFY_USER_DOCUMENT}
    Verify Text Equal on Element    ${PAGE_VERIFY_USER_DOCUMENT}  Ahora, ingresa tu número de documento y verifícate en Momo S.A.
    Click Element    ${VERIFY_BUTTON}
    Wait Until Element is visible    ${ENTER_DOCUMENT_DATA}     
    ${document_number}    FakerLibrary.Passport Number  
    Input Text       ${VERIFICATION_FIELD}     ${document_number}  
    Click Element    ${VERIFY_BUTTON}
    ${NO_LICENSE_FOUND}  Set Variable    No fue posible realizar la verificación con el dato:${document_number}\nSi el dato que ingresas es el correcto o aún no puedes verificarte, continua para ayudarte a crear tu cuenta
    Wait Until Element is visible   ${VERIFY_BUTTON_CONTINUAR} 
    ${document_number}    Convert To String    ${document_number} 
    Should Contain    ${NO_LICENSE_FOUND}      ${document_number} 
    


Navegation
    Wait Until Element Is Visible   ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Click Element    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Input Text       ${LOGIN_COMPANY_FIELD}    ${NAME_COMPANY_THREE}
    Wait Until Element Is Visible   ${COMPANY_SELECTOR_DOCUMENT}   
    Click Element    ${COMPANY_SELECTOR_DOCUMENT}     
    Click Element    ${LOGIN_SUBMIT_BUTTON_CONTINUAR}
    Wait Until Element Is Visible   ${PAGE_VERIFY_USER_DOCUMENT}
    ${document_number}    FakerLibrary.Passport Number  
    Input Text       ${VERIFICATION_FIELD}     ${document_number}  
    Click Element    ${VERIFY_BUTTON}
    Wait Until Element is visible   ${VERIFY_BUTTON_CONTINUAR} 
    Click Element    xpath=//android.view.View[@content-desc="Sombreado"]
    ${value_page_verify}=    Get Text  ${VERIFICATION_FIELD} 
    Should Be Empty  ${value_page_verify}
    Wait Until Element is visible  ${BUTTON_BACK} 
    Click Element    ${BUTTON_BACK} 
    Wait Until Element is visible  ${PAGE_FOUND_COMPANY}  
    ${value}=    Get Text    ${LOGIN_COMPANY_FIELD}
    Should Be Equal    ${value}    ${NAME_COMPANY_THREE}
    Sleep    5s
    Click Element    xpath=//android.view.View[@content-desc="Busca tu empresa"]/android.view.View[1]
    Wait Until Page Contains Element    //android.view.View[@content-desc="¡Un beneficio de salud y bienestar que sí funciona!"]
    

Validation active account with email
    Wait Until Element Is Visible   ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Click Element    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Input Text       ${LOGIN_COMPANY_FIELD}    ${NAME_COMPANY}
    Wait Until Element Is Visible   ${COMPANY_SELECTOR}
    Click Element    ${COMPANY_SELECTOR}
    Click Element    ${LOGIN_SUBMIT_BUTTON_CONTINUAR}
    Click Element    ${VERIFY_BUTTON}
    Wait Until Element is visible    ${ENTER_EMAIL_DATA}
    Wait Until Element Is Visible  ${VERIFICATION_FIELD}
    Input Text       ${VERIFICATION_FIELD}  ${USER1_DETAILS}        
    Click Element    ${VERIFY_BUTTON}
    ${ACTIVE_LICENSE_FOUND}=    Get Element Attribute    xpath=//android.view.View[contains(@content-desc, "Ya tienes una cuenta activa") and contains(@content-desc, "correo:")]    content-desc
    Log To Console    El texto obtenido es: ${ACTIVE_LICENSE_FOUND}
    Wait Until Element is visible  ${BUTTON_LOGIN} 
    Wait Until Element Is Visible    ${SUPPORT_MESSAGE}  
    Should Be Equal    ${ACTIVE_LICENSE_FOUND}   Ya tienes una cuenta activa\nInicia sesión con este correo:\ntutai*******ail.com 
    Click Element    //android.view.View[@content-desc="Sombreado"]
    ${value_page_verify}=    Get Text  ${VERIFICATION_FIELD}
    Log To Console  El correo ingresado fue: ${value_page_verify}
    Should Be Equal    ${value_page_verify}  ${USER1_DETAILS}  
    Sleep    5s 
    
    
Validation active account with phone 
    Wait Until Element Is Visible   ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Click Element    ${LOGIN_SUBMIT_CONTINUACONEMPRESA}
    Input Text       ${LOGIN_COMPANY_FIELD}    ${NAME_COMPANY_FOUR}
    Wait Until Element Is Visible   ${COMPANY_SELECTOR_EMAIL}
    Click Element    ${COMPANY_SELECTOR_EMAIL}
    Click Element    ${LOGIN_SUBMIT_BUTTON_CONTINUAR}
    Click Element    ${VERIFY_BUTTON}
    Wait Until Element is visible    ${ENTER_EMAIL_DATA}
    Wait Until Element is visible  ${VERIFICATION_FIELD}
    Input Text       ${VERIFICATION_FIELD}  ${USER1_PHONE}        
    Click Element    ${VERIFY_BUTTON}
    ${ACTIVE_LICENSE_FOUND}   Get Element Attribute  xpath=//android.view.View[contains(@content-desc, "Ya tienes una cuenta activa") and contains(@content-desc, "celular:")]  content-desc
     Log To Console    El texto obtenido es: ${ACTIVE_LICENSE_FOUND}
    Wait Until Element is visible  ${BUTTON_LOGIN} 
    Wait Until Element Is Visible    ${SUPPORT_MESSAGE}  
    Should Be Equal    ${ACTIVE_LICENSE_FOUND}   Ya tienes una cuenta activa\nInicia sesión con este celular:\n30438*****
    Click Element    //android.view.View[@content-desc="Sombreado"]
    ${value_page_verify}=    Get Text  ${VERIFICATION_FIELD}
    Log To Console  El correo ingresado fue: ${value_page_verify}
    Should Be Equal    ${value_page_verify}  ${USER1_PHONE}  
    Sleep    5s 
    
