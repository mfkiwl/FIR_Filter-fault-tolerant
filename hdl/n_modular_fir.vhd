library ieee;
use ieee.std_logic_1164.all;


entity n_modular_fir is
  generic (
    N       : integer := 24;
    ORDER   : integer := 10;
    FIR_NUM : integer := 5);
  port (clk_i : in  std_logic;
        u_i   : in  std_logic_vector (N-1 downto 0);
        y_o   : out std_logic_vector (N-1 downto 0));

end entity n_modular_fir;

architecture Behavioral of n_modular_fir is

  type std_2d is array (FIR_NUM downto 1) of std_logic_vector(N-1 downto 0);
  signal w_firs     : std_2d := (others => (others => '0'));
  signal o_majority : std_logic_vector(N-1 downto 0);
begin  -- architecture Behavioral

  GEN_FIRS :
  for I in 1 to FIR_NUM generate
    fir : entity work.fir
      generic map (
        N     => N,
        ORDER => ORDER)
      port map (
        clk_i => clk_i,
        u_i   => u_i,
        y_o   => w_firs(I));

  end generate;

  voter_1 : entity work.voter
    generic map (
      N => N)
    port map (
      i_u1       => w_firs(1),
      i_u2       => w_firs(2),
      i_u3       => w_firs(3),
      i_u4       => w_firs(4),
      i_u5       => w_firs(5),
      o_majority => o_majority);

  y_o <= o_majority;

end architecture Behavioral;
