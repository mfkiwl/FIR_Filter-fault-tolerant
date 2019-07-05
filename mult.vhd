library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity mult is
  generic (
    N : integer := 24);
  port (i_num1 : in  std_logic_vector (N-1 downto 0);
        i_num2 : in  std_logic_vector (N-1 downto 0);
        o_mul  : out std_logic_vector (N-1 downto 0));
end mult;

--------------------------------------------------------
architecture Behavioral of mult is
begin


  o_mul <= std_logic_vector(resize(signed(i_num1) * signed(i_num2), 2*N+1)((2*(N-1)) downto N-1));



end Behavioral;
