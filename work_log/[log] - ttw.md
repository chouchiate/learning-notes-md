## [log] -- ttw

### 07-21-2022
#### IT611N
    - battery alert triggered issue
        - possible adc voltage drop after motor operation
        - change measurement timing from
            1. every idle before sleep, (possibly after motor movement) to
            2. prior motor movement when battery voltage level is smooth
    -

#### IT603_JTIC new spec
    - fsm refactor
    - touch panel refactor
    - led scan refactor
    - await time to spec meet review and confirmation