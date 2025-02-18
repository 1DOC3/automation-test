*** Settings ***
Library         AppiumLibrary
Resource        ../resources/android/variables/Screen_Activation.robot
Resource        ../resources/android/variables/Screen_Onboarding.robot
Resource        ../resources/android/keywords/keywords.robot

Suite Setup     Setting timeouts
Test Setup       Before Tests
Test Teardown    After Tests

*** Test Cases ***
Field validations
    Do Login new user
    Wait Until Page Contains Element  ${COPY_TITLE}
    Wait Until Page Contains Element  ${FIELD_NAME}
    Wait Until Page Contains Element  ${FIELD_LAST_NAME}
    Wait Until Element Is Visible     ${FIELD_GENDER}
    Wait Until Element Is Visible     ${FIELD_DATE_OF_BIRTH}
    Wait Until Element Is Visible      ${COPY_INFORMATION}
    Wait Until Page Contains Element  ${BTN_CONTINUE}
    Input Text       ${INPUT_NAME}           'Liz Dahianna'
    Click Element    ${INPUT_LAST_NAME} 
    Input Text       ${INPUT_LAST_NAME}      'Giraldo'
    Log Source
    Press Keycode    66
    Click Element     ${WOMEN_OPTION}
    Wait Until Element Is Visible     ${FIELD_DATE_OF_BIRTH}
    Click Element ${FIELD_DATE_OF_BIRTH}
   Wait Until Element Is Visible  ${COPY_INFORMATION_DATE_OF_BIRTH} 
   Click Element    //android.widget.SeekBar[@content-desc="16"]
   Click Element   //android.widget.SeekBar[@content-desc="marzo"]
   Click Element   //android.widget.SeekBar[@content-desc="2023"]
   Click Element   ${BTN_SAVED}
   Wait Until Element Is Visible ${ERROR_AGE_USER}
   Click Element   //android.widget.SeekBar[@content-desc="1996"]
   Click Element   ${BTN_SAVED}
   Wait Until Element Is Visible    //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View
   Wait Until Element Is Visible   ${OBJECTIVE_1}       
   Wait Until Element Is Visible   ${OBJECTIVE_2}     
   Wait Until Element Is Visible   ${OBJECTIVE_3} 
   Wait Until Element Is Visible   ${OBJECTIVE_4}  
   Wait Until Element Is Visible   ${OBJECTIVE_5} 
   Wait Until Element Is Visible   ${OBJECTIVE_6}
   Wait Until Element Is Visible   ${OBJECTIVE_7}    
   Click Element                    ${OBJECTIVE_3}

    
       
        
  


   