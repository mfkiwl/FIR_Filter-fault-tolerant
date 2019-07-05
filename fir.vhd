library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity fir is
  generic (
    N     : integer := 24;
    ORDER : integer := 5);
  port (clk_i : in  std_logic;
        u_i   : in  std_logic_vector (N-1 downto 0);
        y_o   : out std_logic_vector (N-1 downto 0));
end fir;

--------------------------------------------------------
architecture Behavioral of fir is
  type std_2d is array (ORDER-1 downto 0) of std_logic_vector(23 downto 0);
  signal mac_inter : std_2d := (others => (others => '0'));

  type coef_t is array (0 to 4) of std_logic_vector(23 downto 0);
  signal b : coef_t := (x"18bfcb",
                        x"1a05d9",
                        x"1a74b5",
                        x"1a05d9",
                        x"18bfcb");


begin

  prvi_MAC :
    entity work.mac(behavioral)
      port map(i_clk => clk_i,
               i_u   => u_i,
               i_bn  => b(4),
               i_mac => (others => '0'),
               o_mac => mac_inter(0));

  drugi_MAC :
    entity work.mac(behavioral)
      port map(i_clk => clk_i,
               i_u   => u_i,
               i_bn  => b(3),
               i_mac => mac_inter(0),
               o_mac => mac_inter(1));

  treci_MAC :
    entity work.mac(behavioral)
      port map(i_clk => clk_i,
               i_u   => u_i,
               i_bn  => b(2),
               i_mac => mac_inter(1),
               o_mac => mac_inter(2));

  cetvrti_MAC :
    entity work.mac(behavioral)
      port map(i_clk => clk_i,
               i_u   => u_i,
               i_bn  => b(1),
               i_mac => mac_inter(2),
               o_mac => mac_inter(3));

  peti_MAC :
    entity work.mac(behavioral)
      port map(i_clk => clk_i,
               i_u   => u_i,
               i_bn  => b(0),
               i_mac => mac_inter(3),
               o_mac => mac_inter(4));

  y_o <= mac_inter(4);






end Behavioral;
