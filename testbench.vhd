library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity test_detector  is 
 generic(d:integer:=4);
end entity;


architecture bh of test_detector  is 

component detector000   
port (
	clk	:in  std_logic;
	input	:in std_logic;
	output	:out std_logic);
end component;
component detector1010   
port (
	clk	:in  std_logic;
	input	:in std_logic;
	output	:out std_logic);
end component;
component detector11011   
port (
	clk	:in  std_logic;
	input	:in std_logic;
	output	:out std_logic);
end component;
component detector_1001  

port (
clk:in std_logic;
rst:in std_logic;
in1:in std_logic;
out1:out std_logic
);


end component;
------------ Signal declaration -------------
signal clk:std_logic:='0';
signal input_vector:std_logic_vector(16 downto 0):="10101010110011011";
signal input,output:std_logic;
signal rst:std_logic; 
begin 


P_CLK: process 
        begin
        clk<=not(clk);
        wait for 100 ps;
    end process P_CLK;

detect_000:if d=1 generate 
gate0: detector000  port map(
	                        clk	    =>clk,--:in  std_logic;
	                        input   =>input ,--	:in std_logic;
	                        output  =>output--	:out std_logic
                            );
end generate;
 detect_1010:if d=2 generate 
gate1: detector1010  port map(
	                        clk	    =>clk,--:in  std_logic;
	                        input   =>input ,--	:in std_logic;
	                        output  =>output--	:out std_logic
                            ); 
end generate;
 detect_11011:if d=3 generate 
gate2: detector11011  port map(
	                        clk	    =>clk,--:in  std_logic;
	                        input   =>input ,--	:in std_logic;
	                        output  =>output--	:out std_logic
                            ); 

 end generate;


detect_1001:if d=4 generate 
gate2: detector_1001  

port map (
clk=> clk,
rst=> rst,
in1=> input,
out1=> output
);

 end generate;

----------------------------------
process (clk)

        begin 
                if falling_edge(clk) then 
                    input_vector<= std_logic_vector(shift_right(unsigned(input_vector),1) );
                    input<=input_vector(0);
                end if;

end process;




end bh;
