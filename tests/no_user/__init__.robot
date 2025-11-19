*** Settings ***
Library           AppiumLibrary
Library           Collections

Resource        ../../resources/android/variables/user_activations.robot
Resource        ../../resources/android/keywords/keywords.robot


Suite Setup      Before Tests
Suite Teardown   Close Application
Test Teardown    Run Keyword And Ignore Error  Return To Home Public