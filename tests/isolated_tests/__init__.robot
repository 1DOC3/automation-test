*** Settings ***
Library           AppiumLibrary
Library           Collections

Resource        ../../resources/android/variables/user_activations.robot
Resource        ../../resources/android/keywords/keywords.robot

Suite Setup     Setting timeouts
Test Setup      Before Tests
Test Teardown   Close Application

