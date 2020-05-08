EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 1
Title "Camera"
Date "2020-05-07"
Rev "1"
Comp "Mark Sherstan"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Module:Arduino_Nano_v3.x A1
U 1 1 5EB2E547
P 4800 3550
F 0 "A1" H 4800 2461 50  0000 C CNN
F 1 "Arduino_Nano_v3.x" H 4800 2370 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 4800 3550 50  0001 C CIN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 4800 3550 50  0001 C CNN
	1    4800 3550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5EB2FAD6
P 4300 4650
F 0 "#PWR0101" H 4300 4400 50  0001 C CNN
F 1 "GND" H 4305 4477 50  0000 C CNN
F 2 "" H 4300 4650 50  0001 C CNN
F 3 "" H 4300 4650 50  0001 C CNN
	1    4300 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 4650 4300 4550
Wire Wire Line
	4900 4550 5350 4550
Wire Wire Line
	5350 4550 5350 4650
Wire Wire Line
	4300 4550 4800 4550
$Comp
L power:GND #PWR0102
U 1 1 5EB32798
P 5350 4650
F 0 "#PWR0102" H 5350 4400 50  0001 C CNN
F 1 "GND" H 5355 4477 50  0000 C CNN
F 2 "" H 5350 4650 50  0001 C CNN
F 3 "" H 5350 4650 50  0001 C CNN
	1    5350 4650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0103
U 1 1 5EB32869
P 5000 2550
F 0 "#PWR0103" H 5000 2400 50  0001 C CNN
F 1 "+5V" H 5015 2723 50  0000 C CNN
F 2 "" H 5000 2550 50  0001 C CNN
F 3 "" H 5000 2550 50  0001 C CNN
	1    5000 2550
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0104
U 1 1 5EB33F05
P 4900 2250
F 0 "#PWR0104" H 4900 2100 50  0001 C CNN
F 1 "+3.3V" H 4915 2423 50  0000 C CNN
F 2 "" H 4900 2250 50  0001 C CNN
F 3 "" H 4900 2250 50  0001 C CNN
	1    4900 2250
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0105
U 1 1 5EB34843
P 4700 2000
F 0 "#PWR0105" H 4700 1850 50  0001 C CNN
F 1 "VCC" H 4717 2173 50  0000 C CNN
F 2 "" H 4700 2000 50  0001 C CNN
F 3 "" H 4700 2000 50  0001 C CNN
	1    4700 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 2000 4700 2550
Wire Wire Line
	4900 2250 4900 2550
Text GLabel 4000 3650 0    50   Input ~ 0
CE
Text GLabel 4000 3750 0    50   Input ~ 0
CSN
Text GLabel 4000 4050 0    50   Input ~ 0
MOSI
Text GLabel 4000 4150 0    50   Input ~ 0
MISO
Text GLabel 4000 4250 0    50   Input ~ 0
SCK
Wire Wire Line
	4000 3650 4300 3650
Wire Wire Line
	4300 3750 4000 3750
Wire Wire Line
	4000 4050 4300 4050
Wire Wire Line
	4300 4150 4000 4150
Wire Wire Line
	4000 4250 4300 4250
$Comp
L RF:NRF24L01_Breakout U1
U 1 1 5EB37153
P 1750 5400
F 0 "U1" H 2130 5446 50  0000 L CNN
F 1 "NRF24L01_Breakout" H 2130 5355 50  0000 L CNN
F 2 "RF_Module:nRF24L01_Breakout" H 1900 6000 50  0001 L CIN
F 3 "http://www.nordicsemi.com/eng/content/download/2730/34105/file/nRF24L01_Product_Specification_v2_0.pdf" H 1750 5300 50  0001 C CNN
	1    1750 5400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5EB3CD7B
P 1750 6150
F 0 "#PWR0106" H 1750 5900 50  0001 C CNN
F 1 "GND" H 1755 5977 50  0000 C CNN
F 2 "" H 1750 6150 50  0001 C CNN
F 3 "" H 1750 6150 50  0001 C CNN
	1    1750 6150
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0107
U 1 1 5EB3DDC5
P 1750 4650
F 0 "#PWR0107" H 1750 4500 50  0001 C CNN
F 1 "+3.3V" H 1765 4823 50  0000 C CNN
F 2 "" H 1750 4650 50  0001 C CNN
F 3 "" H 1750 4650 50  0001 C CNN
	1    1750 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 4800 1750 4650
