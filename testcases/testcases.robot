*** Settings ***
Resource        ../Keywords/Keywords.robot


*** Test Cases ***
Verify create the record without remainder successfully 
    # [Tags]      Test
    [Documentation]     [TC No.1] - To verify the application can create Todo task succesfully
    ...                 And verify all components on the page will display correctly
    Open Test Application
    Verify List Page Before Add The Record
    Click Create Button
    Verify Add List Page
    Enter The Title As To_Do_No1
    Click The Next Button
    Verify The List Page After Adding The Record Case      Without Remainder      1

Verify create the record with remainder successfully  
    # [Tags]      Test
    [Documentation]     [TC No.2] - To verify the application can create Todo task succesfully
    Open Test Application
    Verify List Page Before Add The Record
    Click Create Button
    Verify Add List Page
    Enter The Title As To_Do_No1
    Click Remainder Toggle
    Verify After Adding Page After Toggle Is On
    Select The Next Day
    Click The Next Button
    Verify The List Page After Adding The Record Case      With Remainder      1

Verify the application will display default text as Today when selecting the day that is in the past  
    # [Tags]      Test
    [Documentation]     [TC No.3] - To verify the application display default text as Today when selecting the day that is in the past
    Open Test Application
    Verify List Page Before Add The Record
    Click Create Button
    Verify Add List Page
    Enter The Title As To_Do_No1
    Click Remainder Toggle
    Verify After Adding Page After Toggle Is On
    Select The Previous Day
    Verify Date Field After Selecting Previous Day
    Click The Next Button
    Verify After Adding The Record Case      With Remainder      1

Verify can't create the record when not filled title but click the next button
    # [Tags]      Test
    [Documentation]     [TC No.6] - To verify the application will go back to the list page but not created any record when not filled the title
    Open Test Application
    Verify List Page Before Add The Record
    Click Create Button
    Verify Add List Page
    Click The Next Button
    Verify After Adding The Record Case But Not Filled The Title

Verify A User Can Click The Setting
    # [Tags]      Test
    [Documentation]     [TC No.7] - To verify can change display mode when go to the setting page
    ...                 [TC No.8] - To verify display about page when clicking on about
    Open Test Application
    Click Setting
    Select Settings Menu
    Verify Setting Page
    Check The Check Box At Setting Page
    Verify Setting Page After Checking The Check Box
    Click Back
    Click Setting
    Select About Menu
    Verify About Page

Verify display list sorting correctly
    # [Tags]      Test
    [Documentation]     [TC No.9] - To verify the application sorting the reccord by creted DESC correctly 
    Open Test Application
    Verify List Page Before Add The Record
    Click Create Button
    Verify Add List Page
    Enter The Title As To_Do_No1
    Click The Next Button
    Click Create Button
    Verify Add List Page
    Enter The Title As To_Do_No2
    Click The Next Button
    Verify The List Page After Adding The Multiple Record       1       2

Verify Date And Time Picker
    # [Tags]      Test
    [Documentation]     [TC No.11] - To verify the application will close the date picker
    ...                 [TC No.12] - To verify the application will close the time picker
    Open Test Application
    Verify List Page Before Add The Record
    Click Create Button
    Verify Add List Page
    Enter The Title As To_Do_No1
    Click Remainder Toggle
    Cancel The Date Picker
    Cancel The Time Picker
    Verify The Adding Page After Closing The Date Time Picker
