*** Settings ***
Library    SeleniumLibrary
Resource    FiberPage_PO/Prepaid_PO/RedirectionToPrepaid.robot
Resource    FiberPage_PO/Prepaid_PO/NowUpgrade_Section.robot
Resource    FiberPage_PO/Prepaid_PO/AlreadyAJioFiber_Section.robot
Resource    FiberPage_PO/Prepaid_PO/Pre_UIVerification.robot  
Resource    FiberPage_PO/Prepaid_PO/FAQ_Verification.robot

*** Keywords ***
Visit JioFiber Prepaid Page on Jio.com
    Landing on Prepaid Page

Prepaid page UI Verification
    Prepaid page UI Validation

Now upgrade your JioFiber plan JioFiber Section
    Now upgrade your JioFiber plan anytime UI & Content Validation 

Landing on FAQ Section and confirming FAQ answers
    Reading Data of Prepaid Fiber Page from Excel
    Validating the FAQ Section and confirming the redirections

Already a JioFiber Users? - Redirection of all buttons
    Already a JioFiber user?

Verify Monthly Subscription Page
    Monthly Subscription Page Validation

Verify Quarterly Subscription Page
    Quarterly Subscription Page Validation

Verify Semi-Annual Subscription Page
    Semi-Annual Subscription Page Validation

Verify Annual Subscription Page
    Annual Subscription Page Validation

Verify ISD Subscription Page
    ISD Subscription Page Validation

Verify Top-up Subscription Page
    Top-up Subscription Page Validation

Verify Data Sachet Subscription Page
    Data Sachet Subscription Page Validation
