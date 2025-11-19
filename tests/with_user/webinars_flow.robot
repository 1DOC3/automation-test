*** Settings ***
Library           AppiumLibrary
Library           Collections
Library           DateTime
Resource        ../../resources/android/variables/user_activations.robot
Resource        ../../resources/android/keywords/keywords.robot
Resource        ../../resources/android/variables/user_webinars.robot




*** Test Cases ***
Watch Webinar validations
    Sleep    2s
    ${today}=    Get Current Date    result_format=%A
    Log To Console    Today is: ${today}
    ${element_found}=    Set Variable    NONE
    # ===== Case 1: Monday to Wednesday =====
    IF    '${today}' in ['Monday', 'Tuesday', 'Wednesday']
        FOR    ${i}    IN RANGE    10
            ${join_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${BUTTON_JOIN}
            ${registered_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${REGISTERED}

            IF    ${join_visible}
                ${element_found}=    Set Variable    JOIN
                Exit For Loop
            ELSE IF    ${registered_visible}
                ${element_found}=    Set Variable    INSCRITO
                Exit For Loop
            ELSE
                 Swipe By Percent    50    85    50    25    500
                 Wait Until Keyword Succeeds    3s    0.5s    Run Keyword If    '${join_visible}' or '${registered_visible}'    No Operation
            END
        END 

        IF    '${element_found}' == 'INSCRITO'
            Log To Console    User already registered.
            Element Should Be Visible    ${REGISTERED}
        ELSE IF    '${element_found}' == 'JOIN'
            Log To Console    Unregistered user, starting registration.
            Click Element    ${BUTTON_JOIN}
            Wait Until Element Is Visible    ${MODAL_JOIN}
            Click Element    ${BUTTON_JOIN}
            Wait Until Element Is Visible    ${ADD_DATE_CALENDAR}
            Wait Until Element Is Visible    ${BODY_DATE_CALENDAR}
            Wait Until Element Is Visible    ${BTN_CALENDAR}
        ELSE
            Fail    Neither join button registered banner was found.
        END
    END

 # ===== Case 2: Thursday =====
    IF    '${today}' == 'Thursday'
        Log To Console    Validation if Webinar is on live or is available to join 

     FOR    ${i}    IN RANGE    5
            ${live_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${LIVE}
            ${last_webinar}=    Run Keyword And Return Status    Element Should Be Visible    ${NO_LIVE}
            ${join_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${BUTTON_JOIN}
            ${registered_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${REGISTERED}
            

            IF    ${live_visible}
                ${element_found}=    Set Variable    LIVE
                Exit For Loop
            ELSE IF    ${last_webinar}
                ${element_found}=    Set Variable    NO LIVE
                Exit For Loop
            ELSE IF    ${join_visible}
                ${element_found}=    Set Variable    JOIN
                Exit For Loop
            ELSE IF    ${registered_visible}
                ${element_found}=    Set Variable    INSCRITO
                Exit For Loop
            
            ELSE
                 Swipe By Percent    50    85    50    25    500
                 Wait Until Keyword Succeeds    5s    0.5s    Run Keyword If  '${LIVE}' or '${NO_LIVE}' or '${BUTTON_JOIN}' or '${REGISTERED}'  No Operation
            END
        END 

        IF    '${element_found}' == 'LIVE'
            Log To Console    Webinar on live.
            Element Should Be Visible    ${LIVE}
        ELSE IF    '${element_found}' == 'NO LIVE'
            Log To Console    Banner last webinar is now available.
            Wait Until Element Is Visible    ${NO_LIVE}
            Click Element    ${NO_LIVE}
            Sleep  5s
        ELSE IF    '${element_found}' == 'INSCRITO'
            Log To Console    User already registered.
            Element Should Be Visible    ${REGISTERED} 
        ELSE IF    '${element_found}' == 'JOIN'
            Log To Console    Unregistered user, starting registration.
            Click Element    ${BUTTON_JOIN}
            Wait Until Element Is Visible    ${MODAL_JOIN}
            Click Element    ${BUTTON_JOIN}
            Wait Until Element Is Visible    ${ADD_DATE_CALENDAR}
            Wait Until Element Is Visible    ${BODY_DATE_CALENDAR}
            Wait Until Element Is Visible    ${BTN_CALENDAR}  
        ELSE
            Fail    Neither banner on live or banner last webinar, or banner to Join or banner to register was found.
        END
    END



    # ===== Case 3: Friday =====
    IF    '${today}' == 'Friday'
        
        Page Should Not Contain Element    ${BUTTON_JOIN}
        Log To Console    No webinar available.
    END