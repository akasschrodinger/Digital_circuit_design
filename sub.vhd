library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_textio.all;
use ieee.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity sub is
port (a: in std_logic_vector(15 downto 0);
		a_comp: out std_logic_vector(15 downto 0));
end sub;

architecture subtract of sub is

signal a_sig: std_logic_vector(15 downto 0);
signal a_std: std_logic_vector(15 downto 0);
signal one: std_logic_vector(15 downto 0);

component newNOTG is
		port(G:in std_logic_vector(0 to 15); H:out std_logic_vector(0 to 15));
	end component;
begin

one<="0000000000000001";

NOTChip: newNOTG
port map(a,a_sig);

a_std<=a_sig;
a_comp<=(a_std+one); 

end subtract;