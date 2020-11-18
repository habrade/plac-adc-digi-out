library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity comp6 is
  port(
    din  : in  std_logic_vector(5 downto 0);
    dout : out std_logic_vector(2 downto 0)
    );
end entity;

architecture behv of comp6 is
  signal dout_r : std_logic_vector(2 downto 0);
	attribute rom_style : string;
  attribute rom_style of dout_r : signal is "block";
begin

  gen_comp_out : process(all)
  begin

    case din is
      when 6X"00" =>
        dout_r <= "000";
      when 6X"01" =>
        dout_r <= "001";
      when 6X"03" =>
        dout_r <= "010";
      when 6X"07" =>
        dout_r <= "011";
      when 6X"0f" =>
        dout_r <= "100";
      when 6X"1f" =>
        dout_r <= "101";
      when others => null;
    end case;
    
    dout <= dout_r;
  end process;

end architecture;
