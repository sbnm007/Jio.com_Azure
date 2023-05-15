*** Settings ***
Library     SeleniumLibrary
Library     ExcelLibrary
Library     String
Variables   Common_Variables.yaml


*** Keywords *** 
 Home Tags Activity 
    # Home_Page
    ${Grand Total_Home}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=Grand Total_Home 
    ${TC01-Home}=    Adjacent Cell Value 
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC01-Home
    Set Global Variable    ${TC01-Home}
    ${TC03-Home}=    Adjacent Cell Value 
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC03-Home
    Set Global Variable    ${TC03-Home} 
    ${TC104-Home}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC104-Home
    Set Global Variable    ${TC104-Home}
    ${TC111-Home}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC111-Home
    Set Global Variable    ${TC111-Home}
    ${TC114-Home}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC114-Home
    Set Global Variable    ${TC114-Home}
    ${TC115-Home}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC115-Home
    Set Global Variable    ${TC115-Home}
    ${TC119-Home}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC119-Home
    Set Global Variable    ${TC119-Home}
    ${TC122-Home}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC122-Home
    Set Global Variable    ${TC122-Home}
    ${TC132-Home}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC132-Home
    Set Global Variable    ${TC132-Home}
    ${TC135-Home}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC135-Home
    Set Global Variable    ${TC135-Home}
    ${TC138-Home}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC138-Home
    Set Global Variable    ${TC135-Home}
    ${TC13-Home}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC13-Home
    Set Global Variable    ${TC13-Home}
    ${TC144-Home}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC144-Home
    Set Global Variable    ${TC144-Home}
    ${TC15-Home}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC15-Home
    Set Global Variable    ${TC15-Home}
    ${TC16-Home}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC16-Home
    Set Global Variable    ${TC16-Home}
    ${TC41-Home}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC41-Home
    Set Global Variable    ${TC41-Home}
    ${TC53-Home}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC53-Home
    Set Global Variable    ${TC53-Home}
    ${TC70-Home}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC70-Home
    Set Global Variable    ${TC70-Home}
    ${TC71-Home}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC71-Home
    Set Global Variable    ${TC71-Home}
     ${TC98-Home}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC98-Home
    Set Global Variable    ${TC98-Home} 
    ${TC99-Home}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC99-Home
    Set Global Variable    ${TC99-Home}
   
    
Support Tag Activity
    # support page
    ${Grand Total_Support}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=Grand Total_Support

Support Contact centre Tag Activity

    ${TC01-SUC}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC01-SUC
    Set Global Variable    ${TC01-SUC} 
    
Support Discover Tag Activity 
    ${TC01-SUD}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC01-SUD
    Set Global Variable    ${TC01-SUD}
    ${TC06-SUD}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC06-SUD
    Set Global Variable    ${TC06-SUD}
    ${TC10-SUD}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC10-SUD
    Set Global Variable    ${TC10-SUD}
    ${TC12-SUD}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC12-SUD
    Set Global Variable    ${TC12-SUD}
    ${TC14-SUD}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC14-SUD
    Set Global Variable    ${TC14-SUD}
    ${TC16-SUD}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC16-SUD
    Set Global Variable    ${TC16-SUD}
    ${TC18-SUD}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC18-SUD
    Set Global Variable    ${TC18-SUD}
    ${TC20-SUD}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC20-SUD
    Set Global Variable    ${TC20-SUD}
    ${TC22-SUD}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC22-SUD
    Set Global Variable    ${TC22-SUD}
    ${TC32-SUD}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC32-SUD
    Set Global Variable    ${TC32-SUD}
    ${TC36-SUD}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC36-SUD
    Set Global Variable    ${TC36-SUD}
    ${TC38-SUD}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC38-SUD
    Set Global Variable    ${TC38-SUD}
    ${TC44-SUD}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC44-SUD
    Set Global Variable    ${TC44-SUD}
    ${TC47-SUD}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC47-SUD
    Set Global Variable    ${TC47-SUD}
    ${TC50-SUD}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC50-SUD
    Set Global Variable    ${TC50-SUD}
    ${TC51-SUD}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC51-SUD
    Set Global Variable    ${TC51-SUD}

