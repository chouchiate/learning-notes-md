## [android] - Project Structure Layout

## **app**

### **/manifests**
* describes all the components of your Android app and is read by the Android runtime system when your app is executed.

### **/java**
* com.<project_package_name>
  * This folder contains the Java source code files for your app.
* com.<project_package_name> (androidTest)
  * This folder is where you would put your instrumented tests, which are tests that run on an Android device. It starts out with a skeleton test file.
* com.<project_package_name> (test)
  * This folder is where you would put your unit tests. Unit tests don't need an Android device to run. It starts out with a skeleton unit test file.

### **/res**

* drawable
  * All your app's images will be stored in this folder.
* layout
  * This folder contains the UI layout files for your activities. 
* menu
  * This folder contains XML files describing any menus in your app.
    * activity_main.xml
    * content_main.xml
    * fragment_first.xml
    * fragment_second.xml

* mipmap
  * This folder contains the launcher icons for your app.

* navigation
  This folder contains the navigation graph, which tells Android Studio how to navigate between different parts of your application.
* values
  * This folder contains resources, such as strings and colors, used in your app.

## **lib**






