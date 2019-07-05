library IEEE;
use IEEE.STD_LOGIC_1164.all;

use IEEE.NUMERIC_STD.all;


entity adder is
  generic (
    N : integer := 24);
  port (i_num1 : in  std_logic_vector (N-1 downto 0);
        i_num2 : in  std_logic_vector (N-1 downto 0);
        o_sum  : out std_logic_vector (N-1 downto 0));
end adder;

---------------------------------------------------------
architecture Behavioral of adder is
  signal w_out_tmp : std_logic_vector(N downto 0);
begin

  w_out_tmp <= std_logic_vector(resize(signed(i_num1), N+1) + resize(signed(i_num2), N+1));
  saturation_process : process (w_out_tmp, i_num1, i_num2) is
  begin  -- process saturation_process
    -- Check if overflow is happening. Saturate to max/min value
    if to_integer(signed(w_out_tmp)) > integer(2**(N-1)) then
      o_sum <= (N-1 => '0', others => '1');
    elsif to_integer(signed(w_out_tmp)) < integer(-2**(N-1)) then
      o_sum <= (N-1 => '1', others => '0');
    else
      o_sum <= w_out_tmp(N-1 downto 0);
    end if;

  end process saturation_process;

end Behavioral;
