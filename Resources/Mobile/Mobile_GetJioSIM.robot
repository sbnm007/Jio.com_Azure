*** Settings ***
Resource                            Mobile_PO/GetJioSim_PO/RedirectionToGetJioSim.robot
Resource                            Mobile_PO/GetJioSim_PO/GetJioSim_Functionality.robot

*** Keywords ***
Visit Get JioSim page of Jio.com
    Landing on Get JioSim Page

Get JioSim Page Validation
    Get JioSim Page Verification

FAQ Section Validation
    FAQ Section Verification    ${GetJio-FAQ_URL}   GetJio-FAQ_Hyperlink 
