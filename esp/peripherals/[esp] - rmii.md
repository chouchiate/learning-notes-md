## [esp] - RMII

### pin definitions

| ESP32 pin	| Function |
| --- | --- |
| GPIO25 | EMAC_RXD0 |
|GPIO26	| EMAC_RXD1 |
|GPIO27	| EMAC_RX_DV |
|GPIO19	| EMAC_TXD0 |
|GPIO22	| EMAC_TXD1 |
|GPIO21	| EMAC_TX_EN |
|GPIO16	| EMAC_CLK_OUT |
|GPIO17	| EMAC_CLK_180 |

> Note that typically the EMAC_CLK_180 pin is used to let the ESP32 create a clock internally using its PLL and output it to the PHY.

