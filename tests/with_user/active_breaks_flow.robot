*** Settings ***
Library           AppiumLibrary
Library           Collections
Resource        ../../resources/android/variables/user_activations.robot
Resource        ../../resources/android/keywords/keywords.robot
Resource        ../../resources/android/keywords/Keywords_breaks_flow.robot
Resource        ../../resources/android/variables/user_active_breaks.robot





*** Test Cases ***
Active pause banner validations
    ${element_found}=    Set Variable    NONE
    FOR    ${i}    IN RANGE  5
            ${Banner_not_break}=    Run Keyword And Return Status    Element Should Be Visible     ${Banner_not_active_break}
            ${Banner}=    Run Keyword And Return Status    Element Should Be Visible    ${Active_banner}

            IF   ${Banner_not_break}
                ${element_found}=    Set Variable    NOT_BRAKE
                Exit For Loop
            ELSE IF   ${Banner}
                ${element_found}=    Set Variable    YES_BRAKE
                Exit For Loop
            ELSE
                 Swipe By Percent    50    85    50    25    500
                 Wait Until Keyword Succeeds    7s    0.5s    Run Keyword If    '${Banner_not_break}' or '${Banner}'    No Operation
            END
        END

        IF    '${element_found}' == "NOT_BRAKE"
                Log To Console  Banner not active break founded
                Not active break
                 
            ELSE IF    '${element_found}' == 'YES_BRAKE'
                Log To Console  Banner active break founded
                Active break
                  
            ELSE
            Pass Execution    Neither banner active or not active found
        END
    
    
 


