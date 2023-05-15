*** Settings ***
Library                             SeleniumLibrary
Library                             ExcelLibrary
Library                             String

*** Keywords ***
#Shops page
#Shops page
Reading Most Popular/Value Data from Excel
    [Arguments]    ${ROW}    ${Sheet}
    ${Prod_info}=                            Read Excel Cell    row_num=${ROW}    col_num=2    sheet_name=${Sheet}
    ${Prod_info}=                            String.Split String    ${Prod_info}    ;

    Set Global Variable                      ${Prod_info}    ${Prod_info}

Reading Data of Shops Page from Excel
        
    [Arguments]    ${row}    ${col}    ${sheetName}
    ${option} =                              Read Excel Cell    ${row}    ${col}    ${sheetName}
    RETURN    ${option}     
        
Reading Filter Option Data of Smart Devices Page from Excel
    [Arguments]       ${ROW}    ${Sheet}
    ${Opts}=                                 Read Excel Cell    row_num=${ROW}    col_num=2    sheet_name=${Sheet}
    ${Opts}=                                 String.Split String    ${Opts}    ;
    Set Global Variable                      ${Opts}
    
Reading Data of Add to Cart Pop Up from Excel
    ${Pop_up}=                               Read Excel Cell    2    1    ${Excel_Sheet_Name_AddtoCart}
    ${Pop_up}=                               String.Split String    ${Pop_up}    ;
    Set Global Variable                      ${Pop_up}
    Log To Console                           ${Pop_up}

Reading Data of Add to Cart Personal Details
    ${Error_Text}=                           Read Excel Cell    5    1    ${Excel_Sheet_Name_AddtoCart}
    ${Error_Text}=                           String.Split String    ${Error_Text}    ;
    Set Global Variable                      ${Error_Text}
    Log To Console                           ${Error_Text}

    ${Delivery_Data}=                        Read Excel Cell    8    1    ${Excel_Sheet_Name_AddtoCart}
    ${Delivery_Data}=                        String.Split String    ${Delivery_Data}    ;
    Set Global Variable                      ${Delivery_Data}
    Log To Console                           ${Delivery_Data}

# vivek
#Shops page
Read Data of Trending right now section from Excel
    
    ${Trending_now}=                        Read Excel Cell    row_num=12    col_num=2    sheet_name=${Excel_Sheet_Name_Discover}
    Set Global Variable                     ${Trending_now}    ${Trending_now}
    ${Our_pick}=                            Read Excel Cell    row_num=13    col_num=2    sheet_name=${Excel_Sheet_Name_Discover}
    Set Global Variable                     ${Our_pick}    ${Our_pick}
    ${Name_of_product}=                     Read Excel Cell    row_num=14    col_num=2    sheet_name=${Excel_Sheet_Name_Discover}
    ${Name_of_product}=                     String.SplitString    ${Name_of_product}    separator=;
    Set Global Variable                     ${Name_of_product}    ${Name_of_product}
    ${Price}=                               Read Excel Cell    row_num=15    col_num=2    sheet_name=${Excel_Sheet_Name_Discover}
    ${Price}=                               String.SplitString    ${Price}    separator=;
    Set Global Variable                     ${Price}    ${Price}

Read Data of Always Find New Offers section from Excel
    
    ${Jio_Extender6_Section}=               Read Excel Cell    row_num=18    col_num=2    sheet_name=${Excel_Sheet_Name_Discover}
    Set Global Variable                     ${Jio_Extender6_Section}    ${Jio_Extender6_Section}
    ${Now_enjoy}=                           Read Excel Cell    row_num=19    col_num=2    sheet_name=${Excel_Sheet_Name_Discover}
    Set Global Variable                     ${Now_enjoy}    ${Now_enjoy}    

Read Data of More reason to Shop here section from Excel
    
    ${More_reasons}=                        Read Excel Cell    row_num=22   col_num=2    sheet_name=${Excel_Sheet_Name_Discover}
    Set Global Variable                     ${More_reasons}    ${More_reasons}
    ${Check_the_benefits}=                  Read Excel Cell    row_num=23    col_num=2    sheet_name=${Excel_Sheet_Name_Discover}
    Set Global Variable                     ${Check_the_benefits}    ${Check_the_benefits}
    ${heading}=                             Read Excel Cell    row_num=24    col_num=2    sheet_name=${Excel_Sheet_Name_Discover}
    ${heading}=                             String.SplitString    ${heading}    separator=;
    Set Global Variable                     ${heading}    ${heading}
    ${Receive_secure}=                      Read Excel Cell    row_num=25    col_num=2   sheet_name=${Excel_Sheet_Name_Discover}
    ${Receive_secure}=                      String.SplitString    ${Receive_secure}    separator=;
    Set Global Variable                     ${Receive_secure}    ${Receive_secure}

