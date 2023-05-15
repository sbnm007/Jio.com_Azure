*** Settings ***
Resource                              ../../../../Local_Keywords.robot

*** Keywords ***
Checking PriceRange Filter UI
    Click Show Filter Option
    Applying Slider Filter            xpath=(//div[@class="filters-container"])[1]    Price range
    Confirm product list is modified as per "Price filter"
    Remove Filter

Checking Filter Brand UI
    Click Show Filter Option
    ${brand}    Set Variable          Jio
    Applying CheckBox Filter          xpath=(//div[@class="filters-container"])[4]    Brand    ${brand}
    Verify Checkbox Filter            ${brand}
    Remove Filter

Checking Filter Category UI
    Click Show Filter Option
    ${category}    Set Variable       Fiber Accessories
    Applying CheckBox Filter          xpath=(//div[@class="filters-container"])[3]    Category    ${category}
    Verify Checkbox Filter            ${category}
    Remove Filter
