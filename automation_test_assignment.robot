*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            https://www.mall.cz



*** Test Cases ***
Verify Carousel Elements.robot
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Scroll Until Element is Visible \ \ \ xpath://*[@id="carousel-1"]
    ${carousel_elements} \ \ \ Get WebElements \ \ \ xpath://div[@class="carousel-item"]
    FOR \ \ \ ${element} \ \ \ IN \ \ \ @{carousel_elements}
    \ ${item_count} \ \ \ Get Matching Xpath Count \ \ \ ${element}//*[@class="item"]
        Should Be Equal As Integers \ \ \ ${item_count} \ \ \ 15
    END
    Close Browser
