*** Settings ***
Library    AppiumLibrary
Library    BuiltIn
Library    Collections

Resource   func.robot
Resource   data.robot

Suite Teardown    Sleep  5s

*** Test Cases ***
TC_01 Open App And Verify Empty List
    [Documentation]    เปิดแอป Minimal Todo และตรวจว่าไม่มีรายการบนหน้าจอ
    Start Minimal Todo App
    Sleep	5
    Verify Empty Todo List
    Close Application

TC_02 Add New Todo And Verify In List
    [Documentation]    เพิ่ม todo ใหม่แล้วตรวจว่าขึ้นบนหน้าหลัก
    Start Minimal Todo App
    Verify Empty Todo List
    Add New Todo Item    ${TODO_TEXT}
    Verify Todo Appears In List    ${TODO_TEXT}
    Close Application

TC_03 Edit Existing Todo And Verify Updated
    [Documentation]    เพิ่ม todo, แก้ไขชื่อ แล้วตรวจว่าชื่อใหม่แสดงใน list
    Start Minimal Todo App
    Add New Todo Item    ${OLD_TODO_TEXT}
    Open Todo For Edit   ${OLD_TODO_TEXT}
    Edit Todo Title      ${NEW_TODO_TEXT}
    Verify Todo Updated  ${OLD_TODO_TEXT}    ${NEW_TODO_TEXT}
    Close Application

TC_04 Delete Existing Todo And Verify Removed
    [Documentation]    เพิ่ม todo ชั่วคราว, ลบออก และตรวจว่าหายจาก list
    Start Minimal Todo App
    Add New Todo Item      ${TODO_TO_DELETE}
    Verify Todo Exists     ${TODO_TO_DELETE}
    Swipe Todo To Delete    ${TODO_TO_DELETE}
    Verify Todo Not Exists     ${TODO_TO_DELETE}
    Close Application