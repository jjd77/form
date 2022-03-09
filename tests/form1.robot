*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/common.robot
Resource    ../resources/actions.robot
Test Setup    common.Open Login Page
Test Teardown    common.Close the Browser

*** Variables ***
${NAME}    Nazwa1
${MAIL}   adresmailowy@wp.pl
${MAIL_INVALID}   adresmailowy@wp
${COMMENT}     treść komentarza z polskimi znakami

*** Test Cases ***

Contact form validation happy path
    [Documentation]    This test a happy path for the contact form
    [Tags]    smoke
    actions.Navigate to the contact tab
    actions.Enter name in the contact form    ${NAME}
    actions.enter email in the contact form    ${MAIL}
    actions.Enter comment in the contact form    ${COMMENT}
    actions.Click submit button in the contact form
    element text should be    //blockquote/p[1]    Name: ${NAME}
    element text should be    //blockquote/p[2]    Email: ${MAIL}
    element text should be    //blockquote/p[3]    Comment: ${COMMENT}

Contact form invalid email
    [Documentation]    This test negative path for the contact form with invalid email error message
    [Tags]    smoke
    actions.Navigate to the contact tab
    actions.Enter name in the contact form    ${NAME}
    actions.enter email in the contact form    ${MAIL_INVALID}
    actions.Enter comment in the contact form    ${COMMENT}
    actions.Click submit button in the contact form
    element should contain    //ul[@class="form-errors"]    Email requires a valid email address

Contact form with blanks
    [Documentation]    This test negative path for the contact form with blank fields
    [Tags]    smoke
    actions.Navigate to the contact tab
    actions.Click submit button in the contact form
    actions.Verify if Submit button is still visible
    actions.Enter name in the contact form    ${NAME}
    actions.Click submit button in the contact form
    actions.Verify if Submit button is still visible
    actions.Enter email in the contact form    ${MAIL}
    actions.Click submit button in the contact form
    actions.Verify if Submit button is still visible
    actions.Enter comment in the contact form    ${COMMENT}
    actions.Enter name in the contact form    ${EMPTY}
    actions.Click submit button in the contact form
    actions.Verify if Submit button is still visible

