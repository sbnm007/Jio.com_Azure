*** Settings ***
Resource    ../Support/SupportPage_PO/LocateUs_PO/RedirectionToLocateUs.robot
Resource    ../Support/SupportPage_PO/LocateUs_PO/ServiceCentres.robot
Resource    ../Support/SupportPage_PO/LocateUs_PO/Hotspot.robot
Resource    ../Support/SupportPage_PO/LocateUs_PO/Stores.robot


*** Keywords ***
Visit LocateUs Support Page of Jio.com
    Landing on Locate Us Page

UI and content Of 'Stores', 'Services Centers' and 'Hotspots'
    UI and Content of 'Store Details' Page Validation
    Locate Us Search bar and Suggestions validation
    Autofetch location content validation
    UI and content of 'service center' page validation
    UI and content of 'Hotspot' Page validation

UI and content of 'Hotspot' Page validation
    UI and content of 'Hotspot' Page verification

UI and Content of 'Store Details' Page Validation
    UI and Content of 'Store Details' Page Verification

UI and content of 'service center' page validation
    UI and content of 'service center' page verification

Locate Us Search bar and Suggestions Validation
    Locate Us Search bar and Suggestions Verification

Autofetch location content validation
    Check List view and Map View are autofetched in Stores
    Check List view and Map View are autofetched in Service Centers
    Check List view and Map View are autofetched in Hotspots





    






