*** Settings ***
Library         AppiumLibrary
Resource        ../resources/android/variables/user_activations.robot 
Resource        ../resources/android/keywords/keywords.robot
Library    FakerLibrary

Suite Setup     Setting timeouts

Test Setup    Before Tests
#Test Teardown    After Tests

*** Test Cases ***
Unopened inspiration
    Do login with email    prueba0023@yopmail.com
    Sleep    8s
    Permission notifications
    Terms and conditions
    Alarms & Reminders