Support Locate Us Tag Activity
    ${TC01-SULU}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC01-SULU
    Set Global Variable    ${TC01-SULU}

Support Track Order Tag Activity
    ${TC01-SUTO}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC01-SUTO
    Set Global Variable    ${TC01-SUTO}
    ${TC08-SUTO}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC08-SUTO
    Set Global Variable    ${TC08-SUTO}
    ${TC16-SUTO}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC16-SUTO
    Set Global Variable    ${TC16-SUTO}



Mobile Tag Activity
    # Mobile
    ${Grand Total_Mobile}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=Grand Total_Mobile

Mobile Discover Tag Activity
    ${TC01-MDiscover}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC01-MDiscover
    Set Global Variable    ${TC01-MDiscover}    
    ${TC02-MDiscover}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC02-MDiscover
    Set Global Variable    ${TC02-MDiscover}
    ${TC09-MDiscover}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC09-MDiscover
    Set Global Variable    ${TC09-MDiscover}
    # ${TC28-MDiscover}=    Adjacent Cell Value
    # ...    file_path=${Tags_Activity_Location}
    # ...    sheet_name=PivotTable
    # ...    name=TC28-MDiscover
    # Set Global Variable    ${TC28-MDiscover}
    ${TC37-MDiscover}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC37-MDiscover
    Set Global Variable    ${TC37-MDiscover}
    ${TC39-MDiscover}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC39-MDiscover
    Set Global Variable    ${TC39-MDiscover}
    ${TC59-MDiscover}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC59-MDiscover
    Set Global Variable    ${TC59-MDiscover}
    ${TC67-MDiscover}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC67-MDiscover
    Set Global Variable    ${TC67-MDiscover}
    ${TC71-MDiscover}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC71-MDiscover
    Set Global Variable    ${TC71-MDiscover}
    ${TC75-MDiscover}=    Adjacent Cell Value 
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable                                                  
    ...    name=TC75-MDiscover
    Set Global Variable    ${TC75-MDiscover}
    ${TC80-MDiscover}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC80-MDiscover
    Set Global Variable    ${TC80-MDiscover}
    ${TC83-MDiscover}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC83-MDiscover
    Set Global Variable    ${TC83-MDiscover}


Mobile Get Jio Sim Tag Activity
    ${TC01-MGetJioSIM}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC01-MGetJioSIM
    Set Global Variable    ${TC01-MGetJioSIM}
    ${TC02-MGetJioSIM}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC02-MGetJioSIM
    Set Global Variable    ${TC02-MGetJioSIM}
    ${TC37-MGetJioSIM}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC37-MGetJioSIM
    Set Global Variable    ${TC37-MGetJioSIM}

Mobile Header Tag Activity
    ${TC01-MHeader}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC01-MHeader
    Set Global Variable    ${TC01-MHeader}
    # ${TC02-MHeader}=    Adjacent Cell Value
    # ...    file_path=${Tags_Activity_Location}
    # ...    sheet_name=PivotTable
    # ...    name=TC02-MHeader
    # Set Global Variable    ${TC02-MHeader}
    ${TC08-MHeader}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC08-MHeader
    Set Global Variable    ${TC08-MHeader}
    ${TC13-MHeader}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC13-MHeader
    Set Global Variable    ${TC13-MHeader}
    ${TC25-MHeader}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC25-MHeader
    Set Global Variable    ${TC25-MHeader}
    # ${TC26-MHeader}=    Adjacent Cell Value
    # ...    file_path=${Tags_Activity_Location}
    # ...    sheet_name=PivotTable
    # ...    name=TC26-MHeader
    # Set Global Variable    ${TC26-MHeader}

