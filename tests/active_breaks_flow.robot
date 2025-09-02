*** Settings ***
Library           AppiumLibrary
Library           Collections
Resource        ../resources/android/variables/user_activations.robot
Resource        ../resources/android/keywords/keywords.robot
Resource        ../resources/android/variables/user_active_breaks.robot


Suite Setup     Setting timeouts
Test Setup       Before Tests
Test Teardown    After Tests

*** Test Cases ***
Active pause banner validations
    Do login with email    nnn@yopmail.com
    Wait until element is visible  ${Active_banner}
    Wait Until Element Is Visible  ${Button_start_break}
    Click Element  ${Button_start_break}
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

Banner without breaks made
    Do login with email  tutaina@yopmail.com
    Wait until element is visible  ${Banner_not_active_break}
    Wait Until Element Is Visible  ${Button_start_break}
    Click Element  ${Button_start_break}
    sleep  3s
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


    