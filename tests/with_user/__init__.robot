*** Settings ***
Library           AppiumLibrary
Library           Collections

Resource        ../../resources/android/variables/user_activations.robot
Resource        ../../resources/android/keywords/keywords.robot

Suite Setup     Initialize Session
Suite Teardown   Close Application
Test Teardown    Return To Home



