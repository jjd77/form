*** Settings ***
Library    SeleniumLibrary

*** Variables ***


*** Keywords ***

Navigate to the contact tab
    [Documentation]    this clicks on Contact tab top nav bar and validates the result
    wait until element is visible    //a[contains(.,'Contact')]
    click link    //a[contains(.,'Contact')]
    title should be    Contact – Site Title

Verify if Submit button is still visible
    [Documentation]    Just asserts if  Submit button is visible (on the Contact page)
    page should contain element    //button[contains(., 'Submit')]

Click submit button in the contact form
    [Documentation]    Just clicks Submit button on the Contact page
    Verify if Submit button is still visible
    click element    //button[contains(., 'Submit')]

Enter name in the contact form
    [Arguments]    ${name}
    input text    g2-name    ${name}    True

Enter email in the contact form
    [Arguments]    ${email}
    input text    g2-email    ${email}    True

Enter comment in the contact form
    [Arguments]    ${comment}
    input text    contact-form-comment-g2-comment    ${comment}    True
