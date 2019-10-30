EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Module:Arduino_Nano_v3.x A1
U 1 1 5DAE21E4
P 5300 4050
F 0 "A1" H 5300 2961 50  0000 C CNN
F 1 "Arduino_Nano_v3.x" H 5300 2870 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 5450 3100 50  0001 L CNN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 5300 3050 50  0001 C CNN
	1    5300 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5DAE42D2
P 9700 5000
F 0 "R4" V 9493 5000 50  0000 C CNN
F 1 "10k" V 9584 5000 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 9770 4909 50  0001 L CNN
F 3 "https://www.digikey.ca/product-detail/en/panasonic-electronic-components/ERJ-3EKF1002V/P10.0KHCT-ND/198102" H 9700 5000 50  0001 C CNN
	1    9700 5000
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR026
U 1 1 5DAE4C27
P 10200 5100
F 0 "#PWR026" H 10200 4850 50  0001 C CNN
F 1 "GND" H 10205 4927 50  0000 C CNN
F 2 "" H 10200 5100 50  0001 C CNN
F 3 "" H 10200 5100 50  0001 C CNN
	1    10200 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	9850 5000 10200 5000
$Comp
L power:GND #PWR02
U 1 1 5DAEA58B
P 900 4050
F 0 "#PWR02" H 900 3800 50  0001 C CNN
F 1 "GND" H 905 3877 50  0000 C CNN
F 2 "" H 900 4050 50  0001 C CNN
F 3 "" H 900 4050 50  0001 C CNN
	1    900  4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 4050 6200 4050
$Comp
L Device:LED D2
U 1 1 5DAF88E0
P 1950 7000
F 0 "D2" H 1943 7216 50  0000 C CNN
F 1 "R-LED" H 1943 7125 50  0000 C CNN
F 2 "LED_SMD:LED_0603_1608Metric" H 1950 7000 50  0001 C CNN
F 3 "https://www.digikey.ca/product-detail/en/rohm-semiconductor/SML-D12V8WT86/511-1581-1-ND/1641813" H 1950 7000 50  0001 C CNN
	1    1950 7000
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5DB0990D
P 900 5150
F 0 "#PWR04" H 900 4900 50  0001 C CNN
F 1 "GND" H 905 4977 50  0000 C CNN
F 2 "" H 900 5150 50  0001 C CNN
F 3 "" H 900 5150 50  0001 C CNN
	1    900  5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 4900 900  4900
$Comp
L Device:R R2
U 1 1 5DB11BB4
P 1500 7000
F 0 "R2" V 1293 7000 50  0000 C CNN
F 1 "140" V 1384 7000 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 1570 6909 50  0001 L CNN
F 3 "https://www.digikey.ca/product-detail/en/panasonic-electronic-components/ERA-3AEB1400V/P140DBCT-ND/3075795" H 1500 7000 50  0001 C CNN
	1    1500 7000
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R1
U 1 1 5DB12750
P 1500 6550
F 0 "R1" V 1293 6550 50  0000 C CNN
F 1 "140" V 1384 6550 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 1570 6459 50  0001 L CNN
F 3 "https://www.digikey.ca/product-detail/en/panasonic-electronic-components/ERA-3AEB1400V/P140DBCT-ND/3075795" H 1500 6550 50  0001 C CNN
	1    1500 6550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1800 6550 1650 6550
$Comp
L power:GND #PWR08
U 1 1 5DB161D3
P 2450 7100
F 0 "#PWR08" H 2450 6850 50  0001 C CNN
F 1 "GND" H 2455 6927 50  0000 C CNN
F 2 "" H 2450 7100 50  0001 C CNN
F 3 "" H 2450 7100 50  0001 C CNN
	1    2450 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 7000 2450 7100
