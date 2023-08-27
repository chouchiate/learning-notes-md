## [flutter] - setup



### Unable to find bundled Java version on Flutter - Mac User

Set Java_Home path using below article & then after applying below command

[guide](https://mkyong.com/java/how-to-set-java_home-environment-variable-on-mac-os-x/#what-is-usrlibexecjava-home)

after that type below command on terminal:

(for those with a jbr that would be electric eel Android studio) use the following Commands to run in terminal: {

```bash
cd /Applications/Android\ Studio.app/Contents/jbr
ln -s ../jbr jdk
ln -s "/Library/Internet Plug-Ins/JavaAppletPlugin.plugin" jdk
```

Then 
1. go to finder and find Android studio:
2. right click and show package contents
3. contents-then create new folder called jre
4. copy contents of the jbr folder and paste into jre folder
5. Flutter doctor -v should work now !!

```bash
cd /Applications/Android\ Studio.app/Contents/jre
ln -s ../jre jdk
ln -s "/Library/Internet Plug-Ins/JavaAppletPlugin.plugin" jdk
flutter doctor -v
```