Wire Wire Line
	1750 6150 1750 6000
Text GLabel 1050 5100 0    50   Input ~ 0
MOSI
Text GLabel 1050 5200 0    50   Input ~ 0
MISO
Text GLabel 1050 5300 0    50   Input ~ 0
SCK
Text GLabel 1050 5400 0    50   Input ~ 0
CSN
Text GLabel 1050 5600 0    50   Input ~ 0
CE
Wire Wire Line
	1050 5100 1250 5100
Wire Wire Line
	1250 5200 1050 5200
Wire Wire Line
	1050 5300 1250 5300
Wire Wire Line
	1250 5400 1050 5400
Wire Wire Line
	1050 5600 1250 5600
$Comp
L Device:R R1
U 1 1 5EB40232
P 1400 6900
F 0 "R1" V 1193 6900 50  0000 C CNN
F 1 "220 ohm" V 1284 6900 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 1330 6900 50  0001 C CNN
F 3 "https://www.digikey.ca/product-detail/en/panasonic-electronic-components/ERJ-PA3J221V/P220BZCT-ND/5036283" H 1400 6900 50  0001 C CNN
F 4 "P220BZCT-ND" V 1400 6900 50  0001 C CNN "Field4"
	1    1400 6900
	0    1    1    0   
$EndComp
$Comp
L Device:LED D1
U 1 1 5EB407E9
P 2050 6900
F 0 "D1" H 2043 6645 50  0000 C CNN
F 1 "R-LED" H 2043 6736 50  0000 C CNN
F 2 "LED_SMD:LED_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 2050 6900 50  0001 C CNN
F 3 "https://www.digikey.ca/product-detail/en/lite-on-inc/LTST-C191KRKT/160-1447-1-ND/386836" H 2050 6900 50  0001 C CNN
F 4 "160-1447-1-ND" H 2050 6900 50  0001 C CNN "Field4"
	1    2050 6900
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 5EB42F6B
P 2650 7050
F 0 "#PWR0108" H 2650 6800 50  0001 C CNN
F 1 "GND" H 2655 6877 50  0000 C CNN
F 2 "" H 2650 7050 50  0001 C CNN
F 3 "" H 2650 7050 50  0001 C CNN
	1    2650 7050
	1    0    0    -1  
$EndComp
Text GLabel 850  6900 0    50   Input ~ 0
D9
Text GLabel 850  7550 0    50   Input ~ 0
D10
Text GLabel 4000 3850 0    50   Input ~ 0
D9
Text GLabel 4000 3950 0    50   Input ~ 0
D10
Wire Wire Line
	4000 3850 4300 3850
Wire Wire Line
	4300 3950 4000 3950
Wire Wire Line
	850  6900 1250 6900
Wire Wire Line
	1550 6900 1900 6900
Wire Wire Line
	2200 6900 2650 6900
Wire Wire Line
	2650 6900 2650 7050
$Comp
L Device:LED D2
U 1 1 5EB48639
P 2050 7550
F 0 "D2" H 2043 7295 50  0000 C CNN
F 1 "G-LED" H 2043 7386 50  0000 C CNN
F 2 "LED_SMD:LED_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 2050 7550 50  0001 C CNN
F 3 "https://www.digikey.ca/product-detail/en/lite-on-inc/LTST-C191GKT/160-1443-6-ND/1888655" H 2050 7550 50  0001 C CNN
F 4 "160-1443-6-ND" H 2050 7550 50  0001 C CNN "Field4"
	1    2050 7550
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 5EB4863F
P 2650 7700
F 0 "#PWR0109" H 2650 7450 50  0001 C CNN
F 1 "GND" H 2655 7527 50  0000 C CNN
F 2 "" H 2650 7700 50  0001 C CNN
F 3 "" H 2650 7700 50  0001 C CNN
	1    2650 7700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 7550 1900 7550
Wire Wire Line
	2200 7550 2650 7550
Wire Wire Line
	2650 7550 2650 7700
