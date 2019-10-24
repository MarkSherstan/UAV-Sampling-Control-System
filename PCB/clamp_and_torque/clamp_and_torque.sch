EESchema Schematic File Version 4
LIBS:clamp_and_torque-cache
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
P 5550 3550
F 0 "A1" H 5550 2461 50  0000 C CNN
F 1 "Arduino_Nano_v3.x" H 5550 2370 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 5700 2600 50  0001 L CNN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 5550 2550 50  0001 C CNN
	1    5550 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5DAE42D2
P 9700 4050
F 0 "R1" V 9493 4050 50  0000 C CNN
F 1 "10k" V 9584 4050 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 9770 3959 50  0001 L CNN
F 3 "~" H 9700 4050 50  0001 C CNN
	1    9700 4050
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5DAE4C27
P 10200 4150
F 0 "#PWR0101" H 10200 3900 50  0001 C CNN
F 1 "GND" H 10205 3977 50  0000 C CNN
F 2 "" H 10200 4150 50  0001 C CNN
F 3 "" H 10200 4150 50  0001 C CNN
	1    10200 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9850 4050 10200 4050
$Comp
L Connector:Conn_01x03_Female J1
U 1 1 5DAE38D8
P 1550 3750
F 0 "J1" H 1578 3776 50  0000 L CNN
F 1 "Servo1" H 1578 3685 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 1550 3750 50  0001 C CNN
F 3 "~" H 1550 3750 50  0001 C CNN
	1    1550 3750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5DAEA58B
P 900 4050
F 0 "#PWR0103" H 900 3800 50  0001 C CNN
F 1 "GND" H 905 3877 50  0000 C CNN
F 2 "" H 900 4050 50  0001 C CNN
F 3 "" H 900 4050 50  0001 C CNN
	1    900  4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 3550 6450 3550
$Comp
L Connector:Conn_01x02_Female J4
U 1 1 5DAF68B1
P 9750 3600
F 0 "J4" H 9778 3576 50  0000 L CNN
F 1 "Conn_01x02_Female" H 9778 3485 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical_V2" H 9750 3600 50  0001 C CNN
F 3 "~" H 9750 3600 50  0001 C CNN
	1    9750 3600
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D1
U 1 1 5DAF88E0
P 2000 7000
F 0 "D1" H 1993 7216 50  0000 C CNN
F 1 "R-LED" H 1993 7125 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 2000 7000 50  0001 C CNN
F 3 "~" H 2000 7000 50  0001 C CNN
	1    2000 7000
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x02_Female J3
U 1 1 5DAFAF0D
P 950 1350
F 0 "J3" H 842 1025 50  0000 C CNN
F 1 "LimitSwitchA" H 842 1116 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 950 1350 50  0001 C CNN
F 3 "~" H 950 1350 50  0001 C CNN
	1    950  1350
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x03_Female J2
U 1 1 5DB09907
P 1550 4900
F 0 "J2" H 1578 4926 50  0000 L CNN
F 1 "Servo2" H 1578 4835 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 1550 4900 50  0001 C CNN
F 3 "~" H 1550 4900 50  0001 C CNN
	1    1550 4900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 5DB0990D
P 900 5150
F 0 "#PWR0105" H 900 4900 50  0001 C CNN
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
F 1 "?" V 1384 7000 50  0000 C CNN
F 2 "" H 1570 6909 50  0000 L CNN
F 3 "~" H 1500 7000 50  0001 C CNN
	1    1500 7000
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R3
U 1 1 5DB12750
P 1500 6550
F 0 "R3" V 1293 6550 50  0000 C CNN
F 1 "?" V 1384 6550 50  0000 C CNN
F 2 "" H 1570 6459 50  0000 L CNN
F 3 "~" H 1500 6550 50  0001 C CNN
	1    1500 6550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1800 6550 1650 6550
Wire Wire Line
	1850 7000 1650 7000
$Comp
L power:GND #PWR0106
U 1 1 5DB161D3
P 2450 7100
F 0 "#PWR0106" H 2450 6850 50  0001 C CNN
F 1 "GND" H 2455 6927 50  0000 C CNN
F 2 "" H 2450 7100 50  0001 C CNN
F 3 "" H 2450 7100 50  0001 C CNN
	1    2450 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 7000 2450 7000
Wire Wire Line
	2450 7000 2450 7100
$Comp
L Device:LED D2
U 1 1 5DB1C9A4
P 1950 6550
F 0 "D2" H 1943 6766 50  0000 C CNN
F 1 "G-LED" H 1943 6675 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 1950 6550 50  0001 C CNN
F 3 "~" H 1950 6550 50  0001 C CNN
	1    1950 6550
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR0109
U 1 1 5DB2417F
P 9300 3450
F 0 "#PWR0109" H 9300 3300 50  0001 C CNN
F 1 "+5V" H 9315 3623 50  0000 C CNN
F 2 "" H 9300 3450 50  0001 C CNN
F 3 "" H 9300 3450 50  0001 C CNN
	1    9300 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 3600 9300 3600