Mobile Postpaid Tag Activity
    ${TC01-MPostpaid}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC01-MPostpaid
    Set Global Variable    ${TC01-MPostpaid}
    ${TC02-MPostpaid}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC02-MPostpaid
    Set Global Variable    ${TC02-MPostpaid}
    ${TC03-MPostpaid}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC03-MPostpaid
    Set Global Variable    ${TC03-MPostpaid}
    ${TC10-MPostpaid}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC10-MPostpaid
    Set Global Variable    ${TC10-MPostpaid}
    ${TC29-MPostpaid}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC29-MPostpaid
    Set Global Variable    ${TC29-MPostpaid}
    ${TC43-MPostpaid}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC43-MPostpaid
    Set Global Variable    ${TC43-MPostpaid}
    ${TC68-MPostpaid}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC68-MPostpaid
    Set Global Variable    ${TC68-MPostpaid}
    ${TC91-MPostpaid}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC91-MPostpaid
    Set Global Variable    ${TC91-MPostpaid}
    ${TC97-MPostpaid}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC97-MPostpaid
    Set Global Variable    ${TC97-MPostpaid}

Mobile Prepaid Tag Activity
     ${TC23-MPrepaid}=    Adjacent Cell Value    file_path=${Tags_Activity_Location}  
     ...    sheet_name=PivotTable
     ...    name=TC23-MPrepaid
    Set Global Variable    ${TC23-MPrepaid}
    ${TC01-MPrepaid}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC01-MPrepaid
    Set Global Variable    ${TC01-MPrepaid}
    ${TC05-MPrepaid}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC05-MPrepaid
    Set Global Variable    ${TC05-MPrepaid}
    ${TC33-MPrepaid}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC33-MPrepaid
    Set Global Variable    ${TC33-MPrepaid}
    ${TC43-MPrepaid}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC43-MPrepaid
    Set Global Variable    ${TC43-MPrepaid}
    ${TC60-MPrepaid}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC60-MPrepaid
    Set Global Variable    ${TC60-MPrepaid}
    ${TC70-MPrepaid}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC70-MPrepaid
    Set Global Variable    ${TC70-MPrepaid}
    ${TC80-MPrepaid}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC80-MPrepaid
    Set Global Variable    ${TC80-MPrepaid}
    ${TC90-MPrepaid}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC90-MPrepaid
    Set Global Variable    ${TC90-MPrepaid}
    ${TC110-MPrepaid}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC110-MPrepaid
    Set Global Variable    ${TC110-MPrepaid}
    ${TC120-MPrepaid}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC120-MPrepaid
    Set Global Variable    ${TC120-MPrepaid}
    ${TC129-MPrepaid}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC129-MPrepaid
    Set Global Variable    ${TC129-MPrepaid}
    ${TC146-MPrepaid}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC146-MPrepaid
    Set Global Variable    ${TC146-MPrepaid}
    ${TC155-MPrepaid}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC155-MPrepaid
    Set Global Variable    ${TC155-MPrepaid}
    ${TC166-MPrepaid}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC166-MPrepaid
    Set Global Variable    ${TC166-MPrepaid}
    ${TC165-MPrepaid}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC165-MPrepaid
    Set Global Variable    ${TC165-MPrepaid}
    ${TC168-MPrepaid}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC168-MPrepaid
    Set Global Variable    ${TC168-MPrepaid}  

Mobile Recharge Tag Activity    
    ${TC01-MRecharge}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC01-MRecharge
    Set Global Variable    ${TC01-MRecharge}   
    ${TC09-MRecharge}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC09-MRecharge
    Set Global Variable    ${TC09-MRecharge}
    ${TC14-MRecharge}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC14-MRecharge 
    Set Global Variable    ${TC14-MRecharge}
    ${TC23-MRecharge}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC23-MRecharge
    Set Global Variable    ${TC23-MRecharge}
    ${TC33-MRecharge}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC33-MRecharge
    Set Global Variable    ${TC33-MRecharge}
    ${TC44-MRecharge}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC44-MRecharge
    Set Global Variable    ${TC44-MRecharge}
    ${TC48-MRecharge}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC48-MRecharge
    Set Global Variable    ${TC48-MRecharge} 

 Shop Tag Activity
    # SHOP
    ${Grand Total_Shop}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=Grand Total_Shop
    
Shop Accessories Tag Activity
    ${TC01-SAccessories}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC01-SAccessories
    Set Global Variable    ${TC01-SAccessories}
    ${TC04-SAccessories}=    Adjacent Cell Value  
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC04-SAccessories
    Set Global Variable    ${TC04-SAccessories}
    ${TC13-SAccessories}=    Adjacent Cell Value 
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC13-SAccessories
    Set Global Variable    ${TC13-SAccessories}

