*** Settings ***
Library                              SeleniumLibrary
Resource                            ../../../../Resources/Local_keywords.robot


*** Keywords ***
Redirection to Mobile Page
    Visit Jio.com And Goto                                  ${Mobile_URL}      
    URL Validation                                          https://www.jio.com/mobile
    Set Screenshot Directory                                ./Results/Mobile/Header_Screenshots/
    Take Page Screenshot                                    MobilePage_Loaded
    # Reading Data From Excel
    Reading Data of Mobile Header from Excel 


Mobile Page Verification
    # Verify Mobile page is loaded
    Wait For And Verify Content              xpath=//a[contains(@class,'j-link-active')]                                  Mobile
    # Verify Dicover section is loaded
    Wait For And Verify Content              xpath=//nav[@parent-attr="Mobile"]//li[@class='cursor-pointer active']//a    Discover
    #Element Attribute Value Should Be       xpath=//*[@id="headerAnimate"]/section[2]/section/nav[1]/ul/li[1]       class     cursor-pointer active
    