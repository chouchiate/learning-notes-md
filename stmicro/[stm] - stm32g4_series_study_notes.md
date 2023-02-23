# [stm] - stm32gs_series_study_note

### ADC interrupt and status register (ADC_ISR)



### ADC interrupt enable register (ADC_IER)


### ADC control register (ADC_CR)



### ADC configuration register (ADC_CFGR)



### ADC configuration register 2 (ADC_CFGR2)



### ADC regular sequence register (ADC_SQRy, y=1,2,3,4)

### ADC sample time register (ADC_SMPRy, y=1,2)

### ADC injected sequence register (ADC_JSQR)

### HAL STATUS & LOCK

```c
/**
  * @brief  HAL Status structures definition
  */
typedef enum
{
  HAL_OK       = 0x00U,
  HAL_ERROR    = 0x01U,
  HAL_BUSY     = 0x02U,
  HAL_TIMEOUT  = 0x03U
} HAL_StatusTypeDef;

/**
  * @brief  HAL Lock structures definition
  */
typedef enum
{
  HAL_UNLOCKED = 0x00U,
  HAL_LOCKED   = 0x01U
} HAL_LockTypeDef;


```

### HAL_CONF
* list of modules to be used (enabled) in the HAL driver
```c
// stm32g4xx_hal_conf
#define HAL_MODULE_ENABLED

  #define HAL_ADC_MODULE_ENABLED
/*#define HAL_COMP_MODULE_ENABLED   */
/*#define HAL_CORDIC_MODULE_ENABLED   */
/*#define HAL_CRC_MODULE_ENABLED   */
/*#define HAL_CRYP_MODULE_ENABLED   */
#define HAL_DAC_MODULE_ENABLED
/*#define HAL_FDCAN_MODULE_ENABLED   */
/*#define HAL_FMAC_MODULE_ENABLED   */
#define HAL_HRTIM_MODULE_ENABLED
/*#define HAL_IRDA_MODULE_ENABLED   */
...

/* ########################### System Configuration ######################### */
/**
  * @brief This is the HAL system configuration section
  */

#define  VDD_VALUE                   (3300UL) /*!< Value of VDD in mv */
#define  TICK_INT_PRIORITY           (0UL)    /*!< tick interrupt priority (lowest by default)  */
#define  USE_RTOS                     0U
#define  PREFETCH_ENABLE              0U
#define  INSTRUCTION_CACHE_ENABLE     1U
#define  DATA_CACHE_ENABLE            1U

...

#ifdef  USE_FULL_ASSERT
/**
  * @brief  The assert_param macro is used for function's parameters check.
  * @param  expr: If expr is false, it calls assert_failed function
  *         which reports the name of the source file and the source
  *         line number of the call that failed.
  *         If expr is true, it returns no value.
  * @retval None
  */
#define assert_param(expr) ((expr) ? (void)0U : assert_failed((uint8_t *)__FILE__, __LINE__))
/* Exported functions ------------------------------------------------------- */
void assert_failed(uint8_t *file, uint32_t line);
#else
#define assert_param(expr) ((void)0U)
#endif /* USE_FULL_ASSERT */

```

### ADC Analog to digital converters

* Oversampler
* Data Preconditioning
* Start of Conversion
  - by software
  - by hardware trigger (timer event / gpio trigger)
* 3 analog watchdogs per ADC
  - perform filtering to ignore out of range data
* ADC input range: -Vref <= Vin <= Vref+


