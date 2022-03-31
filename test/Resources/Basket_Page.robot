*** Settings ***
Documentation     The Page where \ products are added to basket (and the options for products are selected \ )and these products are on shopping card on this page
Resource          Shared_Resources.robot

*** Variables ***
${GoToBasket}     link=Pokračovať do košíka    # button to continue to basket after the options for product are choosed
${ReturnShopping}    link=Späť k nákupu    # button to return to our category to select more products
${Counter}        0    # counter for FOR cycle

*** Keywords ***
kwdAddToBasketAndReturnToHomePage/orderOfProduct | testData
    [Arguments]    ${orderOfProduct}    @{testData}
    [Documentation]    Keyword which add most expensive product \ by sort order to basket page and check that it it the right product from test data
    kwdWaitAndClickElement/locator    ${GoToBasket}
    FOR    ${Counter}    IN RANGE    ${orderOfProduct}
        Page Should Contain Element    ${testData}[${Counter}]
    END
    kwdWaitAndClickElement/locator    ${ReturnShopping}
