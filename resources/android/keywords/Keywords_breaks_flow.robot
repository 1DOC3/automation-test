*** Settings ***


Library     AppiumLibrary


Resource    ../variables/user_activations.robot
Resource    ../variables/user_active_breaks.robot
Resource    ../keywords/keywords.robot


*** Keywords ***

Not active break
    ${visible}=  Run Keyword And Return Status    Element Should Be Visible     ${Button_start_break}
   Run Keyword If    ${visible}    Click Element  ${Button_start_break}
   Run Keyword If    not ${visible}    Click Element    ${Banner_not_active_break}
    Wait Until Element Is Visible  ${Title_break}
    Wait Until Element Is Visible  ${Boddy_break}
    Wait Until Element Is Visible  ${First_option}
    Wait Until Element Is Visible  ${Second_option}
    Wait Until Element Is Visible  ${Third_option}
    Click Element  ${First_option}
    Wait Until Element Is Visible  ${Content_first}
    Wait Until Element Is Visible  ${Description_first_option}
    Wait Until Element Is Visible  ${Title_recomendations}
    Wait Until Element Is Visible  ${Description_activities}
    Wait Until Element Is Visible  ${close_view}
    Click Element  ${close_view}
    Wait Until Element Is Visible  ${Title_break}
    Wait Until Element Is Visible  ${Second_option}
    Click Element  ${Second_option}
    Wait Until Element Is Visible  ${Content_second}
    Wait Until Element Is Visible  ${Description_second_option}
    Wait Until Element Is Visible  ${Title_recomendations}
    Wait Until Element Is Visible  ${Description_activities}
    Wait Until Element Is Visible  ${close_view}
    Click Element  ${close_view}
    Wait Until Element Is Visible  ${Title_break}
    Wait Until Element Is Visible  ${Third_option}
    Click Element  ${Third_option}
    Wait Until Element Is Visible  ${Content_third}
    Wait Until Element Is Visible  ${Description_third_option}
    Wait Until Element Is Visible  ${Title_recomendations}
    Wait Until Element Is Visible  ${Description_activities}
    Wait Until Element Is Visible  ${close_view}
    Click Element  ${close_view}
    Wait Until Element Is Visible  ${Title_break}
    Wait Until Element Is Visible  ${Back_view}
    Click Element  ${Back_view}
    Wait until element is visible  ${Banner_not_active_break}
    Wait Until Element Is Visible  ${Button_start_break}
    Click Element  ${Button_start_break}
    Wait Until Element Is Visible  ${First_option}
    Click Element    ${First_option}
    Wait Until Element Is Visible  ${Content_first}
    Wait Until Element Is Visible  ${Description_first_option}
    Wait Until Element Is Visible  ${Title_recomendations}
    Wait Until Element Is Visible  ${Description_activities}
    ${elements}=    Get Webelements    //android.widget.ImageView
    Click Element    ${elements}[0]
    Wait Until Element Is Visible  xpath=(//android.view.View)[1] 
    Click Element  xpath=(//android.view.View)[1] 
    Wait Until Element Is Visible  xpath=(//android.view.View)[3]
    Click Element  xpath=(//android.view.View)[3]
    Wait Until Element Is Visible  xpath=(//android.view.View)[5]
    Click Element    xpath=(//android.view.View)[5]
    Wait For Video To Finish


Active break
   ${visible}=  Run Keyword And Return Status    Element Should Be Visible     ${Button_start_break}
   Run Keyword If    ${visible}    Click Element  ${Button_start_break}
   Run Keyword If    not ${visible}      Click Element    ${Active_banner}
    Wait Until Element Is Visible  ${Title_break}
    Wait Until Element Is Visible  ${Boddy_break}
    Wait Until Element Is Visible  ${First_option}
    Wait Until Element Is Visible  ${Second_option}
    Wait Until Element Is Visible  ${Third_option}
    Click Element    ${First_option}
    Wait Until Element Is Visible  ${Content_first}
    Wait Until Element Is Visible  ${Description_first_option}
    Wait Until Element Is Visible  ${Title_recomendations}
    Wait Until Element Is Visible  ${Description_activities}
    Wait Until Element Is Visible  ${close_view}
    Click Element  ${close_view}
    Wait Until Element Is Visible  ${Title_break}
    Wait Until Element Is Visible  ${Second_option}
    Click Element  ${Second_option}
    Wait Until Element Is Visible  ${Content_second}
    Wait Until Element Is Visible  ${Description_second_option}
    Wait Until Element Is Visible  ${Title_recomendations}
    Wait Until Element Is Visible  ${Description_activities}
    Wait Until Element Is Visible  ${close_view}
    Click Element  ${close_view}
    Wait Until Element Is Visible  ${Title_break}
    Wait Until Element Is Visible  ${Third_option}
    Click Element  ${Third_option}
    Wait Until Element Is Visible  ${Content_third}
    Wait Until Element Is Visible  ${Description_third_option}
    Wait Until Element Is Visible  ${Title_recomendations}
    Wait Until Element Is Visible  ${Description_activities}
    Wait Until Element Is Visible  ${close_view}
    Click Element  ${close_view}
    Wait Until Element Is Visible  ${Title_break}
    Wait Until Element Is Visible  ${Back_view}
    Click Element  ${Back_view}
    Wait until element is visible  ${Active_banner}
    Wait Until Element Is Visible  ${Button_start_break}
    Click Element  ${Button_start_break}
    Wait Until Element Is Visible  ${First_option}
    Click Element    ${First_option}
    Wait Until Element Is Visible  ${Content_first}
    Wait Until Element Is Visible  ${Description_first_option}
    Wait Until Element Is Visible  ${Title_recomendations}
    Wait Until Element Is Visible  ${Description_activities}
    ${elements}=    Get Webelements    //android.widget.ImageView
    Click Element    ${elements}[0]
    Wait Until Element Is Visible  xpath=(//android.view.View)[1] 
    Click Element  xpath=(//android.view.View)[1] 
    Wait Until Element Is Visible  xpath=(//android.view.View)[3]
    Click Element  xpath=(//android.view.View)[3]
    Wait Until Element Is Visible  xpath=(//android.view.View)[5]
    Click Element    xpath=(//android.view.View)[5]
    Wait For Video To Finish
    

Wait For Video To Finish
    ${video_presente}=    Run Keyword And Return Status    Page Should Contain Element    xpath=(//android.view.View)[5]

    IF    ${video_presente}
        Log To Console    "Waiting for video ending..."
       
        Wait Until Element Is Visible    ${Activity_complete}   
    ELSE
        Log To Console    "Not found video, continue..."
        Wait Until Element Is Visible     ${Activity_complete}    
    END

    Wait Until Element Is Visible    ${Close_modal}
    Click Element                    ${Close_modal}
    Wait Until Element Is Visible    ${Modal_congratulations}

   
