
# abu_s_application7
### Table of contents
- [System requirements](#system-requirements)
- [Figma design guidelines for better UI accuracy](#figma-design-guideline-for-better-accuracy)
- [Check the UI of the entire app](#app-navigations)
- [Facebook authentication configuration](#facebook-authentication-configuration)
- [Google authentication configuration](#google-authentication-configuration)
- [Application structure](#project-structure)
- [How to format your code?](#how-you-can-do-code-formatting)
- [How you can improve code readability?](#how-you-can-improve-the-readability-of-code)
- [Libraries and tools used](#libraries-and-tools-used)
- [Support](#support)

### System requirements

Dart SDK Version 2.18.0 or greater.
Flutter SDK Version 3.3.0 or greater.

### Figma design guidelines for better UI accuracy

Read our guidelines to increase the accuracy of design-to-code conversion by optimizing Figma designs.
https://docs.dhiwise.com/docs/Designguidelines/intro

### Check the UI of the entire app

Check the UI of all the app screens from a single place by setting up the 'initialRoute'  to AppNavigation in the AppRoutes.dart file.

### Facebook authentication configuration

Steps:
- Follow the steps on https://pub.dev/packages/flutter_login_facebook for Facebook login and only update app_id and client_token in your project.
- For Android:
    - Update facebook_app_id and facebook_client_token in /android/app/src/main/res/values/strings.xml  file.
- For iOS:
    - Configure Info.plist (ios/Runner/Info.plist) file and update APP_ID and CLIENT_TOKEN.

### Google authentication configuration

Steps:
- Follow the steps on https://pub.dev/packages/google_sign_in for Google sign-in.
- For iOS:
    - Download the GoogleService-Info.plist  file. Drag and drop the downloaded file into the Runner subfolder and update Info.plist  file.

### Application structure

After successful build, your application structure should look like this:

```
.
├── android                         - It contains files required to run the application on an Android platform.
├── assets                          - It contains all images and fonts of your application.
├── ios                             - It contains files required to run the application on an iOS platform.
├── lib                             - Most important folder in the application, used to write most of the Dart code..
    ├── main.dart                   - Starting point of the application
    ├── core
    │   ├── app_export.dart         - It contains commonly used file imports
    │   ├── constants               - It contains all constants classes
    │   ├── errors                  - It contains error handling classes                  
    │   ├── network                 - It contains network-related classes
    │   └── utils                   - It contains common files and utilities of the application
    ├── data
    │   ├── apiClient               - It contains API calling methods 
    │   ├── models                  - It contains request/response models 
    │   └── repository              - Network repository
    ├── localization                - It contains localization classes
    ├── presentation                - It contains widgets of the screens with their controllers and the models of the whole application.
    ├── routes                      - It contains all the routes of the application
    └── theme                       - It contains app theme and decoration classes
    └── widgets                     - It contains all custom widget classes
```

### How to format your code?

- if your code is not formatted then run following command in your terminal to format code
  ```
  dart format .
  ```

### How you can improve code readability?

Resolve the errors and warnings that are shown in the application.

### Libraries and tools used

- get - State management
  https://pub.dev/packages/get
- connectivity_plus - For status of network connectivity
  https://pub.dev/packages/connectivity_plus
- shared_preferences - Provide persistent storage for simple data
  https://pub.dev/packages/shared_preferences
- cached_network_image - For storing internet image into cache
  https://pub.dev/packages/cached_network_image

### Support

If you have any problems or questions, go to our Discord channel, where we will help you as quickly as possible: https://discord.com/invite/rFMnCG5MZ7

### Image Assets
We were unable to find Images, Please add manually to ```project/assets``` and replace image_not_found Image constant with original file 

| File Name | Not Found Assets Count |
| --- | :---: |
| message_screen | 1 |

