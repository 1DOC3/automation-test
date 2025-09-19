*** Settings ***
Library           AppiumLibrary
Library           Collections
Resource        ../../resources/android/variables/user_activations.robot
Resource        ../../resources/android/variables/user_activations.robot
Resource        ../../resources/android/keywords/keywords.robot




*** Test Cases ***

verify charging time
    Measure app Loading Time  ${LOGIN_SUBMIT_CONTINUACONEMPRESA}   
    
    