library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity voter is
  generic (
    N : integer := 24);
  port (
    i_u1       : in  std_logic_vector(N-1 downto 0);
    i_u2       : in  std_logic_vector(N-1 downto 0);
    i_u3       : in  std_logic_vector(N-1 downto 0);
    i_u4       : in  std_logic_vector(N-1 downto 0);
    i_u5       : in  std_logic_vector(N-1 downto 0);
    o_majority : out std_logic_vector(N-1 downto 0)

    );
end voter;

architecture Behavioral of voter is
  signal s_majority : std_logic_vector(N-1 downto 0);
begin


  o_majority <= ((i_u1 and i_u2 and i_u3) or (i_u1 and i_u2 and i_u4) or (i_u1 and i_u3 and i_u4) or
                 (i_u2 and i_u3 and i_u4) or (i_u1 and i_u2 and i_u5) or (i_u1 and i_u4 and i_u5) or
                 (i_u1 and i_u3 and i_u5) or (i_u2 and i_u3 and i_u5) or (i_u3 and i_u4 and i_u5) or
                 (i_u2 and i_u4 and i_u5));

end Behavioral;
