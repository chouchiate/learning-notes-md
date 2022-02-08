## [arduinno] - fastled 學習筆記


### **CRGB Struct**
```cpp
struct CRGB {
	union {
		struct {
            union {
                uint8_t r;
                uint8_t red;
            };
            union {
                uint8_t g;
                uint8_t green;
            };
            union {
                uint8_t b;
                uint8_t blue;
            };
        };
		uint8_t raw[3];
	};

    ...
    inline 
    ...
    /// Predefined RGB colors
    typedef enum {
        AliceBlue=0xF0F8FF,
        Amethyst=0x9966CC,
        AntiqueWhite=0xFAEBD7,
        Aqua=0x00FFFF,
        Aquamarine=0x7FFFD4,
        ...
    }
}
```


### **CHSV STRUCT**
```cpp
/// Representation of an HSV pixel (hue, saturation, value (aka brightness)).
struct CHSV {
    union {
		struct {
		    union {
		        uint8_t hue;
		        uint8_t h; };
		    union {
		        uint8_t saturation;
		        uint8_t sat;
		        uint8_t s; };
		    union {
		        uint8_t value;
		        uint8_t val;
		        uint8_t v; };
		};
		uint8_t raw[3];
	};
    ...inline...
    inline CHSV& setHSV(uint8_t ih, uint8_t is, uint8_t iv) __attribute__((always_inline))
    {
        h = ih;
        s = is;
        v = iv;
        return *this;
    }    
};

/// Pre-defined hue values for HSV objects
typedef enum {
    HUE_RED = 0,
    HUE_ORANGE = 32,
    HUE_YELLOW = 64,
    HUE_GREEN = 96,
    HUE_AQUA = 128,
    HUE_BLUE = 160,
    HUE_PURPLE = 192,
    HUE_PINK = 224
} HSVHue;
```



### **ARM_D51 底層 clockless_arm_d51.h**
* Definition for a single channel clockless controller for SAMD51
```cpp
class ClocklessController : public CPixelLEDController<RGB_ORDER> {
	typedef typename FastPin<DATA_PIN>::port_ptr_t data_ptr_t;
	typedef typename FastPin<DATA_PIN>::port_t data_t;

	data_t mPinMask;
	data_ptr_t mPort;
	CMinWait<WAIT_TIME> mWait;

    public:

}

```
### **NRF52 底層 clockless_arm_nrf52.h**
```cpp
class ClocklessController : public CPixelLEDController<_RGB_ORDER> {
    private:

}
```
### **ESP32 底層 clockless_i2s_esp32.h**
```cpp
class ClocklessController : Public CPixelLEDController<RGB_ORDER>
{
    public:
        void init()
    protected:
        static int pgcd();
        static void initBitPatterns();
        static DMABuffer * allocateDMABuffer(int bytes);
        static void i2sInit();
        static void empty(uint32_t *buf);
        virtual void showPixels(PixelController<RGB_ORDER> & pixels);
        // custom interrupt handler
        static IRAM_ATTR void interruptHandler(void *arg);
}
```

### **ESP8266 (Blocking) 底層 clockless_block_esp8266.h**
```cpp
class InlineBlockClocklessController : public CPixelLEDController<RGB_ORDER, LANES, PORT_MASK> {
	typedef typename FastPin<FIRST_PIN>::port_ptr_t data_ptr_t;
	typedef typename FastPin<FIRST_PIN>::port_t data_t;

	CMinWait<WAIT_TIME> mWait;

public:
	virtual int size() { return CLEDController::size() * LANES; }

	virtual void showPixels(PixelController<RGB_ORDER, LANES, PORT_MASK> & pixels);

    template<int PIN> static void initPin() {
		_ESPPIN<PIN, 1<<(PIN & 0xFF)>::setOutput();
	}

    virtual void init() { ... }
    virtual uint16_t getMaxRefreshRate() const { return 400; }

    typedef union {
		uint8_t bytes[8];
		uint16_t shorts[4];
		uint32_t raw[2];
	} Lines;
    template<int BITS,int PX> __attribute__ ((always_inline)) inline static void writeBits(register uint32_t & last_mark, register Lines & b, PixelController<RGB_ORDER, LANES, PORT_MASK> &pixels);

    static uint32_t ICACHE_RAM_ATTR showRGBInternal(PixelController<RGB_ORDER, LANES, PORT_MASK> &allpixels);
}

```
> os_intr_unlock() & os_intr_lock() may be deprecated



### **controller.h**
```cpp
// Pixel Controller Class
struct


```

### **colorutils.cpp**

* [colorutils API](http://fastled.io/docs/3.1/group___colorutils.html#details)

```cpp
    void fill_solid( struct CRGB * leds, int numToFill,
                 const struct CRGB& color);
    void fill_solid( struct CHSV * targetArray, int numToFill,
                 const struct CHSV& hsvColor);

    void fill_rainbow( struct CRGB * pFirstLED, int numToFill,
                  uint8_t initialhue,
                  uint8_t deltahue );  
    void fill_rainbow( struct CHSV * targetArray, int numToFill,
                  uint8_t initialhue,
                  uint8_t deltahue );  
    void fill_gradient_RGB( CRGB* leds,
                   uint16_t startpos, CRGB startcolor,
                   uint16_t endpos,   CRGB endcolor )    


```

### **FastLED/src/pixeltypes.h**

```cpp

inline CRGB& nscale8 (uint8_t scaledown )
inline CRGB& nscale8 (const CRGB & scaledown )
inline CRGB scale8 (const CRGB & scaledown ) const
inline CRGB& fadeToBlackBy (uint8_t fadefactor )
inline CRGB& operator|= (const CRGB& rhs )
```


### **FastLED.cpp**