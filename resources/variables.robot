*** Variables ***
${ANDROID_AUTOMATION_NAME}    uiautomator2
${APP_LOCATION}                 ${CURDIR}/App/app-release.apk
${PLATFORM}      Android
${ANDROID_PLATFORM_VERSION}   12
${DEVICE_NAME}      emulator-5554
${URL}      http://127.0.0.1:4725/wd/hub

#element locators on list page
${txt_title}     xpath=//android.view.ViewGroup[1]/android.widget.TextView
${txt_detail}       xpath=//android.widget.LinearLayout[1]/android.widget.TextView
${btn_add}      com.avjindersinghsekhon.minimaltodo:id/addToDoItemFAB
${img_image1}       xpath=//android.widget.LinearLayout[1]/android.widget.ImageView
${btn_moreoption}       xpath=//android.widget.ImageView[@content-desc="More options"]
${img_record}        xpath=//android.widget.LinearLayout[{index_and}]/android.widget.ImageView
${txt_record_name}        xpath=//android.widget.LinearLayout[{index_and}]/android.widget.RelativeLayout/android.widget.TextView
${btn_more_option}      xpath=//android.widget.ImageView[@content-desc="More options"]
${list_about}       xpath=//android.widget.ListView
${btn_setting_selection}      xpath=//android.widget.LinearLayout[{index_and}]/android.widget.RelativeLayout/android.widget.TextView
# ${btn_about}        xpath=//android.widget.LinearLayout[2]/android.widget.RelativeLayout/android.widget.TextView

#element locators on add page
${txt_title_add_page}       com.avjindersinghsekhon.minimaltodo:id/toDoCustomTextInput
${txt_box_title}        com.avjindersinghsekhon.minimaltodo:id/userToDoEditText
${btn_next}     com.avjindersinghsekhon.minimaltodo:id/makeToDoFloatingActionButton
${tgg_remind}       	com.avjindersinghsekhon.minimaltodo:id/toDoHasDateSwitchCompat
${txt_reminder}     com.avjindersinghsekhon.minimaltodo:id/newToDoDateTimeReminderTextView
${txt_box_date}        com.avjindersinghsekhon.minimaltodo:id/newTodoDateEditText
${txt_box_time}        com.avjindersinghsekhon.minimaltodo:id/newTodoTimeEditText
${selected_date}        xpath=//android.view.View[@content-desc="{date_and}"]
${btn_ok_calendar}      com.avjindersinghsekhon.minimaltodo:id/ok
${btn_cancel_datetime_picker}      com.avjindersinghsekhon.minimaltodo:id/cancel

#element locators on setting page
${txt_setting_title}        android:id/title
${txt_setting_summary}        android:id/summary
${check_box_mode}       	android:id/checkbox
${btn_back}     //android.widget.ImageButton[@content-desc="Navigate up"]

#element locators on about page
${img_about}        com.avjindersinghsekhon.minimaltodo:id/aboutImageView
${txt_detail_about}       xpath=//android.widget.LinearLayout/android.widget.TextView[{index_and}]
${txt_contact_about}      com.avjindersinghsekhon.minimaltodo:id/aboutContactMe

#expected result on list page
${expected_txt_detail_list_page}      You don't have any todos

#expected result on setting page
${expected_txt_titile_setting}      Night Mode
${expected_txt_summary_setting_off}      Night mode is off
${expected_txt_summary_setting_on}      Night mode is on

#expected result on about page
${expected_txt_titile}      Minimal
${expected_txt_version}     Version: 1.2
${expected_txt_sub_titile}      Made by Avjinder
${expected_txt_detail}      You can contact me at
${expected_txt_contact}     avisekhon@gmail.com