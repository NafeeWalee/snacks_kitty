### DemoApplication

Ready made startup application for quick development.

### Change applicationID/bundleID and appName

-[Global]
   flutter pub global run rename --bundleId com.example.android.app
   flutter pub global run rename --appname "Network Upp"
-[Android]
   flutter pub global run rename --bundleId com.example.android.app --target android
   flutter pub global run rename --appname yourappname --target android

-[iOS]
   flutter pub global run rename --bundleId com.example.android.app --target ios
   flutter pub global run rename --appname yourappname --target ios

   ~~~!!!!NOTE: DO NOT USE UNDERSCORE FOR bundleID!!(iOS rejects to upload any app that uses underscore on bundleID) Example: com.flutter.exampleapp instead of com.flutter.example_app (But No Problem Android)

### Get a debug key

- [Generate Key]
    keytool -genkey -noprompt -alias androiddebugkey -dname "CN=firebase backend, OU=upwrok, O=upwrok, L=Khulna, S=Khulna, C=BD" -keystore %USERPROFILE%\.android\debug.keystore -storepass 123456 -keypass 123456 -keyalg RSA -keysize 2048 -validity 10000

- [Generate SHA]
    keytool -list -v -alias androiddebugkey -keystore %USERPROFILE%\.android\debug.keystore

    ~~~!!!!NOTE: after generating the key MOVE & REPLACE debug.keystore FROM %USERPROFILE%\.android\debug.keystore TO android/app/debug.keystore where google-services.json file is!

    FROM: C:\Users\PC_USER_NAME\.android\debug.keystore
    TO: C:\Users\PC_USER_NAME\AndroidStudioProjects\Project_Name\android\app\debug.keystore

- [These are already included,but just in case]

    gradle.propertise:

    RELEASE_STORE_FILE=debug.keystore
    RELEASE_STORE_PASSWORD=123456
    RELEASE_KEY_ALIAS=androiddebugkey
    RELEASE_KEY_PASSWORD=123456

    app/build.gradle:

      buildTypes {
            release {
                signingConfig signingConfigs.debug
                shrinkResources false
                minifyEnabled false
            }
        }

        signingConfigs {
            debug {
                storeFile file(RELEASE_STORE_FILE)
                storePassword RELEASE_STORE_PASSWORD
                keyAlias RELEASE_KEY_ALIAS
                keyPassword RELEASE_KEY_PASSWORD
            }

            release {
                storeFile file(RELEASE_STORE_FILE)
                storePassword RELEASE_STORE_PASSWORD
                keyAlias RELEASE_KEY_ALIAS
                keyPassword RELEASE_KEY_PASSWORD
            }
        }

### Reconnect Firebase with new KEY

     ANDROID
    - Create an android app
    - Copy and paste the applicationID
    - Copy and paste the SHA-1 and SHA-256
    - DOWNLOAD and REPLACE google-services.json (android/app/google-services.json)

     iOS
    - Create an iOS app
    - Copy and paste the applicationID
    - DOWNLOAD GoogleService-Info.plist
    - DELETE previous GoogleService-Info.plist from ios folder
    - Open XCode
    - Right-click on Runner
    - Select Add Files to "Runner"
    - Add newly downloaded GoogleService-Info.plist

### Launcher Icon

    ~~~!!!!NOTE: DO NOT USE TRANSPARENT IMAGE AS iOS Rejects to upload the app (All OK on Android)
