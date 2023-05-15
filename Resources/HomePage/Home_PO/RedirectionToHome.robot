*** Settings ***
Library                              SeleniumLibrary
Resource                             ../../../Resources/Local_Keywords.robot


*** Keywords ***
Landing on Home Page

    #Sets screenshot directory
    Set Screenshot Directory                           ./Results/Home_Screenshots/
    
    #To Visit Jio.com
    Visit Jio.com 
    
    #Reading Data from Excel File
    Reading Data of Home Page from Excel
    
    #Clciking cross for Ad pop-up if visible
    ${visiblity}=   Run Keyword And Return Status   Wait Until Element Is Visible       xpath=//div[@class="intro_desktop"]//a[@aria-label='Close']//span[@class='j-icon']//*[name()='svg']
    IF     ${visiblity} == True
        Wait For And Click Element                     xpath=//div[@class="intro_desktop"]//a[@aria-label='Close']//span[@class='j-icon']//*[name()='svg']
    END
    
    #Takes Page Screenshot
    Take Page Screenshot                               HomePage

Port to Jio Page Redirection                                          
    Redirection On Clicking                            xpath=//a[contains(@onclick,'Port to Jio')]   https://www.jio.com/port-to-jio-mnp  PortToJio
 
Support Page Redirection                                                
    Redirection On Clicking                            xpath=//a[contains(@onclick,'Support')]    https://www.jio.com/help/home#/    Help & Support

    
