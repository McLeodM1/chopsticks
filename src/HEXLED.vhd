--  DESIGNER NAME:  Michael McLeod
--
--       LAB NAME:  Chopsticks
--
--      FILE NAME:  HEXLED.vhd
--
-------------------------------------------------------------------------------
--
--  DESCRIPTION: Translates a binary value from 0 to F into a format that can
--				 be used for 7-segment display HEX LEDs.
--    
-------------------------------------------------------------------------------
--
--  REVISION HISTORY
--
--  _______________________________________________________________________
-- |  DATE    | USER | Ver |  Description                                  |
-- |==========+======+=====+================================================
-- |          |      |     |
-- | 10/13/15 | MSM  | 1.0 | Created
--
--*****************************************************************************
--*****************************************************************************

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL; 

Entity HEXLED is
	Port (bcd : in std_logic_vector(3 downto 0);
		  HEX : out std_logic_vector(6 downto 0));
	end entity;

Architecture behavior of HEXLED is              
														     --gfedcba
constant zero : std_logic_vector(6 downto 0) := "1000000"; 
constant one : std_logic_vector(6 downto 0)  := "1111001"; 
constant two : std_logic_vector(6 downto 0)  := "0100100"; 
constant three : std_logic_vector(6 downto 0):= "0110000"; 
constant four : std_logic_vector(6 downto 0) := "0011001"; 
constant five : std_logic_vector(6 downto 0) := "0010010"; 
constant six : std_logic_vector(6 downto 0)  := "0000010"; 
constant seven : std_logic_vector(6 downto 0):= "1111000"; 
constant eight : std_logic_vector(6 downto 0):= "0000000";
constant nine : std_logic_vector(6 downto 0) := "0011000";
constant A : std_logic_vector(6 downto 0)    := "0001000";
constant B : std_logic_vector(6 downto 0)    := "0000011";
constant C : std_logic_vector(6 downto 0)    := "1000110";
constant D : std_logic_vector(6 downto 0)    := "0100001";
constant E : std_logic_vector(6 downto 0)    := "0000110";
constant F : std_logic_vector(6 downto 0)    := "0001110";
constant blank : std_logic_vector(6 downto 0):= "1111111";
constant neg : std_logic_vector(6 downto 0)  := "0111111";

begin
	convert: process(bcd)
		begin
			case bcd(3 downto 0) is
				when "0000" => HEX <= zero;
				when "0001" => HEX <= one;
				when "0010" => HEX <= two;
				when "0011" => HEX <= three;
				when "0100" => HEX <= four;
				when "0101" => HEX <= five;
				when "0110" => HEX <= six;
				when "0111" => HEX <= seven;
				when "1000" => HEX <= eight;
				when "1001" => HEX <= nine;
				when "1010" => HEX <= A;
				when "1011" => HEX <= B;
				when "1100" => HEX <= C;
				when "1101" => HEX <= D;
				when "1110" => HEX <= E;
				when "1111" => HEX <= F;
				when others => HEX <= blank;
			end case;
		end process;
	
end behavior;
