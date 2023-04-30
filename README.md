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
    * For each icon, you must declare an activity-alias in `AndroidManifest.xml` (see example below)
    * All activity alias name must start with `MainActivityAlias`(for default icon) & `MainActivityAlias{iconName}`(iconName is name of icon)
    * `android.intent.action.MAIN` should be removed from main activity
    * The activity alias for default icon should be enabled true always and all others should be false
    * The icon name you pass in the method must be in the `AndroidManifest.xml` as activity alias
    * Declare a list of string (your new alternative app icons)
	* There is no need to add default icon in list of icons
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
            <intent-filter>
			
			<!-- remove <action android:name="android.intent.action.MAIN"/> from here-->
				
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity>
		
		<!--name activity alias for your default icon and other icons you want to use-->
		<!--Use .MainActivityAlias for default icon and .MainActivityAlias{iconName} for others-->
		
        <activity-alias
            android:label="app"
            android:icon="@mipmap/ic_launcher"
            android:name=".MainActivityAlias"
            android:enabled="true" <!--enabled must be true only for default icon of your app-->
            android:exported="true"
            android:targetActivity=".MainActivity"> <!--target activity class path will be same for all alias-->
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity-alias>
        <!-- <activity-alias used to change app icon dynamically>  : iconone icon, set enabled false initially -->
        <activity-alias
            android:label="app"
            android:icon="@drawable/iconOne"
            android:name=".MainActivityAliasiconOne"
	    android:enabled="false" <!--enabled must be false for non default icon of your app-->
            android:exported="true"
            android:targetActivity=".MainActivity"> <!--target activity class path will be same for all alias-->
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity-alias>
        <activity-alias
            android:label="app"
            android:icon="@drawable/iconTwo"
            android:name=".MainActivityAliasiconTwo"
	    android:enabled="false" <!--enabled must be false for non default icon of your app-->
            android:exported="true"
            android:targetActivity=".MainActivity"> <!--target activity class path will be same for all alias-->
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity-alias>
        <activity-alias
            android:label="app"
            android:icon="@drawable/iconThree"
            android:name=".MainActivityAliasiconThree"
	    android:enabled="false" <!--enabled must be false for non default icon of your app-->
            android:exported="true"
            android:targetActivity=".MainActivity"> <!--target activity class path will be same for all alias-->
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity-alias>
    </application>
	```
	
	
### Dart/Flutter Integration

From your Dart code, you need to import the plugin and use it's static methods:

```dart 
    import 'package:android_dynamic_icon/android_dynamic_icon.dart';

    final _androidDynamicIconPlugin = AndroidDynamicIcon();
    //To set new icon
    await _androidDynamicIconPlugin.changeIcon(
                bundleId: "com.example.app",
                isNewIcon: true,
                iconName: "icon1Name",
                iconNames: ["icon1Name", 'icon2Name'])
                
    //To set default icon
    await _androidDynamicIconPlugin.changeIcon(
                bundleId: "com.example.app",
                isNewIcon: false,
                iconName: "",
                iconNames: ["icon1Name", 'icon2Name'])
```

Check out the `example` app for more details


## Demo
![Screenrecording of the example](https://raw.githubusercontent.com/tastelessjolt/flutter_dynamic_icon/master/imgs/screen.gif)


## Caution*

* Using this feature on some android versions will cause your app to kill (it will crash the first time you change the icon, next time it won't).
* You can use a dialog box before changing icon telling that app will restart after changing icon for better UX.

