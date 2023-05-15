*** Settings ***
Library                              SeleniumLibrary
Resource                             ../../../Common.robot
Resource                             ../TrackOrder_PO/RedirectionToTrackOrder.robot
Variables                            ../../../../Tests/Support/TrackOrder_Variables.yaml


*** Keywords ***
# 92610
UI and content of Track Order Page Verification
    # Track Order Heading
    Text Verification              xpath=//h2[normalize-space()='Track order']                                       Track order
    # Subheading
    Text Verification              xpath=//div[normalize-space()='Choose the order type that you wish to track.']    ${subheading}
    # Jio SIM and Jio Fiber Option
    Text Verification              xpath=//div[contains(text(),'Jio SIM and JioFiber')]                              Jio SIM and JioFiber
    Wait For And Verify Element    xpath=//a[@aria-label="Jio SIM and JioFiber"]//div[@class="j-listBlock__main"]
    # Devices Option
    Text Verification              xpath=//div[@class='j-text j-text-body-s'][normalize-space()='Devices']           Devices
    Wait For And Verify Element    xpath=//a[@aria-label='Devices']//div[@class='j-listBlock__main']
    # eSIM request Option
    Text Verification              xpath=//div[contains(text(),'eSIM request')]                                      eSIM request
    Wait For And Verify Element    xpath=//a[@aria-label='eSIM request']//div[@class='j-listBlock__main']
    # Image Verification
    Image Verification             xpath=//img[@class='l-radius--xl w-100']