$Comp
L Connector:Conn_01x02_Female J6
U 1 1 5DB0E066
P 950 2050
F 0 "J6" H 842 1725 50  0000 C CNN
F 1 "LimitSwitchB" H 842 1816 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 950 2050 50  0001 C CNN
F 3 "~" H 950 2050 50  0001 C CNN
	1    950  2050
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0112
U 1 1 5DB0EAAF
P 1350 1350
F 0 "#PWR0112" H 1350 1100 50  0001 C CNN
F 1 "GND" H 1355 1177 50  0000 C CNN
F 2 "" H 1350 1350 50  0001 C CNN
F 3 "" H 1350 1350 50  0001 C CNN
	1    1350 1350
	1    0    0    -1  
$EndComp
Text GLabel 4600 3150 0    50   Input ~ 0
D2
Text GLabel 4600 3250 0    50   Input ~ 0
D3
Text GLabel 1600 1250 2    50   Input ~ 0
D2
Text GLabel 1550 1950 2    50   Input ~ 0
D3
$Comp
L power:GND #PWR0113
U 1 1 5DB1DE6D
P 1400 2050
F 0 "#PWR0113" H 1400 1800 50  0001 C CNN
F 1 "GND" H 1405 1877 50  0000 C CNN
F 2 "" H 1400 2050 50  0001 C CNN
F 3 "" H 1400 2050 50  0001 C CNN
	1    1400 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 1350 1350 1350
Wire Wire Line
	1150 1950 1550 1950
Wire Wire Line
	1150 1250 1600 1250
Wire Wire Line
	1150 2050 1400 2050
$Comp
L power:GND #PWR0102
U 1 1 5DB261B3
P 6050 4600
F 0 "#PWR0102" H 6050 4350 50  0001 C CNN
F 1 "GND" H 6055 4427 50  0000 C CNN
F 2 "" H 6050 4600 50  0001 C CNN
F 3 "" H 6050 4600 50  0001 C CNN
	1    6050 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 4550 6050 4550
Wire Wire Line
	6050 4550 6050 4600
$Comp
L Connector:Conn_01x02_Female J5
U 1 1 5DB101DE
P 9400 1250
F 0 "J5" H 9428 1226 50  0000 L CNN
F 1 "Conn_01x02_Female" H 9428 1135 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 9400 1250 50  0001 C CNN
F 3 "~" H 9400 1250 50  0001 C CNN
	1    9400 1250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5DB12018
P 8900 1450
F 0 "#PWR0104" H 8900 1200 50  0001 C CNN
F 1 "GND" H 8905 1277 50  0000 C CNN
F 2 "" H 8900 1450 50  0001 C CNN
F 3 "" H 8900 1450 50  0001 C CNN
	1    8900 1450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0108
U 1 1 5DB12812
P 8900 1050
F 0 "#PWR0108" H 8900 900 50  0001 C CNN
F 1 "+5V" H 8915 1223 50  0000 C CNN
F 2 "" H 8900 1050 50  0001 C CNN
F 3 "" H 8900 1050 50  0001 C CNN
	1    8900 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 1250 8900 1250
Wire Wire Line
	8900 1250 8900 1050
Wire Wire Line
	9200 1350 8900 1350
Wire Wire Line
	8900 1350 8900 1450
Text Notes 8850 700  0    50   ~ 10
Power In
Text Notes 9400 750  0    50   ~ 0
5V - 3A or have voltage regulator with 12 V \nand reverse polarity protection etc…
$Comp
L power:+5V #PWR0110
U 1 1 5DB1ED3B
P 5450 2050
F 0 "#PWR0110" H 5450 1900 50  0001 C CNN
F 1 "+5V" H 5465 2223 50  0000 C CNN
F 2 "" H 5450 2050 50  0001 C CNN
F 3 "" H 5450 2050 50  0001 C CNN
	1    5450 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 2550 5450 2050
Text GLabel 4900 2950 0    50   Input ~ 0
RX
Wire Wire Line
	4600 3250 5050 3250
Wire Wire Line
	4600 3150 5050 3150
Wire Wire Line
	4900 2950 5050 2950
Text GLabel 4900 3050 0    50   Input ~ 0
TX
Wire Wire Line
	5050 3050 4900 3050
$Comp
L power:+5V #PWR0111
U 1 1 5DB2D518
P 900 4750
F 0 "#PWR0111" H 900 4600 50  0001 C CNN
F 1 "+5V" H 915 4923 50  0000 C CNN
F 2 "" H 900 4750 50  0001 C CNN
F 3 "" H 900 4750 50  0001 C CNN
	1    900  4750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0114
