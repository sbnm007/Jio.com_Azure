*** Settings ***
Resource                             ../../../Common.robot
Variables                           ../../../../Tests/Support/ContactCentre_Variables.yaml
Resource                             ../../../Excel_Activity.robot
Resource                            ../../../Local_Keywords.robot

*** Keywords ***

#92656 TestCase
Contact Centre section is visible on Support tab Verification
    #Underline under Contact Centre subheading
    CSS Verification                    xpath=//li[@class='cursor-pointer active']    border-bottom    3px solid rgb(232, 232, 252)
    URL Validation                      ${contactURL}     
    #Take Page Screenshot                CC_section

    Verify UI and content of Contact Centre page
    UI and content of the search bar dropdown & Connect with Us Section Verification
    Confirm on entering any random string suggested searches are shown
    User can switch from one subheading to the other Verification
    On clicking the Email subheading the form appears Verification
    User is redirected to confirmation popup after clicking Submit button Verification
    On clicking the Call subheading particular options are shown there Verification
    Validate the functionality of all accordion of Call section
    verify UI and content of the Appellate Authority popup
    

#92657 TestCase
Verify UI and content of Contact Centre page
    
    #Welcome to Jio Support heading
    Text Verification                 ${jioSupport}         ${welcome}
    #Font Verification
    CSS Verification                  ${jioSupport}         font-weight    900

    #Support search bar
    Wait For And Verify Element       xpath=//input[@id='supportSearchtxt']       

    #Connect with us heading
    Text Verification                 ${connect_with_us}    ${connect}
    #Font Verification
    CSS Verification                  ${connect_with_us}    font-weight    900

    #Subheading Chat
    Text Verification                 ${chat}               Chat    
    #Font Verification
    CSS Verification                  ${chat}               font-weight    700

    #Reach out on WhatsApp heading
    Text Verification                 ${whatsapp}           ${wapp}     
    #Font Verification               
    CSS Verification                  ${whatsapp}           font-weight    700

    #Chat with JioCare
    Text Verification                 ${jiocare}            ${jc}    
    #Font Verification
    CSS Verification                  ${jiocare}            font-weight    700

    #Email subheading 
    Text Verification                 ${email}              Email
    #Font Verification 
    CSS Verification                  ${email}              font-weight    700

    #Call subheading
    Text Verification                 ${call}               Call  
    #Font Verification 
    CSS Verification                  ${call}               font-weight    700

    #Chat Now button
    Button Verification               xpath=//button[@class="j-button j-button-size__medium primary icon-primary icon-primary-inline"]    

    #Footer Verification
    Section Verification              xpath=//div[@id='sites-footer-container']    Footer   

