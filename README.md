Lab4_Agnolutto
==============
### ALU Modifications

![schem](https://raw.githubusercontent.com/C15Agnolutto/Lab4_Agnolutto/master/Schematic.JPG)

This is a schematic of what is happening in the ALU_shell.vhd file. It is assigning the data bus and accumulator data 
to the different operations the ALU can perform based on the OP Sel code telling it which operation to perform.



### ALU Test and Debug

![ALU] (https://raw.githubusercontent.com/C15Agnolutto/Lab4_Agnolutto/master/ALU_waveform.PNG)

Above is the ALU simulation results. Yes the ALU works and has the expected results shown (reference table)

| Time   | OpSel   | Data  | Accum | Result |
| ------ |:-------:| :----:|:-----:|-------:|
| 50ns   | 000 AND | 0001  | 0010  | 0000   |
| 70ns   | 001 NEG | 0001  | 0011  | 1101   |
| 150ns  | 010 OR  | 0011  | 0111  | 1000   |
| 210ns  | 011 ROR | 0101  | 0111  | 0101   |
| 250ns  | 100 OR  | 0110  | 1100  | 1110   |
| 310ns  | 101 IN  | 0111  | 1111  | 0111   |
| 390ns  | 110 ADD | 1001  | 0011  | 1100   |
| 450ns  | 111 LDA | 1011  | 0110  | 1011   |

Not much debugging in this stage. Briefly reviewed how to do cases by looking at Lab 3. Initially put "when '0'" etc instead of "when '000'". Fixed that problem. For the NEG function I added "1" instead of "0001". Both easy fixes. Ran
simulation with no problems after syntax cleared. 



### Datapath Modifications
