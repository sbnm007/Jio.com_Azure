*** Settings ***
Resource                               ../../../Common.robot
Variables                              ../../../../Tests/Support/Discover_Variables.yaml
Resource                               ../../../Excel_activity.robot


*** Keywords ***
UI and Content of MyJio Resolving queries just got easier verification
    #92452
    #MyJio Resolving queries just got easier section verification
    Scroll To                               ${resolvingqueries_section}
    Section Verification                    ${resolvingqueries_section}        ${Resolvingqueries_text[0]}
    #MyJio logo
    Logo Verification                       xpath://img[@src='https://jep-asset.akamaized.net/jio/svg/logo/myjio-n.svg'] 
    #Myjio Text 
    Text Verification                       xpath://div[@class='j-contentBlock__title j-heading j-text-heading-xs']    ${Resolvingqueries_text[0]} 
    #Resolving queries just got easier  heading
    Text Verification                       xpath://h2[normalize-space()='Resolving queries just got easier']          ${Resolvingqueries_text[1]} 
    #Subtext under heading 
    Text Verification                       xpath://div[@class='j-color-primary-grey-80 j-contentBlock__description j-text-body-l l-breakpoint--desktop']    ${Resolvingqueries_text[2]} 
    #QR code 
    Wait For And Verify Element             xpath://img[@src="https://jep-asset.akamaized.net/jiostaticresources/v05/images/barcode-myjio-new.png"]