Wire Wire Line
	850  7550 1250 7550
Text GLabel 4000 3550 0    50   Input ~ 0
D6
Wire Wire Line
	4000 3550 4300 3550
$Comp
L Connector_Generic:Conn_01x02 J1
U 1 1 5EB51CDD
P 1300 1350
F 0 "J1" H 1218 1025 50  0000 C CNN
F 1 "Conn_01x02" H 1218 1116 50  0000 C CNN
F 2 "Connector_Molex:Molex_Micro-Fit_3.0_43650-0200_1x02_P3.00mm_Horizontal" H 1300 1350 50  0001 C CNN
F 3 "https://www.digikey.ca/products/en?keywords=0436500200" H 1300 1350 50  0001 C CNN
F 4 "WM1860-ND" H 1300 1350 50  0001 C CNN "Field4"
	1    1300 1350
	-1   0    0    1   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H1
U 1 1 5EB55153
P 4400 6900
F 0 "H1" H 4500 6949 50  0000 L CNN
F 1 "MountingHole_Pad" H 4500 6858 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_ISO14580_Pad" H 4400 6900 50  0001 C CNN
F 3 "~" H 4400 6900 50  0001 C CNN
	1    4400 6900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 5EB55D99
P 4400 7150
F 0 "#PWR0111" H 4400 6900 50  0001 C CNN
F 1 "GND" H 4405 6977 50  0000 C CNN
F 2 "" H 4400 7150 50  0001 C CNN
F 3 "" H 4400 7150 50  0001 C CNN
	1    4400 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 7150 4400 7000
$Comp
L Mechanical:MountingHole_Pad H3
U 1 1 5EB595D8
P 5400 6900
F 0 "H3" H 5500 6949 50  0000 L CNN
F 1 "MountingHole_Pad" H 5500 6858 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_ISO14580_Pad" H 5400 6900 50  0001 C CNN
F 3 "~" H 5400 6900 50  0001 C CNN
	1    5400 6900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0112
U 1 1 5EB595DE
P 5400 7150
F 0 "#PWR0112" H 5400 6900 50  0001 C CNN
F 1 "GND" H 5405 6977 50  0000 C CNN
F 2 "" H 5400 7150 50  0001 C CNN
F 3 "" H 5400 7150 50  0001 C CNN
	1    5400 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 7150 5400 7000
$Comp
L Mechanical:MountingHole_Pad H2
U 1 1 5EB5A561
P 4400 7550
F 0 "H2" H 4500 7599 50  0000 L CNN
F 1 "MountingHole_Pad" H 4500 7508 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_ISO14580_Pad" H 4400 7550 50  0001 C CNN
F 3 "~" H 4400 7550 50  0001 C CNN
	1    4400 7550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 5EB5A567
P 4400 7800
F 0 "#PWR0113" H 4400 7550 50  0001 C CNN
F 1 "GND" H 4405 7627 50  0000 C CNN
F 2 "" H 4400 7800 50  0001 C CNN
F 3 "" H 4400 7800 50  0001 C CNN
	1    4400 7800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 7800 4400 7650
$Comp
L Mechanical:MountingHole_Pad H4
U 1 1 5EB5AD99
P 5400 7550
F 0 "H4" H 5500 7599 50  0000 L CNN
F 1 "MountingHole_Pad" H 5500 7508 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_ISO14580_Pad" H 5400 7550 50  0001 C CNN
F 3 "~" H 5400 7550 50  0001 C CNN
	1    5400 7550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0114
U 1 1 5EB5AD9F
P 5400 7800
F 0 "#PWR0114" H 5400 7550 50  0001 C CNN
F 1 "GND" H 5405 7627 50  0000 C CNN
F 2 "" H 5400 7800 50  0001 C CNN
F 3 "" H 5400 7800 50  0001 C CNN
	1    5400 7800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 7800 5400 7650
Wire Wire Line
	1500 1350 1700 1350
Wire Wire Line
	2000 1250 2000 1350
Wire Wire Line
	1500 1250 2000 1250
Text GLabel 4000 3450 0    50   Input ~ 0
D5
Wire Wire Line
	4000 3450 4300 3450
