*** Settings ***
Library    SeleniumLibrary
Resource    FiberPage_PO/Paybills_PO/RedirectionToPaybills.robot
Resource    FiberPage_PO/Paybills_PO/Paybills.robot
Resource    ../Excel_Activity.robot
Variables    ../Common_Variables.yaml

*** Keywords ***
Confirm UI of 'i',valid & invalid Prepaid JioFiber number or Amount Toast/popup
    Landing on Pay Bills Page
    Confirm UI of 'i',valid & invalid Prepaid JioFiber number or Amount Toast/popup validation

Verify functionalities of Pay Bills Page Mobile tab
    Landing on Pay Bills Page
    Confirm user is getting toast on entering Non-jio/COCP/Prepaid number in Mobile Tab
    
Confirm redirection and UI of Pay for inactive account page
    Landing on Pay Bills Page
    Confirm redirection,UI of Pay for inactive account page on clicking 'here'
