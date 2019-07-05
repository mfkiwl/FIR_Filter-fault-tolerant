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
begin

      o_sum <= std_logic_vector(resize(signed(i_num1) + signed(i_num2), N));

end Behavioral;
