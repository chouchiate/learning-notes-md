## [m2351] - trustzone programming development (AN0019)

- how to partition security attribution
- how to develop program in keil MDK

### memory map and partitions

![](../assets/img/m2351_memory_map.png)

### Memory Map Security attribution configuration

* Implementation Defined Attribution Unit (IDAU)



* Secure Attribution Unit (SAU)
    - change security configuration partition


* Secure(S),
* Non-secure(NS)
* Nonsecure callable(NSC)
    - Non-secure callable entry function should be placed in Non-secure callable memory if Secure code provides Non-secure callable function.

* After the processor compare the security property of the IDAU and SAU, it will take
the highest security attribute applied.

* The hierarchy of security levels from high to low is: Secure >
NSC > Non-secure.

### Implementation Defined Attribution Unit (IDAU)
* define 4 types of regions
    1. secure region: contains secure program code or data
    2. non-secure callable region: (NSC) contains entry functions for non-secure program to access secure functions
    3. non-secure region: contains non-secure program code or data
    4. Exempt region: exempt region will be exempted from security check
* Region number is used for determine a group of memory share the same security
attribute
* [TT instruction](https://developer.arm.com/documentation/dui1095/a/The-Cortex-M23-Instruction-Set/Miscellaneous-instructions/TT--TTT--TTA--and-TTAT?lang=en) :
* TT
Test Target (TT) queries the security state and access permissions of a memory location.
* on the start and end addresses of the memory range, identifying that both reside in the same region number

* The memory map address bit 28 is used to define the security attribution:
    - memory map address bit 28 is 0:
        * it is secured (S)
        * in flash and RAM area, it is non-secure callable (NSC)

![](../assets/img/m2351_idau_defined_memory_map_address_security_attribution.png)

![](../assets/img/m2351_idau_memory_map.png)

![](../assets/img/m2351_idau_block_diagram.png)



### Security attribution unit (SAU)
    * memory alias architecture
    * up to 8 regions in SAU for secure code to configure for m2351
    * Non-secure access to all SAU registers will be RAZ/WI
    * SCR Base Address: SCS_BA: 0xE000E000

| SAU Register | Address | Description |
| ----- | ----- | ----- |
| SAU_CTRL | 0xE000EDD0 | SAU control register|
| SAU_TYPE | 0xE000EDD4 | The number of SAU setting region, read only |
| SAU_RNR | 0xE000EDD8 | SAU setting region |
| SAU_RBAR | 0xE000EDDC | SAU setting start address |
| SAU_RLAR | 0xE000EDE0 | SAU setting end address and attribution |

![](../assets/img/m2351_sau_security_attribution_configuration.png)


### Secure and non-secure switch



### Non-secure code call secure function

