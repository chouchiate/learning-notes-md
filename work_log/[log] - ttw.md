## [log] -- ttw

<<<<<<< Updated upstream
### 08-19-2022
#### IT603_JTIC new spec

:white_check_mark: Complete
*


:construction: Designing


:hammer:



=======
### 08-08-2022
:hammer: battery spec change
    - 1.3V: battery independently measure 10 time below 1.3V will reach battery protect; re-count if over 1.3V
        - motor operational
        - red fast blink before sleep
    - 1.2V: same logic with 1.2V
        - go back to sleep when waking up, red fast blink before sleep 
>>>>>>> Stashed changes

### 08-01-2022

#### IT611N
:hammer: change prevent lock behaviour according to customer feedback
    - un-latch lock prevention when position at switch open


:hammer: no locking operation when no nfc is registered according to customer spec change
    - remove touch key unlock and lock when there is no nfc is registered
    - locking operation prevention when no nfc is registered

:hammer:
    - minor bug fix when factory reset interrupt in the middle causing lock entering incorrect lock state.

---
### 07-28-2022

#### IT611N
:hammer: change locking behaviour according to customer feedback
    - auto locking
    - go to error if auto locking fails, then go to sleep
    - if waking at locking preparation position, use nfc to trigger locking
    - all motor movement mut be recorded and new movement is prevented until sleep occurred.
    - if movement is performed and another possible movement is triggered, lock will show error and be forced to sleep.

:hammer: add logic to compensate for bsw uncertainty issues by saving and checking eeprom accordingly

:hammer: adc battery check timing has been changed when system waking up
    - only after 10th accumulated measurement of low battery should trigger battery saving modes.
---
### 07-22-2022

#### IT611N
:construction: battery alert (red blink) triggered too frequently

:sos: possible adc voltage drop after motor operation, measure too close right after motor operation

:hammer: change measurement timing:
* from: every idle before sleep, (possibly after motor movement) to
* to: prior motor movement when battery voltage level is smooth
* to: every idle before sleep if no motor movement
** no measurement right after motor movement

#### IT603_JTIC new spec
:construction: project skeleton done

:white_check_mark: TO-DOs
- fsm refactor
- touch panel refactor
- led scan refactor
- await time to spec meet review and confirmation

#### e-paper
:construction: dc-dc-boost no signal
- add test point in circuit and layout

:white_check_mark: study demo board
- tracing demo board circuit

---
### 07-21-2022
#### IT611N
    - :construction: battery alert (red blink) triggered too frequently
        - possible adc voltage drop after motor operation, measure too close right after motor operation
        - change measurement timing:
            from: every idle before sleep, (possibly after motor movement) to
            to: prior motor movement when battery voltage level is smooth
            to: every idle before sleep if no motor movement
            ** no measurement right after motor movement

#### IT603_JTIC new spec
    - fsm refactor
    - touch panel refactor
    - led scan refactor
    - await time to spec meet review and confirmation

#### e-paper
    - dc-dc-boost no signal
    - study demo board
