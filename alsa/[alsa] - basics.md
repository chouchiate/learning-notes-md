[alsa] - basics

* [linux-kernel-doc](https://www.kernel.org/doc/html/latest/sound/kernel-api/writing-an-alsa-driver.html)

* Advance Linux Sound Architecture (ALSA)
* Added to kernel during v2.5 development in 2022
* replaced OSS (Open Sound System)

### Basic Architecture
* Components
  - kernel
  - userspace
* Describe hardware capabilities
  - no emulation of missing hardware functionality at lowest level
* Server/client architecture
* Modular plugin architecture
  - stackable module
  - implement emulation in modules
* Organized into
  - Sound card (physical hardware device)
  - Device (PCM, mixer, MIDI, timer)
  - Subdevice (specific endpoint)

