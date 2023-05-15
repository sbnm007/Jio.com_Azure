*** Settings ***
Resource    ../Support/SupportPage_PO/TrackOrder_PO/RedirectionToTrackOrder.robot
Resource    ../Support/SupportPage_PO/TrackOrder_PO/JioSIM_and_JioFiber.robot
Resource    ../Support/SupportPage_PO/TrackOrder_PO/Devices.robot
Resource    ../Support/SupportPage_PO/TrackOrder_PO/eSIM_request.robot
Resource    ../Support/SupportPage_PO/TrackOrder_PO/UI_Verification.robot

*** Keywords ***
Visit Track Order Page of Jio.com
    Landing on Track Order Page

UI of 'Track Order' and 'Devices' Page Validation
    UI and content of Track order page Verification
    UI of 'Devices' Page Verification

UI of 'Esim Request' Page Validation
    UI of 'Esim Request' Page Verifcation

UI and Functionality of 'JioSIM and JioFiber' section
    Functionality of 'Track order' Page Verification
    UI of 'No Orders to Track' Page Verification
    UI and Functionality of OTP Page Verification
    UI of My orders Page Verification