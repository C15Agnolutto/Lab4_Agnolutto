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

This was a little bit trickier. We were given the code for the PC which was helpful in understanding what we had to do
and what each register should look like. I relied heavily on the schematic given to us in the Lab 4 handout to figure 
out what went where and when something would occur. I followed the same pattern for the IR, MARHi, and MARLo using if and elsif statements. If reset was 0 then the info passed through equaled 0. Otherwise, if the clock was at a rising edge and the respective signals going in were equal to 1, then the corresponding outputs went through. The address 
selector was slightly different because it was based on the PC and memory registers. If the address select = 0, the PC value went through, if it equaled 1 then the memory registers went through. Slight issue there initially, assigning Addr to MARHi and MARLo as opposed to splitting the Addr value 7 to 4 and 3 to 0 for the MARHi and MARLo values respectively. After that was resolved, I instantiated the ALU. Easy enough. Connected the OpSel, Data,Accumulator and Result to the ALU info in my ALU_shell file. Implementing the Accumulator was not that difficult. It followed the came pattern as those before it. If reset is enable, then 0 goes through, if AccLd is 1 and its on a rising edge then the accumulator value passes through. The last two pieces were implement a tristate buffer and the datapath status signals. Again, using the schematic provided, it was not different to figure out what gets passed through and what it relied on (can be seen in the provided files). 



### Datapath Test and Debug

![50ns] (https://raw.githubusercontent.com/C15Agnolutto/Lab4_Agnolutto/master/Datapath50ns.PNG)

The above datapath waveform matches the simulation results provided in the lab 4 handout that we were supposed to compare it to. This did not happen on the first attempt. As stated above, the errors I made caused variations in the simulation results until I finished the debugging. This is the final product that matches the 0-50ns waveform. 


### Discussion of Datapath Testbench Operation

![100ns] (https://raw.githubusercontent.com/C15Agnolutto/Lab4_Agnolutto/master/Datapath100ns.PNG)


