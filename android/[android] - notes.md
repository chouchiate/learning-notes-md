## Notes (Unsorted)

* Android Compatibility Definition Document (CDD)
* Android Compatibility Test Suite (CTS)
* Vendor Test Suite (VTS)
* Booting ACME

## What is R.class
* R is a class that contains ONLY public constants. (public static final).

* It is a generated class (by Android Plugin in Eclipse) that reflects the various values you defined in the res file.

* R.java is the dynamically generated class, created during build process to dynamically identify all assets (from strings to android widgets to layouts), for usage in java classes in Android app.
*

## Application Resource Overview

```
MyProject/
    src/
        MyActivity.java
    res/
        drawable/
            graphic.png
        layout/
            main.xml
            info.xml
        mipmap/
            icon.png
        values/
            strings.xml
```
[reference](https://developer.android.com/guide/topics/resources/providing-resources)


## What is android.content.Context
* Interface to global information about app environment
* Abstract class
* allow access to application specific classes and resources
[reference](https://developer.android.com/reference/android/content/Context)

## What is android.os.Bundle
* Extends BaseBundle
* Implements Cloneable, Parcelable
* Mapping of string key to various parcelable values

## What is Throwable
* extends Object
* Implements Serializable

[reference](https://developer.android.com/reference/java/lang/Throwable)



## Android Jetpack

## What is androidx.appcompat.app.AppCompactActivity
* Base class for activities uses new platform features on 'older' android devices. Backport features includes:
  1. Using action bars, action items, navigation mode and more with (setSupportActionBar)
  2. Built-in light and dark theme switche.
  3. Integration with DrawerLayout by using getDrawerToggleDelegate() API

[reference](https://developer.android.com/reference/androidx/appcompat/app/AppCompatActivity)

## What is androidx.lifecycle.Observer
[reference](https://developer.android.com/reference/androidx/lifecycle/Observer)

## What is androidx.lifecycle.LiveData

## What is androidx.lifecycle.Transformations
* Transformation method for LiveData
[reference](https://developer.android.com/reference/androidx/lifecycle/Transformations)