#92658 TestCase
UI and content of the search bar dropdown & Connect with Us Section Verification 

    Scroll To                         xpath=(//div[contains(@class,'l-layout--max-width')])[1]
    #clicking on search bar
    Wait For And Click Element        xpath=//input[@id='supportSearchtxt']
    #Quick links
    Text Verification                 xpath=//div[@id='quicklink-list-id-support']//div[contains(@class,'searchresult-header')][normalize-space()='Quick links']    ${text}[7]
    #Suggested searches
    Text Verification                 xpath=//div[@id='suggested-list-id-support']//div[contains(@class,'searchresult-header')][normalize-space()='Suggested searches']    Suggested searches
    #verifying suggestion in search box   
    FOR    ${j}    IN RANGE    0   7
        Text Verification               xpath=(//div[@class="item-text"])[${j}+1]    ${text}[${j}]  
    END
#92659 TestCase
Confirm on entering any random string suggested searches are shown
    
    #Enter text in search box
    Wait For And Input Text           xpath=//input[@id='supportSearchtxt']    jio
    
    #Below script is written when suggested searches gets changed
    # ${text}=    Get Text    xpath=//ul[@id="suggestions-list-support"]
    # Write Excel Cell  row_num=2  col_num=1  value=${text}  sheet_name=Support_ContactCenter
    # Save Excel Document  filename=Resources/JioWeb.xlsx
    
    #Get all the text that appears after searching Jio 
    Text Verification                xpath=//ul[@id="suggestions-list-support"]    ${search_text}

#92660 TestCase
User can switch from one subheading to the other Verification
  
    Scroll To                         xpath=(//span[@class="sp--huge pd--top j-Space__vertical j-Space"])[2]
    #Email Verification                
    Wait For And Click Element        ${email}
    #Redirection Verification (Underline Verification)
    CSS Verification                  xpath=//li[@onclick="openCity(event, 'appellateEmailContent')"]//a[@role='tab']    position    relative
    
    #Call Verification
    Wait For And Click Element        xpath=//li[@onclick="openCity(event, 'appellateCallContent')"]
    #Redirection Verification (Underline Verification)
    CSS Verification                  xpath=//li[@onclick="openCity(event, 'appellateEmailContent')"]//a[@role='tab']    position    relative

#92661 TestCase    
On clicking the Email subheading the form appears Verification

    Scroll To                         xpath=(//span[@class="sp--huge pd--top j-Space__vertical j-Space"])[2]
    #Go to Email section
    Wait For And Click Element        ${email}
    #Email Subheading text
    Text Verification                 xpath=//div[@class='j-color-primary-grey-100 j-text-body-m-bold']    ${any}

    #Textfields Verification
    #Name
    Text Verification                 xpath=//label[normalize-space()='Name']    Name
    #Jio Number/Registered Mobile Number
    Text Verification                 xpath=//label[normalize-space()='Jio Number/Registered Mobile Number']    ${jn}
    #Email Address
    Text Verification                 xpath=//label[normalize-space()='Email Address']    ${text}[8]    
    #Select Product/Service
    Text Verification                 xpath=//*[@id="type-id-0"]/option[1]    ${product} 
    #Subject
    Text Verification                 xpath=//label[normalize-space()='Subject']    Subject
    #Describe your query or concern in details
    Text Verification                 xpath=//label[normalize-space()='Describe your query or concern in details']    ${describe}
    #Upload document
    Text Verification                 xpath=//label[normalize-space()='Upload document']    ${text}[9]    
    #Submit button 
    Text Verification                 xpath=//button[@id='check']    Submit    
    Wait For And Verify Element       xpath=//button[@id='check'] 

    #92662 TestCase
    #Click submit button
    Wait For And Click Element        xpath=//button[@class="j-button j-button-size__medium primary submit-btn"]
    #Please enter all fields error toast
    Text Verification                 xpath=//div[@id='all-field-err']    ${please}   

#92663 TestCase
User is redirected to confirmation popup after clicking Submit button Verification
    
    Scroll To                         xpath=(//span[@class="sp--huge pd--top j-Space__vertical j-Space"])[2]
    
    #Click Email icon
    Wait For And Click Element        ${email}
    
    #Enter Customer Name
    Wait For And Input Text           xpath=//input[@id='customerName']    ABCD
    
    #Enter Number
    Wait For And Input Text           xpath=//input[@id='number']    ${text}[10]
    
    #Enter Email id
    Wait For And Input Text           xpath=//input[@id='userEmail']    ${emailID}
    Scroll To                         xpath=(//span[@class="sp--huge pd--top j-Space__vertical j-Space"])[2]
    
    #Select Product and Services
    Wait For And Click Element        xpath=//select[@id='type-id-0']
    
    #1st option in product and services
    Wait For And Click Element        xpath=//option[@value='Jio Mobile']
    
    #Subject Field
    Wait For And Input Text           xpath=//input[@id='subj']    subject
    
    #Describe your query or concern in details
    Wait For And Input Text           xpath=//textarea[@id='eMailBody']    ${description}


    Scroll To                         xpath=(//span[@class="sp--huge pd--top j-Space__vertical j-Space"])[2]

    #Submit Button
    Wait For And Click Element        xpath=//button[@class="j-button j-button-size__medium primary submit-btn"]

    
    Wait For And Verify Element       xpath=//button[@class='j-button j-button-size__medium tertiary icon-primary icon-only']//i[@class='j-button-icon']//*[name()='svg']    
    
    
    Wait For And Verify Element       xpath=//div[@class='j-contentBlock__caption']//span[@class='j-icon']//*[name()='svg'] 

    #Thank You Text
    Text Verification                 xpath=//h5[normalize-space()='Thank you']    Thank you

    #pop up message
    Text Verification                 xpath=//p[contains(text(),'Your message has been submitted successfully. We w')]    ${msg}
    
    #Done button
    Wait For And Verify Element       xpath=//button[normalize-space()='Done']    
    
    #close button
    Wait For And Click Element        xpath=//button[@class='j-button j-button-size__medium tertiary icon-primary icon-only']//i[@class='j-button-icon']

#92664 TestCase
On clicking the Call subheading particular options are shown there Verification

    Scroll To                         xpath=(//span[@class="sp--huge pd--top j-Space__vertical j-Space"])[2]
    Wait For And Click Element        ${call}
    #Jio Mobile
    Text Verification                 xpath=//button[@class='mobile j-accordion-panel__header-trigger']//div[@class='j-listBlock__block-text']    ${text}[11]
    #JioFiber
    Text Verification                 xpath=//div[@class='j-text j-text-body-s-bold'][normalize-space()='JioFiber']    ${text}[12]
    #JioBusiness
    Text Verification                 xpath=//div[@class='j-text j-text-body-s-bold'][normalize-space()='JioBusiness']    JioBusiness
    #JioPhone, JioFi & LYF Mobile
    Text Verification                 xpath=//div[contains(text(),'JioPhone, JioFi & LYF Mobile')]    ${jp}
    #Online Shopping
    Text Verification                 xpath=//div[contains(text(),'Online Shopping')]    ${text}[13]
    #Appellate Authority
    Text Verification                 ${aa}        ${text}[14]

#92665 TestCase
Validate the functionality of all accordion of Call section
    Click the accordion

Click the accordion
    FOR    ${i}  IN RANGE    5    10
        Scroll To                      xpath=(//span[contains(@aria-label,'button')])[${i}]
        #Accordion opens up and text inside is shown
        Wait For And Click Element     xpath=(//span[contains(@aria-label,'button')])[${i}]
        #Accordion closes and the text is hidden
        Wait For And Click Element     xpath=(//span[contains(@aria-label,'button')])[${i}]
    END
    
    #92666 TestCase
    Scroll To                          xpath=(//span[@class="sp--huge pd--top j-Space__vertical j-Space"])[2]
    Wait For And Click Element         ${aa}

#92667 TestCase
verify UI and content of the Appellate Authority popup

    Wait For And Verify Element        xpath=//*[@id="modal-get-fiber"]/div/header/button
    #Appellate Authority text Verification
    Text Verification                  xpath=//h3[normalize-space()='Appellate Authority']    ${text}[14]
    Wait Until Element Is Visible      xpath=//div[contains(@class,'j-color-primary-grey-80 j-text-body-xs')]
 
    #Pop up Appellate Authority Heading Verification
    Text Verification                  xpath=//p[@class='mb-3']    ${aa_heading}[1]
    #Pop up Appellate Authority Text Verification
    Text Verification                  xpath=//p[contains(text(),'While making an appeal to the Appellate Authority,')]    ${aa_heading}[2]       

    FOR  ${i}  IN RANGE    1    4
        Text Verification              xpath=//ul[@class="mb-3 content-list"]//li[${i}]    ${aa_text}[${i}]
    END
    Wait For And Click Element         xpath=//div[@class='j-modal-body']//div[@class='txt-align--left']//div//div[@class='j-field input-dropdown input-has-suffix']
    #Dropdown of state verification
    FOR  ${j}  IN RANGE    1    29
        Text Verification              xpath=//select[@class="myselect"]//option[${i}]    ${aa_state}[${i}]
    END