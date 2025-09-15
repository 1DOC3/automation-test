*** Settings ***
Library           AppiumLibrary
Library           Collections
Resource        ../resources/android/variables/user_activations.robot
Resource        ../resources/android/variables/user_active_breaks.robot
Resource        ../resources/android/keywords/keywords.robot
Resource    ../resources/android/keywords/keywords.robot



*** Test Cases ***

verify charging time
    Measure Home Loading Time  ${Banner_not_active_break}  tutaina@yopmail.com
    
    