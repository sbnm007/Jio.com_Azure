*** Settings ***
Library                 SeleniumLibrary
Resource                ../../Common.robot
Resource                ../../Local_Keywords.robot
Resource                ../Apps_PO/Apps_FAQ.robot


*** Keywords ***
JioMeet App Tile UI/Content/Functional Verification and Redirection
    ${ROW}=        Decide Start and End                    2    18    JioMeet    Apps_Page
    Reading Data of Apps Page from Excel    ${ROW}
    Tile Verification 
    Click Get Now Button
    Jio App Information Page Redirection
    Banner Verification
    Content Validation
    Infographics Verificationn
    All Get Now Verification of App Information Page
    App Validate FAQ
    Go Back

JioChat App Tile UI/Content/Functional Verification and Redirection
    ${ROW}=        Decide Start and End                    2    18    JioChat    Apps_Page
    Reading Data of Apps Page from Excel    ${ROW}
    Tile Verification
    Click Get Now Button
    Jio App Information Page Redirection
    Banner Verification
    Content Validation
    Infographics Verificationn
    All Get Now Verification of App Information Page
    App Validate FAQ
    Go Back



JioCall App Tile UI/Content/Functional Verification and Redirection
    ${ROW}=        Decide Start and End                    2    18    JioCall    Apps_Page
    Reading Data of Apps Page from Excel    ${ROW}
    Tile Verification
    Click Get Now Button
    Jio App Information Page Redirection
    Banner Verification
    Content Validation
    Infographics Verificationn
    All Get Now Verification of App Information Page
    App Validate FAQ
    Go Back

