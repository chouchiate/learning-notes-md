# [gcc] - Function Attributes

### weak
- The weak attribute causes the declaration to be emitted as a **weak symbol** rather than a **global**. This is primarily useful in *defining library functions* which can be **overridden** in **user code**, though it can also be used with non-function declarations.

```c
/**
  * @brief  EXTI line detection callback.
  * @param  GPIO_Pin Specifies the port pin connected to corresponding EXTI line.
  * @retval None
  */
__weak void HAL_GPIO_EXTI_Rising_Callback(uint16_t GPIO_Pin)
{
  /* Prevent unused argument(s) compilation warning */
  UNUSED(GPIO_Pin);

  /* NOTE: This function should not be modified, when the callback is needed,
           the HAL_GPIO_EXTI_Rising_Callback could be implemented in the user file
   */
}
```

```c
/**
  * @brief  Rx Transfer completed callback.
  * @param  huart UART handle.
  * @retval None
  */
__weak void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart)
{
  /* Prevent unused argument(s) compilation warning */
  UNUSED(huart);

  /* NOTE : This function should not be modified, when the callback is needed,
            the HAL_UART_RxCpltCallback can be implemented in the user file.
   */
}

```



### external
[gcc](https://gcc.gnu.org/onlinedocs/gcc-4.3.5/gcc/Function-Attributes.html)
