*** Settings ***
Library     AppiumLibrary
Library     BuiltIn
Library     Process
Library     OperatingSystem
Suite Teardown    Close All Applications
Test Teardown     Close All Applications

*** Variables ***
${ANDROID_AUTOMATION_NAME}      UIAutomator2
${ANDROID_PLATFORM_NAME}        Android
${ANDROID_PLATFORM_VERSION}     %{ANDROID_PLATFORM_VERSION=13}
${ANDROID_APP_PACKAGE}          com.samplegithubactionsrn
${DEVICE_NAME_ANDROID}          Note20
${APP_ACTIVITY}                 com.samplegithubactionsrn.MainActivity
${WELCOME_TEXT}                 xpath=//android.widget.TextView[@text="Welcome to React Native"]
${WELCOME_TEXT1}                //android.widget.ImageView[contains(resource-id,'new-app-screen-header')]
${WELCOME_TEXT2}                xpath=//android.view.ImageView[@resource-id="new-app-screen-header"]
${WELCOME_TEXT3}                xpath=//android.widget.TextView[@content-desc="id-app-tsx"]

*** Keywords ***
# Open Android Test App Sample
#     open application    http://0.0.0.0:4723
#     ...    automationName=${ANDROID_AUTOMATION_NAME}
#     ...    platformName=${ANDROID_PLATFORM_NAME}
#     ...    platformVersion=${ANDROID_PLATFORM_VERSION}
#     ...    newCommandTimeout=60000
#     ...    launchTimeout=48000
#     ...    appWaitActivity=*
#     ...    autoGrantPermissions=true
#     ...    noReset=true
#     ...    appPackage=${ANDROID_APP_PACKAGE}
#     ...    deviceName=${DEVICE_NAME_ANDROID}
#     ...    appActivity=${APP_ACTIVITY}
Open Android Test App Sample
  Open Application  http://127.0.0.1:4723/wd/hub  automationName=${ANDROID_AUTOMATION_NAME}
  ...  platformName=${ANDROID_PLATFORM_NAME}  platformVersion=${ANDROID_PLATFORM_VERSION}
  ...  appPackage=${ANDROID_APP_PACKAGE}  appActivity=${APP_ACTIVITY}

*** Test Cases ***
Open App And Check Welcome Text
    Open Android Test App Sample
    Wait Until Page Contains Element    ${WELCOME_TEXT3}    timeout=15s

Open App And Check Welcome Text Failed
    Open Android Test App Sample
    Wait Until Page Contains Element    ${WELCOME_TEXT3}    timeout=15s