LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity generate_carry is
	port(
		g1 : in std_logic;
		g2 : in std_logic;
		p1 : in std_logic;
		p2 : in std_logic;
		go : out std_logic;
		po : out std_logic
	);
end generate_carry;
		
ARCHITECTURE KS_architecture of generate_carry is
signal s: std_logic;

component nuORG is
		port(Q,R:in std_logic; S: out std_logic);
	end component;
component nuANDG is
		port(N,O: in std_logic; P: out std_logic);
	end component;

BEGIN
	Chip1nuAND: nuANDG
	port map(g1,p2,s);
	
	Chip2nuOR: nuORG
	port map(s,g2,go);
	
	Chip3nuAND: nuANDG
	port map(p2,p1,po);
	
end KS_architecture;	
