## Try Out FlutterBleLib, aka. flutter_ble_lib

```
Go to [project]/ios directory and run pod install.
Terminal Get Following:

(base) derickchou@Dericks-MBP ios % pod install
Analyzing dependencies
Downloading dependencies
Installing Flutter (1.0.0)
Installing MultiplatformBleAdapter (0.1.7)
Installing flutter_ble_lib (2.3.1)
Generating Pods project
Integrating client project
Pod installation complete! There are 2 dependencies from the Podfile and 3 total pods installed.

[!] Automatically assigning platform `iOS` with version `9.0` on target `Runner` because no platform was specified. Please specify a platform for this target in your Podfile. See `https://guides.cocoapods.org/syntax/podfile.html#platform`.

[!] CocoaPods did not set the base configuration of your project because your project already has a custom config set. In order for CocoaPods integration to work at all, please either set the base configurations of the target `Runner` to `Target Support Files/Pods-Runner/Pods-Runner.profile.xcconfig` or include the `Target Support Files/Pods-Runner/Pods-Runner.profile.xcconfig` in your build configuration (`Flutter/Release.xcconfig`).

```

### The library is organised around a few base entities, which are:

- **BleManager**
- **Peripheral**
- **Service**
- **Characteristic**
- **Descriptor**

## setup

### Android -  **android/app/src/main/AndroidManifest.xml**

```
 <uses-permission android:name="android.permission.BLUETOOTH" />  
	 <uses-permission android:name="android.permission.BLUETOOTH_ADMIN" />  
	 <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>  
 <application
```

### IOS - **ios/Runner/Info.plist**

```
	<dict>  
			<key>NSBluetoothAlwaysUsageDescription</key>
			<string>Your own description of the purpose.</string>
	    <key>NSBluetoothAlwaysUsageDescription</key>  
	    <string>Need BLE permission</string>  
	    <key>NSBluetoothPeripheralUsageDescription</key>  
	    <string>Need BLE permission</string>  
	    <key>NSLocationAlwaysAndWhenInUseUsageDescription</key>  
	    <string>Need Location permission</string>  
	    <key>NSLocationAlwaysUsageDescription</key>  
	    <string>Need Location permission</string>  
	    <key>NSLocationWhenInUseUsageDescription</key>  
	    <string>Need Location permission</string>
	    ...
```







