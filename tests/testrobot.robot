*** Settings ***

Library             OperatingSystem
Library             SeleniumLibrary

Suite Teardown      Suite Teardown

*** Variables ***

${ENV}                                  qa
${BROWSER}                              gc
${url}                                  https://robotframework.org/

*** Test Cases ***

#Test Robot
#    [Tags]                              test
#    Log                                 Robot Framework
#    Log                                 ${ENV}

Test 1
    [Tags]                              web     group1      norun
    Log                                 Opening wwww page
    Open WWW Page                       https://robotframework.org/
    Top Command
    Sleep                               4
    Open WWW Page                       https://www.pokemongofriendcodes.com/
    Top Command
    Sleep                               4
    Open WWW Page                       https://yle.fi/uutiset

Test 2
    [Tags]                              web     group2     # norun
    Log                                 Opening wwww page
    Open WWW Page                       https://www.seiska.fi/
    Top Command
    Sleep                               4
    Open WWW Page                       https://www.karkkainen.com/verkkokauppa/
    Top Command
    Sleep                               4
    Open WWW Page                       https://www.vihreat.fi/
    
Test 3
    [Tags]                              web     group1     # norun
    Log                                 Opening wwww page
    Open WWW Page                       https://porsche.fi/kampanjat/uusi-taycan/
    Top Command
    Sleep                               4
    Open WWW Page                       https://www.lakeudenkone.fi
    Top Command
    Sleep                               4
    Open WWW Page                       https://www.kela.fi
    
Test 4
    [Tags]                              web     group2     # norun
    Log                                 Opening wwww page
    Open WWW Page                       https://fi.wikipedia.org/wiki/Porkkana
    Top Command
    Sleep                               4
    Open WWW Page                       https://www.kaalimato.com
    Top Command
    Sleep                               4
    Open WWW Page                       https://www.lapinkansa.fi/
    
Test 5
    [Tags]                              web     group1     # norun
    Log                                 Opening wwww page
    Open WWW Page                       https://iceland.nordicvisitor.com
    Top Command
    Sleep                               4
    Open WWW Page                       https://www.rolls-royce.com/
    Top Command
    Sleep                               4
    Open WWW Page                       https://www.britannica.com/place/Bangalore-India
    
Test 6
    [Tags]                              web     group2     # norun
    Log                                 Opening wwww page
    Open WWW Page                       https://cross.boats/fi
    Top Command
    Sleep                               4
    Open WWW Page                       https://www.ttl.fi/ova/happi.html
    Top Command
    Sleep                               4
    Open WWW Page                       https://puut.fi/

Test 7
    [Tags]                              web     group1     # norun
    Log                                 Opening wwww page
    Open WWW Page                       https://www.luontoportti.com/suomi/fi/puut/kuusi
    Top Command
    Sleep                               4
    Open WWW Page                       https://ducati.fi/
    Top Command
    Sleep                               4
    Open WWW Page                       https://panimoliitto.fi/juomat/olut/
    
Test 8
    [Tags]                              web     group2     # norun
    Log                                 Opening wwww page
    Open WWW Page                       ${url}
    Top Command
    Sleep                               4
    Open WWW Page                       https://poliisi.fi/etusivu
    Top Command
    Sleep                               4
    Open WWW Page                       https://www.azlyrics.com/lyrics/doors/theend.html


*** Keywords ***

Top Command
    ${top}=                             Run    top -n 1
    #${mem}=                             Run    

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
