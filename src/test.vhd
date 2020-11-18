library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity test is
  port(
    clk    : in std_logic;
    clk_p1 : in std_logic;
    clk_p2 : in std_logic;
    rst    : in std_logic;

    t1 : in std_logic_vector(13 downto 0);
    t2 : in std_logic_vector(5 downto 0);
    t3 : in std_logic_vector(5 downto 0);
    t4 : in std_logic_vector(5 downto 0);
    t5 : in std_logic_vector(14 downto 0);

    calc_out : out std_logic_vector(12 downto 0)

    );
end entity;

architecture behv of test is

  type cout_type1_v is array(natural range <>) of std_logic_vector(3 downto 0);
  type cout_type2_v is array(natural range <>) of std_logic_vector(2 downto 0);

  signal t1_v : cout_type1_v(5 downto 0) := (others => (others => '0'));
  signal t2_v : cout_type2_v(4 downto 0) := (others => (others => '0'));
  signal t3_v : cout_type2_v(3 downto 0) := (others => (others => '0'));
  signal t4_v : cout_type2_v(2 downto 0) := (others => (others => '0'));
  signal t5_v : cout_type1_v(1 downto 0) := (others => (others => '0'));

  component comp14 is
    port(
      din  : in  std_logic_vector(13 downto 0);
      dout : out std_logic_vector(3 downto 0)
      );
  end component;

  component comp6 is
    port(
      din  : in  std_logic_vector(5 downto 0);
      dout : out std_logic_vector(2 downto 0)
      );
  end component;

  component comp15 is
    port(
      din  : in  std_logic_vector(14 downto 0);
      dout : out std_logic_vector(3 downto 0)
      );
  end component;

begin

  gen_t1_in : comp14
    port map(
      din  => t1,
      dout => t1_v(0)
      );

  gen_t2_in : comp6
    port map(
      din  => t2,
      dout => t2_v(0)
      );

  gen_t3_in : comp6
    port map(
      din  => t3,
      dout => t3_v(0)
      );

  gen_t4_in : comp6
    port map(
      din  => t4,
      dout => t4_v(0)
      );

  gen_t5_in : comp15
    port map(
      din  => t5,
      dout => t5_v(0)
      );

  -- 1, 3, 5 clk_p1, 2,4 clk_p2
  t1_pipline_reg : process (all)
  begin
    if ?? rst then
      t1_v(5 downto 1) <= (others => (others => '0'));
    elsif rising_edge(clk_p1) then
      t1_v(1) <= t1_v(0);
      t1_v(2) <= t1_v(1);
      t1_v(3) <= t1_v(2);
      t1_v(4) <= t1_v(3);
      t1_v(5) <= t1_v(4);
    end if;
  end process;

  t2_pipline_reg : process (all)
  begin
    if ?? rst then
      t2_v(4 downto 1) <= (others => (others => '0'));
    elsif rising_edge(clk_p2) then
      t2_v(1) <= t2_v(0);
      t2_v(2) <= t2_v(1);
      t2_v(3) <= t2_v(2);
      t2_v(4) <= t2_v(3);
    end if;
  end process;

  t3_pipline_reg : process (all)
  begin
    if ?? rst then
      t3_v(3 downto 1) <= (others => (others => '0'));
    elsif rising_edge(clk_p1) then
      t3_v(1) <= t3_v(0);
      t3_v(2) <= t3_v(1);
      t3_v(3) <= t3_v(2);
    end if;
  end process;

  t4_pipline_reg : process (all)
  begin
    if ?? rst then
      t4_v(2 downto 1) <= (others => (others => '0'));
    elsif rising_edge(clk_p2) then
      t4_v(1) <= t4_v(0);
      t4_v(2) <= t4_v(1);
    end if;
  end process;

  t5_pipline_reg : process (all)
  begin
    if ?? rst then
      t5_v(1) <= (others => '0');
    elsif rising_edge(clk_p1) then
      t5_v(1) <= t5_v(0);
    end if;
  end process;

  final_out : process (all)
  begin
    if ?? rst then
      calc_out <= (others => '0');
    elsif rising_edge(clk) then
      calc_out <= t1_v(5)(3 downto 1) &
                  (t1_v(5)(0) or t2_v(4)(2)) &
                  t2_v(4)(1) &
                  (t2_v(4)(0) or t3_v(3)(2))&
                  t3_v(3)(1) &
                  (t3_v(3)(0) or t4_v(2)(2)) &
                  t4_v(2)(1) &
                  (t4_v(2)(0) or t5_v(1)(3)) &
                  t5_v(1)(2 downto 0);
    end if;
  end process;

end architecture;
