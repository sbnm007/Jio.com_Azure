*** Settings ***
Library                 SeleniumLibrary
Resource                ../../Common.robot
Resource                ../../Local_Keywords.robot
Resource                ../Apps_PO/Apps_FAQ.robot 


***Keywords***
#------APPS VERIFICATION-----

JioPages App Tile UI/Content/Functional Verification and Redirection
    ${ROW}=        Decide Start and End                    2    18    JioPages    Apps_Page
    Reading Data of Apps Page from Excel    ${ROW}
    Tile Verification
    Click Get Now Button
    Jio App Information Page Redirection
    Banner Verification
    Content Validation
    Infographics Verificationn
    All Get Now Verification of App Information Page
    Checking Video Section
    App Validate FAQ
    Go Back

JioCloud App Tile UI/Content/Functional Verification and Redirection
    ${ROW}=        Decide Start and End                    2    18    JioCloud    Apps_Page
    Reading Data of Apps Page from Excel    ${ROW}
    Tile Verification
    Click Get Now Button
    Jio App Information Page Redirection
    Content Validation
    Infographics Verificationn
    All Get Now Verification of App Information Page
    App Validate FAQ
    Go Back

JioSecurity App Tile UI/Content/Functional Verification and Redirection
    ${ROW}=        Decide Start and End                    2    18    JioSecurity    Apps_Page
    Reading Data of Apps Page from Excel    ${ROW}
    Tile Verification
    Click Get Now Button
    Jio App Information Page Redirection
    Content Validation
    Infographics Verificationn
    All Get Now Verification of App Information Page
    App Validate FAQ
    Go Back
