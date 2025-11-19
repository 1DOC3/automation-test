*** Settings ***
Library         AppiumLibrary
Resource        ../../resources/android/variables/user_activations.robot
Resource        ../../resources/android/variables/user_explore.robot 
Resource        ../../resources/android/keywords/keywords.robot



*** Test Cases ***   
Flujo explorar validaciones
    Click Element    ${TAB_EXPLORA}
    Sleep    5s
    Wait Until Element Is Visible     ${TITLE_EXPLORA}
    Wait Until Element Is Visible     ${SEARCH_BAR}
    Scroll Until Element Is Found In Safe Position    ${MENTAL_HEALTH}   
    ...    start_y=1400    
    ...    end_y=400
    ...    duration=500
    Wait Until Element Is Visible    ${MENTAL_HEALTH}       
    Click Element    ${MENTAL_HEALTH}
    Wait Until Element Is Visible    ${TITLE_HEALTH}
    Wait Until Element Is Visible    ${TITLE2_HEALTH}
    Click Element    ${BACK_WINDOW}
    Sleep    2s
    Click Element    ${NUTRITION}   
    Wait Until Element Is Visible    ${TITLE_NUTRITION} 
    Wait Until Element Is Visible    ${BODY_NUTRITION} 
    Wait Until Element Is Visible    ${TITLE2_NUTRITION}
    Click Element    ${BACK_WINDOW}
    Sleep    2s
    Click Element    ${RELATIONS}
    Wait Until Element Is Visible    ${TITLE_RELATIONS}   
    Wait Until Element Is Visible    ${BODY_RELATIONS} 
    Wait Until Element Is Visible    ${TITLE2_RELATIONS}
    Click Element    ${BACK_WINDOW}
    Sleep    2s
    Click Element    ${TRAINING}
    Wait Until Element Is Visible    ${TITLE_TRAINING} 
    Wait Until Element Is Visible    ${BODY_TRAINING} 
    Wait Until Element Is Visible    ${TITLE2_TRAINING}
    Click Element    ${BACK_WINDOW}
    Sleep    2s    
    Click Element    ${PETS}    
    Wait Until Element Is Visible    ${TITLE_PETS} 
    Wait Until Element Is Visible    ${BODY_PETS} 
    Wait Until Element Is Visible    ${TITLE2_TRAINING}
    Click Element    ${BACK_WINDOW}
    
Banner health 
    Wait Until Element Is Visible  ${TAB_EXPLORA}
    Click Element    ${TAB_EXPLORA}
    Wait Until Element Is Visible    ${BANNER_HEALTH}  70s
    Click Element    ${BANNER_HEALTH}
    Sleep    2s
    Click Element    ${CLOSE_WINDOW1}

Video Validation
    Wait Until Element Is Visible  ${TAB_EXPLORA}
    Click Element    ${TAB_EXPLORA}
    Sleep    5s
    Wait Until Element Is Visible    ${SECTION_EXPLORA}
    Click Element    ${SECTION_EXPLORA}
    Sleep    5s
    Click Element  //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.view.View[1]/android.view.View[1] 
    Wait Until Element Is Visible   xpath=(//android.view.View)[2]    
    Click Element  xpath=(//android.view.View)[2]
    Wait Until Element Is Visible  ${BUTTON_CLOSE}
    Click Element    ${BUTTON_CLOSE}
    




