*** Variables ***
${APPIUM_SERVER}    http://127.0.0.1:4723
${DEVICE_NAME}      emulator-5554
${APP}              /Users/ponyo/Downloads/Minimal-Todo-master/app/app-release.apk


# TC_01 Open App And Verify Empty List
${EMPTY_ICON}       xpath=//android.widget.ImageView
${EMPTY_TEXT}       xpath=//android.widget.TextView[@text="You don't have any todos"]

# --------

# TC_02 Add New Todo And Verify In List
# ปุ่ม + ในหน้าหลัก
${FAB_ADD_TODO}    id=com.avjindersinghsekhon.minimaltodo:id/addToDoItemFAB

# ช่องกรอกชื่อ todo ในหน้า Add
${INPUT_TODO_TITLE}    id=com.avjindersinghsekhon.minimaltodo:id/userToDoEditText

# ปุ่ม Save ในหน้า Add
${FAB_SAVE_TODO}       id=com.avjindersinghsekhon.minimaltodo:id/makeToDoFloatingActionButton

# locator ของ text รายการ todo ใน list (ใช้ text ที่เรากรอก)
${TODO_ITEM_XPATH}     xpath=//android.widget.TextView[@text="${TODO_TEXT}"]

${EMPTY_TEXT}          xpath=//android.widget.TextView[@text="You don't have any todos"]
${TODO_TEXT}           Buy milk

# TC_03 Edit Existing Todo And Verify Updated
${OLD_TODO_TEXT}        Buy milk
${NEW_TODO_TEXT}        Buy soy milk

# --------
# TC_04 Delete Existing Todo And Verify Removed
${TODO_TO_DELETE}       Temp todo to delete