$Comp
L Device:LED D1
U 1 1 5DB1C9A4
P 1950 6550
F 0 "D1" H 1943 6766 50  0000 C CNN
F 1 "G-LED" H 1943 6675 50  0000 C CNN
F 2 "LED_SMD:LED_0603_1608Metric" H 1950 6550 50  0001 C CNN
F 3 "https://www.digikey.ca/product-detail/en/rohm-semiconductor/SML-D12M8WT86/511-1578-1-ND/1641810" H 1950 6550 50  0001 C CNN
	1    1950 6550
	-1   0    0    1   
$EndComp
Wire Wire Line
	9550 4550 9300 4550
Text GLabel 4650 3650 0    50   Input ~ 0
D2
Text GLabel 4650 3750 0    50   Input ~ 0
D3
$Comp
L power:GND #PWR016
U 1 1 5DB261B3
P 5800 5100
F 0 "#PWR016" H 5800 4850 50  0001 C CNN
F 1 "GND" H 5805 4927 50  0000 C CNN
F 2 "" H 5800 5100 50  0001 C CNN
F 3 "" H 5800 5100 50  0001 C CNN
	1    5800 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 5050 5800 5050
Wire Wire Line
	5800 5050 5800 5100
$Comp
L power:GND #PWR011
U 1 1 5DB12018
P 5200 1300
F 0 "#PWR011" H 5200 1050 50  0001 C CNN
F 1 "GND" H 5205 1127 50  0000 C CNN
F 2 "" H 5200 1300 50  0001 C CNN
F 3 "" H 5200 1300 50  0001 C CNN
	1    5200 1300
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4900 1200 5200 1200
Wire Wire Line
	5200 1200 5200 1300
Text Notes 3900 700  0    50   ~ 10
Power In
Wire Wire Line
	5200 3050 5200 2550
Text Notes 850  800  0    50   ~ 10
Limit Switches
Text Notes 850  3150 0    50   ~ 10
Servos
Wire Wire Line
	900  5000 900  5150
Wire Wire Line
	900  5000 1350 5000
Text GLabel 4650 3950 0    50   Input ~ 0
D5
Text GLabel 4650 3850 0    50   Input ~ 0
D4
Text GLabel 1200 3650 0    50   Input ~ 0
D4
Text GLabel 1200 4800 0    50   Input ~ 0
D5
Wire Wire Line
	1200 4800 1350 4800
Wire Wire Line
	1200 3650 1350 3650
Wire Wire Line
	900  3450 900  3750
Wire Wire Line
	900  3750 1350 3750
Wire Wire Line
	900  3850 900  4050
Wire Wire Line
	900  3850 1350 3850
Text Notes 8500 4150 0    50   ~ 10
FSR’s
Wire Wire Line
	10200 5000 10200 5100
Wire Wire Line
	9300 5000 9300 4650
Wire Wire Line
	9300 4650 9550 4650
Wire Wire Line
	9300 5000 9550 5000
Text GLabel 6200 4050 2    50   Input ~ 0
A0
Text GLabel 9050 4650 0    50   Input ~ 0
A0
Wire Wire Line
	9300 4550 9300 4400
Wire Wire Line
	9050 4650 9300 4650
Connection ~ 9300 4650
$Comp
L Device:R R5
U 1 1 5DB73738
P 9700 6150
F 0 "R5" V 9493 6150 50  0000 C CNN
F 1 "10k" V 9584 6150 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 9770 6059 50  0001 L CNN
F 3 "https://www.digikey.ca/product-detail/en/panasonic-electronic-components/ERJ-3EKF1002V/P10.0KHCT-ND/198102" H 9700 6150 50  0001 C CNN
	1    9700 6150
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR027
U 1 1 5DB7373E
P 10200 6250
F 0 "#PWR027" H 10200 6000 50  0001 C CNN
F 1 "GND" H 10205 6077 50  0000 C CNN
F 2 "" H 10200 6250 50  0001 C CNN
F 3 "" H 10200 6250 50  0001 C CNN
	1    10200 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9850 6150 10200 6150
Wire Wire Line
	9550 5700 9300 5700
Wire Wire Line
	10200 6150 10200 6250