Shop Add To Cart Tag Activity
    ${TC01-SAdd to Cart}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC01-SAdd to Cart
    Set Global Variable    ${TC01-SAdd to Cart}
    ${TC17-SAdd to Cart}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC17-SAdd to Cart
    Set Global Variable    ${TC17-SAdd to Cart}

Shop Discover Tag Activity
    ${TC01-SDiscover}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable 
    ...    name=TC01-SDiscover
    Set Global Variable    ${TC01-SDiscover}
    ${TC08-SDiscover}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC08-SDiscover
    Set Global Variable    ${TC08-SDiscover}
    ${TC13-SDiscover}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC13-SDiscover
    Set Global Variable    ${TC13-SDiscover}
    ${TC17-SDiscover}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC17-SDiscover
    Set Global Variable    ${TC17-SDiscover}
    ${TC20-SDiscover}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC20-SDiscover
    Set Global Variable    ${TC20-SDiscover}
    ${TC23-SDiscover}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC23-SDiscover
    Set Global Variable    ${TC23-SDiscover}
    ${TC26-SDiscover}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC26-SDiscover
    Set Global Variable    ${TC26-SDiscover}
    ${TC28-SDiscover}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC28-SDiscover
    Set Global Variable    ${TC28-SDiscover}

Shop Jio Fi Tag Activity
    ${TC01-SJioFi}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC01-SJioFi
    Set Global Variable    ${TC01-SJioFi}
    ${TC04-SJioFi}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC04-SJioFi
    Set Global Variable    ${TC04-SJioFi}
    ${TC11-SJioFi}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC11-SJioFi
    Set Global Variable    ${TC11-SJioFi}

Shop Smartdevices Tag Activity
    ${TC01-SSmartDevices}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC01-SSmartDevices
    Set Global Variable    ${TC01-SSmartDevices}
    ${TC27-SSmartDevices}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC27-SSmartDevices
    Set Global Variable    ${TC27-SSmartDevices}
    ${TC30-SSmartDevices}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC30-SSmartDevices
    Set Global Variable    ${TC30-SSmart Devices}

Shop Smartphones Tag Activity
    ${TC01-SSmartphones}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC01-SSmartphones
    Set Global Variable    ${TC01-SSmartphones}
    ${TC04-SSmartphones}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC04-SSmartphones
    Set Global Variable    ${TC04-SSmartphones}
    ${TC29-SSmartphones}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC29-SSmartphones
    Set Global Variable    ${TC29-SSmartphones}


Fiber Tag Activity
    ##FIBER
    ${Grand Total_Fiber}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=Grand Total_Fiber
    
Fiber Discover Tag Activity
    ${TC01-FDiscover}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC01-FDiscover
    Set Global Variable    ${TC01-FDiscover}
    ${TC08-FDiscover}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC08-FDiscover
    Set Global Variable    ${TC08-FDiscover}
    ${TC19-FDiscover}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC19-FDiscover
    Set Global Variable    ${TC19-FDiscover}
    ${TC23-FDiscover}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC23-FDiscover
    Set Global Variable    ${TC23-FDiscover} 
  
    ${TC29-FDiscover}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC29-FDiscover 
    Set Global Variable    ${TC29-FDiscover} 
    #####changes 48 tc### 
    ${TC48-FDiscover}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC48-FDiscover 
    Set Global Variable    ${TC48-FDiscover}
    ${TC52-FDiscover}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC52-FDiscover
    Set Global Variable    ${TC52-FDiscover} 
    ${TC56-FDiscover}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC56-FDiscover
    Set Global Variable    ${TC56-FDiscover} 

