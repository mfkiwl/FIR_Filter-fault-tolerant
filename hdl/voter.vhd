library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

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

begin
vote : process (i_u1, i_u2, i_u3, i_u4, i_u5) is
  begin  -- process vote
    if ((i_u1 and i_u2 and i_u3) or (i_u1 and i_u2 and i_u4) or
        (i_u1 and i_u2 and i_u5) or (i_u1 and i_u3 and i_u4) or
        (i_u1 and i_u4 and i_u5)) > "000000000000000000000000" then
      o_majority <= i_u1;
    elsif ((i_u2 and i_u3 and i_u4) or (i_u2 and i_u3 and i_u5) or
           (i_u2 and i_u4 and i_u5)) > "000000000000000000000000" then
      o_majority <= i_u2;
    elsif ((i_u3 and i_u4 and i_u5)) > "000000000000000000000000" then
      o_majority <= i_u3;
    else
      o_majority <= i_u1;
    end if;
  end process vote;

end Behavioral;
