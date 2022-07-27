## [log] -- ttw

### 07-25-2022



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
