*** Settings ***
Library         AppiumLibrary
Resource        ../resources/android/variables/user_activations.robot 
Resource        ../resources/android/keywords/keywords.robot

Suite Setup     Setting timeouts

Test Setup    Before Tests
#Test Teardown    After Tests


*** Test Cases ***
Prueba obtener código
    Do login with email

    