```c
// adc handler structure definition for
// stm32g4xx_hal_adc.h

/**
  * @brief  ADC handle Structure definition
  */
#if (USE_HAL_ADC_REGISTER_CALLBACKS == 1)
typedef struct __ADC_HandleTypeDef
#else
typedef struct
#endif /* USE_HAL_ADC_REGISTER_CALLBACKS */
{
  ADC_TypeDef                   *Instance;              /*!< Register base address */
  ADC_InitTypeDef               Init;                   /*!< ADC initialization parameters and regular conversions setting */
  DMA_HandleTypeDef             *DMA_Handle;            /*!< Pointer DMA Handler */
  HAL_LockTypeDef               Lock;                   /*!< ADC locking object */
  __IO uint32_t                 State;                  /*!< ADC communication state (bitmap of ADC states) */
  __IO uint32_t                 ErrorCode;              /*!< ADC Error code */
  ADC_InjectionConfigTypeDef    InjectionConfig ;       /*!< ADC injected channel configuration build-up structure */
#if (USE_HAL_ADC_REGISTER_CALLBACKS == 1)
  void (* ConvCpltCallback)(struct __ADC_HandleTypeDef *hadc);              /*!< ADC conversion complete callback */
  void (* ConvHalfCpltCallback)(struct __ADC_HandleTypeDef *hadc);          /*!< ADC conversion DMA half-transfer callback */
  void (* LevelOutOfWindowCallback)(struct __ADC_HandleTypeDef *hadc);      /*!< ADC analog watchdog 1 callback */
  void (* ErrorCallback)(struct __ADC_HandleTypeDef *hadc);                 /*!< ADC error callback */
  void (* InjectedConvCpltCallback)(struct __ADC_HandleTypeDef *hadc);      /*!< ADC group injected conversion complete callback */
  void (* InjectedQueueOverflowCallback)(struct __ADC_HandleTypeDef *hadc); /*!< ADC group injected context queue overflow callback */
  void (* LevelOutOfWindow2Callback)(struct __ADC_HandleTypeDef *hadc);     /*!< ADC analog watchdog 2 callback */
  void (* LevelOutOfWindow3Callback)(struct __ADC_HandleTypeDef *hadc);     /*!< ADC analog watchdog 3 callback */
  void (* EndOfSamplingCallback)(struct __ADC_HandleTypeDef *hadc);         /*!< ADC end of sampling callback */
  void (* MspInitCallback)(struct __ADC_HandleTypeDef *hadc);               /*!< ADC Msp Init callback */
  void (* MspDeInitCallback)(struct __ADC_HandleTypeDef *hadc);             /*!< ADC Msp DeInit callback */
#endif /* USE_HAL_ADC_REGISTER_CALLBACKS */
} ADC_HandleTypeDef;
```

#### ADC_InitTypeDef