$Comp
L Connector_Generic:Conn_01x04 J2
U 1 1 5EB4902B
P 8250 4750
F 0 "J2" H 8330 4742 50  0000 L CNN
F 1 "Conn_01x04" H 8330 4651 50  0000 L CNN
F 2 "Connector_Molex:Molex_Micro-Fit_3.0_43650-0400_1x04_P3.00mm_Horizontal" H 8250 4750 50  0001 C CNN
F 3 "https://www.digikey.ca/products/en?keywords=43650-0400" H 8250 4750 50  0001 C CNN
F 4 "WM1862-ND" H 8250 4750 50  0001 C CNN "Field4"
	1    8250 4750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 5EB4BBA3
P 7500 4750
F 0 "#PWR0110" H 7500 4500 50  0001 C CNN
F 1 "GND" H 7505 4577 50  0000 C CNN
F 2 "" H 7500 4750 50  0001 C CNN
F 3 "" H 7500 4750 50  0001 C CNN
	1    7500 4750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 5EB4C016
P 7900 4950
F 0 "#PWR0115" H 7900 4700 50  0001 C CNN
F 1 "GND" H 7905 4777 50  0000 C CNN
F 2 "" H 7900 4950 50  0001 C CNN
F 3 "" H 7900 4950 50  0001 C CNN
	1    7900 4950
	1    0    0    -1  
$EndComp
Text GLabel 7800 4850 0    50   Input ~ 0
D5
Text GLabel 7400 4650 0    50   Input ~ 0
D6
Wire Wire Line
	7800 4850 8050 4850
Wire Wire Line
	7400 4650 8050 4650
Wire Wire Line
	7500 4750 8050 4750
Wire Wire Line
	8050 4950 7900 4950
$Comp
L power:VCC #PWR0116
U 1 1 5EB5A6EF
P 2000 1350
F 0 "#PWR0116" H 2000 1200 50  0001 C CNN
F 1 "VCC" H 2017 1523 50  0000 C CNN
F 2 "" H 2000 1350 50  0001 C CNN
F 3 "" H 2000 1350 50  0001 C CNN
	1    2000 1350
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0117
U 1 1 5EB5B719
P 1700 1350
F 0 "#PWR0117" H 1700 1100 50  0001 C CNN
F 1 "GND" H 1705 1177 50  0000 C CNN
F 2 "" H 1700 1350 50  0001 C CNN
F 3 "" H 1700 1350 50  0001 C CNN
	1    1700 1350
	1    0    0    -1  
$EndComp
Text Notes 1400 900  0    50   ~ 0
Power In
Text Notes 1450 4250 0    50   ~ 0
Communication
Text Notes 4550 1650 0    50   ~ 0
Microcontroller
Text Notes 4900 6550 0    50   ~ 0
Mounting
Text Notes 8050 4450 0    50   ~ 0
PWM Control
Text Notes 7850 1800 0    50   ~ 0
Camera Power
$Comp
L Regulator_Linear:LM7805_TO220 U2
U 1 1 5EB67BEF
P 8100 2350
F 0 "U2" H 8100 2592 50  0000 C CNN
F 1 "LM7805" H 8100 2501 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 8100 2575 50  0001 C CIN
F 3 "https://www.digikey.ca/products/en?keywords=296-44517-1-ND" H 8100 2300 50  0001 C CNN
F 4 "296-44517-1-ND" H 8100 2350 50  0001 C CNN "Field4"
	1    8100 2350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5EB6B1F1
P 7400 2500
F 0 "C1" H 7515 2546 50  0000 L CNN
F 1 "0.22 uF" H 7515 2455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 7438 2350 50  0001 C CNN
F 3 "https://www.digikey.ca/product-detail/en/tdk-corporation/C1608X7R1H224M080AB/445-7409-1-ND/2733481" H 7400 2500 50  0001 C CNN
F 4 "445-7409-1-ND" H 7400 2500 50  0001 C CNN "Field4"
	1    7400 2500
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0118
U 1 1 5EB6F0EF
P 7000 2350
F 0 "#PWR0118" H 7000 2200 50  0001 C CNN
F 1 "VCC" H 7017 2523 50  0000 C CNN
F 2 "" H 7000 2350 50  0001 C CNN
F 3 "" H 7000 2350 50  0001 C CNN
	1    7000 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 2350 7400 2350
