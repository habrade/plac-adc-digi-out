library ieee;
use ieee.std_logic_1164.all;


entity comp15 is
  port(
    din  : in  std_logic_vector(14 downto 0);
    dout : out std_logic_vector(3 downto 0)
    );
end entity;

architecture behv of comp15 is
  signal dout_r : std_logic_vector(3 downto 0);
	attribute rom_style : string;
  attribute rom_style of dout_r : signal is "block";
begin

  gen_comp_out : process(all)
  begin
    case din is
      when 15X"0000" =>
        dout_r <= "0000";
      when 15X"0001" =>
        dout_r <= "0001";
      when 15X"0003" =>
        dout_r <= "0010";
      when 15X"0007" =>
        dout_r <= "0011";
      when 15X"000f" =>
        dout_r <= "0100";
      when 15X"001f" =>
        dout_r <= "0101";
      when 15X"003f" =>
        dout_r <= "0110";
      when 15X"007f" =>
        dout_r <= "0111";
      when 15X"00ff" =>
        dout_r <= "1000";
      when 15X"01ff" =>
        dout_r <= "1001";
      when 15X"03ff" =>
        dout_r <= "1010";
      when 15X"07ff" =>
        dout_r <= "1011";
      when 15X"0fff" =>
        dout_r <= "1100";
      when 15X"1fff" =>
        dout_r <= "1101";
      when 15X"3fff" =>
        dout_r <= "1110";
      when 15X"7fff" =>
        dout_r <= "1111";
      when others => null;
    end case;
  end process;

  dout <= dout_r;

end architecture;