Wire Wire Line
	9300 6150 9300 5800
Wire Wire Line
	9300 5800 9550 5800
Wire Wire Line
	9300 6150 9550 6150
Text GLabel 9050 5800 0    50   Input ~ 0
A1
Wire Wire Line
	9300 5700 9300 5550
Wire Wire Line
	9050 5800 9300 5800
Connection ~ 9300 5800
Text GLabel 6200 4150 2    50   Input ~ 0
A1
Wire Wire Line
	5800 4150 6200 4150
Wire Wire Line
	2100 6550 2450 6550
$Comp
L power:GND #PWR07
U 1 1 5DB16AD6
P 2450 6650
F 0 "#PWR07" H 2450 6400 50  0001 C CNN
F 1 "GND" H 2455 6477 50  0000 C CNN
F 2 "" H 2450 6650 50  0001 C CNN
F 3 "" H 2450 6650 50  0001 C CNN
	1    2450 6650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 6650 2450 6550
Text GLabel 4650 4350 0    50   Input ~ 0
D9
Text GLabel 4650 4450 0    50   Input ~ 0
D13
Text GLabel 1050 6550 0    50   Input ~ 0
D9
Text GLabel 1050 7000 0    50   Input ~ 0
D10
Wire Wire Line
	1050 6550 1350 6550
Wire Wire Line
	1050 7000 1350 7000
Text Notes 800  6150 0    50   ~ 10
Indicator LEDs
Text Notes 3300 7500 0    50   ~ 0
Mounting holes on board\nDoes the RC need capacitor across power? Switch on VCC?\nScrew terminal FSR footprint?\nMeasure new servos and then select a unit with correct full scale range. -> voltage divider
$Comp
L power:+3.3V #PWR013
U 1 1 5DB748D2
P 5400 2800
F 0 "#PWR013" H 5400 2650 50  0001 C CNN
F 1 "+3.3V" H 5415 2973 50  0000 C CNN
F 2 "" H 5400 2800 50  0001 C CNN
F 3 "" H 5400 2800 50  0001 C CNN
	1    5400 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 3050 5400 2800
Wire Wire Line
	4650 3850 4800 3850
Wire Wire Line
	4650 3950 4800 3950
Text GLabel 4650 4150 0    50   Input ~ 0
CE
Text GLabel 4650 4250 0    50   Input ~ 0
CSN
Text GLabel 4650 4750 0    50   Input ~ 0
SCK
Text GLabel 4650 4550 0    50   Input ~ 0
MOSI
Text GLabel 4650 4650 0    50   Input ~ 0
MISO
Wire Wire Line
	4650 3750 4800 3750
Wire Wire Line
	4650 3650 4800 3650
Wire Wire Line
	4650 4150 4800 4150
Wire Wire Line
	4650 4250 4800 4250
Wire Wire Line
	4650 4550 4800 4550
Wire Wire Line
	4650 4650 4800 4650
Wire Wire Line
	4650 4750 4800 4750
Wire Wire Line
	4650 4350 4800 4350
Wire Wire Line
	4650 4450 4800 4450
Text Notes 8300 700  0    50   ~ 10
Current Sensor
Wire Wire Line
	900  4650 900  4900
Text GLabel 10600 2700 2    50   Input ~ 0
A2
Text Notes 3950 6150 0    50   ~ 10
Radio
$Comp
L Connector_Generic:Conn_02x04_Top_Bottom J6
U 1 1 5DB8BBDA
P 4950 6600
F 0 "J6" H 5000 6917 50  0000 C CNN
F 1 "Radio" H 5000 6826 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x04_P2.54mm_Vertical" H 4950 6600 50  0001 C CNN
F 3 "https://www.amazon.ca/gp/product/B01C3YNGI8/ref=ppx_od_dt_b_asin_image_s00?ie=UTF8&psc=1" H 4950 6600 50  0001 C CNN
	1    4950 6600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 5DB9E8F8
