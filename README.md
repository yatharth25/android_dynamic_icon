# android_dynamic_icon

A flutter plugin for dynamically changing multiple android app icons for your app. Supports **only Android**.

## Usage

To use this plugin, add `android_dynamic_icon` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

## Getting Started

Check out the `example` directory for a sample app using `android_dynamic_icon`

### Integration

1. Add the latest version of the plugin to your `pubpsec.yaml` under dependencies section
2. Run `flutter pub get`
3. Add your all icons on `android/src/main/res/drawable` folder
4. For having multiple app icon in your app you should note following:
    * For each icon, you must declare an activity-alias in `AndroidManifest.xml` (see example in point 5)
    * For each icon you add, make a `ExampleIcon.kt` file below `MainActivity.kt` file (see example in point 6)
5. Update `android/src/main/AndroidManifest.xml` as follows:

	```xml
	<application...>
   
        <activity
            android:name=".MainActivity"
            android:exported="true"
            android:launchMode="singleTop"
            android:theme="@style/LaunchTheme"
    	android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
            android:hardwareAccelerated="true"
            android:windowSoftInputMode="adjustResize">
            <meta-data
              android:name="io.flutter.embedding.android.NormalTheme"
              android:resource="@style/NormalTheme"
              />
			<action android:name="android.intent.action.MAIN"/>
		    <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity>
		
		<!--name activity alias for icons you want to use-->
	
        <activity-alias
            android:label="app"
            android:icon="@drawable/iconone"
            android:name=".IconOne"
	        android:enabled="false"
            android:exported="true"
            android:targetActivity=".MainActivity"> <!--target activity class path will be same for all alias-->
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity-alias>
        <activity-alias
            android:label="app"
            android:icon="@drawable/icontwo"
            android:name=".IconTwo"
	        android:enabled="false"
            android:exported="true"
            android:targetActivity=".MainActivity"> <!--target activity class path will be same for all alias-->
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity-alias>
    </application>
	```
6. Add `IconOne.kt` and `IconTwo.kt` below `MainActivity.kt` as follows:
    ```kt
    package com.example.android_dynamic_icon

    import io.flutter.embedding.android.FlutterActivity

    class IconOne: FlutterActivity() {
    }
    ```
    ```kt
    package com.example.android_dynamic_icon

    import io.flutter.embedding.android.FlutterActivity

    class IconTwo: FlutterActivity() {
    }
    ```
	
	
### Dart/Flutter Integration

From your Dart code, you need to import the plugin and use it's methods:

1. First Initiliaze the plugin by all classes you made Including MainActivity as it is responsible for Default icon.

```dart 
    import 'package:android_dynamic_icon/android_dynamic_icon.dart';

    final _androidDynamicIconPlugin = AndroidDynamicIcon();

    @override
    void initState() {
        AndroidDynamicIcon.initialize(
            classNames: ['MainActivity', 'IconOne', 'IconTwo']);
        super.initState();
    }
```

2. Now set different icons using change icon method.
    
```dart
    //To set Icon One
    await _androidDynamicIconPlugin
            .changeIcon(classNames: ['IconOne', '']);

    //To set Icon Two
    await _androidDynamicIconPlugin
            .changeIcon(classNames: ['IconOne', '']);

    //To set Default Icon
    await _androidDynamicIconPlugin
            .changeIcon(classNames: ['MainActivity', '']);                
```

Check out the `example` app for more details


## Demo
<img src="https://user-images.githubusercontent.com/54071856/235359921-822bc474-abf9-406f-922a-97cea9ccaa0c.gif" width="25%" height="25%">

