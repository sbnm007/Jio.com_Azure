*** Settings ***
Resource                                        ../../../../Local_Keywords.robot

*** Keywords ***
Checking UI of Accessories Product Page
    Checking Device Name
    Confirm redirection of the breadcrumbs hyperlinks
    Checking Image Carousel
    Checking "About Item"
    Checking Pincode
    Checking Quantity
    Checking Policy
    Run Keyword And Continue On Failure          Checking "View All Specifications"    #Run Keyword And Continue On Failure required because of Device specific issue
    
    SlideShow Gallery Verification

Checking UI and functionality of Pincode and Delivery Section
    Pincode Verification
    Confirm the functionality of Click here text

Checking Accordion Functionality
    Open All Accordions