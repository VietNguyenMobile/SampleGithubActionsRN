*** Settings ***
Library     AppiumLibrary
Library     BuiltIn
Library     Process
Library     OperatingSystem
Suite Teardown    Close All Applications
Test Teardown     Close All Applications

*** Variables ***
${WELCOME_TEXT3}                        accessibility_id=id-app-tsx

# IOS variables
${ios_automation_name}                  xcuitest
${DEVICE_NAME_IOS}                      iPhone 12 Mini
${ios_platform_name}                    ios
${ios_platform_version}                 %{IOS_PLATFORM_VERSION=17.0.3}
${bundle_id}                            org.reactjs.native.example.SampleGithubActionsRN
${xcode_org_id}                         M3C9MSKRH7
${xcode_signing_id}                     iPhone Developer
${udid}                                 00008101-000C046836E9003A

*** Keywords ***
Open iOS App Sample
  open application    http://127.0.0.1:4724/wd/hub
  ...    automationName=${ios_automation_name}
  ...    deviceName=${DEVICE_NAME_IOS}
  ...    platformName=${ios_platform_name}
  ...    platformVersion=${ios_platform_version}
  ...    bundleId=${bundle_id}
  ...    udid=${udid}
  ...    newCommandTimeout=60000
  ...    launchTimeout=48000
  ...    xcodeOrgId=${xcode_org_id}
  ...    xcodeSigningId=${xcode_signing_id}
  ...    appWaitActivity=*
  ...    autoGrantPermissions=true
  ...    noReset=true

*** Test Cases ***
Open App And Check Welcome Text
    Open iOS App Sample
    Wait Until Page Contains Element    ${WELCOME_TEXT3}    timeout=15s