Fiber Get Jio Fiber Tag Activity
    ${TC01-FGetJioFiber}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC01-FGetJioFiber
    Set Global Variable    ${TC01-FGetJioFiber}
    ${TC10-FGetJioFiber}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC10-FGetJioFiber
    Set Global Variable    ${TC10-FGetJioFiber}
    ${TC18-FGetJioFiber}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC18-FGetJioFiber
    Set Global Variable    ${TC18-FGetJioFiber}
    ${TC27-FGetJioFiber}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC27-FGetJioFiber
    Set Global Variable    ${TC27-FGetJioFiber}
    ${TC32-FGetJioFiber}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC32-FGetJioFiber
    Set Global Variable    ${TC32-FGetJioFiber}

Fiber Paybills Tag Activity
    ${TC01-FPaybills}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC01-FPaybills
    Set Global Variable    ${TC01-FPaybills}
    ${TC11-FPaybills}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC11-FPaybills
    Set Global Variable    ${TC11-FPaybills}
    ${TC16-FPaybills}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC16-FPaybills
    Set Global Variable    ${TC16-FPaybills} 

Fiber Postpaid Tag Activity
    ${TC01-FPostpaid}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC01-FPostpaid     
    Set Global Variable    ${TC01-FPostpaid}
    ${TC02-FPostpaid}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC02-FPostpaid
    Set Global Variable    ${TC02-FPostpaid}
    ${TC04-FPostpaid}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC04-FPostpaid
    Set Global Variable    ${TC04-FPostpaid}
    ${TC10-FPostpaid}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC10-FPostpaid
    Set Global Variable    ${TC10-FPostpaid}
    ${TC12-FPostpaid}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC12-FPostpaid
    Set Global Variable    ${TC12-FPostpaid}
    ${TC26-FPostpaid}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC26-FPostpaid
    Set Global Variable    ${TC26-FPostpaid}
    ${TC40-FPostpaid}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC40-FPostpaid
    Set Global Variable    ${TC40-FPostpaid} 
    ${TC54-FPostpaid}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC54-FPostpaid
    Set Global Variable    ${TC54-FPostpaid} 
    ${TC68-FPostpaid}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC68-FPostpaid
    Set Global Variable    ${TC68-FPostpaid}
    ${TC79-FPostpaid}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC79-FPostpaid
    Set Global Variable    ${TC79-FPostpaid}
    ${TC90-FPostpaid}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC90-FPostpaid
    Set Global Variable    ${TC90-FPostpaid} 
    ${TC91-FPostpaid}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC91-FPostpaid
    Set Global Variable    ${TC91-FPostpaid} 
    ${TC96-FPostpaid}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC96-FPostpaid 
    Set Global Variable    ${TC96-FPostpaid}
    ${TC98-FPostpaid}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC98-FPostpaid
    Set Global Variable    ${TC98-FPostpaid} 

Fiber Prepaid Tag Activity
    ${TC01-FPrepaid}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC01-FPrepaid
    Set Global Variable    ${TC01-FPrepaid}
    #${TC02-FPrepaid}=    Adjacent Cell Value
    #...    file_path=${Tags_Activity_Location}
    #...    sheet_name=PivotTable
    #...    name=TC02-FPrepaid
    #Set Global Variable    ${TC02-FPrepaid}
    #${TC04-FPrepaid}=    Adjacent Cell Value
    #...    file_path=${Tags_Activity_Location}
    #...    sheet_name=PivotTable
    #...    name=TC04-FPrepaid 
   # Set Global Variable    ${TC04-FPrepaid} #
    ${TC103-FPrepaid}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC103-FPrepaid
    Set Global Variable    ${TC103-FPrepaid} 
    ${TC113-FPrepaid}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC113-FPreapid
    Set Global Variable    ${TC113-FPrepaid} 
    # changes made added 113 ##
    ${TC14-FPrepaid}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC14-FPrepaid
    Set Global Variable    ${TC14-FPrepaid}
    ${TC31-FPrepaid}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC31-FPrepaid 
    Set Global Variable    ${TC31-FPrepaid}
    ${TC48-FPrepaid}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC48-FPrepaid
    Set Global Variable    ${TC48-FPrepaid} 
    ${TC65-FPrepaid}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC65-FPrepaid
    Set Global Variable    ${TC65-FPrepaid} 
    ${TC82-FPrepaid}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC82-FPrepaid
    Set Global Variable    ${TC82-FPrepaid} 
    ${TC93-FPrepaid}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC93-FPrepaid
    Set Global Variable    ${TC93-FPrepaid} 

