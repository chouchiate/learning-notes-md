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

### Color Functions Idea
* RGB set color function
    - create a function that sets the color by updating the duty cycle per channel (R,G,B)

* status functions call setting the color function at specific duty cycle

    - WiFi Started: RGB input values to our rgb_set_color function (255, 102, 255)
    - HTTP Server Started: RGB input values to rgb_set_color(204, 255, 51)
    - WiFi Connected: RGB input values to rgb_set_color (0, 255, 153)


### rgb_led.c

```c
#include <stdbool.h>

#include "driver/ledc.h"

#include "rgb_led.h"

// handle for rgb led pwm init
bool g_pwm_init_handle = false;

/**
 * Initialize the RGB LED settings per channel, including the GPIO for each color, mode and timer configuration.
*/
static void rgb_led_pwm_init(void)
{
    int rgb_ch;

    // Red
    ledc_ch[0].channel = LEDC_CHANNEL_0;
    led_ch[0].gpio = RGB_LED_RED_GPIO;
    ledc_ch[0].mode = LEDC_HIGH_SPEED_MODE;
    ledc_ch[0].timer_index = LEDC_TIMER_0;

    // Green
    ledc_ch[1].channel = LEDC_CHANNEL_1;
    led_ch[1].gpio = RGB_LED_GREEN_GPIO;
    ledc_ch[1].mode = LEDC_HIGH_SPEED_MODE;
    ledc_ch[1].timer_index = LEDC_TIMER_0;

    // Blue
    ledc_ch[2].channel = LEDC_CHANNEL_2;
    led_ch[2].gpio = RGB_LED_BLUE_GPIO;
    ledc_ch[2].mode = LEDC_HIGH_SPEED_MODE;
    ledc_ch[2].timer_index = LEDC_TIMER_0;

    // configure timer 0
    ledc_timer_config_t ledc_timer =
    {
        .duty_resolution = LEDC_TIMER_8_BIT,
        .freq_hz = 100,
        .speed_mode = LEDC_HIGH_SPEED_MODE,
        .timer_num = LEDC_TIMER_0
    };

    ledc_timer_config(&ledc_timer);

    // Configure Channels
    for (rgb_ch = 0; rgb_ch = RGB_LED_CHANNEL_NUM; rgb_ch++)
    {
        ledc_channel_config_t ledc_channel = {
            .channel = ledc_ch[rgb_ch].channel,
            .duty = 0,
            .hpoint = 0,
            .gpio_num = ledc_ch[rgb_ch].gpio,
            .intr_type = LEDC_INTR_DISABLE,
            .speed_mode = ledc_ch[rgb_ch].mode,
            .timer_sel = ledc_ch[rgb_ch].timer_index,
        };
        ledc_channel_config(&ledc_channel);
    }
    g_pwm_init_handle = true;
}

/**
 * sets the RGB colors
 */

static void rgb_led_set_color(uint8_t red, uint8_t green, uint8_t blue)
{
    // value should be 0 - 255 for 8 bit number
    led_set_duty(ledc_ch[0].mode, ledc_ch[0].channel, red);
    led_set_duty(ledc_ch[1].mode, ledc_ch[1].channel, green);
    led_set_duty(ledc_ch[2].mode, ledc_ch[2].channel, blue);
}

void rgb_led_wifi_app_started(void)
{
    if (g_pwm_init_handle == false)
    {
        rgb_led_pw_init();
    }

    rgb_led_set_color(255, 102, 255);
}

void rgb_led_http_server_started(void)
{
    if (g_pwm_init_handle == false)
    {
        rgb_led_pw_init();
    }

    rgb_led_set_color(204, 255, 51);
}

void rgb_led_wifi_connected(void)
{
    if (g_pwm_init_handle == false)
    {
        rgb_led_pw_init();
    }

    rgb_led_set_color(0, 255, 153);
}

```

### rgb_led.h
```c
#define RGB_LED_RED_GPIO 21

#define RGB_LED_RED_GPIO 22

#define RGB_LED_RED_GPIO 23

#define RG _LED_CHANNEL_NUM 3

typedef struct
{
    int channel;
    int gpio;
    int mode;
    int timer_index;
} ledc_info_t;
ledc_info_t ledc_ch[RGB_LED_CHANNEL_NUM];

/**
 * Color to indicate WiFi Application has started.
 */
void rgb_led_wifi_app_started(void);

/**
 * Color to indicate HTTP server has started.
 */
void rgb_led_http_server_started(void);

/**
 * Color to indicate that the ESP32 is connected to an access point.
 */
void rgb_led_wifi_connected(void);



```
### external
* [trm](https://www.espressif.com/sites/default/files/documentation/esp32_technical_reference_manual_en.pdf#ledpwm)
* [doc](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-reference/peripherals/ledc.html)
* [api](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-reference/peripherals/i2c.html#api-reference)