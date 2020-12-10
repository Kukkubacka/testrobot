*** Settings ***

Library             SeleniumLibrary

Suite Teardown      Suite Teardown

*** Variables ***

${ENV}                                  qa
${BROWSER}                              gc
${url}                                  https://robotframework.org/

*** Test Cases ***

Test Robot
    [Tags]                              test
    Log                                 Robot Framework
    Log                                 ${ENV}

Test Selenium Headless
    [Tags]                              web          # norun
    Log                                 Opening wwww page
    Open WWW Page                       ${url}

Test Selenium Headfull
    [Tags]                              web          # norun
    Log                                 Test Create Web Driver
    Open WWW Page                       ${url}


*** Keywords ***

Open WWW Page 
    [Arguments]		                    ${page}	
    ${chrome-options}=    Evaluate      sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method                         ${chrome-options}    add_argument    --no-sandbox
    Call Method                         ${chrome-options}    add_argument    --disable-dev-shm-usage
    #Call Method                         ${chrome-options}    add_argument    --disable-setuid-sandbox
    Call Method                         ${chrome-options}    add_argument    --headless
    #Call Method                         ${chrome-options}    add_argument    --binary_location\=/usr/bin/google-chrome
    #Call Method                         ${chrome-options}    add_argument    --remote-debugging-port\=9922

    Open Browser                        ${page}     ${BROWSER}      options=${chrome-options}
    Sleep                               1
    Capture Page Screenshot             Robot_1.png
    Log                                 ${OUTPUT_DIR}

Test Create Web Driver
    [Arguments]		                    ${page}	
    ${chrome-options}=    Evaluate      sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method                         ${chrome-options}    add_argument    --no-sandbox
    Call Method                         ${chrome-options}    add_argument    --disable-dev-shm-usage
    #Call Method                         ${chrome-options}    add_argument    --disable-setuid-sandbox
    #Call Method                         ${chrome-options}    add_argument    --headless
    #Call Method                         ${chrome-options}    add_argument    --binary_location\=/usr/bin/google-chrome
    #Call Method                         ${chrome-options}    add_argument    --remote-debugging-port\=9922

    ${service-args}=	                Create List	    --verbose      --log-path=${OUTPUT_DIR}/chromedriver.log
    Create Webdriver	                Chrome	    options=${chrome-options}   service_args=${service-args} 

    Sleep                               1
    Capture Page Screenshot             Robot_1.png
    Log                                 ${OUTPUT_DIR}

Suite Teardown
    Close All Browsers
