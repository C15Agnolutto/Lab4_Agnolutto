-------------------------------------------------------------------------------
--
-- Title       : ALU
-- Design      : ALU
-- Author      : C2C Agnolutto
-- Company     : USAFA ECE 281
--
-------------------------------------------------------------------------------
--
-- File        : ALU.vhd
-- Generated   : Fri Mar 30 11:16:54 2007
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.20
--
-------------------------------------------------------------------------------
--
-- Description : creates an ALU
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {ALU} architecture {ALU}}

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU is
	 port(
		 OpSel : in STD_LOGIC_VECTOR(2 downto 0);
		 Data : in STD_LOGIC_VECTOR(3 downto 0);
		 Accumulator : in STD_LOGIC_VECTOR(3 downto 0);
		 Result : out STD_LOGIC_VECTOR(3 downto 0)
	     );
end ALU;

--}} End of automatically maintained section

architecture ALU of ALU is	   

begin
	
-- fill in details to create result as a function of Data and Accumulator, based on OpSel.
 -- e.g : Build a multiplexer choosing between the eight ALU operations.  Either use a case statement (and thus a process)
 --       or a conditional signal assignment statement ( x <= Y when <condition> else . . .)
 -- ALU Operations are defined as:
 -- OpSel : Function
--  0     : AND
--  1     : NEG (2s complement)
--  2     : NOT (invert)
--  3     : ROR
--  4     : OR
--  5     : IN
--  6     : ADD
--  7     : LD
aluswitch: process (Accumulator, Data, OpSel)
        begin
		-- enter your if/then/else or case statements here
			case OpSel is
				--AND function, takes both 
				when "000" =>
					Result <= Data and Accumulator;
				
				--NEG function, not the accumulator value and add 1 to get two's complement
				when "001" =>
					Result <= not Accumulator + "0001";
				
				--NOT function, not the accumulator value
				when "010" =>
					Result <= not Accumulator;
					
				--ROR function, rotates the accumulator value one to the left
				when "011" =>
					Result(0) <= Accumulator(1);
					Result(1) <= Accumulator(2);
					Result(2) <= Accumulator(3);
					Result(3) <= Accumulator(0);
				
				--OR function, takes either of them
				when "100" =>
					Result <= Data or Accumulator;
					
				--In function, passes data along to the accumulator
				when "101" => 
					Result <= Data;
					
				--ADD function, adds the two together
				when "110" => 
					Result <= Data + Accumulator;
					
				--LD function, loads the value of data to the accumulator
				when "111" =>
					Result <= Data;
			
				when others =>
					Result <= Accumulator;
			
			end case;


				
		end process;

-- OR, enter your conditional signal statement here

end ALU;

