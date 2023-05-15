*** Settings ***
Library                              SeleniumLibrary
Resource                            ../../../../Resources/Local_keywords.robot


*** Keywords ***
Page Redirections
    [Arguments]         ${clicking_element}    ${Page_URL}    ${Page_Title_Locator}    ${Page_Title}  ${Screenshot}
    # Click on Section/ Sub Section
    Wait For And Click Element          ${clicking_element}

    # Verify URL
    URL Validation                      ${Page_URL}

    # Check Section is Underlined (active) and Section/ Page Name
    Wait Until Keyword Succeeds     0.3min   1s       Wait For And Verify Content         ${Page_Title_Locator}           ${Page_Title}
    Take Page Screenshot       ${Screenshot}


Check Sub-Header menu Redirections
    #Prepaid
    Page Redirections           xpath=//li[contains(@onclick,'mobility/prepaid-plans-home')]         https://www.jio.com/selfcare/plans/mobility/prepaid-plans-home/         xpath=//nav[@parent-attr="Mobile"]//li[@class='cursor-pointer active']//a          Prepaid                   Prepaid_page

    #Postpaid
    Page Redirections           xpath=//li[contains(@onclick,'mobility/postpaid-plans-home')]        https://www.jio.com/selfcare/plans/mobility/postpaid-plans-home/        xpath=//nav[@parent-attr="Mobile"]//li[@class='cursor-pointer active']//a          Postpaid                  Postpaid_page

    #International Services
    Page Redirections           xpath=//li[contains(@onclick,'international-services')]              https://www.jio.com/jcms/international-services/                              xpath=//nav[@parent-attr="Mobile"]//li[@class='cursor-pointer active']//a          International Services    InternationalServices_page

    #Get Jio SIM
    Page Redirections           xpath=//li[contains(@onclick,'/interest/sim/')]                      https://www.jio.com/selfcare/interest/sim/                              xpath=//nav[@parent-attr="Mobile"]//li[@class='cursor-pointer active']//a          Get Jio SIM               GetJioSim_Page

    #Recharge
    Page Redirections           xpath=//li[contains(@onclick,'/recharge/mobility')]                  https://www.jio.com/selfcare/recharge/mobility/                         xpath=//nav[@parent-attr="Mobile"]//li[@class='cursor-pointer active']//a          Recharge                  Recharge_Page

    #Pay Bills
    Page Redirections           xpath=//li[contains(@onclick,'/paybill/mobility')]                   https://www.jio.com/selfcare/paybill/mobility/                          xpath=//nav[@parent-attr="Mobile"]//li[@class='cursor-pointer active']//a          Pay Bills                 PayBills_Page


Check Header menu Redirections

    #Redirection of JioFiber
    Page Redirections           xpath=//nav[@id="firstlevel-nav"]//a[normalize-space()='JioFiber']          https://www.jio.com/fiber                xpath=//nav[@parent-attr="JioFiber"]//li[@class='cursor-pointer active']//a          Discover       JioFiber_Discover

    #Redirection of Business
    Page Redirections           xpath=//nav[@id="firstlevel-nav"]//a[normalize-space()='Business']          https://www.jio.com/business/            xpath=//li[@class='main-link ']//a                                                   Discover       Business_Discover
    
    #Redirection of Shop
    Page Redirections           xpath=//nav//a[normalize-space()='Shop']                                    https://www.jio.com/shop/homepage        xpath=//nav[@parent-attr="Shop"]//li[@class='cursor-pointer active']//a              Discover       Shop_Discover

    #Redirection of Apps
    Page Redirections           xpath=//nav[@id="firstlevel-nav"]//a[normalize-space()='Apps']              https://www.jio.com/jcms/apps/           xpath=//a[contains(@class,'active')]                                                 Apps           Apps_Page

    #Redirection of Support
    Page Redirections           xpath=//nav[@id="firstlevel-nav"]//a[normalize-space()='Support']           https://www.jio.com/help/home#/                      xpath=//a[contains(@class,'active')]                                                 Support        Support_Page
