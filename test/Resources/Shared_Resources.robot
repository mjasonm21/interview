*** Settings ***
Documentation     Shared keywords for pages

*** Variables ***
${Temp}           ${EMPTY}    # Variable for Temp data
${SupportElementAlzakCloseButton}    xpath=//div[@id='vendor-close']    # Close button for Alzak support element on page

*** Keywords ***
kwdCloseSupportElementAlzak
    [Documentation]    Keyword(function) to remove alzak(alza support element which hiding elements): it is random so this is hard to test
    ${Temp}    Run Keyword And Return Status    Element Should Be Visible    ${SupportElementAlzakCloseButton}
    Run Keyword If    $Temp    Click Element    ${SupportElementAlzakCloseButton}

kwdWaitAndClickElement/locator
    [Arguments]    ${locator}
    [Documentation]    keyword which wait until element is rendered and click on it
    Wait Until Page Contains Element    ${locator}
    Click Link    ${locator}
