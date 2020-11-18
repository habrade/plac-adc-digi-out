library ieee;
use IEEE.STD_LOGIC_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library uvvm_util;
context uvvm_util.uvvm_util_context;

entity tb_test is
end entity;

architecture behv of tb_test is

  signal clk, clk_p1, clk_p2 : std_logic                     := '0';
  signal rst                 : std_logic                     := '0';
  signal t1                  : std_logic_vector(13 downto 0) := (others => '0');
  signal t2                  : std_logic_vector(5 downto 0)  := (others => '0');
  signal t3                  : std_logic_vector(5 downto 0)  := (others => '0');
  signal t4                  : std_logic_vector(5 downto 0)  := (others => '0');
  signal t5                  : std_logic_vector(14 downto 0) := (others => '0');
  signal calc_out            : std_logic_vector(12 downto 0) := (others => '0');

  constant SYS_PERIOD : time := 25 ns;  -- 40MHz

  constant delta_1 : time := 0.3 ns;
  constant delta_2 : time := 1.2 ns;

begin

  clk    <= not clk    after SYS_PERIOD/2;
  clk_p1 <= clk        after delta_1;
  clk_p2 <= not clk_p1 after delta_2;

  DUT : entity work.test
    port map(
      clk      => clk,
      clk_p1   => clk_p1,
      clk_p2   => clk_p2,
      rst      => rst,
      t1       => t1,
      t2       => t2,
      t3       => t3,
      t4       => t4,
      t5       => t5,
      calc_out => calc_out
      );

  main : process
  begin
    wait for 2*SYS_PERIOD;
    gen_pulse(rst, 2 * SYS_PERIOD, "Reset pulse");

    wait for 5*SYS_PERIOD;

    -- calc_out = X"1A8C"
    t1 <= 14X"0FFF";   -- "1100"
    wait for SYS_PERIOD;
    t2 <= 6X"1F";      --  "101"
    wait for SYS_PERIOD;
    t3 <= 6X"0F";      --  "100"
    wait for SYS_PERIOD;
    t4 <= 6X"01";      --  "001"
    wait for SYS_PERIOD;
    t5 <= 15X"0FFF";   --  "1100"
    wait for 1*SYS_PERIOD;
    
    -- calc_out = X"14a8"
    t1 <= 14X"003ff";  -- "1100"
    wait for SYS_PERIOD;
    t2 <= 6X"01";      --  "001" 
    wait for SYS_PERIOD;
    t3 <= 6X"00";      --  "000"
    wait for SYS_PERIOD;
    t4 <= 6X"0F";      --  "100"
    wait for SYS_PERIOD;
    t5 <= 15X"00FF";   -- "1000"
    wait for 1*SYS_PERIOD;
    
    -- calc_out = X"0a35"
    t1 <= 14X"000F";   -- "0100"
    wait for SYS_PERIOD;
    t2 <= 6X"0F";      --  "100"
    wait for SYS_PERIOD;
    t3 <= 6X"01";      --  "001"
    wait for SYS_PERIOD;
    t4 <= 6X"03";      --  "010"
    wait for SYS_PERIOD;
    t5 <= 15X"001F";   -- "0101"

    wait for 1000 ns;
    std.env.stop;
  end process;

end behv;



