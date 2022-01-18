
## **SPICE模型的種類**
* 元件模型
* 子電路(Subcircuit)模型
* 熱計算的特殊模型

![](../../assets/img/spice_model_block.png)


### **SPICE的元件模型**
> 表示電晶體和二極體等各模型電氣特性的公式是規定好的，元件模型是表示該公式所用係數（參數）的。

![](../../assets/img/spice_component_model.png)


### **SPICE的子電路模型**
> 元件模型、電源及公式等相結合，組成電路的模型。模型中包含電路連接資訊和元件模型等。

![](../../assets/img/sub_component_spice_model.png)




### **Component Data Statement**

```spice
TITLE STATEMENT
ELEMENT STATEMENTS
.
COMMAND (CONTROL) STATEMENTS
OUTPUT STATEMENTS
.END <CR>

```
> * The statements have a free format and consist of fields separated by a **blank**. 
> * To continue a statement to the ***next line***, one uses a **"+"** sign (**continuation** sign) at the
beginning of the next line.
> * Numbers can be integers, or floating points. For example:
  ```
  RES1 1 0 3500 or RES1 1 0 3.5E3
  ```
### **SCALE FACTOR**
| Suffix | Scale | Value | Name |
| -----| -----| ----- | ----- |
| T | E+12 | 1,000,000,000,000| Tera |
| G | E+9 | 1,000,000,000 | Giga |
| X or MEG | E+6 | 1,000,000 | Mega |
| K | E+3 | 1,000 | Kilo |
| M | E-3 | 0.001 | Milli |
| U | E-6 | 0.000001 | Micro |
| N | E-9 | 0.000000001 | Nano |
| P | E-12 | 0.000000000001 | Pico |
| F | E-15 | 0.000000000000001 | Femto |

* eg. a capacitor of 225 picofarad in the following ways:
  ```
  225P, 225p, 225pF; 225pFarad; 225E-12; 0.225N, etc.
  ```

### **Basic Components**
#### ***Resistor***
```
Rname N+ N- Value
```

#### ***Inductor and Capacitor***
```
Cname N+ N- Value <IC=Initial Condition>
Lname N+ N- Value <IC=Initial Condition>

```

### **Voltage and Current Source**
#### ***Independent DC Source***

#### ***Independent AC Source***

### **Transient Source**
#### ***Sinusoidal***

#### ***Piece-Wise Linear***


#### ***Pulse***

### **Dependent Source**

### **Semiconductor Devices**

#### ***Diode***
#### ***Bipolar Transistor***
#### ***MOSFET***
#### ***Ideal OpAmp***









