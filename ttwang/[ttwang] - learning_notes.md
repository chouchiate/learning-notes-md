## IT611N_WITH_POWER 

INIT and wakeup

  beep <OpenSW=0>
              fn_A11
                GreenLED
                CheckSWs with Tkey
       <CloseSW=0>
              fm_A12
                Flash Blue LED
          <NO NFC>

          <With NFC>


  Fn_B
    <CloseSW> <MotorSW = 1>
      <w/ NFC>
        Motor Close (MotorSW=0?)
          <FlashBlueLED>
            <Check NFC -- error CheckSws>

      <no nfc>
        BlueLED
        CheckSWs
  
  Fn_C <Open Position>
    beep <OpenSW=0, MotorSw=1>
      GreenLED


  Fn_D <closesw=1, opensw=1>


### Tasks
Buzzfn
20us

LedFn
20us

KeyFn
1ms

MotorFn
  if limit switch on motor stop (adj and err)
  direction and report

Check NFC
  Receive Data
    1st byte -- data length

### EEPROM
喚醒後工作
  eeprom read

休眠前工作
  vpower chk
  eeprom write (when to do?)

  eeprom block ? 32 bytes
  write and read, do not interrupt ?
