*** Settings ***
Library    AppiumLibrary
Library    String
Library    DateTime

Resource    ../Resources/Variables.robot   

*** Keywords ***
Open Test Application
    Open Application    ${URL}   platformName=${PLATFORM}    platformVersion=${ANDROID_PLATFORM_VERSION}
    ...     deviceName=${DEVICE_NAME}    app=${APP_LOCATION}    automationName=appium

Click Create Button
    Click Element       ${btn_add}

Enter The Title As ${text_input}
    Input Text    ${txt_box_title}    ${text_input}

Click The Next Button
    Click Element       ${btn_next}

Click Remainder Toggle
    Click Element       ${tgg_remind}

Select The Next Day
    ${date_time}        Get Current Date    result_format=datetime
    ${datetime}=    Convert Date    ${date_time}    result_format=%d/%m/%Y
    ${date}  DateTime.Add Time To Date  ${date_time}  1 days    date_format=%d/%m/%Y    result_format=%d %B %Y
    log     ${date}
    ${locator_selected_date} = 	Replace String      ${selected_date}       {date_and}     ${date}
    Click Element       ${txt_box_date}
    Wait Until Element Is Visible       ${btn_ok_calendar}     15
    Click Element       ${locator_selected_date}
    Click Element          ${btn_ok_calendar}
    Should Not Be Empty     ${txt_box_date}

Select The Previous Day
    ${date_time}        Get Current Date    result_format=datetime
    ${datetime}=    Convert Date    ${date_time}    result_format=%Y-%m-%d %H:%M:%S
    ${date}    Subtract Time From Date    ${datetime}    2 days     result_format=%d %B %Y
    log     ${date}
    ${locator_selected_date} = 	Replace String      ${selected_date}       {date_and}     ${date}
    Click Element       ${txt_box_date}
    Wait Until Element Is Visible       ${btn_ok_calendar}     15
    Click Element       ${locator_selected_date}
    Click Element          ${btn_ok_calendar}
    Should Not Be Empty     ${txt_box_date}

Click Setting
    Wait Until Element Is Visible       ${btn_more_option}        15
    Click Element       ${btn_more_option}

Select ${button_name} Menu
    Wait Until Element Is Visible       ${list_about}        15
     IF  "${button_name}" == "Settings"
        ${btn_setting} = 	Replace String      ${btn_setting_selection}       {index_and}     1
        Click Element    ${btn_setting}
    ELSE
        ${btn_about} = 	Replace String      ${btn_setting_selection}       {index_and}     2
        Click Element    ${btn_about}
    END

Check The Check Box At Setting Page
    Click Element    ${check_box_mode}

Click Back
    Click Element    ${btn_back}

Cancel The Date Picker
    Click Element       ${txt_box_date}
    Wait Until Element Is Visible       ${btn_cancel_datetime_picker}     15
    Click Element       ${btn_cancel_datetime_picker}

Cancel The Time Picker
    Click Element       ${txt_box_time}
    Wait Until Element Is Visible       ${btn_cancel_datetime_picker}     15
    Click Element       ${btn_cancel_datetime_picker}

Verify Add List Page
    Wait Until Element Is Visible       ${txt_title_add_page}       15

Verify List Page Before Add The Record
    Wait Until Element Is Visible       ${txt_title}        15
    ${actual_txt_detail}        Get Text          ${txt_detail}
    Should Be Equal     ${actual_txt_detail}        ${expected_txt_detail_list_page}
    Element Should Be Visible       ${btn_add}
    Element Should Be Visible       ${img_image1}
    Element Should Be Visible       ${btn_moreoption}

Verify The List Page After Adding The Multiple Record
    [Arguments]     ${index_1}      ${index_2}
    Wait Until Element Is Visible       ${txt_title}        15
    ${locator_txt_record_name_no1} = 	Replace String      ${txt_record_name}       {index_and}     ${index_1}
    ${locator_txt_record_name_no2} = 	Replace String      ${txt_record_name}       {index_and}     ${index_2}
    ${actual_txt_record_no1}        Get Text          ${locator_txt_record_name_no1}
    ${actual_txt_record_no2}        Get Text          ${locator_txt_record_name_no2}
    Should Be Equal     ${actual_txt_record_no1}        To_Do_No1
    Should Be Equal     ${actual_txt_record_no2}        To_Do_No2

Verify After Adding Page After Toggle Is On
    Wait Until Element Is Visible       ${txt_reminder}     15
    ${actual_txt_reminder}        Get Text          ${txt_reminder}
    Should Contain      ${actual_txt_reminder}      Reminder${SPACE}set${SPACE}for

Verify The Adding Page After Closing The Date Time Picker
    Wait Until Element Is Visible       ${txt_reminder}     15
    ${actual_txt_reminder}        Get Text          ${txt_reminder}
    Should Contain      ${actual_txt_reminder}      Reminder${SPACE}set${SPACE}for

Verify Date Field After Selecting Previous Day
    Wait Until Element Is Visible       ${txt_reminder}     15
    ${actual_txt}        Get Text          ${txt_box_date}
    Should Be Equal     ${actual_txt}       Today

Verify After Adding The Record Case But Not Filled The Title
    Wait Until Element Is Visible       ${txt_title}        15
    ${actual_txt_detail}        Get Text          ${txt_detail}
    Should Be Equal     ${actual_txt_detail}        ${expected_txt_detail_list_page}
 
Verify Setting Page
    Wait Until Element Is Visible       ${txt_setting_title}        15
    ${actual_txt_setting_title}        Get Text          ${txt_setting_title}
    ${actual_txt_setting_summary}        Get Text          ${txt_setting_summary}  
    Should Be Equal     ${actual_txt_setting_title}        ${expected_txt_titile_setting}
    Should Be Equal     ${actual_txt_setting_summary}       ${expected_txt_summary_setting_off} 

Verify Setting Page After Checking The Check Box
    ${actual_txt_setting_summary}        Get Text          ${txt_setting_summary}  
    Should Be Equal     ${actual_txt_setting_summary}       ${expected_txt_summary_setting_on}

Verify About Page
    Wait Until Element Is Visible       ${img_about}        15
    ${locator_about_txt_titile} = 	Replace String      ${txt_detail_about}       {index_and}     1
    ${locator_about_txt_version} = 	Replace String      ${txt_detail_about}       {index_and}     2
    ${locator_about_txt_sub_titile} = 	Replace String      ${txt_detail_about}       {index_and}     3
    ${locator_about_txt_detail} = 	Replace String      ${txt_detail_about}       {index_and}     4
    ${actual_txt_setting_title}        Get Text          ${locator_about_txt_titile}
    ${actual_about_txt_version}        Get Text          ${locator_about_txt_version}
    ${actual_about_txt_sub_titile}        Get Text          ${locator_about_txt_sub_titile}
    ${actual_about_txt_detail}        Get Text          ${locator_about_txt_detail}
    ${actual_about_txt_contact_about}        Get Text          ${txt_contact_about}
    Should Be Equal     ${actual_txt_setting_title}        ${expected_txt_titile}
    Should Be Equal     ${actual_about_txt_version}       ${expected_txt_version} 
    Should Be Equal     ${actual_about_txt_sub_titile}        ${expected_txt_sub_titile}
    Should Be Equal     ${actual_about_txt_detail}       ${expected_txt_detail} 
    Should Be Equal     ${actual_about_txt_contact_about}       ${expected_txt_contact} 


