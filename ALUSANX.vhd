library ieee;
use ieee.std_logic_1164.all;

entity ALUSANX is 
port ( a : in  std_logic_vector(0 to 15); b : in  std_logic_vector(0 to 15); s0,s1: in  std_logic; R : out  std_logic_vector(0 to 15);
c,z: out std_logic);
end entity;

library ieee;
use ieee.std_logic_1164.all;
entity NANDop is
port (I1,I2 : in std_logic_vector(0 to 15);
 OutputI: out std_logic_vector(0 to 15));
 end entity;

library ieee;
use ieee.std_logic_1164.all;
entity XORop is
port (J1,J2 : in std_logic_vector(0 to 15);
 OutputJ: out std_logic_vector(0 to 15));
 end entity;
 
 library ieee;
use ieee.std_logic_1164.all;
	entity newANDG is
		port(A,B: in std_logic_vector(0 to 15); C: out std_logic_vector(0 to 15));
	end entity newANDG;
library ieee;
use ieee.std_logic_1164.all;
	entity newORG is
		port(D,E:in std_logic_vector(0 to 15); F: out std_logic_vector(0 to 15));
	end entity newORG;
library ieee;
use ieee.std_logic_1164.all;
	entity newNOTG is
		port(G:in std_logic_vector(0 to 15); H:out std_logic_vector(0 to 15));
	end entity newNOTG;
library ieee;
use ieee.std_logic_1164.all;
	entity newXORG is
		port(I,J:in std_logic_vector(0 to 15); K: out std_logic_vector(0 to 15));
	end entity newXORG;
library ieee;
use ieee.std_logic_1164.all;
	entity nuNOTG is
		port(L:in std_logic; M:out std_logic);
	end entity nuNOTG;
	
LIBRARY ieee;
USE ieee.std_logic_1164.all;
entity nuANDG is
		port(N,O: in std_logic; P: out std_logic);
	end entity nuANDG;
architecture Al of nuANDG is
		begin
			P<=O and N;
		end Al;
LIBRARY ieee;
USE ieee.std_logic_1164.all;
entity nuORG is
		port(Q,R:in std_logic; S: out std_logic);
	end entity nuORG;
	
architecture Ol of nuORG is
		begin
		S<=Q or R;
		end Ol;
LIBRARY ieee;
USE ieee.std_logic_1164.all;
entity nuXORG is
		port(T,U: in std_logic; V: out std_logic);
	end entity nuXORG;
architecture Bl of nuXORG is
		begin
			V<=T xor U;
		end Bl;
		architecture A of newANDG is
		begin
			C<=A and B;
		end A;

		architecture O of newORG is
		begin
		F<=D or E;
		end O;

		architecture N of newNOTG is
		begin
		H<= not G;
		end N;
		
		architecture P of newXORG is
		begin
		K<=I xor J;
		end P;

		architecture Q of nuNOTG is
		begin
		M<= not L;
		end Q;
		
architecture NotAnd of NANDop is 
	signal s:std_logic_vector(0 to 15);
	
	component newANDG is
		port(A,B: in std_logic_vector(0 to 15); C: out std_logic_vector(0 to 15));
	end component;
	
	component newNOTG is
		port(G:in std_logic_vector(0 to 15); H:out std_logic_vector(0 to 15));
	end component;
	
	begin
		
		Chip1AND: newANDG
		port map(I1,I2,s);
		
		Chip2NOT: newNOTG
		port map(s,OutputI);
end NotAnd ;

architecture ExOR of XORop is 

	component newXORG is
		port(I,J:in std_logic_vector(0 to 15); K: out std_logic_vector(0 to 15));
	end component;
	
	begin
		
		Chip1XOR: newXORG
		port map(J1,J2,OutputJ);
		
end ExOR;

-------------------------------------------------------------------------------------

architecture struct of ALUSANX is


component Adder3 IS
	PORT(
		A     : IN std_logic_vector(15 downto 0);
		B     : IN std_logic_vector(15 downto 0);
		c_in  : IN std_logic;
		sum   : OUT std_logic_vector(15 downto 0);
		c_out : OUT std_logic
	);
END component;

component sub is
port( a: in std_logic_vector(15 downto 0);
  a_comp: out std_logic_vector(15 downto 0));
end component;


signal KR: std_logic_vector(0 to 15);

signal RR1: std_logic_vector(0 to 15);
signal RR2: std_logic_vector(0 to 15);
signal RR3: std_logic_vector(0 to 15);
signal RR4: std_logic_vector(0 to 15);
signal CC: std_logic;
signal CC1: std_logic;
signal CC2: std_logic;
signal a_comp: std_logic_vector(0 to 15);
signal temp: std_logic_vector(0 to 14);
signal z1:std_logic;

component NANDop is
port (I1,I2 : in std_logic_vector(0 to 15);
 OutputI: out std_logic_vector(0 to 15));
 end component;

component XORop is
port (J1,J2 : in std_logic_vector(0 to 15);
 OutputJ: out std_logic_vector(0 to 15));
 end component;
 
component nuORG is
		port(Q,R:in std_logic; S: out std_logic);
	end component;
component nuNOTG is
		port(L:in std_logic; M: out std_logic);
	end component;

	
begin

CC<='0';


	subChip: sub
		port map(a,a_comp);
	
	SubtractorChip: Adder3
		port map(a_comp,b,CC,RR4,CC2);
	
	NANDChip: NANDop
		port map(a,b,RR1);

	XORChip: XORop
		port map(a,b,RR2);
	
	AdderChip: Adder3
		port map(a,b,CC,RR3,CC1);
	 
	KR<=RR1 when s0='0' and s1='1' else 
		RR2 when s0='1' and s1='1' else 
		RR3 when s0='0' and s1='0' else RR4;
	c<= CC1 when s0='0' and s1='0' else CC;
	R<=KR;
	
	 ZChip1: nuORG
		port map(KR(0),KR(1),temp(0));
	LOOP1: for i in 0 to 13 generate
		ZChip2: nuORG
		port map(temp(i),KR(i+2),temp(i+1));
		end generate;
	 ZChip3: nuNOTG
	 port map(temp(14),z1);
	 z<=z1;
	
end struct;