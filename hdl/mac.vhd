library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity mac is
  generic (
    N : integer := 24);
  port (i_clk : in  std_logic;
        i_u   : in  std_logic_vector (N-1 downto 0);
        i_mac : in  std_logic_vector (N-1 downto 0);
        i_bn  : in  std_logic_vector (N-1 downto 0);
        o_mac : out std_logic_vector (N-1 downto 0));
end mac;

--------------------------------------------------------
architecture Behavioral of mac is
  signal r_reg : std_logic_vector(N-1 downto 0) := (others => '0');
  signal w_add : std_logic_vector(N-1 downto 0) := (others => '0');
begin

  p_reg_proc : process (i_clk) is
  begin  -- process p_reg_proc
    if i_clk'event and i_clk = '0' then  -- falling clock edge
      r_reg <= i_mac;
    end if;
  end process p_reg_proc;

  mult_1 : entity work.mult
    generic map (
      N => N)
    port map (
      i_num1 => i_u,
      i_num2 => i_bn,
      o_mul  => w_add);

  adder_1 : entity work.adder
    generic map (
      N => N)
    port map (
      i_num1 => w_add,
      i_num2 => r_reg,
      o_sum  => o_mac);


end Behavioral;