```c
typedef struct
{
  uint32_t ClockPrescaler;        /*!< Select ADC clock source (synchronous clock derived from APB clock or asynchronous clock derived from system clock or PLL (Refer to reference manual for list of clocks available)) and clock prescaler.
                                       This parameter can be a value of @ref ADC_HAL_EC_COMMON_CLOCK_SOURCE.
                                       Note: The ADC clock configuration is common to all ADC instances.
                                       Note: In case of usage of channels on injected group, ADC frequency should be lower than AHB clock frequency /4 for resolution 12 or 10 bits,
                                             AHB clock frequency /3 for resolution 8 bits, AHB clock frequency /2 for resolution 6 bits.
                                       Note: In case of synchronous clock mode based on HCLK/1, the configuration must be enabled only
                                             if the system clock has a 50% duty clock cycle (APB prescaler configured inside RCC
                                             must be bypassed and PCLK clock must have 50% duty cycle). Refer to reference manual for details.
                                       Note: In case of usage of asynchronous clock, the selected clock must be preliminarily enabled at RCC top level.
                                       Note: This parameter can be modified only if all ADC instances are disabled. */

  uint32_t Resolution;            /*!< Configure the ADC resolution.
                                       This parameter can be a value of @ref ADC_HAL_EC_RESOLUTION */

  uint32_t DataAlign;             /*!< Specify ADC data alignment in conversion data register (right or left).
                                       Refer to reference manual for alignments formats versus resolutions.
                                       This parameter can be a value of @ref ADC_HAL_EC_DATA_ALIGN */

  uint32_t GainCompensation;      /*!< Specify the ADC gain compensation coefficient to be applied to ADC raw conversion data, based on following formula:
                                           DATA = DATA(raw) * (gain compensation coef) / 4096
                                       2.12 bit format, unsigned: 2 bits exponents / 12 bits mantissa
                                        Gain step is 1/4096 = 0.000244
                                        Gain range is 0.0000 to 3.999756
                                       This parameter value can be
                                        0           Gain compensation will be disabled and coefficient set to 0
                                        1 -> 0x3FFF Gain compensation will be enabled and coefficient set to specified value

                                       Note: Gain compensation when enabled is applied to all channels. */

  uint32_t ScanConvMode;          /*!< Configure the sequencer of ADC groups regular and injected.
                                       This parameter can be associated to parameter 'DiscontinuousConvMode' to have main sequence subdivided in successive parts.
                                       If disabled: Conversion is performed in single mode (one channel converted, the one defined in rank 1).
                                                    Parameters 'NbrOfConversion' and 'InjectedNbrOfConversion' are discarded (equivalent to set to 1).
                                       If enabled:  Conversions are performed in sequence mode (multiple ranks defined by 'NbrOfConversion' or 'InjectedNbrOfConversion' and rank of each channel in sequencer).
                                                    Scan direction is upward: from rank 1 to rank 'n'.
                                       This parameter can be a value of @ref ADC_Scan_mode */

  uint32_t EOCSelection;          /*!< Specify which EOC (End Of Conversion) flag is used for conversion by polling and interruption: end of unitary conversion or end of sequence conversions.
                                       This parameter can be a value of @ref ADC_EOCSelection. */

  FunctionalState LowPowerAutoWait; /*!< Select the dynamic low power Auto Delay: new conversion start only when the previous
                                       conversion (for ADC group regular) or previous sequence (for ADC group injected) has been retrieved by user software,
                                       using function HAL_ADC_GetValue() or HAL_ADCEx_InjectedGetValue().
                                       This feature automatically adapts the frequency of ADC conversions triggers to the speed of the system that reads the data. Moreover, this avoids risk of overrun
                                       for low frequency applications.
                                       This parameter can be set to ENABLE or DISABLE.
                                       Note: It is not recommended to use with interruption or DMA (HAL_ADC_Start_IT(), HAL_ADC_Start_DMA()) since these modes have to clear immediately the EOC flag (by CPU to free the IRQ pending event or by DMA).
                                             Auto wait will work but fort a very short time, discarding its intended benefit (except specific case of high load of CPU or DMA transfers which can justify usage of auto wait).
                                             Do use with polling: 1. Start conversion with HAL_ADC_Start(), 2. Later on, when ADC conversion data is needed:
                                             use HAL_ADC_PollForConversion() to ensure that conversion is completed and HAL_ADC_GetValue() to retrieve conversion result and trig another conversion start.
                                             (in case of usage of ADC group injected, use the equivalent functions HAL_ADCExInjected_Start(), HAL_ADCEx_InjectedGetValue(), ...). */

  FunctionalState ContinuousConvMode; /*!< Specify whether the conversion is performed in single mode (one conversion) or continuous mode for ADC group regular,
                                       after the first ADC conversion start trigger occurred (software start or external trigger).
                                       This parameter can be set to ENABLE or DISABLE. */

  uint32_t NbrOfConversion;       /*!< Specify the number of ranks that will be converted within the regular group sequencer.
                                       To use the regular group sequencer and convert several ranks, parameter 'ScanConvMode' must be enabled.
                                       This parameter must be a number between Min_Data = 1 and Max_Data = 16.
                                       Note: This parameter must be modified when no conversion is on going on regular group (ADC disabled, or ADC enabled without
                                       continuous mode or external trigger that could launch a conversion). */

  FunctionalState DiscontinuousConvMode; /*!< Specify whether the conversions sequence of ADC group regular is performed in Complete-sequence/Discontinuous-sequence
                                       (main sequence subdivided in successive parts).
                                       Discontinuous mode is used only if sequencer is enabled (parameter 'ScanConvMode'). If sequencer is disabled, this parameter is discarded.
                                       Discontinuous mode can be enabled only if continuous mode is disabled. If continuous mode is enabled, this parameter setting is discarded.
                                       This parameter can be set to ENABLE or DISABLE. */

  uint32_t NbrOfDiscConversion;   /*!< Specifies the number of discontinuous conversions in which the main sequence of ADC group regular (parameter NbrOfConversion) will be subdivided.
                                       If parameter 'DiscontinuousConvMode' is disabled, this parameter is discarded.
                                       This parameter must be a number between Min_Data = 1 and Max_Data = 8. */

  uint32_t ExternalTrigConv;      /*!< Select the external event source used to trigger ADC group regular conversion start.
                                       If set to ADC_SOFTWARE_START, external triggers are disabled and software trigger is used instead.
                                       This parameter can be a value of @ref ADC_regular_external_trigger_source.
                                       Caution: external trigger source is common to all ADC instances. */

  uint32_t ExternalTrigConvEdge;  /*!< Select the external event edge used to trigger ADC group regular conversion start.
                                       If trigger source is set to ADC_SOFTWARE_START, this parameter is discarded.
                                       This parameter can be a value of @ref ADC_regular_external_trigger_edge */

  uint32_t SamplingMode;          /*!< Select the sampling mode to be used for ADC group regular conversion.
                                       This parameter can be a value of @ref ADC_regular_sampling_mode */

  FunctionalState DMAContinuousRequests; /*!< Specify whether the DMA requests are performed in one shot mode (DMA transfer stops when number of conversions is reached)
                                       or in continuous mode (DMA transfer unlimited, whatever number of conversions).
                                       This parameter can be set to ENABLE or DISABLE.
                                       Note: In continuous mode, DMA must be configured in circular mode. Otherwise an overrun will be triggered when DMA buffer maximum pointer is reached. */

  uint32_t Overrun;               /*!< Select the behavior in case of overrun: data overwritten or preserved (default).
                                       This parameter applies to ADC group regular only.
                                       This parameter can be a value of @ref ADC_HAL_EC_REG_OVR_DATA_BEHAVIOR.
                                       Note: In case of overrun set to data preserved and usage with programming model with interruption (HAL_Start_IT()): ADC IRQ handler has to clear
                                       end of conversion flags, this induces the release of the preserved data. If needed, this data can be saved in function
                                       HAL_ADC_ConvCpltCallback(), placed in user program code (called before end of conversion flags clear).
                                       Note: Error reporting with respect to the conversion mode:
                                             - Usage with ADC conversion by polling for event or interruption: Error is reported only if overrun is set to data preserved. If overrun is set to data
                                               overwritten, user can willingly not read all the converted data, this is not considered as an erroneous case.
                                             - Usage with ADC conversion by DMA: Error is reported whatever overrun setting (DMA is expected to process all data from data register). */

  FunctionalState OversamplingMode;       /*!< Specify whether the oversampling feature is enabled or disabled.
                                               This parameter can be set to ENABLE or DISABLE.
                                               Note: This parameter can be modified only if there is no conversion is ongoing on ADC groups regular and injected */

  ADC_OversamplingTypeDef Oversampling;   /*!< Specify the Oversampling parameters.
                                               Caution: this setting overwrites the previous oversampling configuration if oversampling is already enabled. */

} ADC_InitTypeDef;

```