Connection ~ 7400 2350
Wire Wire Line
	7400 2350 7800 2350
$Comp
L Device:C C2
U 1 1 5EB73AAE
P 8700 2500
F 0 "C2" H 8815 2546 50  0000 L CNN
F 1 "0.1 uF" H 8815 2455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 8738 2350 50  0001 C CNN
F 3 "https://www.digikey.ca/product-detail/en/kemet/C0603C104M5RACTU/399-7845-1-ND/3471568" H 8700 2500 50  0001 C CNN
F 4 "399-7845-1-ND" H 8700 2500 50  0001 C CNN "Field4"
	1    8700 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 2350 8700 2350
$Comp
L power:GND #PWR0119
U 1 1 5EB77ACB
P 8100 2800
F 0 "#PWR0119" H 8100 2550 50  0001 C CNN
F 1 "GND" H 8105 2627 50  0000 C CNN
F 2 "" H 8100 2800 50  0001 C CNN
F 3 "" H 8100 2800 50  0001 C CNN
	1    8100 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 2650 8100 2700
Connection ~ 8100 2700
Wire Wire Line
	8100 2700 8100 2800
Wire Wire Line
	8100 2700 7400 2700
Wire Wire Line
	7400 2700 7400 2650
Connection ~ 8700 2350
Wire Wire Line
	8700 2350 9300 2350
Wire Wire Line
	8700 2650 8700 2700
Wire Wire Line
	8700 2700 8100 2700
$Comp
L power:Vdrive #PWR0120
U 1 1 5EB836DB
P 9300 2350
F 0 "#PWR0120" H 9100 2200 50  0001 C CNN
F 1 "Vdrive" H 9317 2523 50  0000 C CNN
F 2 "" H 9300 2350 50  0001 C CNN
F 3 "" H 9300 2350 50  0001 C CNN
	1    9300 2350
	1    0    0    -1  
$EndComp
$Comp
L power:Vdrive #PWR0121
U 1 1 5EB846CC
P 7950 3350
F 0 "#PWR0121" H 7750 3200 50  0001 C CNN
F 1 "Vdrive" H 7967 3523 50  0000 C CNN
F 2 "" H 7950 3350 50  0001 C CNN
F 3 "" H 7950 3350 50  0001 C CNN
	1    7950 3350
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0122
U 1 1 5EB856CF
P 7650 3250
F 0 "#PWR0122" H 7650 3000 50  0001 C CNN
F 1 "GND" H 7655 3077 50  0000 C CNN
F 2 "" H 7650 3250 50  0001 C CNN
F 3 "" H 7650 3250 50  0001 C CNN
	1    7650 3250
	1    0    0    -1  
$EndComp
Text Notes 8900 4900 0    50   ~ 0
To be mated with Digi-Key part numbers:\nH2184-ND‎\nH4BXT-10106-B8-ND
$Comp
L Device:R R2
U 1 1 5EB92A44
P 1400 7550
F 0 "R2" V 1193 7550 50  0000 C CNN
F 1 "220 ohm" V 1284 7550 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 1330 7550 50  0001 C CNN
F 3 "https://www.digikey.ca/product-detail/en/panasonic-electronic-components/ERJ-PA3J221V/P220BZCT-ND/5036283" H 1400 7550 50  0001 C CNN
F 4 "P220BZCT-ND" V 1400 7550 50  0001 C CNN "Field4"
	1    1400 7550
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J3
U 1 1 5EB98EBE
P 8500 3250
F 0 "J3" H 8418 2925 50  0000 C CNN
F 1 "Conn_01x02" H 8418 3016 50  0000 C CNN
F 2 "Connector_Molex:Molex_Micro-Fit_3.0_43650-0200_1x02_P3.00mm_Horizontal" H 8500 3250 50  0001 C CNN
F 3 "https://www.digikey.ca/products/en?keywords=0436500200" H 8500 3250 50  0001 C CNN
F 4 "WM1860-ND" H 8500 3250 50  0001 C CNN "Field4"
	1    8500 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 3250 8300 3250
Wire Wire Line
	7950 3350 8300 3350
$EndSCHEMATC
