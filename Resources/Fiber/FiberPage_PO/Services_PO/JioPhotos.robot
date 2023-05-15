*** Settings ***
Library                SeleniumLibrary
Library                Dialogs
Resource               ../../../Common.robot
Resource               ../Services_PO/RedirectionToSevices.robot
Resource               ../../../Excel_Activity.robot
Resource               ../../../Local_Keywords.robot
Variables              ../../../../Tests/Fiber/FServices_Variables.yaml



*** Keywords ***
JioPhotos Page
    Verify the UI & Contents of page appears clicking 'learn more' of 'JioPhotos'
    Verify redirection of elements present on page which appears after clicking 'learn more' of 'JioPhotos'
    

Verify the UI & Contents of page appears clicking 'learn more' of 'JioPhotos'
   # Click On 'Learn More' Button Present On 4th Card.
    Wait For And Click Element          xpath://*//div[contains(@class,"card-vertical")][4]//button
  
    # Verify Whether Banner Is Present Or Not.
    Wait For And Verify Element         xpath://section[contains(@aria-label,"JioPhotos") and @role="promo-banner"]

    # Verify Whether Heading 'JioPhotos' Is Present Or Not.
    Wait For And Verify Element         xpath://h5[text()="JioPhotos"]

    # Verify Whether Subtext Below Heading 'JioPhotos' Is Present Or Not.
    Wait For And Verify Element         xpath://button[normalize-space()="Get JioFiber"]//ancestor::div[contains(@class,"body")]

    # Verify Whether Button 'Get JioFiber' Is Present Or Not.
    Wait For And Verify Element         xpath://button[normalize-space()="Get JioFiber"]
    
    # Verify Section With Heading 'Making photo viewing extraordinary with JioPhotos' Is Present Or Not.
    Wait For And Verify Element         xpath://*[@aria-label="Making photo viewing extraordinary with JioPhotos"]
    
    # Verify The Presence Of 'More From Jio' Section
    Wait For And Verify Element         xpath://section[@aria-label="More from Jio"]

    # Verify The Presence Of 'FAQs' Section
    Wait For And Verify Element         xpath://section[@aria-label="faqs section"]

Verify redirection of elements present on page which appears after clicking 'learn more' of 'JioPhotos'
    # Click On Button, Verify Redirection On Mentioned URL & Capture And Save Screenshot On Mentioned Directory
    Redirection On Clicking             xpath://section[contains(@aria-label,"JioPhotos") and @role="promo-banner"]  https://www.jio.com/selfcare/interest/fiber/  BannerRedirection
    
    # Click On Button, Verify Redirection On Mentioned URL & Capture And Save Screenshot On Mentioned Directory
    Redirection On Clicking             xpath://button[normalize-space()="Get JioFiber"]   https://www.jio.com/selfcare/interest/fiber/  ButtonRedirection
   
    # Get The Count Of Tiles Present Under 'Making photo viewing extraordinary with JioPhotos' Section
    ${img_count} =  Get Element Count   xpath://*[@aria-label="Making photo viewing extraordinary with JioPhotos"]//img
    log to console     ${img_count}
    # Compare Whether The Number Of Tiles Given Are According To Testcase Or Not.
    IF  ${img_count} != 9

        # Fail The Testcase If The Condition Doesn't Met.
        Fail  msg=Images are more or less.
    END
    
    # Redirection of Best Selling JioFiber Accessories section.
    Verify redirection of Best Selling JioFiber Accessories section  3

    # Get The Number Of Banners Matching The Provide Xpath.
    ${promo_banners} =  Get Element Count  xpath://section[@aria-label="More from Jio"]//section[@role="promo-banner"]
    log to console    ${promo_banners}     
    # Loop To Iterate For Each Banner.
    FOR  ${i}  IN RANGE  ${promo_banners}
        
        # Check The Redirection Each Banner Present.
        Redirection On Clicking            xpath://section[@aria-label="More from Jio"]//section[contains(@class,"h-100")][${i+1}]//section[@role="promo-banner"]  https://www.jio.com/selfcare/interest/fiber/  MBanner
    END

    # Scroll Down to FAQs Section.
    Scroll To                              xpath://section[@aria-label="faqs section"]//div[@class="j-accordion-panel"][5]//*[name()="path"]

    # Get All The Accordions Present.
    @{accordions} =  Get WebElements       xpath://section[@aria-label="faqs section"]//div[@class="j-accordion-panel"]//*[name()="path"]
    ${index} =  Set Variable  1

    # Loop To Iterate For Each Accordion
    FOR  ${accordion}  IN  @{accordions}
       
        # Scroll Down to accordion and click on it to open it.
        Scroll To and click  ${accordion}

        # Check whether Opened Accordion Is '-' Or Not.
        Wait For And Verify Element         xpath://section[@aria-label="faqs section"]//*[name()="path" and contains(@d,"M3.293")]

        # Again Click On The Same Accordion To Close It.
        Scroll To and click                 xpath://section[@aria-label="faqs section"]//div[contains(@class,"j-accordion-panel")][${index}]//button

        # Check Whether The Accordion Close Contains '+' Or Not.
        Wait For And Verify Element         xpath://section[@aria-label="faqs section"]//div[@class="j-accordion-panel"][${index}]//*[name()="path" and contains(@d,"M20")]

        # To Increment The Value Of Index
        ${index} =  Evaluate  ${index} + 1
    END
