library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity fir is
  generic (
    N     : integer := 24;
    ORDER : integer := 10);
  port (clk_i : in  std_logic;
        u_i   : in  std_logic_vector (N-1 downto 0);
        y_o   : out std_logic_vector (N-1 downto 0));
end fir;

--------------------------------------------------------
architecture Behavioral of fir is
  type std_2d is array (ORDER-1 downto 0) of std_logic_vector(23 downto 0);
  signal mac_inter : std_2d := (others => (others => '0'));

  type coef_t is array (0 to ORDER-1) of std_logic_vector(23 downto 0);
  signal b : coef_t := (

    b"000010100100100100010111",
    b"000010111110010000011100",
    b"000011010010111011001100",
    b"000011100001011001100011",
    b"000011101000110110011110",
    b"000011101000110110011110",
    b"000011100001011001100011",
    b"000011010010111011001100",
    b"000010111110010000011100",
    b"000010100100100100010111"
    );


begin

  prvi_MAC :
    entity work.mac(behavioral)
      port map(i_clk => clk_i,
               i_u   => u_i,
               i_bn  => b(ORDER-1),
               i_mac => (others => '0'),
               o_mac => mac_inter(0));

  GEN_MAC :
  for I in 0 to ORDER-2 generate

    MAC :
      entity work.mac(behavioral)
        port map(i_clk => clk_i,
                 i_u   => u_i,
                 i_bn  => b(ORDER-1-I),
                 i_mac => mac_inter(I),
                 o_mac => mac_inter(I+1));
  end generate GEN_MAC;


  y_o <= mac_inter(ORDER-1);






end Behavioral;
