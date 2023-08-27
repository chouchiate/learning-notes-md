## [C51] - VS Code + SDCC + Makefile

> This article will get through to the editor 、 compile 、 Complete tool chain for burning , Build an elegant 、 Open source 51 development environment .

### **Editor: VS Code**

* Create new work path
* Add setting.json file
```json
{
  "files.associations": {
  
    "*.h": "c",
  },
  "C_Cpp.errorSquiggles": "Disabled",
  "files.autoGuessEncoding": true,
}
```
* Add tasks.json file
```json
{
  // See https://go.microsoft.com/fwlink/?LinkId=733558
  // for the documentation about the tasks.json format
  "version": "2.0.0",
  "tasks": [
    {
      "label": "clean",
      "type": "shell",
      "command": "mingw32-make",
      "args": [
        "clean"
      ],
      "problemMatcher": []
    },
    {
      "label": "compile",
      "type": "shell",
      "command": "mingw32-make",
      "args": [
        "target=${fileBasenameNoExtension}"
      ],
      "group": {
        "kind": "build",
        "isDefault": true
      }
    }
  ]
}

```

### **Compiler: SDCC**
[SDCC Sourceforge](http://sdcc.sourceforge.net/)
> SDCC: Small Device C Compiler，一套開源的微控制器C語言編譯器，起初僅針對MCS-51系列的微控制器所開發，現在除了MCS-51以外已經支援Z80、STM8、PIC14、PIC16等常見的微控制器。

### **Install SDCC on MAC OSX**

1. In terminal, run: (skip this if homebrew already installed)
```bash
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" 2> /dev/null
```
2. Install sdcc with homebrew
```bash
$ brew install sdcc
```

### **使用SDCC別於Keil C51的部分**

> 基本上會有三個地方需要注意，第一點就是暫存器記憶體位址的定義方式
由官網下載的N76E003_BSP_Keil_C51_V1.0.5可以發現，N76E003.h中是以這樣定義暫存器的

```c
sfr P0                  = 0x80;
sbit P00                = P0^0;
```
> 然而從SDCC的使用者手冊中第3.5.1.7章節可以發現SDCC認定的定義方式為，且special bit不能像keil透過P0^0表示P0的第0個bit，必須為確切的位址。

[sdccman](http://sdcc.sourceforge.net/doc/sdccman.pdf)
```c
__sfr __at (0x80) P0;
__sbit __at (0x80) P00;
```
[SDCC 與 keil C51 差異詳見](https://danchouzhou.blogspot.com/2018/06/sdccn76e003-1t-8051.html)