# FPGA_Alarm
2 zone alarm on an Altera Development FPGA board with VHDL

ZONES

The zones consist of 2 contacts (push button) each, where when they are pressed, a logical '1' is sent to the output of each module of each zone so that the alarm sounds.
Unless one of the On / Off switches that each zone of the alarm has is off, in which case a logic '0' will be sent to the output.
Also, depending on the state of these switches, an LED lights up where it is lit if the zone is active, i.e. the switch is in position '1'.

CENTRAL ALARM

In the central alarm, the outputs of each zone are checked, for whether the siren will sound.
Also in the central alarm we have as input 1 toggle switch which is for Activation-Deactivation of the entire alarm and as output 4 LEDs and 1 siren.
The alarm checks if the 4th switch is in position '1' and if it is then it checks the inputs one by one and lights the 4th led. If it is '0'- off then no control is done and the Led is off.
So, depending on whether a zone hits, an LED lights up for each zone that hits.

![image](https://github.com/dimitrisanta/FPGA_Alarm/assets/23315629/bf066e6c-092f-44ba-9902-7f81e3b852e6)

![image](https://github.com/dimitrisanta/FPGA_Alarm/assets/23315629/43cd7357-303e-4845-83a5-fa893586b5d1)
