*** Settings ***
Resource                           ../../../../Local_Keywords.robot

*** Keywords ***
Checking UI of SmartDevices Product Page
    Checking Device Name
    Confirm redirection of the breadcrumbs hyperlinks
    Checking Image Carousel
    Checking "About Item"
    Checking Pincode
    IF  ${i} != 5
        Checking Colour
    END
    Checking Quantity
    Checking Policy
    Checking "View All Specifications"
    SlideShow Gallery Verification

Checking UI and functionality of Pincode and Delivery Section
    Pincode Verification
    Confirm the functionality of Click here text

Checking Accordion Functionality
    Open All Accordions