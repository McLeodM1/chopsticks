--  DESIGNER NAME:  Michael McLeod
--
--   PROJECT NAME:  Chopsticks 
--
--      FILE NAME:  gameTop.vhd
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity gameTop is
	
  port(
    clk                 : in std_logic;
    reset_n             : in std_logic;
	split				: in std_logic;
	secure				: in std_logic;
    switches	        : in std_logic_vector(3 downto 0);
	rx_instruction      : in std_logic_vector(4 downto 0);
	HEX_play_right		: out std_logic_vector(6 downto 0);
	HEX_opp_right		: out std_logic_vector(6 downto 0);
	HEX_opp_left		: out std_logic_vector(6 downto 0);
	HEX_play_left		: out std_logic_vector(6 downto 0)
  );
end entity;

Architecture behavior of gameTop is

component Chopsticks is 
  port(
    clk                 : in std_logic;
    reset               : in std_logic;
	enable			 : in std_logic;
	split			: in std_logic;
    instruction         : in std_logic_vector(4 downto 0);
	state			 : in std_logic_vector(5 downto 0);
	your_left			: in std_logic_vector(3 downto 0);
	your_right			: in std_logic_vector(3 downto 0);
	my_left				: out std_logic_vector(3 downto 0);
	my_right			: out std_logic_vector(3 downto 0)
  );
end component;

component HEXLED is
	Port (bcd : in std_logic_vector(3 downto 0);
		  HEX : out std_logic_vector(6 downto 0));
	end component;
	
type array_num is array (3 downto 0) of std_logic_vector(3 downto 0);
type light_array is array (3 downto 0) of std_logic_vector(6 downto 0);

signal int_my_left, int_my_right 	: std_logic_vector(3 downto 0);
signal int_your_left, int_your_right : std_logic_vector(3 downto 0);
signal sw_instruction : std_logic_vector(4 downto 0);
signal numberin : array_num;
signal light	: light_array;
signal reset : std_logic;
signal current_rx : std_logic_vector(4 downto 0) := "00000";
signal enable0, enable1 : std_logic := '0';
signal opponent_split, player_split : std_logic := '1';

signal state_reg            : std_logic_vector(5 downto 0);
signal state_next           : std_logic_vector(5 downto 0);


-- constant you_go             : std_logic_vector(5 downto 0) := "000001";
-- constant no_you				: std_logic_vector(5 downto 0) := "000001";
constant idle               : std_logic_vector(5 downto 0) := "000001";
constant player_in			: std_logic_vector(5 downto 0) := "000010";
constant calc_0				: std_logic_vector(5 downto 0) := "000100";
constant opponent_in        : std_logic_vector(5 downto 0) := "001000";
constant calc_1       		: std_logic_vector(5 downto 0) := "010000";
constant wait1        		: std_logic_vector(5 downto 0) := "100000";
constant fetch_wait2        : std_logic_vector(6 downto 0) := "1000000";

begin
--instantiate generates of HEX LEDs
GEN_HEX:
	for I in 0 to 3 generate
		Lights: HEXLED 
			port map
			(numberin(I), light(I));
	end generate GEN_HEX;
	

--instantiate player
Player: Chopsticks
	-- generic map (person => '0')
	port map(
    clk => clk,
    reset => reset,
	enable => enable0,
	split => player_split,
    instruction => rx_instruction,
	state => state_reg,
	your_left => int_your_left,
	your_right => int_your_right,
	my_left => int_my_left,
	my_right => int_my_right
  );
  
--instantiate opponent
Opponent: Chopsticks
	-- generic map (person => '1')
	port map(
    clk => clk,
    reset => reset,
	enable => enable1,
	split => opponent_split,
    instruction => sw_instruction,
	state => state_reg,
	your_left => int_my_left,
	your_right => int_my_right,
	my_left => int_your_left,
	my_right => int_your_right
  );

reset <= not reset_n; 

-------------------------------------------------------------------------------
-- state register
------------------------------------------------------------------------------- 
state_register: process(clk,reset)
  begin 
    if (reset = '1') then 
      state_reg <= idle;
    elsif (clk'event and clk = '1') then
      state_reg <= state_next;
    end if;
  end process;

-------------------------------------------------------------------------------
-- instruction next state logic
------------------------------------------------------------------------------- 
next_state_logic: process(state_reg,rx_instruction(0),secure, split, switches)
begin
  -- default values
  state_next <= state_reg;    
  case state_reg is  
    when idle =>
		sw_instruction <= "10000";
		if secure = '0' then
			sw_instruction <= "11111";
			state_next <= player_in;
		elsif rx_instruction = "11111" then
			state_next <= player_in;
		else 
			state_next <= idle;
		end if;
    when player_in =>
	  sw_instruction <= split & switches;
	  enable0 <= '0';
	  player_split <= '1';
		if secure = '0' then
			state_next <= calc_0;
		elsif split = '0' then
			player_split <= '0';
			state_next <= player_in;
		else 
			state_next <= player_in;
		end if;
    when calc_0 =>
	sw_instruction <= split & switches;
	enable1 <= '1';
      state_next <= opponent_in;
    when opponent_in =>
	  sw_instruction <= split & switches;
	  enable1 <= '0';
	  if rx_instruction(4) = '0' then
			opponent_split <= '0';
			state_next <= opponent_in;
		else
			opponent_split <= '1';
			state_next <= calc_1;
		end if;
    when calc_1 =>
	sw_instruction <= split & switches;
		enable0 <= '1';
		state_next <= player_in;
    when others =>
	sw_instruction <= split & switches;
      state_next <= idle;
  end case;
end process;

--input the hand values to the HEX display converter
numberin(0) <= int_my_right;
numberin(1) <= int_your_right;
numberin(2) <= int_your_left;
numberin(3) <= int_my_left;

--output HEX values
HEX_play_right	<= light(0);
HEX_opp_right 	<= light(1);
HEX_opp_left	<= light(2);
HEX_play_left	<= light(3);

end behavior;
