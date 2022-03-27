## [esp] - VS Code Extension Setup Guide

* ESP IDE
* ESP OS
* Arduinno
* ESP Examples

#### **Installation**

* [installation guide](https://raw.githubusercontent.com/espressif/vscode-esp-idf-extension/master/docs/tutorial/install.md)

* Get ESP-IDF
  ```bash
  mkdir -p ~/esp
  cd ~/esp
  git clone --recursive https://github.com/espressif/esp-idf.git
  ```
* 確認 Python 安裝
```bash
python --verison
python3 --version
```

#### **Create Project**

> * Use examples from ESP-IDF or
> * Use ***ESP-IDF: Show Examples Projects*** command
> * Use tempaltes: ***ESP-IDF: Create ESP-IDF Projects*** command


#### **Extension activation self configuration**

#### **Setup Wizard**


#### **JSON Manual Configuration**


#### **UI Manual Configuration**


#### **Example configuration setting values**

#### **Additional Frameworks in extensions:**
[guide](https://github.com/espressif/vscode-esp-idf-extension/blob/master/docs/tutorial/additional_frameworks.md)

* ESP-ADF - Expressif Audio Development Framework
  - Use "Install ESP-ADF" command:
    + Clone ESP-ADF to path and set ***idf.espMdfPath*** configuration
* ESP-MDF - Expressif Mesh Development Framework
  - Use "Install ESP-MDF" command:
    + Clone ESP-MDF to path and set ***idf.espMdfPath*** configuration
* Add Arduino-ESP32 as ESP-IDF component
* Create ESP-IDF project with arduino-as-component template


#### External Resources

* [expressif-docs](https://espressif-docs.readthedocs-hosted.com/_/downloads/esp-idf/en/latest/pdf/)