*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${MAIN_PAGE_TITLE}    Site Title
${BROWSER}    chrome
${MAIN_PAGE_LINK}    https://testblogselenium.wordpress.com/
${IFRAME}    //*[@id="cmp-app-container"]//iframe
${IAGRE_BUTTON}   //button[contains(., 'I Agree!')]


*** Keywords ***
Open Login Page
    [Documentation]    Open browser on given page, maximize, set timeout, chacke title page
    open browser    ${MAIN_PAGE_LINK}   ${BROWSER}    options=add_experimental_option("excludeSwitches", ["enable-logging"])
    set selenium timeout    6
    title should be    ${MAIN_PAGE_TITLE}
    wait until page contains    Agree
#    The cookies bar is nested in on from several iframes inside the page structure, therefore it is needed to specify this particular iframe
    select frame    ${IFRAME}
    wait until element is visible    ${IAGRE_BUTTON}
    click element    ${IAGRE_BUTTON}
    wait until element is not visible   ${IAGRE_BUTTON}
    unselect frame
    maximize browser window

Close The Browser
    close browser
