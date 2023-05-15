*** Settings ***
Library    SeleniumLibrary
Resource    FiberPage_PO/Recharge_PO/RedirectionToRecharge.robot
Resource    FiberPage_PO/Recharge_PO/FiberTab.robot
Resource    FiberPage_PO/Recharge_PO/MobileTab.robot

*** Keywords ***
Confirm UI and Redirection from Recharge Page
    Landing on Recharge Page  
    Confirm UI, redirection on clicking Mobile tab and toast on entering Invalid Mobile number

Confirm UI and redirection of View details button and Select plan page
    Landing on Recharge Page  
    Verify UI elements and accordian functionality of Select plan and View details page mobile tab

Confirm UI and functionality of ISD tab
    Landing on Recharge Page  
    Verify UI and Content elements of ISD tab

Confirm UI and functionality of International Roaming tab
    Landing on Recharge Page  
    Verify UI elements of International Roaming tab

Confirm UI and functionality of JioFiber Tab and toast on entering wrong JioFiber No
    Landing on Recharge Page  
    Verify UI of JioFiber Tab and toast on entering wrong JioFiber No

Confirm UI, redirection and functionality of View details button, Select plan page for JioFiber Tab
    Landing on Recharge Page  
    Verify UI elements,redirection and functionality of Select plan, View details and Payments page Fiber tab

Confirm UI and functionality of ISD tab for Fiber Tab
    Landing on Recharge Page  
    Verify UI and Content elements of ISD tab for Fiber Tab 
