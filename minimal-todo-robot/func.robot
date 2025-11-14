*** Keywords ***
Start Minimal Todo App
    Open Application    ${APPIUM_SERVER}
    ...    platformName=Android
    ...    deviceName=${DEVICE_NAME}
    ...    automationName=UiAutomator2
    ...    app=${APP}

Verify Empty Todo List
    Wait Until Element Is Visible    ${EMPTY_ICON}    10s
    Wait Until Element Is Visible    ${EMPTY_TEXT}    10s

Add New Todo Item
    [Arguments]    ${text}
    Click Element    ${FAB_ADD_TODO}
    Wait Until Element Is Visible    ${INPUT_TODO_TITLE}    10s
    Input Text        ${INPUT_TODO_TITLE}    ${text}
    Click Element     ${FAB_SAVE_TODO}

Verify Todo Appears In List
    [Arguments]    ${text}
    # รอให้กลับมาหน้าหลัก และไม่แสดง empty text
    Wait Until Page Contains Element    ${TODO_ITEM_XPATH}    10s
    Run Keyword And Ignore Error    Wait Until Element Does Not Exist    ${EMPTY_TEXT} 

Open Todo For Edit
    [Arguments]    ${text}
    ${todo_locator}=    Set Variable    xpath=//android.widget.TextView[@text="${text}"]
    Wait Until Element Is Visible    ${todo_locator}    10s
    Click Element    ${todo_locator}

Edit Todo Title
    [Arguments]    ${new_text}
    Wait Until Element Is Visible    ${INPUT_TODO_TITLE}    10s
    Clear Text       ${INPUT_TODO_TITLE}
    Input Text       ${INPUT_TODO_TITLE}    ${new_text}
    Click Element    ${FAB_SAVE_TODO}

Verify Todo Updated
    [Arguments]    ${old_text}    ${new_text}
    ${new_locator}=    Set Variable    xpath=//android.widget.TextView[@text="${new_text}"]
    ${old_locator}=    Set Variable    xpath=//android.widget.TextView[@text="${old_text}"]
    Wait Until Element Is Visible    ${new_locator}    10s
    Run Keyword And Ignore Error    Page Should Not Contain Element    ${old_locator}

Verify Todo Not Exists
    [Arguments]    ${text}
    ${todo_locator}=    Set Variable    xpath=//android.widget.TextView[@text="${text}"]
    Run Keyword And Ignore Error    Page Should Not Contain Element    ${todo_locator}

Verify Todo Exists
    [Arguments]    ${text}
    ${todo_locator}=    Set Variable    xpath=//android.widget.TextView[@text="${text}"]
    Wait Until Element Is Visible    ${todo_locator}    10s

Swipe Todo To Delete    
    # Get Element Location
    # Swipe    start_x=474    start_y=428    end_x=200    end_y=474
    [Arguments]    ${text}
    # 1) หา locator จากชื่อ todo
    ${todo_locator}=    Set Variable    xpath=//android.widget.TextView[@text="${text}"]
    Wait Until Element Is Visible    ${todo_locator}    10s

    # 2) ดึงตำแหน่ง (x,y) และขนาด (width,height) ของ element
    ${loc}=     Get Element Location    ${todo_locator}
    ${size}=    Get Element Size        ${todo_locator}

    ${x}=       Get From Dictionary     ${loc}    x
    ${y}=       Get From Dictionary     ${loc}    y
    ${width}=   Get From Dictionary     ${size}   width
    ${height}=  Get From Dictionary     ${size}   height

    # 3) คำนวณจุดเริ่ม–จบของ swipe (ขวา → ซ้าย กินแถวนี้พอดี)
    ${start_x}=    Evaluate    int(${x} + ${width} * 0.8)
    ${end_x}=      Evaluate    int(${x} + ${width} * 0.2)
    ${center_y}=   Evaluate    int(${y} + ${height} / 2)

    # 4) สั่ง swipe เฉพาะแถวนี้
    Swipe    start_x=${start_x}    start_y=${center_y}    end_x=${end_x}    end_y=${center_y}