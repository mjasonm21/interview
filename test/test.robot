*** Settings ***
Resource          Resources/Basket_Page.robot
Resource          Resources/Home_Page.robot
Resource          Resources/Shared_Resources.robot
Library           SeleniumLibrary

*** Variables ***
${CountOfItems}    2    # How many items will be added to Basket
${Url}            https://www.alza.sk/    # url of shop
${Browser}        chrome    # which browser we are using
@{TestNames}      xpath=//a[contains(text(),'MacBook Pro 16" M1 MAX SK 2021 Vesmírnosivý')]    xpath=//a[contains(text(),'MacBook Pro 16" M1 MAX International English 2021 Vesmírne sivý')]    # Test data for products on shopping card
${Counter}        0    # counter for FOR cycle
${Temp}           ${EMPTY}    # variable for temp data

*** Test Cases ***
Add two most expensive products to basket
    [Documentation]    Main Test to add two most expensive products to basket.
    [Setup]    Open Browser    ${Url}    ${Browser}
    Wait Until Keyword Succeeds    1x    30s    kwdOpenCatalog
    FOR    ${Couter}    IN RANGE    ${CountOfItems}
        ${Temp}=    evaluate    ${Couter} + 1
        kwdSelectMostExpensiveByOrder/OrderOfProduct    ${Temp}
        kwdAddToBasketAndReturnToHomePage/orderOfProduct | testData    ${Temp}    @{TestNames}
    END
    [Teardown]    Close Window    # Close Browser

*** Keywords ***
