*** Settings ***
Documentation     The Home page where products and categories are selected
Resource          Shared_Resources.robot

*** Variables ***
${CookiesBanner}    link=Rozumiem    # Button to close cookies banner
${LevelOneCategory}    link=Počítače a notebooky    # first category button
${LevelTwoCategory}    link=Notebooky    # second category button inside the first category
${SortByMostExpensive}    link=Najdrahšie    # Button to sort products by most expensive

*** Keywords ***
kwdOpenCatalog
    [Documentation]    Keyword which Maximize window and select te right categories
    Maximize Browser Window
    kwdWaitAndClickElement/locator    ${CookiesBanner}
    kwdWaitAndClickElement/locator    ${LevelOneCategory}
    kwdCloseSupportElementAlzak
    kwdWaitAndClickElement/locator    ${LevelTwoCategory}
    kwdCloseSupportElementAlzak

kwdSelectMostExpensiveByOrder/orderOfProduct
    [Arguments]    ${orderOfProduct}
    [Documentation]    Keyword which sort items by most expensive and select most expensive product by sort order(it calls kwdDynamicBuy/counter)
    kwdCloseSupportElementAlzak
    kwdWaitAndClickElement/locator    ${SortByMostExpensive}
    kwdCloseSupportElementAlzak
    kwdDynamicBuy/counter    ${orderOfProduct}
    kwdCloseSupportElementAlzak

kwdDynamicBuy/counter
    [Arguments]    ${counter}
    [Documentation]    Keyword which click on the right item on items table by sort order
    Comment    click to Buy on Most expensive item by couter variable
    kwdWaitAndClickElement/locator    xpath=//div[@id='boxc']/div/div[${counter}]/div[@class='bottom']/div/span/a[@class='btnk1']