P 4250 6500
F 0 "#PWR09" H 4250 6250 50  0001 C CNN
F 1 "GND" H 4255 6327 50  0000 C CNN
F 2 "" H 4250 6500 50  0001 C CNN
F 3 "" H 4250 6500 50  0001 C CNN
	1    4250 6500
	1    0    0    -1  
$EndComp
Text GLabel 4600 6600 0    50   Input ~ 0
CE
$Comp
L power:+3.3V #PWR017
U 1 1 5DBA51EE
P 5850 6500
F 0 "#PWR017" H 5850 6350 50  0001 C CNN
F 1 "+3.3V" H 5865 6673 50  0000 C CNN
F 2 "" H 5850 6500 50  0001 C CNN
F 3 "" H 5850 6500 50  0001 C CNN
	1    5850 6500
	-1   0    0    1   
$EndComp
Text GLabel 5400 6600 2    50   Input ~ 0
CSN
Text GLabel 4600 6700 0    50   Input ~ 0
SCK
Text GLabel 4600 6800 0    50   Input ~ 0
MISO
Text GLabel 5400 6700 2    50   Input ~ 0
MOSI
Text GLabel 6200 4250 2    50   Input ~ 0
A2
Wire Wire Line
	5800 4250 6200 4250
Wire Wire Line
	6200 1100 6200 1300
$Comp
L Device:Q_PMOS_DGS Q1
U 1 1 5DBCD594
P 5500 1200
F 0 "Q1" V 5843 1200 50  0000 C CNN
F 1 "Q_PMOS_DGS" V 5752 1200 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5700 1300 50  0001 C CNN
F 3 "https://www.digikey.ca/product-detail/en/diodes-incorporated/DMP3099L-7/DMP3099L-7DICT-ND/5218217" H 5500 1200 50  0001 C CNN
	1    5500 1200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4900 1100 5300 1100
$Comp
L power:GND #PWR014
U 1 1 5DBD5775
P 5500 1600
F 0 "#PWR014" H 5500 1350 50  0001 C CNN
F 1 "GND" H 5505 1427 50  0000 C CNN
F 2 "" H 5500 1600 50  0001 C CNN
F 3 "" H 5500 1600 50  0001 C CNN
	1    5500 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 1600 5500 1400
Wire Wire Line
	4250 6500 4750 6500
Wire Wire Line
	4600 6600 4750 6600
Wire Wire Line
	4600 6700 4750 6700
Wire Wire Line
	4600 6800 4750 6800
Wire Wire Line
	5250 6700 5400 6700
Wire Wire Line
	5250 6600 5400 6600
Wire Wire Line
	5250 6500 5850 6500
$Comp
L power:VCC #PWR018
U 1 1 5DC34DAC
P 6200 1300
F 0 "#PWR018" H 6200 1150 50  0001 C CNN
F 1 "VCC" H 6218 1473 50  0000 C CNN
F 2 "" H 6200 1300 50  0001 C CNN
F 3 "" H 6200 1300 50  0001 C CNN
	1    6200 1300
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J7
U 1 1 5DC7C73C
P 9750 4550
F 0 "J7" H 9830 4542 50  0000 L CNN
F 1 "FSR1" H 9830 4451 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 9750 4550 50  0001 C CNN
F 3 "~" H 9750 4550 50  0001 C CNN
	1    9750 4550
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J8
U 1 1 5DC879D4
P 9750 5700
F 0 "J8" H 9830 5692 50  0000 L CNN
F 1 "FSR2" H 9830 5601 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 9750 5700 50  0001 C CNN
F 3 "~" H 9750 5700 50  0001 C CNN
	1    9750 5700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 5DC88464
P 4800 5100
F 0 "#PWR010" H 4800 4850 50  0001 C CNN
F 1 "GND" H 4805 4927 50  0000 C CNN
F 2 "" H 4800 5100 50  0001 C CNN
F 3 "" H 4800 5100 50  0001 C CNN
	1    4800 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 5100 4800 5050
Wire Wire Line
	4800 5050 5300 5050