#### DMA_HandleTypeDef

```c

```

#### 21.4.29 oversampler


```c
/* Configuration of Oversampler:                                      */
/*  - Oversampling Ratio                                              */
/*  - Right bit shift                                                 */
/*  - Triggered mode                                                  */
/*  - Oversampling mode (continued/resumed)                           */
// oversampling configuration 
HAL_StatusTypeDef HAL_ADC_Init(ADC_HandleTypeDef *hadc)
  ...
      if (hadc->Init.OversamplingMode == ENABLE)
      {
        assert_param(IS_ADC_OVERSAMPLING_RATIO(hadc->Init.Oversampling.Ratio));
        assert_param(IS_ADC_RIGHT_BIT_SHIFT(hadc->Init.Oversampling.RightBitShift));
        assert_param(IS_ADC_TRIGGERED_OVERSAMPLING_MODE(hadc->Init.Oversampling.TriggeredMode));
        assert_param(IS_ADC_REGOVERSAMPLING_MODE(hadc->Init.Oversampling.OversamplingStopReset));

        /* Configuration of Oversampler:                                      */
        /*  - Oversampling Ratio                                              */
        /*  - Right bit shift                                                 */
        /*  - Triggered mode                                                  */
        /*  - Oversampling mode (continued/resumed)                           */
        MODIFY_REG(hadc->Instance->CFGR2,
                   ADC_CFGR2_OVSR  |
                   ADC_CFGR2_OVSS  |
                   ADC_CFGR2_TROVS |
                   ADC_CFGR2_ROVSM,
                   ADC_CFGR2_ROVSE                       |
                   hadc->Init.Oversampling.Ratio         |
                   hadc->Init.Oversampling.RightBitShift |
                   hadc->Init.Oversampling.TriggeredMode |
                   hadc->Init.Oversampling.OversamplingStopReset
                  );
      }
  ...
```