Fiber Recharge Tag Activity
    ${TC01-FRecharge}=    Adjacent Cell Value    file_path=${Tags_Activity_Location}    
    ...    sheet_name=PivotTable   
    ...    name=TC01-FRecharge
    Set Global Variable    ${TC01-FRecharge}
    ${TC09-FRecharge}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC09-FRecharge                 
    Set Global Variable    ${TC09-FRecharge}
    ${TC13-FRecharge}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC13-FRecharge
    Set Global Variable    ${TC13-FRecharge}
    ${TC17-FRecharge}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC17-FRecharge
    Set Global Variable    ${TC17-FRecharge}
    ${TC20-FRecharge}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC20-FRecharge    
    Set Global Variable    ${TC20-FRecharge}
    ${TC25-FRecharge}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC25-FRecharge
    Set Global Variable    ${TC25-FRecharge} 
    ${TC29-FRecharge}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC29-FRecharge
    Set Global Variable    ${TC29-FRecharge} 
 Fiber Services Tag Activity  
    ${TC01-FServices}=    Adjacent Cell Value 
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC01-FServices
    Set Global Variable    ${TC01-FServices}
    ${TC05-FServices}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC05-FServices 
    Set Global Variable    ${TC05-FServices}
    ${TC08-FServices}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC08-FServices
    Set Global Variable    ${TC08-FServices}
    ${TC11-FServices}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC11-FServices
    Set Global Variable    ${TC11-FServices}
    ${TC14-FServices}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC14-FServices
    Set Global Variable    ${TC14-FServices}
    ${TC17-FServices}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC17-FServices
    Set Global Variable    ${TC17-FServices}
    ${TC20-FServices}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC20-FServices
    Set Global Variable    ${TC20-FServices}
    ${TC23-FServices}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC23-FServices
    Set Global Variable    ${TC23-FServices} 
    ${TC26-FServices}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=TC26-FServices
    Set Global Variable    ${TC26-FServices} 
 


Apps Tag Activity
#### APPS 
    ${Grand Total_Apps}=    Adjacent Cell Value 
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=Grand Total_Apps 
    ${Apps_Home}=    Adjacent Cell Value 
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=Apps_Home
    Set Global Variable    ${Apps_Home} 
    #${HomeTC02-}=    Adjacent Cell Value
    #...    file_path=${Tags_Activity_Location}
    #...    sheet_name=PivotTable
    #...    name=TC02-Home
    #Set Global Variable    ${TC02-Home} 
    ${JioCall}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable 
    ...    name=JioCall
    Set Global Variable    ${JioCall}
    ${JioChat}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=JioChat
    Set Global Variable    ${JioChat}
    ${JioCinema}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=JioCinema
    Set Global Variable    ${JioCinema}
    ${JioCloud}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=JioCloud
    Set Global Variable    ${JioCloud}
    ${JioGames}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=JioGames
    Set Global Variable    ${JioGames}
    ${JioHealthHub}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=JioHealthHub
    Set Global Variable    ${JioHealthHub}
    ${JioHome}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=JioHome 
    Set Global Variable    ${JioHome}
    ${JioMart}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=JioMart
    Set Global Variable    ${JioMart}
    ${JioMeet}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=JioMeet   
    Set Global Variable    ${JioMeet}
    ${JioNews}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=JioNews
    Set Global Variable    ${JioNews}
    ${JioPages}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=JioPages
    Set Global Variable    ${JioPages}
    ${JioPOSLite}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=JioPOSLite
    Set Global Variable    ${JioPOSLite}
    ${JioSaavn}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=JioSaavn
    Set Global Variable    ${JioSaavn}
    ${JioSecurity}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=JioSecurity
    Set Global Variable    ${JioSecurity}
    ${JioTV}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=JioTV
    Set Global Variable    ${JioTV}
    ${MyJio}=    Adjacent Cell Value
    ...    file_path=${Tags_Activity_Location}
    ...    sheet_name=PivotTable
    ...    name=MyJio
    Set Global Variable    ${MyJio}
    