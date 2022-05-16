## [kicad] - learning guide
* [pcb-new-part1](https://www.pcbway.com/blog/PCB_Design_Layout/Layout_In_Pcbnew.html)
* [pcb-new-part2](https://www.pcbway.com/blog/PCB_Design_Layout/Layout_In_Pcbnew_____part_2.html)

### Footprint Creation

```
F.CrtYd, T:0.05mm, @-2.05
F.Silk, T:0.12mm, @-1.8
F.Fab, T:0.1mm, @-1.75
```

###

## Layout to Gerber

```
Plot>>Gerber
Included Layers
F.Cu
B.Cu
F.Paste
B.Paste
F.Silks
B.Silks
F.Mask
B.Mask
Edge.Cuts
In1.Cu (4 layers)
In2.Cu (4 layers)

Uncheck - Plot footprint values
Check - Use Protel filename extensions
Plot

```

## Generate Drill Files

```
Excellon
Use Route Command
Map File Format: Gerber Format
Drill Origin: Absolute
Drill Unit: Inches
Zeros Format Decimal
Precision: 2:4
```

![Drill](D:\Work\aMarkdown\img\drill.png)



