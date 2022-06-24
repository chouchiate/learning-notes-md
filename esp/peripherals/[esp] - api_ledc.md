## [esp] - peripherals api ledc

### esp - LEDC (LED Control) module

* Timer Configuration
```c
esp_err_t ledc_timer_config(const ledc_timer_config_t *timer_conf)

```

```c
typedef struct {
    ledc_mode_t speed_mode;
    ledc_timer_bit_t duty_resolution;
    ledc_timer_t  timer_num;
    uint32_t freq_hz;
    ledc_clk_cfg_t clk_cfg;
} ledc_timer_config_t;

```
    - ledc_mode_t: LEDC speed speed_mode, high-speed mode or low-speed mode
    - ledc_timer_bit_t: LEDC channel duty resolution
    - ledc_timer_t: The timer source of channel (0 - 3)
    - freq_hz: LEDC timer frequency (Hz)
    - ledc_clk_cfg_t: Configure LEDC source clock from ledc_clk_cfg_t.

        Note that LEDC_USE_RTC8M_CLK and LEDC_USE_XTAL_CLK are
        non-timer-specific clock sources. You can not have one LEDC timer uses
        RTC8M_CLK as the clock source and have another LEDC timer uses XTAL_CLK
        as its clock source. All chips except esp32 and esp32s2 do not have
        timer-specific clock sources, which means clock source for all timers
        must be the same one.


* Channel Configuration
```c
esp_err_t ledc_channel_config(const ledc_channel_config_t *ledc_conf)
```

* Update channel parameter
```c
esp_err_t ledc_update_duty(ledc_mode_t speed_mode, ledc_channel_t channel)
```


### external
* [trm](https://www.espressif.com/sites/default/files/documentation/esp32_technical_reference_manual_en.pdf#ledpwm)
* [doc](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-reference/peripherals/ledc.html)
* [api](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-reference/peripherals/i2c.html#api-reference)