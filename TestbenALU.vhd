library ieee;
use ieee.std_logic_1164.all;
entity TestbenALU is
end entity TestbenALU;

architecture test of TestbenALU is
signal A,B : std_logic_vector(15 downto 0);
signal S0,S1: std_logic;
signal Z: std_logic;
signal C: std_logic;
signal R: std_logic_vector(15 downto 0);

component ALUSANX is
	port ( a : in  std_logic_vector(0 to 15); b : in  std_logic_vector(0 to 15); s0,s1: in  std_logic;
	R: out  std_logic_vector(0 to 15); c,z : out std_logic);

end component ;

begin 
	dut_instance: ALUSANX
		port map(a=>A,b=>B,s0=>S0,s1=>S1,R=>R,c=>C,z=>Z);
		
		process
		
		begin
		
	 A <= "0100010010110000";
    B <= "0001010111011110";
	 S1<='0';
    S0<='0';
	 wait for 30 ns;

    A <= "1111111111111111";
    B <= "0000000000000001";
	 S1<='0';
    S0<='0';

    wait for 30 ns;
	 
	 A <= "0100010010110000";
    B <= "0001010111011110";
	 S1<='0';
	 S0<='0';
    wait for 30 ns;

    A <= "0011000011110111";
    B <= "0100000101000001";
	 S1<='0';
	 S0<='0';
    wait for 30 ns;

    A <= "0011100011100001";
    B <= "0010011000000111";
	 S1<='0';
	 S0<='1';

    wait for 30 ns;

    A <= "1011110010110011";
    B <= "1000111101011110";
	 S1<='0';
	 S0<='1';

    wait for 30 ns;

    A <= "0010000100100001";
    B <= "1111101000100111";
	 S1<='0';
	 S0<='1';

    wait for 30 ns;

    A <= "0001011100100011";
    B <= "0001011100100011";
	 S1<='0';
	 S0<='1';

    wait for 30 ns;

    A <= "1011000110111001";
    B <= "1001011001011111";
	 S1<='1';
	 S0<='0';

    wait for 30 ns;

    A <= "0000001011001010";
    B <= "1000011011101011";
	 S1<='1';
	 S0<='0';

    wait for 30 ns;

    A <= "0011110110100000";
    B <= "1100111000000010";
	 S1<='1';
	 S0<='0';

    wait for 30 ns;

    A <= "0100000111111000";
    B <= "0001001111100101";
	 S1<='1';
	 S0<='0';

    wait for 30 ns;

    A <= "1011111001111100";
    B <= "0100001101010111";
	 S1<='1';
	 S0<='1';

    wait for 30 ns;

    A <= "1111000110000001";
    B <= "1010000100001110";
	 S1<='1';
	 S0<='1';

    wait for 30 ns;

    A <= "0111000111001011";
    B <= "1011000111010100";
	 S1<='1';
	 S0<='1';

    wait for 30 ns;

    A <= "1011011101101010";
    B <= "1100111100101110";
	 S1<='1';
	 S0<='1';

    wait for 30 ns;

    A <= "1111001001010111";
    B <= "0110010000100001";
	 S1<='0';
	 S0<='0';

    wait for 30 ns;

    A <= "0111111101101100";
    B <= "0111000100001111";
	 S1<='0';
	 S0<='1';

    wait for 30 ns;

    A <= "0000111101111000";
    B <= "1100011111101100";
	 S1<='1';
	 S0<='0';

    wait for 30 ns;

    A <= "0011100001100111";
    B <= "1010101100100000";
	 S1<='1';
	 S0<='1';
--
--    wait for 30 ns;
--
--    A <= "1111111101000111";
--    B <= "0110111101011100";
--	 S1<=' ';
--	 S0<='';
--
--    wait for 30 ns;
--
--    A <= "0011111101000001";
--    B <= "1100100001100100";
--	 S1<=' ';
--	 S0<='';
--
--    wait for 30 ns;
--
--    A <= "1011011111000111";
--    B <= "1000111101011011";
--
--    wait for 30 ns;
--
--    A <= "1001011010010100";
--    B <= "0110001100101111";
--
--    wait for 30 ns;
--
--    A <= "1111111000100101";
--    B <= "1111111110001010";
--
--    wait for 30 ns;
--
--    A <= "1011100101000001";
--    B <= "0000100000000011";
--	 S1<=' ';
--	 S0<='';
--
	wait for 30 ns;

  end process;
  end test;