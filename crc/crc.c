/**
 * @file crc.c
 * @author Derick Chou (derick.chou@fluxconn.com)
 * @brief 
 * @version 0.1
 * @date 2023-04-14
 * 
 * @copyright Copyright (c) 2023
 * 
 * 
 * // use this to check
 * http://www.ip33.com/crc.html
 */


#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>

static const uint8_t aucCRCHi[] = {
    0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41,
    0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40,
    0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41,
    0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41,
    0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41,
    0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40,
    0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40,
    0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40,
    0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41,
    0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40,
    0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41,
    0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 
    0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41,
    0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 
    0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41,
    0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41,
    0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 
    0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40,
    0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41,
    0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41,
    0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41,
    0x00, 0xC1, 0x81, 0x40
};

static const uint8_t aucCRCLo[] = {
    0x00, 0xC0, 0xC1, 0x01, 0xC3, 0x03, 0x02, 0xC2, 0xC6, 0x06, 0x07, 0xC7,
    0x05, 0xC5, 0xC4, 0x04, 0xCC, 0x0C, 0x0D, 0xCD, 0x0F, 0xCF, 0xCE, 0x0E,
    0x0A, 0xCA, 0xCB, 0x0B, 0xC9, 0x09, 0x08, 0xC8, 0xD8, 0x18, 0x19, 0xD9,
    0x1B, 0xDB, 0xDA, 0x1A, 0x1E, 0xDE, 0xDF, 0x1F, 0xDD, 0x1D, 0x1C, 0xDC,
    0x14, 0xD4, 0xD5, 0x15, 0xD7, 0x17, 0x16, 0xD6, 0xD2, 0x12, 0x13, 0xD3,
    0x11, 0xD1, 0xD0, 0x10, 0xF0, 0x30, 0x31, 0xF1, 0x33, 0xF3, 0xF2, 0x32,
    0x36, 0xF6, 0xF7, 0x37, 0xF5, 0x35, 0x34, 0xF4, 0x3C, 0xFC, 0xFD, 0x3D,
    0xFF, 0x3F, 0x3E, 0xFE, 0xFA, 0x3A, 0x3B, 0xFB, 0x39, 0xF9, 0xF8, 0x38, 
    0x28, 0xE8, 0xE9, 0x29, 0xEB, 0x2B, 0x2A, 0xEA, 0xEE, 0x2E, 0x2F, 0xEF,
    0x2D, 0xED, 0xEC, 0x2C, 0xE4, 0x24, 0x25, 0xE5, 0x27, 0xE7, 0xE6, 0x26,
    0x22, 0xE2, 0xE3, 0x23, 0xE1, 0x21, 0x20, 0xE0, 0xA0, 0x60, 0x61, 0xA1,
    0x63, 0xA3, 0xA2, 0x62, 0x66, 0xA6, 0xA7, 0x67, 0xA5, 0x65, 0x64, 0xA4,
    0x6C, 0xAC, 0xAD, 0x6D, 0xAF, 0x6F, 0x6E, 0xAE, 0xAA, 0x6A, 0x6B, 0xAB, 
    0x69, 0xA9, 0xA8, 0x68, 0x78, 0xB8, 0xB9, 0x79, 0xBB, 0x7B, 0x7A, 0xBA,
    0xBE, 0x7E, 0x7F, 0xBF, 0x7D, 0xBD, 0xBC, 0x7C, 0xB4, 0x74, 0x75, 0xB5,
    0x77, 0xB7, 0xB6, 0x76, 0x72, 0xB2, 0xB3, 0x73, 0xB1, 0x71, 0x70, 0xB0,
    0x50, 0x90, 0x91, 0x51, 0x93, 0x53, 0x52, 0x92, 0x96, 0x56, 0x57, 0x97,
    0x55, 0x95, 0x94, 0x54, 0x9C, 0x5C, 0x5D, 0x9D, 0x5F, 0x9F, 0x9E, 0x5E,
    0x5A, 0x9A, 0x9B, 0x5B, 0x99, 0x59, 0x58, 0x98, 0x88, 0x48, 0x49, 0x89,
    0x4B, 0x8B, 0x8A, 0x4A, 0x4E, 0x8E, 0x8F, 0x4F, 0x8D, 0x4D, 0x4C, 0x8C,
    0x44, 0x84, 0x85, 0x45, 0x87, 0x47, 0x46, 0x86, 0x82, 0x42, 0x43, 0x83,
    0x41, 0x81, 0x80, 0x40
};

uint16_t usMBCRC16( uint8_t * pucFrame, uint16_t usLen );

