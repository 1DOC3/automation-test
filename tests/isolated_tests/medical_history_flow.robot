*** Settings ***
Library         AppiumLibrary
Library         OperatingSystem
Resource        ../../resources/android/variables/user_medical_history.robot
Resource        ../../resources/android/keywords/keywords.robot



*** Test Cases ***


Validation Medical History From Tab bar and choosing consultations
    Do login with email  tutaina@yopmail.com
    # Access from Tab Bar
    Wait Until Element Is Visible       ${BUTTON_CONSULTATION}
    Click Element                       ${BUTTON_CONSULTATION}
    Wait Until Page Contains Element    ${BUTTON_CONSULTATIONS}
    Click Element                       ${BUTTON_CONSULTATIONS}
    Wait Until Page Contains Element    ${TITLE_CONSULTATIONS}
    Wait Until Element Is Visible       ${FILTER} 
    Click Element                       ${FILTER} 
    Wait Until Page Contains Element    ${FILTER_MODE}  
    Wait Until Element Is Visible        ${FINANCIAL_ASSISTANT} 
    Click Element    ${FINANCIAL_ASSISTANT} 
    Wait Until Element Is Visible  ${FIRTS_CONSULTATIONS_FINANCIAL}
    Click Element  ${FIRTS_CONSULTATIONS_FINANCIAL}
    Wait Until Element Is Visible  ${TITLE_CONSULTATION_FINANCIAL}
    Wait Until Element Is Visible  ${REASON_FOR_CONSULTATIONN_FINANCIAL}
    Wait Until Element Is Visible  ${CONSULTATION_SUMMARY_FINANCIAL}
    Wait Until Element Is Visible  ${CONSULTATION_RATING}
    Wait Until Element Is Visible  ${READ_CHAT}
    Click Element  ${BUTTON_BACK_CONSULTATION}
    Wait Until Page Contains Element    ${TITLE_CONSULTATIONS}
    Wait Until Element Is Visible  ${OPTION_FINANCIAL_ASSISTANT}
    Click Element                ${OPTION_FINANCIAL_ASSISTANT}
    Wait Until Element Is Visible  ${LEGAL_ASSISTANT}
    Click Element    ${LEGAL_ASSISTANT}
    Wait Until Element Is Visible  ${THIRD_CONSULTATION_LEGAL}
    Click Element  ${THIRD_CONSULTATION_LEGAL}
    Wait Until Element Is Visible  ${TITLE_CONSULTATION_LEGAL}
    Wait Until Element Is Visible  ${REASON_FOR_CONSULTATIONN_LEGAL}
    Wait Until Element Is Visible  ${CONSULTATION_RATING}
    Wait Until Element Is Visible  ${READ_CHAT}
    Click Element  ${BUTTON_BACK_CONSULTATION}
    Wait Until Page Contains Element    ${TITLE_CONSULTATIONS}
    Wait Until Element Is Visible  ${OPTION_LEGAL_ASSISTANT}
    Click Element  ${OPTION_LEGAL_ASSISTANT}
    Wait Until Element is visible  ${BUTTON_CANCEL}
    Click Element   ${BUTTON_CANCEL}
    Wait Until Element Is Visible  ${OPTION_LEGAL_ASSISTANT}
    Click Element  ${OPTION_LEGAL_ASSISTANT}
    Wait Until Element Is Visible        ${GENERAL_MEDICINE} 
    Click Element    ${GENERAL_MEDICINE} 
    Wait Until Page Contains Element    ${TITLE_CONSULTATIONS}
    Wait Until Element Is Visible  ${OPTION_GENERAL_MEDICINE}
    Click Element  ${OPTION_GENERAL_MEDICINE}
    Wait Until Element Is Visible  ${PEDIATRICS}
    Click Element  ${PEDIATRICS}
    Wait Until Element Is Visible  ${OPTION_PEDIATRICS}
    Click Element  ${OPTION_PEDIATRICS}
    Click Element  ${BACK}
     Wait Until Element Is Visible        ${MENTAL_HEALTH} 
    Click Element    ${MENTAL_HEALTH} 
    Wait Until Page Contains Element    ${TITLE_CONSULTATIONS}
    Wait Until Element Is Visible  ${OPTION_MENTAL_HEALTH}
    Click Element  ${OPTION_MENTAL_HEALTH}
    Wait Until Element Is Visible        ${SEXUAL_HEALTH} 
    Click Element    ${SEXUAL_HEALTH} 
    Wait Until Page Contains Element    ${TITLE_CONSULTATIONS}
    Wait Until Element Is Visible  ${OPTION_SEXUAL_HEALTH}
    Click Element  ${OPTION_SEXUAL_HEALTH}
    Wait Until Element Is Visible        ${VETERINARY} 
    Click Element   ${VETERINARY} 
    Wait Until Page Contains Element    ${TITLE_CONSULTATIONS}
    Wait Until Element Is Visible  ${OPTION_VETERINARY}
    Click Element  ${OPTION_VETERINARY}

Validation Medical History From Tab bar without consultations
    Do login with email  lizgiraldo@utp.edu.co 
    # Access from Tab Bar
    Wait Until Element Is Visible       ${BUTTON_CONSULTATION}
    Click Element                       ${BUTTON_CONSULTATION}
    Wait Until Page Contains Element    ${BUTTON_CONSULTATIONS}
    Click Element                       ${BUTTON_CONSULTATIONS}
    Wait Until Element Is Visible  ${EMPTY_STATE}
    Sleep  2s






