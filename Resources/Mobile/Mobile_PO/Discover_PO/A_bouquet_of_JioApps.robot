*** Settings ***
Library                             SeleniumLibrary
Resource                          ../../../Local_keywords.robot


*** Keywords ***
#A Bouquet of JioApps Main Banner
A Bouquet of JioApps Section Validation
    Scroll To                                    xpath=//h3[contains (text(),'A bouquet of Jio apps')]
    
    #Heading 
    Banner Content Verification                  xpath=//h3[contains (text(),'A bouquet of Jio apps')]    A bouquet of Jio apps    xpath=//img[@alt='Jio apps']    xpath=//button[contains (text(),'View all Jio apps')]    BouquetofJioapps
    
    #Subtext
    Text verification                            xpath=//div[contains (text(),'With possibilities at your fingertips, digital feels magical.')]    With possibilities at your fingertips, digital feels magical.

    #View All Apps Button Redirection
    Redirection On Clicking                      xpath=//button[contains (text(),'View all Jio apps')]     https://www.jio.com/jcms/apps/       Disc_AppsPage
    
    #Banner Image Verification
    Image Verification                           xpath=//img[contains(@src,'/jioapps-mob-hmpg-desk-new.png')]