#define HI_NIBBLE(x) ((x & 0xf0) > 4)
#define LO_NIBBLE(x) ((x & 0x0f)
#define HI_BYTE(x) ((x & 0xff00) > 8)
#define LO_BYTE(x) ((x & 0x00ff))
#define HI_WORD(x) ((x) & 0xffffffff00000000) > 16)
#define LO_WORD(x) ((x) & 0x00000000ffffffff)

#define _GW_MSG_GWID_LOC_ 0
#define _GW_MSG_DEVID_LOC_ 1
#define _GW_MSG_DATE_LOC_ 2
#define _GW_MSG_CRC_LOC_ 3

#define _FIRMWAWRE_VER 1

int main()
{
    uint8_t i, j, k, n, x, y;
    uint8_t *u8Ptr, *u8Ptr1;
    uint16_t *u16Ptr;


    /* strings */
    const uint8_t rcv_head [] = "+RCV=219,26";
    const uint8_t msg_head [] = "$$$";
    const uint8_t msg_tail [] = "###";
    uint8_t rssi [] = "-11";
    uint8_t snr [] = "12";

    const uint8_t s[] = "|";
    const uint8_t d[] = ",";

    const uint8_t gw_head [] = "GW";
    const uint8_t date_time [] = "2023-04-10 17:00:00";

    uint8_t time_yy = 23;
    uint8_t time_MM = 4; 
    uint8_t time_dd = 14;
    uint8_t time_hh = 2;
    uint8_t time_mm = 13;
    uint8_t time_ss = 28;
    
    uint16_t firm_ver = _FIRMWAWRE_VER;
    
    static uint8_t msg_from_gw [60] = {0};
    static uint8_t msg_from_mi [120] = {0};
    
    /* ids */
    const uint8_t gw_id [4] = { 'G', 'W', 0x54, 0x53 };
    const uint8_t dev_id [4] = { 0x01, 0xE1, 0x24, 0xA4};
    uint16_t crc_res = 0;

    /* data */
    uint16_t input_volt_1 = 1043;
    uint16_t input_curr_1 = 2011;
    uint16_t input_power_1 = 3041;
    uint16_t input_volt_2 = 1230;
    uint16_t input_curr_2 = 3120;
    uint16_t input_power_2 = 4120;
    uint16_t input_volt_3 = 1210;
    uint16_t input_curr_3 = 2210;
    uint16_t input_power_3 = 3210;
    uint16_t angle = 90;
    uint16_t temp = 110;

    /* dev parser result */
    uint8_t dev_parsed_gw_id [4];    
    uint8_t dev_parsed_dev_id [4];
    uint8_t dev_parsed_dt [] = {0};
    uint8_t dev_parsed_yy = 0;
    uint8_t dev_parsed_MM = 0;
    uint8_t dev_parsed_dd = 0;
    uint8_t dev_parsed_hh = 0;
    uint8_t dev_parsed_mm = 0;
    uint8_t dev_parsed_ss = 0;
    uint16_t dev_parsed_crc = 0;


    /* gw parser result */
    uint8_t gw_parsed_gw_id;    
    uint8_t gw_parsed_dev_id;
    uint8_t gw_parsed_dt [] = {0};
    uint8_t gw_parsed_yy = 0;
    uint8_t gw_parsed_MM = 0;
    uint8_t gw_parsed_dd = 0;
    uint8_t gw_parsed_hh = 0;
    uint8_t gw_parsed_mm = 0;
    uint8_t gw_parsed_ss = 0;
    uint16_t gw_parsed_crc = 0;

    uint8_t *tokens[5];
    uint8_t slices[10][25] = {0};

    for (i = 0; i < strlen(msg_from_gw); i++) {
        msg_from_gw[i] = 0;
    }

    strcpy(msg_from_gw, rcv_head);
    
    memcpy(msg_from_gw + strlen(msg_from_gw), d, sizeof(d));
    memcpy(msg_from_gw + strlen(msg_from_gw), msg_head, sizeof(msg_head));
    memcpy(msg_from_gw + strlen(msg_from_gw), gw_id, sizeof(gw_id));
    strcat(msg_from_gw, s);
    
    memcpy(msg_from_gw + strlen(msg_from_gw), dev_id, sizeof(dev_id));
    strcat(msg_from_gw, s);
    
    memcpy(msg_from_gw + strlen(msg_from_gw), &time_yy, sizeof(unsigned char));
    memcpy(msg_from_gw + strlen(msg_from_gw), &time_MM, sizeof(unsigned char));
    memcpy(msg_from_gw + strlen(msg_from_gw), &time_dd, sizeof(unsigned char));
    memcpy(msg_from_gw + strlen(msg_from_gw), &time_hh, sizeof(unsigned char));
    memcpy(msg_from_gw + strlen(msg_from_gw), &time_mm, sizeof(unsigned char));
    memcpy(msg_from_gw + strlen(msg_from_gw), &time_ss, sizeof(unsigned char));

    strcat(msg_from_gw, msg_tail);
    
    crc_res = usMBCRC16(msg_from_gw, strlen(msg_from_gw));
    strcat(msg_from_gw, s);
    memcpy(msg_from_gw + strlen(msg_from_gw), &crc_res, sizeof(crc_res));
    strcat(msg_from_gw, s);
    memcpy(msg_from_gw + strlen(msg_from_gw), &rssi, sizeof(rssi));
    strcat(msg_from_gw, d);
    memcpy(msg_from_gw + strlen(msg_from_gw), &snr, sizeof(snr));
    
    printf("msg_from_gw: %s\r\n", msg_from_gw);
    printf("msg_from_gw_hex: ");
    
    for (i = 0; i < strlen(msg_from_gw); i++) {
        printf("%x", msg_from_gw[i]);        
        printf(" ");
    }
    printf("\r\n");
    printf("gw_crc: 0x%x \r\n", crc_res);
    
    /**
     * mi parse gw message
     */
     u8Ptr1 = 0;
     u8Ptr1 = strstr(msg_from_gw, msg_head);

    if (u8Ptr1 != NULL) {
        printf("strstr res: %s\r\n", u8Ptr1);
    }
    
    x = strcspn(msg_from_gw, msg_head);
    printf("strcspn head %d\r\n", x);
    y = strcspn(msg_from_gw, msg_tail);
    printf("strcspn tail %d\r\n", y);

    i = 0;

    tokens[i] = strtok(msg_from_gw, s);
    
    while(tokens[i] != NULL) {
      printf("\r\n%d: tokens: %s", i, tokens[i]);
      i++;
      tokens[i] = strtok(NULL, s);
    }
    printf("\r\n");
    n = i;

    /**
     * device check messages
     */
    for (i = 0; i < n; i++) {
      u8Ptr = tokens[i];
      printf("%d check %s\r\n", i, u8Ptr);
        switch (i) {
            default: break;
            case _GW_MSG_GWID_LOC_:
                memcpy(dev_parsed_gw_id, &u8Ptr[3], strlen(u8Ptr));
                if (memcmp(dev_parsed_gw_id, gw_id, 4) == 0) {
                    printf("gw_id equal\r\n");
                } else {
                    printf("gw_id diff %s, %s \r\n", gw_id, dev_parsed_gw_id);
                }
            break;
            case _GW_MSG_DEVID_LOC_:
                memcpy(dev_parsed_dev_id, u8Ptr, strlen(u8Ptr));
                if (memcmp(dev_parsed_dev_id, dev_id, 4) == 0) {
                    printf("dev_id equal\r\n");
                } else {
                    printf("dev_id diff %s, %s \r\n", dev_id, dev_parsed_dev_id);
                }              
            break;

            case _GW_MSG_DATE_LOC_:
                memcpy(dev_parsed_dt, u8Ptr, strlen(u8Ptr) - 3);
                if (memcmp(dev_parsed_dt, date_time, strlen(date_time)) == 0) {
                    printf("date_time equal\r\n");
                } else {
                    printf("date_time diff %s, %s \r\n", date_time, dev_parsed_dt);
                }          
            break;

            case _GW_MSG_CRC_LOC_:
                // memcpy(dev_parsed_crc, u8Ptr, strlen(u8Ptr));
                if (memcmp(&dev_parsed_crc, &crc_res, sizeof(crc_res)) == 0) {
                    printf("crc same");
                } else {
                    printf("crc diff %d, %d", dev_parsed_crc, crc_res);
                }
            break;
        }
    }
    
    /**
     * mi form device message
     */
     
    for (i = 0; i < 120; i++) {
        msg_from_mi[i] = 0;
    }
     
    strcpy(msg_from_mi, msg_head);
    
    memcpy(msg_from_mi + strlen(msg_from_mi), dev_id, 4);
    i = strlen(msg_from_mi);
    printf("len %d \r\n", i);
    msg_from_mi[i++] = "|";
    msg_from_mi[i++] = HI_BYTE(firm_ver);
    msg_from_mi[i++] = LO_BYTE(firm_ver);
    msg_from_mi[i++] = "|";
    msg_from_mi[i++] = time_yy;
    msg_from_mi[i++] = time_MM;
    msg_from_mi[i++] = "|";
    msg_from_mi[i++] = time_yy;
    msg_from_mi[i++] = time_MM;
    msg_from_mi[i++] = time_dd;
    msg_from_mi[i++] = time_hh;
    msg_from_mi[i++] = time_mm;
    msg_from_mi[i++] = time_ss;    
    msg_from_mi[i++] = "|";
    msg_from_mi[i++] = HI_BYTE(input_volt_1);
    msg_from_mi[i++] = LO_BYTE(input_volt_1);
    msg_from_mi[i++] = "|";    
    msg_from_mi[i++] = HI_BYTE(input_curr_1);
    msg_from_mi[i++] = LO_BYTE(input_curr_1);
    msg_from_mi[i++] = "|";    
    msg_from_mi[i++] = HI_BYTE(input_power_1);
    msg_from_mi[i++] = LO_BYTE(input_power_1);    
    msg_from_mi[i++] = "|";
    msg_from_mi[i++] = HI_BYTE(input_volt_2);
    msg_from_mi[i++] = LO_BYTE(input_volt_2);
    msg_from_mi[i++] = "|";    
    msg_from_mi[i++] = HI_BYTE(input_curr_2);
    msg_from_mi[i++] = LO_BYTE(input_curr_2);
    msg_from_mi[i++] = "|";    
    msg_from_mi[i++] = HI_BYTE(input_power_2);
    msg_from_mi[i++] = LO_BYTE(input_power_2);    
    msg_from_mi[i++] = "|";
    msg_from_mi[i++] = HI_BYTE(input_volt_3);
    msg_from_mi[i++] = LO_BYTE(input_volt_3);
    msg_from_mi[i++] = "|";    
    msg_from_mi[i++] = HI_BYTE(input_curr_3);
    msg_from_mi[i++] = LO_BYTE(input_curr_3);
    msg_from_mi[i++] = "|";    
    msg_from_mi[i++] = HI_BYTE(input_power_3);
    msg_from_mi[i++] = LO_BYTE(input_power_3);    
    msg_from_mi[i++] = "|";
    msg_from_mi[i++] = HI_BYTE(angle);
    msg_from_mi[i++] = LO_BYTE(angle);
    msg_from_mi[i++] = "|";    
    msg_from_mi[i++] = HI_BYTE(temp);
    msg_from_mi[i++] = LO_BYTE(temp);
    msg_from_mi[i++] = "|";    
    
    j=10;
    while(j>0) {
        j--;
        msg_from_mi[i++] = "-";
    }
    j=3;
    while(j>0) {
        j--;
        msg_from_mi[i++] = "#";
    }
    printf("mi msg len: %d \r\n", i);
    crc_res = 0;
    crc_res = usMBCRC16(msg_from_mi, i);
    printf("crc: %d \r\n", crc_res);
    msg_from_mi[i++] = "|";    
    msg_from_mi[i++] = HI_BYTE(crc_res);
    msg_from_mi[i++] = LO_BYTE(crc_res);    
    msg_from_mi[i++] = "|";    
    printf("\r\nmi msg hex: ");
    n = i;
    for (j = 0; j < i; j++) {
        printf("%x,", msg_from_mi[j]);
    }        

    /**
     * gw parse mi message
     */

    /**
     * 
     */
                
    
    return 0;
}

uint16_t usMBCRC16( uint8_t * pucFrame, uint16_t usLen )
{
    uint8_t           ucCRCHi = 0xFF;
    uint8_t           ucCRCLo = 0xFF;
    uint32_t             iIndex;

    while( usLen-- )
    {
        iIndex = ucCRCLo ^ *( pucFrame++ );
        ucCRCLo = ( uint8_t )( ucCRCHi ^ aucCRCHi[iIndex] );
        ucCRCHi = aucCRCLo[iIndex];
    }
    return ( uint16_t )( ucCRCHi << 8 | ucCRCLo );
}


int power(int base, int exp){
	int ret=1;
	unsigned char i;
	for(i=0;i<exp;i++){
		ret*=base;
	}
	return ret;
}

int decCharToInt(char str[]){
	int intVal = 0;
	unsigned char i;
	for( i=0; i< strlen(str); i++ ){
		intVal += ((int)(str[i]&0x0F))*power(10,strlen(str)-i-1);
	}
	return intVal;
}

unsigned char isStringDigit(char str[]){
	unsigned char i;
	for( i=0; i<strlen(str); i++ ){
		if(!(str[i] >= '0' && str[i] <= '9')){
			return 0;
		}
	}
	return 1;
}
