## [arduinno] - fastled 學習筆記

#### **ARM_D51 底層 clockless_arm_d51.h**
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
#### **NRF52 底層 clockless_arm_nrf52.h**
```cpp
class ClocklessController : public CPixelLEDController<_RGB_ORDER> {
    private:

}
```
#### **ESP32 底層 clockless_i2s_esp32.h**
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

#### **ESP8266 (Blocking) 底層 clockless_block_esp8266.h**
```cpp
class InlineBlockClocklessController : public CPixelLEDController<RGB_ORDER, LANES, PORT_MASK> {
	typedef typename FastPin<FIRST_PIN>::port_ptr_t data_ptr_t;
	typedef typename FastPin<FIRST_PIN>::port_t data_t;

	CMinWait<WAIT_TIME> mWait;

public:
	virtual int size() { return CLEDController::size() * LANES; }

	virtual void showPixels(PixelController<RGB_ORDER, LANES, PORT_MASK> & pixels);
}


```

#### **controller.h**
```cpp
// Pixel Controller Class
struct
```


#### **FastLED.cpp**