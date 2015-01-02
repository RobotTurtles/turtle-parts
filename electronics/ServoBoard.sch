EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:ServoBoard-cache
EELAYER 27 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 1
Title "Robot Turtle Servo Board"
Date "2 jan 2015"
Rev "0.01"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L 7805 U1
U 1 1 54A6D8F3
P 3200 1700
F 0 "U1" H 3350 1504 60  0000 C CNN
F 1 "7805" H 3200 1900 60  0000 C CNN
F 2 "~" H 3200 1700 60  0000 C CNN
F 3 "~" H 3200 1700 60  0000 C CNN
	1    3200 1700
	1    0    0    -1  
$EndComp
$Comp
L +6V #PWR01
U 1 1 54A6D96E
P 1400 1550
F 0 "#PWR01" H 1400 1680 20  0001 C CNN
F 1 "+6V" H 1400 1650 30  0000 C CNN
F 2 "" H 1400 1550 60  0000 C CNN
F 3 "" H 1400 1550 60  0000 C CNN
	1    1400 1550
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 54A6DC96
P 1400 2100
F 0 "R1" H 1480 2100 40  0000 C CNN
F 1 "100" H 1407 2101 40  0000 C CNN
F 2 "~" V 1330 2100 30  0000 C CNN
F 3 "~" H 1400 2100 30  0000 C CNN
	1    1400 2100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 54A6DDCB
P 1400 3050
F 0 "#PWR02" H 1400 3050 30  0001 C CNN
F 1 "GND" H 1400 2980 30  0001 C CNN
F 2 "" H 1400 3050 60  0000 C CNN
F 3 "" H 1400 3050 60  0000 C CNN
	1    1400 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 1650 2800 1650
$Comp
L LED D1
U 1 1 54A6DE7D
P 1550 2600
F 0 "D1" H 1550 2700 50  0000 C CNN
F 1 "LED" H 1550 2500 50  0000 C CNN
F 2 "~" H 1550 2600 60  0000 C CNN
F 3 "~" H 1550 2600 60  0000 C CNN
	1    1550 2600
	0    1    1    0   
$EndComp
Wire Wire Line
	1400 2800 1400 3050
Wire Wire Line
	3200 3000 3200 1950
Wire Wire Line
	1400 3000 5850 3000
$Comp
L C C1
U 1 1 54A6DFA4
P 1850 2300
F 0 "C1" H 1850 2400 40  0000 L CNN
F 1 "100 uF" H 1856 2215 40  0000 L CNN
F 2 "~" H 1888 2150 30  0000 C CNN
F 3 "~" H 1850 2300 60  0000 C CNN
	1    1850 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 2100 1850 1650
Connection ~ 1850 1650
Wire Wire Line
	1850 2500 1850 3000
Connection ~ 1850 3000
$Comp
L CONN_20X2 P1
U 1 1 54A6E06A
P 6850 2850
F 0 "P1" H 6850 3900 60  0000 C CNN
F 1 "Pi GPIO Header" V 6850 2850 50  0000 C CNN
F 2 "" H 6850 2850 60  0000 C CNN
F 3 "" H 6850 2850 60  0000 C CNN
	1    6850 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 1650 7250 1650
Wire Wire Line
	7250 1650 7250 1900
Wire Wire Line
	6450 1900 6450 1650
Connection ~ 6450 1650
Wire Wire Line
	5850 3000 5850 2300
Wire Wire Line
	5850 2300 6450 2300
