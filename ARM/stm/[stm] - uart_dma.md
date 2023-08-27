## [stm] - DMA with UART

DMA data transfer is, like interrupt, in a non-blocking mode.

In DMA,
* when half the data gets Received, a HALF Received COMPLETE INTERRUPT gets triggered and HAL_UART_RxHalfCpltCallback is called
* when the data transfer completes, HAL_UART_RxCpltCallback is called.

> To Setup the DMA, we have to ADD the DMA in the DMA Tab under the UART.

---
abc

![](../assets/img/stm_dma_uart.png)

def

![](../assets/img/sql_005.png)

avae

![](../assets/img/keil_assistant_open_proj.png)

---
* UART1_Rx DMA is added for Uart Rx.
* In the Circular mode, the DMA will keep Receiving the data.
* After Receiving all the Required data, it will start automatically from the beginning.
* Data Width is selected as Byte, as we are receiving characters, which takes only 1 byte in the memory.

```c
....
uint8_t Rx_data[10];  //  creating a buffer of 10 bytes

void HAL_UART_RxHalfCpltCallback(UART_HandleTypeDef *huart)
{
  HAL_GPIO_TogglePin (GPIOA, GPIO_PIN_0);  // toggle PA0
}

void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart)
{
  HAL_UART_Receive_DMA(&huart2, Rx_data, 4);
}

int main ()
{
  ..........
  ..........

  HAL_UART_Receive_DMA (&huart2, Rx_data, 4);  // Receive 4 Bytes of data

  while (1)
  {
    HAL_GPIO_TogglePin (GPIOA, GPIO_PIN_5);
    HAL_Delay (250);
  }
}
```
* When the Half reception is complete, LED connected to A0 should toggle.
* When all the data is received, RxCpltCallback will be called. Do the desired operation here.
* If you haven’t selected the Circular mode in DMA, you can start the DMA again.
* If you have selected the circular mode, then no need to start the DMA, as it will start automatically.