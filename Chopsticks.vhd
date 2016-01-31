--  DESIGNER NAME:  Michael McLeod
--
--   PROJECT NAME:  Chopsticks 
--
--      FILE NAME:  Chopsticks.vhd
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_unSIGNED.ALL; 

entity Chopsticks is 
  -- generic( person : std_logic);
  port(
   clk               : in std_logic;
   reset             : in std_logic;
   enable			 : in std_logic;
   split			: in std_logic;
   instruction       : in std_logic_vector(4 downto 0);
   state			 : in std_logic_vector(5 downto 0);
   your_left		 : in std_logic_vector(3 downto 0);
   your_right			: in std_logic_vector(3 downto 0);
   my_left				: out std_logic_vector(3 downto 0);
   my_right			: out std_logic_vector(3 downto 0)
  );
end entity;

Architecture behavior of Chopsticks is

signal next_right, next_left : std_logic_vector(4 downto 0) := "00001";
signal int_my_left, int_my_right : std_logic_vector(3 downto 0) := "0001";
signal over_right, over_left : std_logic_vector(4 downto 0) := "00001";

alias s_split : std_logic is instruction(4);

begin

process(clk, reset, instruction, your_right, your_left, int_my_left, int_my_right, enable, split)
 begin
if reset = '1' then
		over_left <= "00001";
		over_right <= "00001";

elsif (rising_edge(clk)) then
	if (int_my_left = "00000" and int_my_right = "00000") then
		over_left <= "00000";
		over_right <= "00000";
	elsif enable = '1' then
		case (instruction) is
			when "10001" => over_left <= '0' & (your_right + int_my_left); 
							 over_right <= '0' & int_my_right;
			when "10010" => over_right <= '0' & (your_right + int_my_right);
							 over_left <= '0' & int_my_left;
			when "10100" => over_left <= '0' & (your_left + int_my_left);
							 over_right <= '0' & int_my_right;
			when "11000" => over_right <= '0' & (your_left + int_my_right);
							 over_left <= '0' & int_my_left;
			when others => over_left <= '0' & int_my_left;
							over_right <= '0' & int_my_right;
		end case;
	
	elsif split = '0' then
		over_left <= '0' & int_my_left;
		over_right <= '0' & int_my_right;
	end if;
end if;
end process;

overflow:process(over_right, over_left)
begin
	if (over_right >= "00101") then -- checking overflow for right hand 
		if (over_right = "00101") then
			next_right <= "00000";
			next_left <= over_left;
		elsif (over_right > "00101") then
			next_right <= over_right - "00101";
			next_left <= over_left;
		end if;
	elsif (over_left >= "00101") then -- checking overflow for left hand 
		if (over_left = "00101") then
			next_left <= "00000";
			next_right <= over_right;
		elsif (over_left > "00101") then
			next_left <= over_left - "00101";
			next_right <= over_right;
		end if;
	else
		next_left <= over_left;
		next_right <= over_right;
	end if;
end process;

spliteer: process(next_left, next_right, split)
begin
if (split = '0')	then --Handles split case
	if (next_left = "00010" AND next_right = "00000") then
		int_my_left <= "0001";
		int_my_right <= "0001";
	elsif (next_left = "00100" AND next_right = "00000") then
		int_my_left <= "0010";
		int_my_right <= "0010";
	elsif (next_right = "00010" AND next_left = "00000") then
		int_my_left <= "0001";
		int_my_right <= "0001";
	elsif (next_right = "00100" AND next_left = "00000") then
		int_my_left <= "0010";
		int_my_right <= "0010";
	else
		int_my_left <= next_left(3 downto 0);
		int_my_right <= next_right(3 downto 0);
	end if;

else
	int_my_left <= next_left(3 downto 0);
	int_my_right <= next_right(3 downto 0);
end if;
end process;


my_right <= int_my_right;
my_left <= int_my_left;

end behavior;