Connection ~ 3200 3000
NoConn ~ 7250 2000
NoConn ~ 7250 2100
NoConn ~ 7250 2200
NoConn ~ 7250 2300
NoConn ~ 7250 2400
NoConn ~ 7250 2500
NoConn ~ 7250 2600
NoConn ~ 7250 2700
NoConn ~ 7250 2800
NoConn ~ 7250 2900
NoConn ~ 7250 3000
NoConn ~ 7250 3100
NoConn ~ 7250 3200
NoConn ~ 7250 3300
NoConn ~ 7250 3400
NoConn ~ 7250 3500
NoConn ~ 7250 3600
NoConn ~ 7250 3700
NoConn ~ 7250 3800
NoConn ~ 6450 3800
NoConn ~ 6450 3700
NoConn ~ 6450 3600
NoConn ~ 6450 3500
NoConn ~ 6450 3400
NoConn ~ 6450 3300
NoConn ~ 6450 3200
NoConn ~ 6450 3100
NoConn ~ 6450 3000
NoConn ~ 6450 2900
NoConn ~ 6450 2800
NoConn ~ 6450 2700
NoConn ~ 6450 2600
NoConn ~ 6450 2500
NoConn ~ 6450 2100
NoConn ~ 6450 2000
$Comp
L CONN_3 K1
U 1 1 54A6E166
P 3050 4000
F 0 "K1" V 3000 4000 50  0000 C CNN
F 1 "Left Servo" V 3100 4000 40  0000 C CNN
F 2 "" H 3050 4000 60  0000 C CNN
F 3 "" H 3050 4000 60  0000 C CNN
	1    3050 4000
	1    0    0    -1  
$EndComp
$Comp
L CONN_3 K2
U 1 1 54A6E177
P 4400 4000
F 0 "K2" V 4350 4000 50  0000 C CNN
F 1 "Right Servo" V 4450 4000 40  0000 C CNN
F 2 "" H 4400 4000 60  0000 C CNN
F 3 "" H 4400 4000 60  0000 C CNN
	1    4400 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 3900 2700 3250
Wire Wire Line
	2700 3250 5500 3250
Wire Wire Line
	5500 3250 5500 2200
Wire Wire Line
	5500 2200 6450 2200
Wire Wire Line
	6450 2400 3700 2400
Wire Wire Line
	3700 2400 3700 3900
Wire Wire Line
	3700 3900 4050 3900
Wire Wire Line
	2250 4000 2700 4000
Wire Wire Line
	2250 1650 2250 4000
Connection ~ 2250 1650
Wire Wire Line
	2250 3500 3550 3500
Wire Wire Line
	3550 3500 3550 4000
Wire Wire Line
	3550 4000 4100 4000
Connection ~ 4050 4000
Connection ~ 2250 3500
Wire Wire Line
	4050 4100 3400 4100
Wire Wire Line
	3400 4100 3400 4250
Wire Wire Line
	3400 4250 1900 4250
Wire Wire Line
	2700 4250 2700 4100
Wire Wire Line
	1900 4250 1900 3000
Connection ~ 1900 3000
Connection ~ 2700 4250
$Comp
L PWR_FLAG #FLG03
U 1 1 54A6E288
P 1050 1550
F 0 "#FLG03" H 1050 1645 30  0001 C CNN
F 1 "PWR_FLAG" H 1050 1730 30  0000 C CNN
F 2 "" H 1050 1550 60  0000 C CNN
F 3 "" H 1050 1550 60  0000 C CNN
	1    1050 1550
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG04
U 1 1 54A6E297
P 1000 2900
F 0 "#FLG04" H 1000 2995 30  0001 C CNN
F 1 "PWR_FLAG" H 1000 3080 30  0000 C CNN
F 2 "" H 1000 2900 60  0000 C CNN
F 3 "" H 1000 2900 60  0000 C CNN
	1    1000 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 1550 1400 1550
Wire Wire Line
	1000 2900 1400 2900
Connection ~ 1400 3000
Wire Wire Line
	1400 1550 1400 1850
Connection ~ 1400 1650
$Comp
L CONN_2 P2
U 1 1 54A6EE84
P 650 2250
F 0 "P2" V 600 2250 40  0000 C CNN
F 1 "CONN_2" V 700 2250 40  0000 C CNN
F 2 "" H 650 2250 60  0000 C CNN
F 3 "" H 650 2250 60  0000 C CNN
	1    650  2250
	-1   0    0    1   
$EndComp
Wire Wire Line
	1000 2150 1000 1650
Wire Wire Line
	1200 2800 1550 2800
Connection ~ 1400 2900
Wire Wire Line
	1200 2800 1200 2350
Wire Wire Line
	1200 2350 1000 2350
Connection ~ 1400 2800
Wire Wire Line
	1400 2350 1550 2350
Wire Wire Line
	1550 2350 1550 2400
$EndSCHEMATC
