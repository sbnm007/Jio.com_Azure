*** Settings ***
Library    SeleniumLibrary
Resource    FiberPage_PO/Get_JioFiber_PO/RedirectionToGetJioFiber.robot
Resource    FiberPage_PO/Get_JioFiber_PO/Get_JioFiber.robot
Resource    FiberPage_PO/Get_JioFiber_PO/Verify_OTP.robot
Resource    FiberPage_PO/Get_JioFiber_PO/Installation_address.robot
Resource    FiberPage_PO/Get_JioFiber_PO/Installation_address_map.robot

*** Keywords ***
Verify and Validate Get JioFiber page
    Landing on Get JioFiber Page
    Get JioFiber Main page

Verify and Validate Verify OTP page
    Landing on Get JioFiber Page
    Verify OTP page

Verify and Validate Installation address page
    Landing on Get JioFiber Page
    Installation Address page

Verify and Validate Installation address map page
    Landing on Get JioFiber Page
    Installation address map page

Verify and Validate If Maximum attempts toast appears
    Landing on Get JioFiber Page
    Verify if Maximum attempts toast appears on Generating OTP for the third time