Wire Wire Line
	1650 7000 1800 7000
Wire Wire Line
	2100 7000 2450 7000
$Comp
L Connector_Generic:Conn_01x03 J1
U 1 1 5DCA5112
P 1550 3750
F 0 "J1" H 1630 3792 50  0000 L CNN
F 1 "Servo1" H 1630 3701 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 1550 3750 50  0001 C CNN
F 3 "~" H 1550 3750 50  0001 C CNN
	1    1550 3750
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J2
U 1 1 5DCA5E07
P 1550 4900
F 0 "J2" H 1630 4942 50  0000 L CNN
F 1 "Servo2" H 1630 4851 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 1550 4900 50  0001 C CNN
F 3 "~" H 1550 4900 50  0001 C CNN
	1    1550 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 2100 1150 2100
Wire Wire Line
	1400 1300 950  1300
Wire Wire Line
	1400 2000 1000 2000
Wire Wire Line
	1400 1400 1200 1400
$Comp
L power:GND #PWR05
U 1 1 5DB1DE6D
P 1150 2100
F 0 "#PWR05" H 1150 1850 50  0001 C CNN
F 1 "GND" H 1155 1927 50  0000 C CNN
F 2 "" H 1150 2100 50  0001 C CNN
F 3 "" H 1150 2100 50  0001 C CNN
	1    1150 2100
	-1   0    0    -1  
$EndComp
Text GLabel 1000 2000 0    50   Input ~ 0
D3
Text GLabel 950  1300 0    50   Input ~ 0
D2
$Comp
L power:GND #PWR06
U 1 1 5DB0EAAF
P 1200 1400
F 0 "#PWR06" H 1200 1150 50  0001 C CNN
F 1 "GND" H 1205 1227 50  0000 C CNN
F 2 "" H 1200 1400 50  0001 C CNN
F 3 "" H 1200 1400 50  0001 C CNN
	1    1200 1400
	-1   0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J3
U 1 1 5DCC0B75
P 1600 1300
F 0 "J3" H 1680 1292 50  0000 L CNN
F 1 "LS1" H 1680 1201 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 1600 1300 50  0001 C CNN
F 3 "~" H 1600 1300 50  0001 C CNN
	1    1600 1300
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J4
U 1 1 5DCC16B0
P 1600 2000
F 0 "J4" H 1680 1992 50  0000 L CNN
F 1 "LS2" H 1680 1901 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 1600 2000 50  0001 C CNN
F 3 "~" H 1600 2000 50  0001 C CNN
	1    1600 2000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR024
U 1 1 5DCDD92C
P 9300 4400
F 0 "#PWR024" H 9300 4250 50  0001 C CNN
F 1 "+5V" H 9315 4573 50  0000 C CNN
F 2 "" H 9300 4400 50  0001 C CNN
F 3 "" H 9300 4400 50  0001 C CNN
	1    9300 4400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR025
U 1 1 5DCDE500
P 9300 5550
F 0 "#PWR025" H 9300 5400 50  0001 C CNN
F 1 "+5V" H 9315 5723 50  0000 C CNN
F 2 "" H 9300 5550 50  0001 C CNN
F 3 "" H 9300 5550 50  0001 C CNN
	1    9300 5550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR015
U 1 1 5DCDED48
P 5500 3050
F 0 "#PWR015" H 5500 2900 50  0001 C CNN
F 1 "+5V" H 5515 3223 50  0000 C CNN
F 2 "" H 5500 3050 50  0001 C CNN
F 3 "" H 5500 3050 50  0001 C CNN
	1    5500 3050
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR012
U 1 1 5DCE2068
P 5200 2550
F 0 "#PWR012" H 5200 2400 50  0001 C CNN
F 1 "VCC" H 5217 2723 50  0000 C CNN
F 2 "" H 5200 2550 50  0001 C CNN
F 3 "" H 5200 2550 50  0001 C CNN
	1    5200 2550
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J5
U 1 1 5DD20618
P 4700 1200
F 0 "J5" H 4618 875 50  0000 C CNN
F 1 "VCC/GND-IN" H 4618 966 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 4700 1200 50  0001 C CNN
F 3 "~" H 4700 1200 50  0001 C CNN
	1    4700 1200
	-1   0    0    1   
