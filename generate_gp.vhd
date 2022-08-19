LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity generate_gp is
	PORT(
		A : in std_logic;
		B : in std_logic;
		g : out std_logic;
		p : out std_logic
	);
end generate_gp;
		
ARCHITECTURE KS_architecture of generate_gp is
component nuXORG is
		port(T,U: in std_logic; V: out std_logic);
	end component;

component nuANDG is
		port(N,O: in std_logic; P: out std_logic);
	end component;
	
BEGIN
	Chip1niAND: nuANDG
	port map(A,B,g);
	
	Chip2niXOR: nuXORG
	port map(A,B,p);
	
end KS_architecture;
