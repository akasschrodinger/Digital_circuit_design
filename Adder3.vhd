LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity Adder3 is
	port(
		A     : in std_logic_vector(15 downto 0);
		B     : in std_logic_vector(15 downto 0);
		c_in  : in std_logic;
		sum   : out std_logic_vector(15 downto 0);
		c_out : out std_logic
	);
end Adder3;

ARCHITECTURE KS_architecture of Adder3 is

	--internal individual g,p signals--
	signal g_in : std_logic_vector(15 downto 0);
	signal p_in : std_logic_vector(15 downto 0);
	
	--Defining separate g, p signals for each stage--
		signal g_1 : std_logic_vector(15 downto 0);
		signal p_1 : std_logic_vector(15 downto 0);-- 01
		signal g_2 : std_logic_vector(15 downto 0);
		signal p_2 : std_logic_vector(15 downto 0);-- 02
		signal g_3 : std_logic_vector(15 downto 0);
		signal p_3 : std_logic_vector(15 downto 0);-- 03
		signal g_4 : std_logic_vector(15 downto 0);
		signal p_4 : std_logic_vector(15 downto 0);-- 04
		signal g_5 : std_logic_vector(15 downto 0);
		signal p_5 : std_logic_vector(15 downto 0);-- 05
		signal g_6 : std_logic_vector(15 downto 0);
		signal p_6 : std_logic_vector(15 downto 0);-- 06
	
	--Defining a signal for carry--
	signal c : std_logic_vector(15 downto 0);
	signal c1 : std_logic_vector(15 downto 0);
	
	signal c_out1 : std_logic;
	
component generate_gp is
	PORT(
		A : in std_logic;
		B : in std_logic;
		g : out std_logic;
		p : out std_logic
	);
end component;

component generate_carry is
	port(
		g1 : in std_logic;
		g2 : in std_logic;
		p1 : in std_logic;
		p2 : in std_logic;
		go : out std_logic;
		po : out std_logic
	);
end component;

component nuANDG is
		port(N,O: in std_logic; P: out std_logic);
	end component nuANDG;

	component nuORG is
		port(Q,R:in std_logic; S: out std_logic);
	end component nuORG;
	

	component nuXORG is
		port(T,U:in std_logic; V: out std_logic);
	end component nuXORG;
	
BEGIN
	
		Stage00: for i in 0 to 15 generate
				map0: generate_gp port map (A => A(i) , B => B(i) , g => g_in(i) , p => p_in(i) );
			end generate;
	--stage 00 done

			
			g_1(0) <= g_in(0);
			p_1(0) <= p_in(0);
	
	Stage01:	for i in 0 to 14 generate
				map1:generate_carry port map (g1 => g_in(i) , p1 => p_in(i) , g2 => g_in(i+1) , p2 => p_in(i+1) , go => g_1(i+1) , po => p_1(i+1) );
			end generate;	
	--stage 01 done
			
	--buffer 1
	
	Buffer1: for i in 0 to 1 generate
				g_2(i) <= g_1(i);
				p_2(i) <= p_1(i);
			end generate;
	
	
	Stage02:		
			for i in 0 to 13 generate
			map2:generate_carry port map (g1 => g_1(i) , p1 => p_1(i) , g2 => g_1(i+2) , p2 => p_1(i+2) , go => g_2(i+2) , po => p_2(i+2) );
			end generate;
	--stage 02 done
			
	--buffer 2
	
	Buffer2: for i in 0 to 3 generate
				g_3(i) <= g_2(i);
				p_3(i) <= p_2(i);
			end generate;
	
		
	Stage03:	for i in 0 to 11 generate
			map3:	generate_carry port map (g1 => g_2(i) , p1 => p_2(i) , g2 => g_2(i+4) , p2 => p_2(i+4) , go => g_3(i+4) , po => p_3(i+4) );
			end generate;
	--stage 03 done
	
	--buffer 3
	
	Buffer3: for i in 0 to 7 generate
				g_4(i) <= g_3(i);
				p_4(i) <= p_3(i);
			end generate;
			
	Stage04:	for i in 0 to 7 generate
			map4:	generate_carry port map (g1 => g_3(i) , p1 => p_3(i) , g2 => g_3(i+8) , p2 => p_3(i+8) , go => g_4(i+8) , po => p_4(i+8) );
			end generate;
			

	--Generating carry
Carry_gen:	for i in 0 to 14 generate
				Chip1AND: nuANDG
				port map(c_in,p_4(i),c1(i+1));
				Chip2OR: nuORG
				port map(g_4(i),c1(i+1),c(i+1));
			end generate;
	c(0)<=c_in;
	Chip3AND: nuANDG
	port map(c_in,p_4(15),c_out1);
	Chip4OR: nuORG
	port map(g_4(15),c_out1,c_out); --final carry bit
	
	Chip5XOR: nuXORG
				port map(c_in,p_in(0),sum(0));
	
	--Generating final results
	Sum1: for i in 1 to 15 generate
				Chip6XOR: nuXORG
				port map(c(i),p_in(i),sum(i));
			end generate;
end KS_architecture;	