$EndComp
Wire Wire Line
	6200 1100 5700 1100
$Comp
L power:VCC #PWR019
U 1 1 5DD41525
P 8400 1300
F 0 "#PWR019" H 8400 1150 50  0001 C CNN
F 1 "VCC" H 8417 1473 50  0000 C CNN
F 2 "" H 8400 1300 50  0001 C CNN
F 3 "" H 8400 1300 50  0001 C CNN
	1    8400 1300
	1    0    0    -1  
$EndComp
$Comp
L power:Vdrive #PWR020
U 1 1 5DD447D0
P 8400 1600
F 0 "#PWR020" H 8200 1450 50  0001 C CNN
F 1 "Vdrive" H 8417 1773 50  0000 C CNN
F 2 "" H 8400 1600 50  0001 C CNN
F 3 "" H 8400 1600 50  0001 C CNN
	1    8400 1600
	-1   0    0    1   
$EndComp
$Comp
L power:Vdrive #PWR01
U 1 1 5DD49E07
P 900 3450
F 0 "#PWR01" H 700 3300 50  0001 C CNN
F 1 "Vdrive" H 917 3623 50  0000 C CNN
F 2 "" H 900 3450 50  0001 C CNN
F 3 "" H 900 3450 50  0001 C CNN
	1    900  3450
	1    0    0    -1  
$EndComp
$Comp
L power:Vdrive #PWR03
U 1 1 5DD4A5B1
P 900 4650
F 0 "#PWR03" H 700 4500 50  0001 C CNN
F 1 "Vdrive" H 917 4823 50  0000 C CNN
F 2 "" H 900 4650 50  0001 C CNN
F 3 "" H 900 4650 50  0001 C CNN
	1    900  4650
	1    0    0    -1  
$EndComp
$Comp
L Sensor_Current:ACS723xLCTR-05AB U1
U 1 1 5DD4F3C7
P 9150 1500
F 0 "U1" H 9150 2081 50  0000 C CNN
F 1 "ACS723xLCTR-05AB" H 9150 1990 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 9250 1150 50  0001 L CNN
F 3 "https://www.digikey.ca/product-detail/en/allegro-microsystems/ACS723LLCTR-05AB-T/620-1641-1-ND/4948877" H 9150 1500 50  0001 C CNN
	1    9150 1500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR029
U 1 1 5DD5F2EC
P 10350 1000
F 0 "#PWR029" H 10350 850 50  0001 C CNN
F 1 "+5V" H 10365 1173 50  0000 C CNN
F 2 "" H 10350 1000 50  0001 C CNN
F 3 "" H 10350 1000 50  0001 C CNN
	1    10350 1000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR022
U 1 1 5DD7D7EB
P 8400 3600
F 0 "#PWR022" H 8400 3350 50  0001 C CNN
F 1 "GND" H 8405 3427 50  0000 C CNN
F 2 "" H 8400 3600 50  0001 C CNN
F 3 "" H 8400 3600 50  0001 C CNN
	1    8400 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR023
U 1 1 5DD7E1A4
P 9150 2100
F 0 "#PWR023" H 9150 1850 50  0001 C CNN
F 1 "GND" H 9155 1927 50  0000 C CNN
F 2 "" H 9150 2100 50  0001 C CNN
F 3 "" H 9150 2100 50  0001 C CNN
	1    9150 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 2100 9150 1900
Wire Wire Line
	8400 1300 8750 1300
Wire Wire Line
	8400 1600 8750 1600