U 1 1 5DB2E1EE
P 900 3450
F 0 "#PWR0114" H 900 3300 50  0001 C CNN
F 1 "+5V" H 915 3623 50  0000 C CNN
F 2 "" H 900 3450 50  0001 C CNN
F 3 "" H 900 3450 50  0001 C CNN
	1    900  3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	900  4900 900  4750
Text Notes 850  800  0    50   ~ 10
Limit Switches
Text Notes 850  3150 0    50   ~ 10
Servos
Wire Wire Line
	900  5000 900  5150
Wire Wire Line
	900  5000 1350 5000
Text GLabel 4850 3850 0    50   Input ~ 0
D9
Text GLabel 4850 3750 0    50   Input ~ 0
D8
Wire Wire Line
	4850 3750 5050 3750
Wire Wire Line
	4850 3850 5050 3850
Text GLabel 1200 3650 0    50   Input ~ 0
D8
Text GLabel 1200 4800 0    50   Input ~ 0
D9
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
Text Notes 8850 2950 0    50   ~ 10
FSR’s
Wire Wire Line
	10200 4050 10200 4150
Wire Wire Line
	9300 4050 9300 3700
Wire Wire Line
	9300 3700 9550 3700
Wire Wire Line
	9300 4050 9550 4050
Text GLabel 6450 3550 2    50   Input ~ 0
A0
Text GLabel 9050 3700 0    50   Input ~ 0
A0
Wire Wire Line
	9300 3600 9300 3450
Wire Wire Line
	9050 3700 9300 3700
Connection ~ 9300 3700
$Comp
L Device:R R4
U 1 1 5DB73738
P 9700 5200
F 0 "R4" V 9493 5200 50  0000 C CNN
F 1 "10k" V 9584 5200 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 9770 5109 50  0001 L CNN
F 3 "~" H 9700 5200 50  0001 C CNN
	1    9700 5200
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 5DB7373E
P 10200 5300
F 0 "#PWR0115" H 10200 5050 50  0001 C CNN
F 1 "GND" H 10205 5127 50  0000 C CNN
F 2 "" H 10200 5300 50  0001 C CNN
F 3 "" H 10200 5300 50  0001 C CNN
	1    10200 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	9850 5200 10200 5200
$Comp
L Connector:Conn_01x02_Female J7
U 1 1 5DB73745
P 9750 4750
F 0 "J7" H 9778 4726 50  0000 L CNN
F 1 "Conn_01x02_Female" H 9778 4635 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical_V2" H 9750 4750 50  0001 C CNN
F 3 "~" H 9750 4750 50  0001 C CNN
	1    9750 4750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0116
U 1 1 5DB7374B
P 9300 4600
F 0 "#PWR0116" H 9300 4450 50  0001 C CNN
F 1 "+5V" H 9315 4773 50  0000 C CNN
F 2 "" H 9300 4600 50  0001 C CNN
F 3 "" H 9300 4600 50  0001 C CNN
	1    9300 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 4750 9300 4750
Wire Wire Line
	10200 5200 10200 5300
Wire Wire Line
	9300 5200 9300 4850
Wire Wire Line
	9300 4850 9550 4850
Wire Wire Line
	9300 5200 9550 5200
Text GLabel 9050 4850 0    50   Input ~ 0
A1
Wire Wire Line
	9300 4750 9300 4600
Wire Wire Line
	9050 4850 9300 4850
Connection ~ 9300 4850
Text GLabel 6450 3650 2    50   Input ~ 0
A1
Wire Wire Line
	6050 3650 6450 3650
Wire Wire Line
	2100 6550 2450 6550
$Comp
L power:GND #PWR0107
U 1 1 5DB16AD6
P 2450 6650
F 0 "#PWR0107" H 2450 6400 50  0001 C CNN
F 1 "GND" H 2455 6477 50  0000 C CNN
F 2 "" H 2450 6650 50  0001 C CNN
F 3 "" H 2450 6650 50  0001 C CNN
	1    2450 6650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 6650 2450 6550
Text GLabel 4600 4150 0    50   Input ~ 0
D12
Text GLabel 4600 4250 0    50   Input ~ 0
D13
Wire Wire Line
	4600 4150 5050 4150
Wire Wire Line
	4600 4250 5050 4250
Text GLabel 1050 6550 0    50   Input ~ 0
D12
Text GLabel 1050 7000 0    50   Input ~ 0
D13
Wire Wire Line
	1050 6550 1350 6550
Wire Wire Line
	1050 7000 1350 7000
Text Notes 800  6150 0    50   ~ 10
Indicator LEDs
Text Notes 4300 6400 0    50   ~ 0
Larger surface mounted components\nResistor values for LEDs\nMounting holes on board\nCorrect foot prints?\n   - 90 degree -> Servo\n   - Screw terminal -> FSR\n
$EndSCHEMATC