Read Data of Need Guidance? section from Excel
    
    ${Need_Guidance}=                       Read Excel Cell    row_num=28    col_num=2   sheet_name=${Excel_Sheet_Name_Discover}
    Set Global Variable                     ${Need_Guidance}    ${Need_Guidance}
    ${We'd_love_to}=                        Read Excel Cell    row_num=29    col_num=2   sheet_name=${Excel_Sheet_Name_Discover}
    Set Global Variable                     ${We'd_love_to}    ${We'd_love_to}

Read Data of Launch and its here from Excel
    
    ${Launched}=                            Read Excel Cell    row_num=2    col_num=2   sheet_name=${Excel_Sheet_Name_Discover}
    Set Global Variable                     ${Launched}    ${Launched}
    ${One_step}=                            Read Excel Cell    row_num=3    col_num=2   sheet_name=${Excel_Sheet_Name_Discover}
    Set Global Variable                     ${One_step}    ${One_step}
    ${Product_Name}=                        Read Excel Cell    row_num=4    col_num=2   sheet_name=${Excel_Sheet_Name_Discover}
    ${Product_Name}=                        String.SplitString    ${Product_Name}    separator=;
    Set Global Variable                     ${Product_Name}    ${Product_Name}
    ${Find_all_the_recently}=               Read Excel Cell    row_num=5    col_num=2   sheet_name=${Excel_Sheet_Name_Discover}
    ${Find_all_the_recently}=               String.SplitString    ${Find_all_the_recently}    separator=;
    Set Global Variable                     ${Find_all_the_recently}    ${Find_all_the_recently}

Read Data of Bringing People Together from Excel    
    
    ${Bringing_people_together}=            Read Excel Cell    row_num=8    col_num=2   sheet_name=${Excel_Sheet_Name_Discover}
    Set Global Variable                     ${Bringing_people_together}    ${Bringing_people_together}
    ${Now_Stay_connected}=                  Read Excel Cell    row_num=9    col_num=2   sheet_name=${Excel_Sheet_Name_Discover}
    Set Global Variable                     ${Now_Stay_connected}    ${Now_Stay_connected}

#-------------------------------------------------Support Excel------------------------------------------------------

Reading Data of Support Discover Page from Excel
    #------------------------------Got queries? Check FAQs for answers-------------------------------								
    ${Gotqueries_text}=                     Read Excel Cell           row_num=86    col_num=2    sheet_name=Support_Discover
    ${Gotqueries_text}=                     String.Split String       ${Gotqueries_text}         ;
    Set Global Variable                     ${Gotqueries_text}
    ${Gotqueries_modules_urls}=             Read Excel Cell           row_num=87    col_num=2    sheet_name=Support_Discover
    ${Gotqueries_modules_urls}=             String.Split String       ${Gotqueries_modules_urls}  ;
    Set Global Variable                     ${Gotqueries_modules_urls}
    ${devicemodule_header}=                 Read Excel Cell           row_num=88    col_num=2    sheet_name=Support_Discover
    Set Global Variable                     ${devicemodule_header}
    ${devicemodule_tabs}=                   Read Excel Cell           row_num=89    col_num=2    sheet_name=Support_Discover
    Set Global Variable                     ${devicemodule_tabs}
    ${devicemodule_relevantoptions}=        Read Excel Cell           row_num=90    col_num=2    sheet_name=Support_Discover
    Set Global Variable                     ${devicemodule_relevantoptions}
    ${devicemodule_faqs}=                   Read Excel Cell           row_num=91    col_num=2    sheet_name=Support_Discover
    ${devicemodule_faqs}=                   String.Split String       ${devicemodule_faqs}       ;
    Set Global Variable                     ${devicemodule_faqs}

    #------------------------------------Resolving queries just got easier---------------------------		
    ${Resolvingqueries_text}=               Read Excel Cell           row_num=94    col_num=2    sheet_name=Support_Discover
    ${Resolvingqueries_text}=               String.Split String       ${Resolvingqueries_text}   ;
    Set Global Variable                     ${Resolvingqueries_text}

    #----------------------------------still need to discuss something?---------------------------
    ${stillneed_text}=                      Read Excel Cell           row_num=97    col_num=2    sheet_name=Support_Discover
    ${stillneed_text}=                      String.Split String       ${stillneed_text}          ;
    Set Global Variable                     ${stillneed_text}
    ${stillneed_buttons_text}=              Read Excel Cell           row_num=98    col_num=2    sheet_name=Support_Discover
    ${stillneed_buttons_text}=              String.Split String       ${stillneed_buttons_text}  ;
    Set Global Variable                     ${stillneed_buttons_text}
    ${stillneed_urls}=                      Read Excel Cell           row_num=99    col_num=2    sheet_name=Support_Discover
    ${stillneed_urls}=                      String.Split String       ${stillneed_urls}          ;
    Set Global Variable                     ${stillneed_urls}
    
    #Lost sim
    ${LostSIM}=                             Read Excel Cell           row_num=18    col_num=6    sheet_name=Support_Discover
    Set Global Variable                     ${LostSIM}                ${LostSIM}
    ${LostSIMText}=                         Read Excel Cell           row_num=19    col_num=6    sheet_name=Support_Discover
    ${LostSIMText}=                         String.Split String       ${LostSIMText}             ;
    Set Global Variable                     ${LostSIMText}            ${LostSIMText}

    #Helpful Tips   
    ${TextVerify1}=                         Read Excel Cell           row_num=70    col_num=2    sheet_name=Support_Discover
    ${TextVerify2}=                         Read Excel Cell           row_num=71    col_num=2    sheet_name=Support_Discover
    #${TextVerify3}=                         Read Excel Cell           row_num=72    col_num=2    sheet_name=Support_Discover
    ${TextVerify3}=                         Read Excel Cell           row_num=73    col_num=2    sheet_name=Support_Discover
    ${TextVerify4}=                         Read Excel Cell           row_num=74    col_num=2    sheet_name=Support_Discover
    ${TextVerify5}=                         Read Excel Cell           row_num=75    col_num=2    sheet_name=Support_Discover
    ${TextVerify6}=                         Read Excel Cell           row_num=76    col_num=2    sheet_name=Support_Discover
    ${TextVerify7}=                         Read Excel Cell           row_num=77    col_num=2    sheet_name=Support_Discover
    ${TextVerify8}=                         Read Excel Cell           row_num=78    col_num=2    sheet_name=Support_Discover
    Set Global Variable                     ${TextVerify1}            ${TextVerify1}
    Set Global Variable                     ${TextVerify2}            ${TextVerify2}
    Set Global Variable                     ${TextVerify3}            ${TextVerify3}
    Set Global Variable                     ${TextVerify4}            ${TextVerify4}
    Set Global Variable                     ${TextVerify5}            ${TextVerify5}
    Set Global Variable                     ${TextVerify6}            ${TextVerify6}
    Set Global Variable                     ${TextVerify7}            ${TextVerify7}
    Set Global Variable                     ${TextVerify8}            ${TextVerify8}
    #Set Global Variable                     ${TextVerify9}            ${TextVerify9} 
    
    #Shortcuts to Most used services
    ${STMUSHeading}=                        Read Excel Cell           row_num=13    col_num=3    sheet_name=Support_Discover
    ${STMUSSubheading}=                     Read Excel Cell           row_num=14    col_num=2    sheet_name=Support_Discover
    Set Global Variable                     ${STMUSHeading}           ${STMUSHeading}
    Set Global Variable                     ${STMUSSubheading}        ${STMUSSubheading}
    ${STMUSdata}=                           Read Excel Cell           row_num=13    col_num=2    sheet_name=Support_Discover
    ${STMUSdata}=                           String.Split String       ${STMUSdata}               ;
    Set Global Variable                     ${STMUSdata}              ${STMUSdata}

    #Got Queries FAQ
    ${Accdata1}=                            Read Excel Cell           row_num=84    col_num=2    sheet_name=Support_Discover
    ${Accdata2}=                            Read Excel Cell           row_num=85    col_num=2    sheet_name=Support_Discover
    Set Global Variable                     ${Accdata1}               ${Accdata1}
    Set Global Variable                     ${Accdata2}               ${Accdata2}
   
    #Track Order Page 
    ${TOdata}=                              Read Excel Cell           row_num=24    col_num=2    sheet_name=Support_Discover
    ${TOdata1}=                             Read Excel Cell           row_num=22    col_num=2    sheet_name=Support_Discover
    ${TOdata2}=                             Read Excel Cell           row_num=23    col_num=2    sheet_name=Support_Discover
    Set Global Variable                     ${TOdata2}                ${TOdata2}
    Set Global Variable                     ${TOdata}                 ${TOdata}
    Set Global Variable                     ${TOdata1}                ${TOdata1}

   #Track Request
   ${TRdata1}=                              Read Excel Cell          row_num=18    col_num=2    sheet_name=Support_Discover
   ${TRdata1}=                              String.Split String      ${TRdata1}     ;
   Set Global Variable                      ${TRdata1}               ${TRdata1}
   ${TRdata2}=                              Read Excel Cell          row_num=19    col_num=2    sheet_name=Support_Discover
   ${TRdata2}=                              String.Split String      ${TRdata2}     ;
   Set Global Variable                      ${TRdata2}               ${TRdata2}
   ${TRdata3}=                              Read Excel Cell          row_num=19    col_num=3    sheet_name=Support_Discover
   ${TRdata3}=                              String.Split String      ${TRdata3}     ;
   Set Global Variable                      ${TRdata3}               ${TRdata3}

    #Manage AutoPay
    ${AutoPay}=                             Read Excel Cell           row_num=27    col_num=2    sheet_name=Support_Discover
    ${AutoPay2}=                            Read Excel Cell           row_num=28    col_num=2    sheet_name=Support_Discover
    ${AutoPay}=                             String.Split String       ${AutoPay}                 ;
    Set Global Variable                     ${AutoPay}                ${AutoPay}
    ${AutoPay3}=                            Read Excel Cell           row_num=29    col_num=2    sheet_name=Support_Discover
    ${AutoPay3}=                            String.Split String       ${AutoPay3}                ;
    Set Global Variable                     ${AutoPay3}               ${AutoPay3}
    Set Global Variable                     ${AutoPay2}               ${AutoPay2}   
    ${AutoPayFAQ}=                          Read Excel Cell           row_num=30    col_num=2    sheet_name=Support_Discover
    ${AutoPayFAQ}=                          String.Split String       ${AutoPayFAQ}              ;   
    Set Global Variable                     ${AutoPayFAQ}             ${AutoPayFAQ}
    
    #SearchBar
    ${placeholder}=                         Read Excel Cell           row_num=81    col_num=2    sheet_name=Support_Discover
    ${placeholder}=                         String.Split String       ${placeholder}             ;
    Set Global Variable                     ${placeholder}            ${placeholder}

    #Jio Helpful Tips
    ${JioHelpfulTips}=                      Read Excel Cell           row_num=70    col_num=2    sheet_name=Support_Discover
    ${JioHelpfulTips}=                      String.Split String       ${JioHelpfulTips}          ;
    ${JioHelpfulTips1}=                     Read Excel Cell           row_num=69    col_num=3    sheet_name=Support_Discover
    ${JioHelpfulTips1}=                     String.Split String       ${JioHelpfulTips1}         ;
    ${JioHelpfulTips3}=                     Read Excel Cell           row_num=69    col_num=2    sheet_name=Support_Discover
    ${JioHelpfulTips3}=                     String.Split String       ${JioHelpfulTips3}         ;
    Set Global Variable                     ${JioHelpfulTips}         ${JioHelpfulTips}
    Set Global Variable                     ${JioHelpfulTips3}        ${JioHelpfulTips3}
    Set Global Variable                     ${JioHelpfulTips1}        ${JioHelpfulTips1}
    
    #Troubleshoot contents
    ${Troubleshoot_Title}=                  Read Excel Cell           row_num=2     col_num=2    sheet_name=Support_Discover
    ${Troubleshoot_SubTitle}=               Read Excel Cell           row_num=3     col_num=2    sheet_name=Support_Discover
    ${Troubleshoot_Body}=                   Read Excel Cell           row_num=4     col_num=2    sheet_name=Support_Discover
    ${Troubleshoot_Body}=                   String.Split String       ${Troubleshoot_Body}       ;
    Set Global Variable                     ${Troubleshoot_Title}     ${Troubleshoot_Title}
    Set Global Variable                     ${Troubleshoot_SubTitle}  ${Troubleshoot_SubTitle}
    Set Global Variable                     ${Troubleshoot_Body}      ${Troubleshoot_Body}

    #Facing any issues?
    ${FacingIssues_title}=                  Read Excel Cell           row_num=7     col_num=2    sheet_name=Support_Discover
    ${FacingIssues_subtitle}=               Read Excel Cell           row_num=8     col_num=2    sheet_name=Support_Discover
    ${issue_type}=                          Read Excel Cell           row_num=9     col_num=2    sheet_name=Support_Discover
    ${issue_title}=                         Read Excel Cell           row_num=10    col_num=2    sheet_name=Support_Discover
    ${issue_type}=                          String.Split String       ${issue_type}              ;
    ${issue_title}=                         String.Split String       ${issue_title}             ;
    Set Global Variable                     ${FacingIssues_title}     ${FacingIssues_title}
    Set Global Variable                     ${FacingIssues_subtitle}  ${FacingIssues_subtitle}
    Set Global Variable                     ${issue_type}             ${issue_type}
    Set Global Variable                     ${issue_title}            ${issue_title}
    
    #Port to jio contents
    ${PO1,2_Title}=                         Read Excel Cell           row_num=33    col_num=2    sheet_name=Support_Discover
    ${PO1,2_SubTitle}=                      Read Excel Cell           row_num=34    col_num=2    sheet_name=Support_Discover
    ${PO1,2_Body}=                          Read Excel Cell           row_num=35    col_num=2    sheet_name=Support_Discover
    ${PO1,2_Title}=                         String.Split String       ${PO1,2_Title}             ;
    ${PO1,2_SubTitle}=                      String.Split String       ${PO1,2_SubTitle}          ;
    ${PO1,2_Body}=                          String.Split String       ${PO1,2_Body}              ;
    ${Plan_Title}=                          Read Excel Cell           row_num=37    col_num=2    sheet_name=Support_Discover
    ${Plan_Price}=                          Read Excel Cell           row_num=38    col_num=2    sheet_name=Support_Discover
    ${Plan_Validity}=                       Read Excel Cell           row_num=39    col_num=2    sheet_name=Support_Discover
    ${Plan_Benefits}=                       Read Excel Cell           row_num=40    col_num=2    sheet_name=Support_Discover
    ${Plan_TotalData}=                      Read Excel Cell           row_num=41    col_num=2    sheet_name=Support_Discover
    ${Plan_Title}=                          String.Split String       ${Plan_Title}              ;
    ${Plan_Price}=                          String.Split String       ${Plan_Price}              ;
    ${Plan_Validity}=                       String.Split String       ${Plan_Validity}           ;
    ${Plan_Benefits}=                       String.Split String       ${Plan_Benefits}           ;
    ${Plan_TotalData}=                      String.Split String       ${Plan_TotalData}          ;
    ${PO4,5_Title}=                         Read Excel Cell           row_num=43    col_num=2    sheet_name=Support_Discover
    ${PO4,5_SubTitle}=                      Read Excel Cell           row_num=44    col_num=2    sheet_name=Support_Discover
    ${PO4,5_Title}=                         String.Split String       ${PO4,5_Title}             ;
    ${PO4,5_SubTitle}=                      String.Split String       ${PO4,5_SubTitle}          ;
    ${FAQ}=                                 Read Excel Cell           row_num=46    col_num=2    sheet_name=Support_Discover
    ${FAQ}=                                 String.Split String       ${FAQ}                     ;
    ${PortYourno_title}=                    Read Excel Cell           row_num=48    col_num=2    sheet_name=Support_Discover
    ${PortYourno_subtitle}=                 Read Excel Cell           row_num=49    col_num=2    sheet_name=Support_Discover
    ${PortYourno_subtitle}=                 String.Split String       ${PortYourno_subtitle}     ;
    Set Global Variable                     ${PO1,2_Title}            ${PO1,2_Title}
    Set Global Variable                     ${PO1,2_SubTitle}         ${PO1,2_SubTitle}
    Set Global Variable                     ${PO1,2_Body}             ${PO1,2_Body}
    Set Global Variable                     ${Plan_Title}             ${Plan_Title}
    Set Global Variable                     ${Plan_Price}             ${Plan_Price}
    Set Global Variable                     ${Plan_Validity}          ${Plan_Validity}
    Set Global Variable                     ${Plan_Benefits}          ${Plan_Benefits}
    Set Global Variable                     ${Plan_TotalData}         ${Plan_TotalData}
    Set Global Variable                     ${PO4,5_Title}            ${PO4,5_Title}
    Set Global Variable                     ${PO4,5_SubTitle}         ${PO4,5_SubTitle}
    Set Global Variable                     ${FAQ}                    ${FAQ}
    Set Global Variable                     ${PortYourno_title}       ${PortYourno_title}
    Set Global Variable                     ${PortYourno_subtitle}    ${PortYourno_subtitle}

    #Claim your refund
    ${ClaimRefund_title}=                   Read Excel Cell           row_num=52    col_num=2    sheet_name=Support_Discover
    ${ClaimRefund_subtitle}=                Read Excel Cell           row_num=53    col_num=2    sheet_name=Support_Discover
    ${Refund_title}=                        Read Excel Cell           row_num=54    col_num=2    sheet_name=Support_Discover
    ${Refund_subtitle}=                     Read Excel Cell           row_num=55    col_num=2    sheet_name=Support_Discover
    ${Refund_title}=                        String.Split String       ${Refund_title}            ;
    ${Refund_subtitle}=                     String.Split String       ${Refund_subtitle}         ;
    Set Global Variable                     ${ClaimRefund_title}      ${ClaimRefund_title}
    Set Global Variable                     ${ClaimRefund_subtitle}   ${ClaimRefund_subtitle}
    Set Global Variable                     ${Refund_title}           ${Refund_title}
    Set Global Variable                     ${Refund_subtitle}        ${Refund_subtitle}

    #Check all links
    ${CheckLinks_title}=                    Read Excel Cell           row_num=58    col_num=2    sheet_name=Support_Discover
    ${CheckLinks_subtitle}=                 Read Excel Cell           row_num=59    col_num=2    sheet_name=Support_Discover
    ${Link_types}=                          Read Excel Cell           row_num=60    col_num=2    sheet_name=Support_Discover
    ${Link_title}=                          Read Excel Cell           row_num=61    col_num=2    sheet_name=Support_Discover
    ${Link_types}=                          String.Split String       ${Link_types}              ;
    ${Link_title}=                          String.Split String       ${Link_title}              ;
    Set Global Variable                     ${CheckLinks_title}       ${CheckLinks_title}
    Set Global Variable                     ${CheckLinks_subtitle}    ${CheckLinks_subtitle}
    Set Global Variable                     ${Link_types}             ${Link_types}
    Set Global Variable                     ${Link_title}             ${Link_title}
    
    #watch,learn,resolve
    ${Title2}=                              Read Excel Cell           row_num=64    col_num=2    sheet_name=Support_Discover
    ${SubTitle2}=                           Read Excel Cell           row_num=65    col_num=2    sheet_name=Support_Discover
    ${Video_Title}=                         Read Excel Cell           row_num=66    col_num=2    sheet_name=Support_Discover
    ${Video_Title}=                         String.Split String       ${Video_Title}             ;
    Set Global Variable                     ${Title2}                 ${Title2}
    Set Global Variable                     ${SubTitle2}              ${SubTitle2}
    Set Global Variable                     ${Video_Title}            ${Video_Title}

Reading data of Support Contact Center page from Excel
    #Appellate Authority Text        
    ${aa_text}=                             Read Excel Cell           row_num=3    col_num=2    sheet_name=Support_ContactCenter
    ${aa_text}=                             Split String              ${aa_text}    ;
    ${aa_text}                              Set Global Variable       ${aa_text}

    ${aa_heading}=                          Read Excel Cell           row_num=2    col_num=2    sheet_name=Support_ContactCenter
    ${aa_heading}=                          Split String              ${aa_heading}    ;
    ${aa_heading}                           Set Global Variable       ${aa_heading}      

    #Appellate Authority States
    ${aa_state}=                            Read Excel Cell           row_num=4    col_num=2    sheet_name=Support_ContactCenter
    ${aa_state}=                            Split String              ${aa_state}    , 
    ${aa_state}                             Set Global Variable       ${aa_state}            

    #Contact Centre Search Suggestions
    ${search_text}=                         Read Excel Cell           row_num=2    col_num=1    sheet_name=Support_ContactCenter
    ${search_text}                          Set Global Variable       ${search_text}    



#--------------------------------------------TrackOrder Section----------------------------------------------------------------

Reading Data of Support Track Order Page from Excel
    
    #variables for Devices page
    ${Devices_Heading}=                     Read Excel Cell          row_num=3         col_num=1       sheet_name=Support_TrackOrder
    Set Global Variable                     ${Devices_Heading}       ${Devices_Heading}
    
    #Variables for JioSim and JioFiber Page
    ${JioSim_JioFiber_heading}=             Read Excel Cell          row_num=3         col_num=2       sheet_name=Support_TrackOrder
    Set Global Variable                     ${JioSim_JioFiber_heading}                 ${JioSim_JioFiber_heading}
    ${JioSim_JioFiber_Subheading}=          Read Excel Cell          row_num=5         col_num=2       sheet_name=Support_TrackOrder
    Set Global Variable                     ${JioSim_JioFiber_Subheading}              ${JioSim_JioFiber_Subheading}
    ${Placeholder_order}=                   Read Excel Cell          row_num=7         col_num=2       sheet_name=Support_TrackOrder
    Set Global Variable                     ${Placeholder_order}     ${Placeholder_order}
    ${Order_Details_Text}=                  Read Excel Cell          row_num=9         col_num=2       sheet_name=Support_TrackOrder
    Set Global Variable                     ${Order_Details_Text}    ${Order_Details_Text}
    ${Hyperlink_popup_heading}=             Read Excel Cell          row_num=11        col_num=2       sheet_name=Support_TrackOrder
    Set Global Variable                     ${Hyperlink_popup_heading}                 ${Hyperlink_popup_heading}
    ${Hyperlink_content}=                   Read Excel Cell          row_num=13        col_num=2       sheet_name=Support_TrackOrder
    Set Global Variable                     ${Hyperlink_content}     ${Hyperlink_content}

    #variables of EsimRequest Page
    ${Esim_Heading}=                        Read Excel Cell          row_num=3         col_num=3   sheet_name=Support_TrackOrder
    Set Global Variable                     ${Esim_Heading}          ${Esim_Heading}
    ${Esim_Subheading}=                     Read Excel Cell          row_num=5         col_num=3   sheet_name=Support_TrackOrder
    Set Global Variable                     ${Esim_Subheading}       ${Esim_Subheading}
    ${Placeholder_Trackingdetails}=         Read Excel Cell          row_num=7         col_num=3   sheet_name=Support_TrackOrder
    Set Global Variable                     ${Placeholder_Trackingdetails}             ${Placeholder_Trackingdetails}
    ${Reference_No_Text}=                   Read Excel Cell          row_num=9         col_num=3   sheet_name=Support_TrackOrder
    Set Global Variable                     ${Reference_No_Text}     ${Reference_No_Text}

Reading Data of LocateUs Support Page from Excel
    #Variables for LocateUs Page
    ${listview_locations1}=                 Read Excel Cell          row_num=3          col_num=1   sheet_name=Support_LocateUs
    Set Global Variable                     ${listview_locations1}                                  ${listview_locations1}
    
    ${listview_locations2}=                 Read Excel Cell          row_num=5          col_num=1   sheet_name=Support_LocateUs
    Set Global Variable                     ${listview_locations2}                                  ${listview_locations2}

    ${locate_text2}=                         Read Excel Cell          row_num=9          col_num=3   sheet_name=Support_LocateUs
    ${locate_text2}=                         Split String             ${locate_text2}    ; 
    ${locate_text2}                          Set Global Variable      ${locate_text2}    

    #Stores
    ${StoresTitle}=                         Read Excel Cell          row_num=5          col_num=3    sheet_name=Support_LocateUs
    Set Global Variable                     ${StoresTitle}           ${StoresTitle}
    ${Placeholder}=                         Read Excel Cell          row_num=7          col_num=3    sheet_name=Support_LocateUs
    Set Global Variable                     ${Placeholder}           ${Placeholder}
    #Service Centers
    ${LocateUsSC1}=                         Read Excel Cell          row_num=6          col_num=1    sheet_name=Support_LocateUs
    Set Global Variable                     ${LocateUsSC1}           ${LocateUsSC1}
    ${LocateUsSC2}=                         Read Excel Cell          row_num=7          col_num=1    sheet_name=Support_LocateUs
    Set Global Variable                     ${LocateUsSC2}           ${LocateUsSC2}

 #Locate Us Tiles
    ${locate_text}=                         Read Excel Cell          row_num=3          col_num=3    sheet_name=Support_LocateUs
    ${locate_text}=                         Split String             ${locate_text}    ; 
    ${locate_text}                          Set Global Variable      ${locate_text}            



        
        
#--------------------------------------------Home Page----------------------------------------------------------------

#Home Page
Reading Data of Home Page from Excel     
        ${Quick_Action}=              Read Excel Cell          row_num=2     col_num=1   sheet_name=Home_Page
        ${Quick_Action}=              String.Split String      ${Quick_Action}        ;
        ${MPrice}=                     Read Excel Cell          row_num=2     col_num=2   sheet_name=Home_Page
        ${MPrice}=                     String.Split String      ${MPrice}        ;
        ${Desc}=                      Read Excel Cell          row_num=2     col_num=3   sheet_name=Home_Page
        ${Desc}=                      String.Split String      ${Desc}        ;
        ${Validaty}=                  Read Excel Cell          row_num=2     col_num=4   sheet_name=Home_Page
        ${Validaty}=                  String.Split String      ${Validaty}        ;
        ${MBenefits}=                  Read Excel Cell          row_num=2     col_num=5   sheet_name=Home_Page
        ${MBenefits}=                  String.Split String      ${MBenefits}        ;
        ${FPrice}=                     Read Excel Cell          row_num=2     col_num=6   sheet_name=Home_Page
        ${FPrice}=                     String.Split String      ${FPrice}        ;
        ${FBenefits}=                  Read Excel Cell          row_num=2     col_num=7   sheet_name=Home_Page
        ${FBenefits}=                  String.Split String      ${FBenefits}       ;
        ${iButton}=                    Read Excel Cell          row_num=2     col_num=8   sheet_name=Home_Page
        ${iButton}=                    String.Split String      ${iButton}            ;
        ${Our_offerings}=              Read Excel Cell          row_num=4       col_num=1      sheet_name=Home_Page
        ${Our_offerings}=              String.Split String      ${Our_offerings}       ;
        ${Footer_Support}=                    Read Excel Cell          row_num=4          col_num=2          sheet_name=Home_Page
        ${Footer_Support}=                    String.Split String       ${Footer_Support}          ;
        ${Our_company}=                Read Excel Cell          row_num=4          col_num=3          sheet_name=Home_Page
        ${Our_company}=                String.Split String       ${Our_company}         ;
        ${Useful_links}=               Read Excel Cell           row_num=4         col_num=4           sheet_name=Home_Page
        ${Useful_links}=               String.Split String       ${Useful_links}         ;
        ${Connect_with_us}=            Read Excel Cell           row_num=4          col_num=5           sheet_name=Home_Page
        ${Connect_with_us}=            String.Split String       ${Connect_with_us}         ;
        ${Download_MyJio}=             Read Excel Cell           row_num=4          col_num=6           sheet_name=Home_Page
        ${Download_MyJio}=             String.Split String       ${Download_MyJio}          ;
        ${Copyright_Section}=          Read Excel Cell           row_num=4          col_num=7            sheet_name=Home_Page
        ${Copyright_Section}=          String.Split String       ${Copyright_Section}         ;
        ${PleaseNote}=                  Read Excel Cell          row_num=6     col_num=1   sheet_name=Home_Page
        ${Header_Options}=              Read Excel Cell          row_num=8     col_num=1   sheet_name=Home_Page
        ${Header_Options}=              String.Split String       ${Header_Options}         ;
        ${Header_URLs}=                 Read Excel Cell          row_num=8     col_num=2   sheet_name=Home_Page
        ${Header_URLs}=                 String.Split String       ${Header_URLs}         ;
        ${Banner_title}=                Read Excel Cell          row_num=10     col_num=1   sheet_name=Home_Page
        ${Banner_title}=                String.Split String       ${Banner_title}         ;
        ${ThreeAppsBanner_URL}=         Read Excel Cell          row_num=12     col_num=1   sheet_name=Home_Page
        ${ThreeAppsBanner_URL}=         String.Split String       ${ThreeAppsBanner_URL}         ;
        ${ThreeAppsBanner_title}=       Read Excel Cell          row_num=12     col_num=2   sheet_name=Home_Page
        ${ThreeAppsBanner_title}=       String.Split String       ${ThreeAppsBanner_title}         ;
        ${ThreeAppsBanner_button}=      Read Excel Cell          row_num=12     col_num=3   sheet_name=Home_Page
        ${ThreeAppsBanner_button}=      String.Split String       ${ThreeAppsBanner_button}         ;
        ${Spotlight_text}=              Read Excel Cell          row_num=14     col_num=1   sheet_name=Home_Page
        ${Spotlight_text}=              String.Split String       ${Spotlight_text}         ;
        ${Enrich_text}=                 Read Excel Cell          row_num=16    col_num=1   sheet_name=Home_Page
        ${Enrich_text}=                 String.Split String       ${Enrich_text}         ;
        ${Enrich_banner_text}=                     Read Excel Cell          row_num=16     col_num=2   sheet_name=Home_Page
        ${Enrich_Walkingcarousel_button}=          Read Excel Cell          row_num=16    col_num=3   sheet_name=Home_Page
        ${Enrich_Walkingcarousel_button}=          String.Split String       ${Enrich_Walkingcarousel_button}         ;
        ${Enrich_Walkingcarousel_title}=           Read Excel Cell          row_num=16    col_num=4   sheet_name=Home_Page
        ${Enrich_Walkingcarousel_title}=           String.Split String       ${Enrich_Walkingcarousel_title}         ;
        ${Enrich_Walkingcarousel_urls}=            Read Excel Cell          row_num=16    col_num=5   sheet_name=Home_Page
        ${Enrich_Walkingcarousel_urls}=            String.Split String       ${Enrich_Walkingcarousel_urls}         ;
        ${Discovernew_section}=                    Read Excel Cell          row_num=18    col_num=1   sheet_name=Home_Page
        ${Discovernew_section}=                    String.Split String       ${Discovernew_section}         ;
        ${Discovernew_iconname}=                   Read Excel Cell          row_num=18    col_num=2   sheet_name=Home_Page
        ${Discovernew_iconname}=                   String.Split String       ${Discovernew_iconname}         ;
        ${Discovernew_subtext}=                    Read Excel Cell          row_num=18    col_num=3   sheet_name=Home_Page
        ${Discovernew_subtext}=                    String.Split String       ${Discovernew_subtext}         ;
        ${Discovernew_buttons}=                    Read Excel Cell          row_num=18    col_num=4   sheet_name=Home_Page
        ${Discovernew_buttons}=                    String.Split String       ${Discovernew_buttons}         ;
        ${Discovernew_urls}=                       Read Excel Cell          row_num=18    col_num=5   sheet_name=Home_Page
        ${Discovernew_urls}=                       String.Split String       ${Discovernew_urls}         ;
        ${Latestdevices_section}=                  Read Excel Cell          row_num=20    col_num=1   sheet_name=Home_Page
        ${Latestdevices_section}=                  String.Split String       ${Latestdevices_section}         ;
        ${Latestdevices_list}=                     Read Excel Cell          row_num=20    col_num=2   sheet_name=Home_Page
        ${Latestdevices_list}=                     String.Split String       ${Latestdevices_list}         ;
        ${Latestdevices_price}=                    Read Excel Cell          row_num=20    col_num=3   sheet_name=Home_Page
        ${Latestdevices_price}=                    String.Split String       ${Latestdevices_price}         ;
        ${Createopportunity_title}=                Read Excel Cell          row_num=22    col_num=1   sheet_name=Home_Page
        ${Createopportunity_subtitle}=             Read Excel Cell          row_num=22    col_num=2   sheet_name=Home_Page
        ${Makingdiff_section}=                     Read Excel Cell          row_num=24   col_num=1   sheet_name=Home_Page
        ${Makingdiff_section}=                     String.Split String       ${Makingdiff_section}         ;
        ${Makingdiff_storytext}=                   Read Excel Cell          row_num=24   col_num=2   sheet_name=Home_Page
        ${Makingdiff_storytext}=                   String.Split String       ${Makingdiff_storytext}         ;
        ${Makingdiff_storyurl}=                    Read Excel Cell          row_num=24   col_num=3   sheet_name=Home_Page
        ${Makingdiff_storyurl}=                    String.Split String       ${Makingdiff_storyurl}         ;
        ${Makingdiff_relatedstorytext}=            Read Excel Cell          row_num=24   col_num=4  sheet_name=Home_Page
        ${Makingdiff_relatedstorytext}=            String.Split String       ${Makingdiff_relatedstorytext}         ;
        ${Makingdiff_shareicons}=                  Read Excel Cell          row_num=24   col_num=5  sheet_name=Home_Page
        ${Makingdiff_shareicons}=                  String.Split String       ${Makingdiff_shareicons}         ;
        ${Myjio_text}=                             Read Excel Cell          row_num=26   col_num=1  sheet_name=Home_Page
        ${Myjio_text}=                             String.Split String       ${Myjio_text}         ;
        ${Ourofferings_text}=                      Read Excel Cell          row_num=28   col_num=1  sheet_name=Home_Page
        ${Ourofferings_text}=                      String.Split String       ${Ourofferings_text}         ;
        ${Footer_Support_text}=                      Read Excel Cell          row_num=28   col_num=2  sheet_name=Home_Page
        ${Footer_Support_text}=                      String.Split String       ${Footer_Support_text}         ;
        ${Ourcompany_text}=                      Read Excel Cell          row_num=28   col_num=3  sheet_name=Home_Page
        ${Ourcompany_text}=                      String.Split String       ${Ourcompany_text}         ;
        ${Usefulinks_text}=                      Read Excel Cell          row_num=28   col_num=4  sheet_name=Home_Page
        ${Usefulinks_text}=                      String.Split String       ${Usefulinks_text}         ;
        
        ${BusinessGrowFaster_Heading}=                      Read Excel Cell          row_num=30   col_num=1  sheet_name=Home_Page
       
        ${BusinessGrowFaster_Subtext}=                      Read Excel Cell          row_num=30   col_num=2  sheet_name=Home_Page
       
        ${BusinessGrowFaster_Button}=                      Read Excel Cell          row_num=30   col_num=3  sheet_name=Home_Page
        







        Set Global Variable           ${Quick_Action}                                ${Quick_Action}
        Set Global Variable           ${MPrice}                                      ${MPrice}
        Set Global Variable           ${Desc}                                        ${Desc}
        Set Global Variable           ${Validaty}                                    ${Validaty}
        Set Global Variable           ${MBenefits}                                   ${MBenefits}
        Set Global Variable           ${FPrice}                                      ${FPrice}
        Set Global Variable           ${FBenefits}                                   ${FBenefits}
        Set Global Variable           ${iButton}                                     ${iButton}
        Set Global Variable           ${Our_offerings}                               ${Our_offerings}
        Set Global Variable           ${Footer_Support}                              ${Footer_Support}
        Set Global Variable           ${Our_company}                                 ${Our_company}
        Set Global Variable           ${Useful_links}                                ${Useful_links}
        Set Global Variable           ${Connect_with_us}                             ${Connect_with_us}
        Set Global Variable           ${Download_MyJio}                              ${Download_MyJio}
        Set Global Variable           ${Copyright_Section}                           ${Copyright_Section}
        Set Global Variable           ${PleaseNote}                                  ${PleaseNote}
        Set Global Variable           ${Header_Options}                              ${Header_Options}
        Set Global Variable           ${Header_URLs}                                 ${Header_URLs}
        Set Global Variable           ${Banner_title}                                ${Banner_title}
        Set Global Variable           ${ThreeAppsBanner_URL}                         ${ThreeAppsBanner_URL}
        Set Global Variable           ${ThreeAppsBanner_title}                       ${ThreeAppsBanner_title}
        Set Global Variable           ${ThreeAppsBanner_button}                      ${ThreeAppsBanner_button}
        Set Global Variable           ${Spotlight_text}                              ${Spotlight_text}
        Set Global Variable           ${Enrich_text}                                 ${Enrich_text}
        Set Global Variable           ${Enrich_banner_text}                          ${Enrich_banner_text}
        Set Global Variable           ${Enrich_Walkingcarousel_button}               ${Enrich_Walkingcarousel_button}
        Set Global Variable           ${Enrich_Walkingcarousel_title}                ${Enrich_Walkingcarousel_title}
        Set Global Variable           ${Enrich_Walkingcarousel_urls}                 ${Enrich_Walkingcarousel_urls}
        Set Global Variable           ${Discovernew_section}                         ${Discovernew_section}
        Set Global Variable           ${Discovernew_iconname}                        ${Discovernew_iconname}
        Set Global Variable           ${Discovernew_subtext}                         ${Discovernew_subtext}
        Set Global Variable           ${Discovernew_buttons}                         ${Discovernew_buttons} 
        Set Global Variable           ${Discovernew_urls}                            ${Discovernew_urls}
        Set Global Variable           ${Latestdevices_section}                       ${Latestdevices_section}
        Set Global Variable           ${Latestdevices_list}                          ${Latestdevices_list} 
        Set Global Variable           ${Latestdevices_price}                         ${Latestdevices_price}
        Set Global Variable           ${Createopportunity_title}                     ${Createopportunity_title}
        Set Global Variable           ${Createopportunity_subtitle}                  ${Createopportunity_subtitle}
        Set Global Variable           ${Makingdiff_section}                          ${Makingdiff_section}
        Set Global Variable           ${Makingdiff_storytext}                        ${Makingdiff_storytext}
        Set Global Variable           ${Makingdiff_storyurl}                         ${Makingdiff_storyurl}
        Set Global Variable           ${Makingdiff_shareicons}                       ${Makingdiff_shareicons}
        Set Global Variable           ${Makingdiff_relatedstorytext}                 ${Makingdiff_relatedstorytext}
        Set Global Variable           ${Myjio_text}                                  ${Myjio_text}
        Set Global Variable           ${Ourofferings_text}                           ${Ourofferings_text}
        Set Global Variable           ${Footer_Support_text}                         ${Footer_Support_text}
        Set Global Variable           ${Ourcompany_text}                             ${Ourcompany_text}
        Set Global Variable           ${Usefulinks_text}                             ${Usefulinks_text}
    
        Set Global Variable           ${BusinessGrowFaster_Heading}                  ${BusinessGrowFaster_Heading}
        Set Global Variable           ${BusinessGrowFaster_Subtext}                  ${BusinessGrowFaster_Subtext}
        Set Global Variable           ${BusinessGrowFaster_Button}                   ${BusinessGrowFaster_Button}





#--------------------- APPS

Reading Data of Apps Page from Excel
#     [Arguments]          ${ROW}
#     ${App_name}=                    Read Excel Cell          row_num=${ROW}     col_num=1   sheet_name=test
#     ${Subtitle}=                    Read Excel Cell          row_num=${ROW}     col_num=2   sheet_name=test
#     ${Button_2}=                    Read Excel Cell          row_num=${ROW}     col_num=5   sheet_name=test
#     ${App_URL}=                     Read Excel Cell          row_num=${ROW}     col_num=10   sheet_name=test

        [Arguments]          ${ROW}
        ${App_name}=                    Read Excel Cell          row_num=${ROW}     col_num=1    sheet_name=Apps_Page
        ${Subtitle}=                    Read Excel Cell          row_num=${ROW}     col_num=2    sheet_name=Apps_Page
        ${Button_2}=                    Read Excel Cell          row_num=${ROW}     col_num=3    sheet_name=Apps_Page
        ${TopText}=                     Read Excel Cell          row_num=${ROW}     col_num=4    sheet_name=Apps_Page
        ${BottomText}=                  Read Excel Cell          row_num=${ROW}     col_num=5    sheet_name=Apps_Page
        ${Infographics}=                Read Excel Cell          row_num=${ROW}     col_num=6    sheet_name=Apps_Page
        ${InfoGraphicsLinks}=           Read Excel Cell          row_num=${ROW}     col_num=7    sheet_name=Apps_Page
        ${Infographics_caption}=        Read Excel Cell          row_num=${ROW}     col_num=8    sheet_name=Apps_Page
        ${Infographics_subtitle}=       Read Excel Cell          row_num=${ROW}     col_num=9    sheet_name=Apps_Page
        ${Infographics_URL}=            Read Excel Cell          row_num=${ROW}     col_num=10   sheet_name=Apps_Page
        ${Infographics_button}=         Read Excel Cell          row_num=${ROW}     col_num=11   sheet_name=Apps_Page
        ${POPUP_URL}=                   Read Excel Cell          row_num=${ROW}     col_num=12   sheet_name=Apps_Page
        ${Category}=                    Read Excel Cell          row_num=${ROW}     col_num=13   sheet_name=Apps_Page
        ${App_URL}=                     Read Excel Cell          row_num=${ROW}     col_num=14   sheet_name=Apps_Page
        ${Smart_Features}=              Read Excel Cell          row_num=${ROW}     col_num=15   sheet_name=Apps_Page
        ${FAQ_URL}=                     Read Excel Cell          row_num=${ROW}     col_num=16   sheet_name=Apps_Page
        ${JPL_Steps}=                   Read Excel Cell          row_num=${ROW}     col_num=17   sheet_name=Apps_Page
        
        ${Infographics}=                        String.Split String             ${Infographics}                    ;
        ${Infographics_subtitle}=               String.Split String             ${Infographics_subtitle}           ;
        ${Infographics_caption}=                String.Split String             ${Infographics_caption}            ;
        ${Infographics_button}=                 String.Split String             ${Infographics_button}             ;
        ${Smart_Features}=                      String.Split String             ${Smart_Features}                  ;
        ${FAQ_URL}=                             String.Split String             ${FAQ_URL}                         ;
        ${POPUP_URL}=                           String.Split String             ${POPUP_URL}                       ;
        #${JPL_Steps}=                           String.Split String             ${JPL_Steps}                       ;
        
        Set Global Variable               ${App_name}                              ${App_name}
        Set Global Variable               ${Subtitle}                              ${Subtitle}
        Set Global Variable               ${Button_2}                              ${Button_2}
        Set Global Variable               ${TopText}                               ${TopText}
        Set Global Variable               ${BottomText}                            ${BottomText}
        Set Global Variable               ${Infographics}                          ${Infographics}
        Set Global Variable               ${InfoGraphicsLinks}                     ${InfoGraphicsLinks}
        Set Global Variable               ${Infographics_caption}                  ${Infographics_caption}
        Set Global Variable               ${Infographics_subtitle}                 ${Infographics_subtitle}
        Set Global Variable               ${Infographics_URL}                      ${Infographics_URL}
        Set Global Variable               ${Infographics_button}                   ${Infographics_button}
        Set Global Variable               ${POPUP_URL}                             ${POPUP_URL}
        Set Global Variable               ${Category}                              ${Category}
        Set Global Variable               ${App_URL}                               ${App_URL}
        Set Global Variable               ${Smart_Features}                        ${Smart_Features}
        Set Global Variable               ${FAQ_URL}                               ${FAQ_URL}
        Set Global Variable               ${JPL_Steps}                             ${JPL_Steps}
        

        SeleniumLibrary.Set Screenshot Directory            ./Results/Apps/Apps_Screenshots/${App_name}





        #------------------------Mobile Excel_activity------------------------------

#Mobile Discover Page
Reading Data of Discover Mobile Page from Excel  
        ${Maintext}=                    Read Excel Cell          row_num=2      col_num=1   sheet_name=Mobile_Discover
        ${Subtext}=                     Read Excel Cell          row_num=2      col_num=2   sheet_name=Mobile_Discover
        ${DevicesMaintext}=             Read Excel Cell          row_num=3      col_num=1   sheet_name=Mobile_Discover
        ${DevicesSubtext}=              Read Excel Cell          row_num=3      col_num=2   sheet_name=Mobile_Discover
        ${PlanPrices}=                  Read Excel Cell          row_num=4      col_num=1   sheet_name=Mobile_Discover
        ${PlanValidity}=                Read Excel Cell          row_num=4      col_num=2   sheet_name=Mobile_Discover
        ${PlanData}=                    Read Excel Cell          row_num=4      col_num=3   sheet_name=Mobile_Discover
        ${TotalData}=                   Read Excel Cell          row_num=4      col_num=4   sheet_name=Mobile_Discover
        ${PostpaidPlanPrices}=          Read Excel Cell          row_num=5      col_num=1   sheet_name=Mobile_Discover
        ${PostpaidPlanData}=            Read Excel Cell          row_num=5      col_num=2   sheet_name=Mobile_Discover
        ${Maintext}=                    String.Split String             ${Maintext}             ;
        ${Subtext}=                     String.Split String             ${Subtext}              ;
        ${DevicesMaintext}=             String.Split String             ${DevicesMaintext}      ;
        ${DevicesSubtext}=              String.Split String             ${DevicesSubtext}       ;
        ${PlanPrices}=                  String.Split String             ${PlanPrices}           ;
        ${PlanValidity}=                String.Split String             ${PlanValidity}         ;
        ${PlanData}=                    String.Split String             ${PlanData}             ;
        ${TotalData}=                   String.Split String             ${TotalData}            ;
        ${PostpaidPlanPrices}=          String.Split String             ${PostpaidPlanPrices}             ;
        ${PostpaidPlanData}=          String.Split String               ${PostpaidPlanData}            ;
        ${Plan_Amount}=                 Read Excel Cell         row_num=8       col_num=1       sheet_name=Mobile_Discover
        ${Plan_Amount}=                 String.Split String                ${Plan_Amount}              ;
        ${Plan_Description}=            Read Excel Cell         row_num=8       col_num=2       sheet_name=Mobile_Discover
        ${Plan_Description}=            String.Split String                ${Plan_Description}         ;        
        ${Validity}=                    Read Excel Cell         row_num=8       col_num=3       sheet_name=Mobile_Discover
        ${Validity}=                    String.Split String                ${Validity}                 ;        
        ${Benefits}=                    Read Excel Cell         row_num=8       col_num=4       sheet_name=Mobile_Discover
        ${Benefits}=                    String.Split String                ${Benefits}                 ;
        ${FPrice}=                      Read Excel Cell          row_num=8      col_num=5       sheet_name=Mobile_Discover
        ${FPrice}=                      String.Split String      ${FPrice}        ;
        ${FBenefits}=                   Read Excel Cell          row_num=8      col_num=6       sheet_name=Mobile_Discover
        ${FBenefits}=                   String.Split String      ${FBenefits}       ;
        ${Guidance_UrlList}=            Read Excel Cell        row_num=11    col_num=1    sheet_name=Mobile_Discover
        ${Guidance_UrlList}=            String.Split String        ${Guidance_UrlList}    ;
        Set Global Variable               ${Maintext}                             ${Maintext}
        Set Global Variable               ${Subtext}                              ${Subtext}
        Set Global Variable               ${DevicesMaintext}                      ${DevicesMaintext}
        Set Global Variable               ${DevicesSubtext}                       ${DevicesSubtext}
        Set Global Variable               ${PlanPrices}                           ${PlanPrices}
        Set Global Variable               ${PlanValidity}                         ${PlanValidity}
        Set Global Variable               ${PlanData}                             ${PlanData}
        Set Global Variable               ${TotalData}                            ${TotalData}
        Set Global Variable               ${PostpaidPlanPrices}                   ${PostpaidPlanPrices}
        Set Global Variable               ${PostpaidPlanData}                    ${PostpaidPlanData}
        Set Global Variable               ${Plan_Amount}                        ${Plan_Amount}
        Set Global Variable               ${Plan_Description}                   ${Plan_Description}
        Set Global Variable               ${Validity}                           ${Validity}
        Set Global Variable               ${Benefits}                           ${Benefits}
        Set Global Variable               ${FPrice}                             ${FPrice}
        Set Global Variable               ${FBenefits}                          ${FBenefits}
        Set Global Variable               ${Guidance_UrlList}                    ${Guidance_UrlList}

Reading Data of Postpaid Mobile Page from Excel
        ${PoFAQ_URL}=                                   Read Excel Cell          row_num=2     col_num=1   sheet_name=Mobile_Postpaid
        ${PoFAQ_URL}=                                   String.Split String      ${PoFAQ_URL}       ;
        
        Set Global Variable                             ${PoFAQ_URL}                                           ${PoFAQ_URL}
        
        ${Subtext}=                                    Read Excel Cell     row_num=4    col_num=1    sheet_name=Mobile_Postpaid
        ${Subtext}=                                    String.Split String    ${Subtext}    ;
        Set Global Variable                                 ${Subtext}

Reading Data of Prepaid Mobile Page from Excel
        ${Flight-FAQ_URL}=                              Read Excel Cell          row_num=2     col_num=1   sheet_name=Mobile_Prepaid
        ${Flight-FAQ_URL}=                              String.Split String      ${Flight-FAQ_URL}       ;
        Set Global Variable                             ${Flight-FAQ_URL}                                      ${Flight-FAQ_URL}


Reading Data of IR Page from Excel
        ${Titles}=                              Read Excel Cell          row_num=2     col_num=1   sheet_name=Mobile_IR
        ${Titles}=                              String.Split String      ${Titles}       ;
        ${FAQ_URL-0}=                           Read Excel Cell          row_num=4     col_num=1   sheet_name=Mobile_IR
        ${FAQ_URL-0}=                           String.Split String      ${FAQ_URL-0}       ;
        ${FAQ_URL-1}=                           Read Excel Cell          row_num=6     col_num=1   sheet_name=Mobile_IR
        ${FAQ_URL-1}=                           String.Split String      ${FAQ_URL-1}       ;
        ${FAQ_URL-2}=                           Read Excel Cell          row_num=8     col_num=1   sheet_name=Mobile_IR
        ${FAQ_URL-2}=                           String.Split String      ${FAQ_URL-2}       ;
        ${Country-list}=                        Read Excel Cell          row_num=10     col_num=1   sheet_name=Mobile_IR
        ${Country-list}=                        String.Split String      ${Country-list}       ;
        ${22+Country-list}=                     Read Excel Cell          row_num=12     col_num=1   sheet_name=Mobile_IR
        ${22+Country-list}=                     String.Split String      ${22+Country-list}       ;
        Set Global Variable           ${Titles}                                         ${Titles}
        Set Global Variable           ${FAQ_URL-0}                                      ${FAQ_URL-0}
        Set Global Variable           ${FAQ_URL-1}                                      ${FAQ_URL-1}
        Set Global Variable           ${FAQ_URL-2}                                      ${FAQ_URL-2}
        Set Global Variable           ${Country-list}                                   ${Country-list}
        Set Global Variable           ${22+Country-list}                                   ${22+Country-list}

Reading Data of Get Jio SIM Mobile Page from Excel
        ${GetJio-FAQ_URL}=                              Read Excel Cell          row_num=2     col_num=1   sheet_name=Mobile_GetJio
        ${GetJio-FAQ_URL}=                              String.Split String      ${GetJio-FAQ_URL}       ;
        Set Global Variable                             ${GetJio-FAQ_URL}                                      ${GetJio-FAQ_URL}

        ${Port_to_Jio}=                                 Read Excel Cell          row_num=5     col_num=1   sheet_name=Mobile_GetJio
        Set Global Variable                             ${Port_to_Jio}                                         ${Port_to_Jio}
        
Reading Data of Mobile Header from Excel                     
    ${Results_In_Features} =              Read Excel Cell          row_num=5   col_num=1      sheet_name=Mobile_Header
    ${Results_In_Features} =           String.Split String          ${Results_In_Features}        ;
    Set Global Variable        ${Results_In_Features}                 ${Results_In_Features} 


#----------------------------------------------Fiber--------------------------------------------------------------

#JioFiber page
Reading Data of Discover Page from Excel

    #Easy Recharge and Pay bills section
    ${notes}=                   Read Excel Cell          row_num=3     col_num=1   sheet_name=Fiber_Discover
    Log To Console    ${notes}
    

    #Popular JioFiber Plans     
    ${PopularJFP}      Read Excel Cell        row_num=6        col_num=1    sheet_name=Fiber_Discover
    ${PopularJFP}      String.Split String    ${PopularJFP}      ;
    
    
    #Easy Recharge and pay bills section
    Set Global Variable           ${notes}                ${notes}
    
    #Popular JioFiber Plans 
    Set Global Variable    ${PopularJFP}      ${PopularJFP}


Reading data from Excel file for Get JioFiber Section
    #Installation address page
    ${texts}=    Read Excel cell    6    1    sheet_name=Fiber_Get_Jiofiber
    ${texts}=    String.Split String    ${texts}    ;

    #Installation address map page
    ${content}=    Read Excel cell    8    1    sheet_name=Fiber_Get_Jiofiber
    ${content}=    String.Split String    ${content}    ;

    #GetJiofiber page
    ${JioFiber_text}=    Read Excel Cell    2    1    sheet_name=Fiber_Get_Jiofiber
    ${JioFiber_text}=    String.Split String    ${JioFiber_text}    ;

    #VerifyOTP page
    ${VerifyOTP_text}=    Read Excel Cell    4    1    sheet_name=Fiber_Get_Jiofiber
    ${VerifyOTP_text}=    String.Split String    ${VerifyOTP_text}    ;

    #Installation address page
    Set Global Variable    ${TEXTS}    ${texts}
    #Installation address map page
    Set Global Variable    ${CONTENT}    ${content}
    #GetJiofiber page
    Set Global Variable     ${JIOFIBER_TEXT}     ${JioFiber_text}
    #VerifyOTP page
    Set Global Variable     ${VERIFYOTP_TEXT}     ${VerifyOTP_text}
   

Reading Data of Fiber Paybills Page from Excel
#Paybills page

        ${MobileTabToast}=            Read Excel Cell    row_num=1    col_num=2    sheet_name=Fiber_Paybills
        ${MobileTabToast}=            String.Split String    ${MobileTabToast}    ;
        Set Global Variable           ${MobileTabToast}       
        
        ${Amount}=                    Read Excel Cell    row_num=2    col_num=2    sheet_name=Fiber_Paybills
        Set Global Variable           ${Amount}       


#Services 
Reading Data of Services Page from Excel
    Open Excel Document    Resources/JioWeb.xlsx    Text Verification  
#JioGames Text Verification
    ${G_heading}=    Read Excel Cell    row_num=2    col_num=2    sheet_name=Fiber_Services
    ${G_Subheading}=    Read Excel Cell    row_num=3    col_num=2    sheet_name=Fiber_Services
    
#JioJoin Text Verification
    ${J_heading}=    Read Excel Cell    row_num=6    col_num=2   sheet_name=Fiber_Services
    ${J_Subheading}=    Read Excel Cell    row_num=7    col_num=2    sheet_name=Fiber_Services

#Jio Set Top Box Text Verification
    ${STB_heading}=    Read Excel Cell    row_num=10    col_num=2   sheet_name=Fiber_Services
    ${STB_Subheading}=    Read Excel Cell    row_num=11    col_num=2    sheet_name=Fiber_Services
            
#High Speed Internet Text Verification
    ${HSI_heading}=    Read Excel Cell    row_num=14    col_num=2   sheet_name=Fiber_Services
    ${HSI_Subheading}=    Read Excel Cell    row_num=15    col_num=2    sheet_name=Fiber_Services
    
#Home Networking Text Verification
    ${HN_heading}=    Read Excel Cell    row_num=18    col_num=2   sheet_name=Fiber_Services
    ${HN_Subheading}=    Read Excel Cell    row_num=19    col_num=2    sheet_name=Fiber_Services
     
#Set Global Variables
    Set Global Variable    ${G_heading}    ${G_heading}
    Set Global Variable    ${G_Subheading}    ${G_Subheading}
    Set Global Variable    ${J_heading}    ${J_heading}
    Set Global Variable    ${J_Subheading}    ${J_Subheading}
    Set Global Variable    ${STB_heading}    ${STB_heading}
    Set Global Variable    ${STB_Subheading}    ${STB_Subheading}
    Set Global Variable    ${HSI_heading}    ${HSI_heading}
    Set Global Variable    ${HSI_Subheading}    ${HSI_Subheading} 
    Set Global Variable    ${HN_heading}    ${HN_heading}
    Set Global Variable    ${HN_Subheading}    ${HN_Subheading}
    
  
#Recharge page
Reading Data of Fiber Recharge Page from Excel       
    #Mobile Tab
        ${WrongMobileNoToast}=         Read Excel Cell    row_num=14    col_num=2    sheet_name=Fiber_Recharge
        Set Global Variable           ${WrongMobileNoToast}
        ${STDPlanNote}=               Read Excel Cell    row_num=2    col_num=1    sheet_name=Fiber_Recharge
        ${IRPlanNote}=                Read Excel Cell    row_num=2    col_num=2    sheet_name=Fiber_Recharge
        ${IRPlanNote}=                String.Split String    ${IRPlanNote}    ;
        ${IRPlanHeading}=             Read Excel Cell    row_num=2    col_num=3    sheet_name=Fiber_Recharge
        ${IRPlanHeading}=             String.Split String    ${IRPlanHeading}    ;
        ${ViewDetailsDescription}=    Read Excel Cell    row_num=4    col_num=2    sheet_name=Fiber_Recharge
        ${ViewDetailsDescription}=    String.Split String    ${ViewDetailsDescription}    ;
        ${ViewDetailsNote}=           Read Excel Cell    row_num=4    col_num=1    sheet_name=Fiber_Recharge
        ${ViewDetailsNote}=           String.Split String    ${ViewDetailsNote}    ;
        ${SelectPlanPageContent}=     Read Excel Cell    row_num=6    col_num=1    sheet_name=Fiber_Recharge
        ${SelectPlanPageContent}=     String.Split String    ${SelectPlanPageContent}    ;
        ${NameOfPlans}=               Read Excel Cell    row_num=8    col_num=1    sheet_name=Fiber_Recharge
        ${NameOfPlans}=               String.Split String    ${NameOfPlans}    ;
        ${PlanPrice}=                 Read Excel Cell    row_num=10    col_num=1    sheet_name=Fiber_Recharge
        ${PlanPrice}=                 String.Split String    ${PlanPrice}    ;
        ${PlanValidity}=              Read Excel Cell    row_num=12    col_num=1    sheet_name=Fiber_Recharge
        ${PlanValidity}=              String.Split String    ${PlanValidity}    ;
        ${PlanData}=                  Read Excel Cell    row_num=14    col_num=1    sheet_name=Fiber_Recharge
        ${PlanData}=                  String.Split String    ${PlanData}        ;
        Set Global Variable           ${STDPlanNote}
        Set Global Variable           ${IRPlanNote}        
        Set Global Variable           ${IRPlanHeading}
        Set Global Variable           ${ViewDetailsNote}
        Set Global Variable           ${ViewDetailsDescription}       
        Set Global Variable           ${SelectPlanPageContent}        
        Set Global Variable           ${NameOfPlans}        
        Set Global Variable           ${PlanPrice}        
        Set Global Variable           ${PlanValidity}        
        Set Global Variable           ${PlanData}        
    #Fiber tab
        ${WrongFiberToast}=         Read Excel Cell    row_num=6    col_num=2    sheet_name=Fiber_Recharge
        ${WrongFiberToast}=               String.Split String    ${WrongFiberToast}    ;
        Set Global Variable           ${WrongFiberToast}        
        ${FiberTabSelectPlanPageContent}=     Read Excel Cell    row_num=8    col_num=2    sheet_name=Fiber_Recharge
        ${FiberTabSelectPlanPageContent}=     String.Split String    ${FiberTabSelectPlanPageContent}    ;
        Set Global Variable           ${FiberTabSelectPlanPageContent}
        ${FiberTabNameOfPlans}=               Read Excel Cell    row_num=10    col_num=2    sheet_name=Fiber_Recharge
        ${FiberTabNameOfPlans}=               String.Split String    ${FiberTabNameOfPlans}    ;
        Set Global Variable           ${FiberTabNameOfPlans}        
        ${FiberTabPlanDetails}=               Read Excel Cell    row_num=12    col_num=2    sheet_name=Fiber_Recharge
        Set Global Variable           ${FiberTabPlanDetails}        
        ${FiberTabViewDetailsDescription}=    Read Excel Cell    row_num=4    col_num=3    sheet_name=Fiber_Recharge
        ${FiberTabViewDetailsDescription}=    String.Split String    ${FiberTabViewDetailsDescription}    ;
        Set Global Variable           ${FiberTabViewDetailsDescription}
        ${FiberTabViewDetailsApps}=           Read Excel Cell    row_num=6    col_num=3    sheet_name=Fiber_Recharge
        ${FiberTabViewDetailsApps}=           String.Split String    ${FiberTabViewDetailsApps}    ;
        Set Global Variable           ${FiberTabViewDetailsApps}
        ${FiberTabViewDetailsNote}=           Read Excel Cell    row_num=8    col_num=3    sheet_name=Fiber_Recharge
        Set Global Variable           ${FiberTabViewDetailsNote}
        ${FiberTabSTDPlanNote}=               Read Excel Cell    row_num=10    col_num=3    sheet_name=Fiber_Recharge
        Set Global Variable           ${FiberTabSTDPlanNote}
        ${FiberTabPaymentT&C}=               Read Excel Cell    row_num=2    col_num=4    sheet_name=Fiber_Recharge
        ${FiberTabPaymentT&C}=               String.Split String    ${FiberTabPaymentT&C}    ;
        Set Global Variable           ${FiberTabPaymentT&C}
        ${FiberTab'i'btnPop}=                Read Excel Cell    row_num=4    col_num=4    sheet_name=Fiber_Recharge
        ${FiberTab'i'btnPop}=                String.Split String    ${FiberTab'i'btnPop}    ;
        Set Global Variable           ${FiberTab'i'btnPop}
        ${FiberTabJioLinkPop}=                Read Excel Cell    row_num=6    col_num=4    sheet_name=Fiber_Recharge
        ${FiberTabJioLinkPop}=                String.Split String    ${FiberTabJioLinkPop}    ;
        Set Global Variable           ${FiberTabJioLinkPop}

 #Postpaid

Reading Data of Postpaid Page from Excel 
    # PostPaid Page UI Verification
    ${PostpaidPage_Text}        Read Excel Cell        row_num=2       col_num=1       sheet_name=Fiber_Postpaid
    ${PostpaidPage_Text}        String.Split String    ${PostpaidPage_Text}    ;
    Set Global Variable        ${PostpaidPage_Text}         ${PostpaidPage_Text}
    
 #Prepaid
Reading Data of Prepaid Fiber Page from Excel
    #Now upgrade your JioFiber plan anytime
    ${NowUpgrade}                   Read Excel Cell        row_num=2    col_num=1    sheet_name=Fiber_Prepaid
    ${NowUpgrade}                   String.Split String    ${NowUpgrade}        ;

    #Notes from Unlimited data with JioFiber Prepaid plans 
    ${Pre_notes}                    Read Excel Cell        row_num=2    col_num=2    sheet_name=Fiber_Prepaid
    ${Pre_notes}                    String.Split String    ${Pre_notes}        ;    

    #Prepaid Monthly page
    ${mob_notes}                    Read Excel Cell        row_num=2    col_num=3    sheet_name=Fiber_Prepaid
    ${mob_notes}                    String.Split String    ${mob_notes}        ; 


    #Unlimited data with JioFiber Prepaid plans - Prepaid page
    Set Global Variable        ${Pre_notes}                   ${Pre_notes}

    #Unbox blockbuster experiences with JioFiber monthly plans - Prepaid Monthly page
    Set Global Variable        ${mob_notes}                    ${mob_notes}

    #Now upgrade your JioFiber plan anytime
    Set Global Variable        ${NowUpgrade}                  ${NowUpgrade}


#Reading Data of Prepaid Page    
    ${TAG_Text}=    Read Excel Cell    row_num=36    col_num=2    sheet_name=Fiber_Prepaid
    ${TAG_Text}=    String.Split String    ${TAG_Text}    ;    
    Set Global Variable        ${TAG_Text}

    ${AMT_Value}=    Read Excel Cell    row_num=37    col_num=2    sheet_name=Fiber_Prepaid
    ${AMT_Value}=    String.Split String    ${AMT_Value}    ;    
    Set Global Variable        ${AMT_Value}

    ${DATA_SPEED_Text}=    Read Excel Cell    row_num=39    col_num=2    sheet_name=Fiber_Prepaid
    ${DATA_SPEED_Text}=    String.Split String    ${DATA_SPEED_Text}    ;    
    Set Global Variable        ${DATA_SPEED_Text}
    
    ${999_Pop_Up_Whole_Text}=    Read Excel Cell    row_num=40    col_num=2    sheet_name=Fiber_Prepaid
    Set Global Variable      ${999_Pop_Up_Whole_Text}  
    
    ${FAQ_Answers}=           Read Excel Column    col_num=2    row_offset=41    max_num=5    sheet_name=Fiber_Prepaid
    Set Global Variable    ${FAQ_Answers}

    ${Card_Data}=    Read Excel Column    col_num=2    row_offset=47    max_num=50    sheet_name=Fiber_Prepaid 
    Set Global Variable      ${Card_Data}  
    # Write Excel Cell    row_num=6     col_num=1    ${visibilty}    sheet_name=Fiber_Prepaid   


    ${Always_At_Pace_URLs}    Read Excel Cell    row_num=51    col_num=2    sheet_name=Fiber_Prepaid
    ${Always_At_Pace_URLs}=   String.Split String    ${Always_At_Pace_URLs}    ;
    Set Global Variable       ${Always_At_Pace_URLs}

    ${Why_India_is_obsessed_Links}    Read Excel Cell    row_num=53    col_num=2    sheet_name=Fiber_Prepaid
    ${Why_India_is_obsessed_Links}=   String.Split String    ${Why_India_is_obsessed_Links}    ;
    Set Global Variable       ${Why_India_is_obsessed_Links}

    
    # ${FAQ_Data_URL}=    Read Excel Column    col_num=2    row_offset=54   max_num=8   sheet_name=Fiber_Prepaid
    ${FAQ_Data_URL}=    Read Excel Cell    row_num=55    col_num=2     sheet_name=Fiber_Prepaid  
    ${FAQ_Data_URL}=    String.Split String    ${FAQ_Data_URL}    ;
    # Log To Console     ${FAQ_Data_URL} 
    # Get Length   ${FAQ_Data_URL}
    Set Global Variable     ${FAQ_Data_URL} 