$Comp
L Jumper:Jumper_2_Open JP1
U 1 1 5DDA41FB
P 8400 3300
F 0 "JP1" V 8446 3212 50  0000 R CNN
F 1 "Jumper_2_Open" V 8355 3212 50  0000 R CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 8400 3300 50  0001 C CNN
F 3 "~" H 8400 3300 50  0001 C CNN
	1    8400 3300
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR030
U 1 1 5DDD3A6B
P 10350 1750
F 0 "#PWR030" H 10350 1500 50  0001 C CNN
F 1 "GND" H 10355 1577 50  0000 C CNN
F 2 "" H 10350 1750 50  0001 C CNN
F 3 "" H 10350 1750 50  0001 C CNN
	1    10350 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5DE038E8
P 10350 1400
F 0 "C2" H 10465 1446 50  0000 L CNN
F 1 "0.1 uF" H 10465 1355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 10388 1250 50  0001 C CNN
F 3 "https://www.digikey.ca/product-detail/en/samsung-electro-mechanics/CL10B104KB8NNNC/1276-1000-1-ND/3889086" H 10350 1400 50  0001 C CNN
	1    10350 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	10350 1550 10350 1750
Wire Wire Line
	10350 1000 10350 1100
Wire Wire Line
	9150 1100 10350 1100
Connection ~ 10350 1100
Wire Wire Line
	10350 1100 10350 1250
Text GLabel 9800 1300 2    50   Input ~ 0
VIOUT
Text GLabel 9800 1600 2    50   Input ~ 0
BW_SEL
Wire Wire Line
	9800 1300 9550 1300
Wire Wire Line
	9800 1600 9550 1600
Text GLabel 9900 2700 0    50   Input ~ 0
VIOUT
Wire Wire Line
	10250 2700 10250 2850
$Comp
L power:+5V #PWR021
U 1 1 5DE25CDF
P 8400 2400
F 0 "#PWR021" H 8400 2250 50  0001 C CNN
F 1 "+5V" H 8415 2573 50  0000 C CNN
F 2 "" H 8400 2400 50  0001 C CNN
F 3 "" H 8400 2400 50  0001 C CNN
	1    8400 2400
	1    0    0    -1  
$EndComp
Text GLabel 8200 3000 0    50   Input ~ 0
BW_SEL
Wire Wire Line
	8400 3600 8400 3500
$Comp
L Device:R R3
U 1 1 5DE38EC1
P 8400 2700
F 0 "R3" V 8193 2700 50  0000 C CNN
F 1 "5.1K" V 8284 2700 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 8470 2609 50  0001 L CNN
F 3 "https://www.digikey.ca/product-detail/en/panasonic-electronic-components/ERJ-3EKF5101V/P5.10KHCT-ND/1746787" H 8400 2700 50  0001 C CNN
	1    8400 2700
	-1   0    0    1   
$EndComp
Wire Wire Line
	8400 2550 8400 2400
Wire Wire Line
	8400 3100 8400 3000
Wire Wire Line
	8200 3000 8400 3000
Connection ~ 8400 3000
Wire Wire Line
	8400 3000 8400 2850
$Comp
L Device:C C1
U 1 1 5DE51560
P 10250 3000
F 0 "C1" H 10365 3046 50  0000 L CNN
F 1 "1 nF" H 10365 2955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 10288 2850 50  0001 C CNN
F 3 "https://www.digikey.ca/product-detail/en/samsung-electro-mechanics/CL10B102KB8NNNC/1276-1018-1-ND/3889104" H 10250 3000 50  0001 C CNN
	1    10250 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	10250 3150 10250 3350
$Comp
L power:GND #PWR028
U 1 1 5DE545EF
P 10250 3350
F 0 "#PWR028" H 10250 3100 50  0001 C CNN
F 1 "GND" H 10255 3177 50  0000 C CNN
F 2 "" H 10250 3350 50  0001 C CNN
F 3 "" H 10250 3350 50  0001 C CNN
	1    10250 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	10600 2700 10250 2700
Connection ~ 10250 2700
Wire Wire Line
	9900 2700 10250 2700
$EndSCHEMATC