### ADC with DMA Section

#### Inputs
* Destination Buffer address - uint32_t *pData
* Adc Handler - (ADC_HandleTypeDef) *hadc
* Number of data to be transferred from ADC peripheral to memory - uint32_t Length

#### Actions
1. Enable ADC
```c
      /* Enable the ADC peripheral */
      tmp_hal_status = ADC_Enable(hadc);
```


#### code blocks
```c
// stm32g4xx_hal_adc.c

/**
  * @brief  Enable ADC, start conversion of regular group and transfer result through DMA.
  * @note   Interruptions enabled in this function:
  *         overrun (if applicable), DMA half transfer, DMA transfer complete.
  *         Each of these interruptions has its dedicated callback function.
  * @note   Case of multimode enabled (when multimode feature is available): HAL_ADC_Start_DMA()
  *         is designed for single-ADC mode only. For multimode, the dedicated
  *         HAL_ADCEx_MultiModeStart_DMA() function must be used.
  * @param hadc ADC handle
  * @param pData Destination Buffer address.
  * @param Length Number of data to be transferred from ADC peripheral to memory
  * @retval HAL status.
  */
HAL_StatusTypeDef HAL_ADC_Start_DMA(ADC_HandleTypeDef *hadc, uint32_t *pData, uint32_t Length)
{
  HAL_StatusTypeDef tmp_hal_status;
#if defined(ADC_MULTIMODE_SUPPORT)
  uint32_t tmp_multimode_config = LL_ADC_GetMultimode(__LL_ADC_COMMON_INSTANCE(hadc->Instance));
#endif

  /* Check the parameters */
  assert_param(IS_ADC_ALL_INSTANCE(hadc->Instance));

  /* Perform ADC enable and conversion start if no conversion is on going */
  if (LL_ADC_REG_IsConversionOngoing(hadc->Instance) == 0UL)
  {
    /* Process locked */
    __HAL_LOCK(hadc);

#if defined(ADC_MULTIMODE_SUPPORT)
    /* Ensure that multimode regular conversions are not enabled.   */
    /* Otherwise, dedicated API HAL_ADCEx_MultiModeStart_DMA() must be used.  */
    if ((ADC_IS_INDEPENDENT(hadc) != RESET)
        || (tmp_multimode_config == LL_ADC_MULTI_INDEPENDENT)
        || (tmp_multimode_config == LL_ADC_MULTI_DUAL_INJ_SIMULT)
        || (tmp_multimode_config == LL_ADC_MULTI_DUAL_INJ_ALTERN)
       )
#endif /* ADC_MULTIMODE_SUPPORT */
    {
      /* Enable the ADC peripheral */
      tmp_hal_status = ADC_Enable(hadc);

      /* Start conversion if ADC is effectively enabled */
      if (tmp_hal_status == HAL_OK)
      {
        /* Set ADC state                                                        */
        /* - Clear state bitfield related to regular group conversion results   */
        /* - Set state bitfield related to regular operation                    */
        ADC_STATE_CLR_SET(hadc->State,
                          HAL_ADC_STATE_READY | HAL_ADC_STATE_REG_EOC | HAL_ADC_STATE_REG_OVR | HAL_ADC_STATE_REG_EOSMP,
                          HAL_ADC_STATE_REG_BUSY);

#if defined(ADC_MULTIMODE_SUPPORT)
        /* Reset HAL_ADC_STATE_MULTIMODE_SLAVE bit
          - if ADC instance is master or if multimode feature is not available
          - if multimode setting is disabled (ADC instance slave in independent mode) */
        if ((__LL_ADC_MULTI_INSTANCE_MASTER(hadc->Instance) == hadc->Instance)
            || (tmp_multimode_config == LL_ADC_MULTI_INDEPENDENT)
           )
        {
          CLEAR_BIT(hadc->State, HAL_ADC_STATE_MULTIMODE_SLAVE);
        }
#endif

        /* Check if a conversion is on going on ADC group injected */
        if ((hadc->State & HAL_ADC_STATE_INJ_BUSY) != 0UL)
        {
          /* Reset ADC error code fields related to regular conversions only */
          CLEAR_BIT(hadc->ErrorCode, (HAL_ADC_ERROR_OVR | HAL_ADC_ERROR_DMA));
        }
        else
        {
          /* Reset all ADC error code fields */
          ADC_CLEAR_ERRORCODE(hadc);
        }

        /* Set the DMA transfer complete callback */
        hadc->DMA_Handle->XferCpltCallback = ADC_DMAConvCplt;

        /* Set the DMA half transfer complete callback */
        hadc->DMA_Handle->XferHalfCpltCallback = ADC_DMAHalfConvCplt;

        /* Set the DMA error callback */
        hadc->DMA_Handle->XferErrorCallback = ADC_DMAError;


        /* Manage ADC and DMA start: ADC overrun interruption, DMA start,     */
        /* ADC start (in case of SW start):                                   */

        /* Clear regular group conversion flag and overrun flag               */
        /* (To ensure of no unknown state from potential previous ADC         */
        /* operations)                                                        */
        __HAL_ADC_CLEAR_FLAG(hadc, (ADC_FLAG_EOC | ADC_FLAG_EOS | ADC_FLAG_OVR));

        /* Process unlocked */
        /* Unlock before starting ADC conversions: in case of potential         */
        /* interruption, to let the process to ADC IRQ Handler.                 */
        __HAL_UNLOCK(hadc);

        /* With DMA, overrun event is always considered as an error even if
           hadc->Init.Overrun is set to ADC_OVR_DATA_OVERWRITTEN. Therefore,
           ADC_IT_OVR is enabled. */
        __HAL_ADC_ENABLE_IT(hadc, ADC_IT_OVR);

        /* Enable ADC DMA mode */
        SET_BIT(hadc->Instance->CFGR, ADC_CFGR_DMAEN);

        /* Start the DMA channel */
        tmp_hal_status = HAL_DMA_Start_IT(hadc->DMA_Handle, (uint32_t)&hadc->Instance->DR, (uint32_t)pData, Length);

        /* Enable conversion of regular group.                                  */
        /* If software start has been selected, conversion starts immediately.  */
        /* If external trigger has been selected, conversion will start at next */
        /* trigger event.                                                       */
        /* Start ADC group regular conversion */
        LL_ADC_REG_StartConversion(hadc->Instance);
      }
      else
      {
        /* Process unlocked */
        __HAL_UNLOCK(hadc);
      }

    }
#if defined(ADC_MULTIMODE_SUPPORT)
    else
    {
      tmp_hal_status = HAL_ERROR;
      /* Process unlocked */
      __HAL_UNLOCK(hadc);
    }
#endif
  }
  else
  {
    tmp_hal_status = HAL_BUSY;
  }

  /* Return function status */
  return tmp_hal_status;
}

```