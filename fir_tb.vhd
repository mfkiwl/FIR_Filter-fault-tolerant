library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use std.textio.all;
use work.txt_util.all;
----------------------------------------------------------------------

entity fir_tb is

end entity fir_tb;

-------------------------------------------------------------------------------

architecture fir_simulation of fir_tb is

  -- component generics
  constant N : integer := 24;
  constant ORDER : integer := 5;

  -- component ports
  signal u_i : std_logic_vector (N-1 downto 0);
  signal y_o : std_logic_vector (N-1 downto 0);


  -- clock
  signal Clk : std_logic := '1';

  signal sim_output : std_logic_vector (N-1 downto 0);

  file input_test_vector1 : text open read_mode is "/home/milos/octave/input.txt";
  -- file output_test_vector : text open read_mode is "/home/milos/octave/output.txt";

begin  -- architecture fir_simulation


  Clk <= not Clk after 10 ns;

  fir_1 : entity work.fir
    generic map (
      N     => N,
      ORDER => ORDER)
    port map (
      clk_i => Clk,
      u_i   => u_i,
      y_o   => y_o);


  -- waveform generation
  WaveGen_Proc : process
    variable tv : line;
  begin
    -- insert signal assignments here

    u_i        <= (others => '0');
    -- readline(output_test_vector, tv);
    -- sim_output <= to_std_logic_vector(string(tv));
    wait until falling_edge(Clk);

    while not endfile(input_test_vector1) loop
      readline(input_test_vector1, tv);
      u_i <= to_std_logic_vector(string(tv));

      wait for 5 ns;

      -- assert abs(to_integer(signed(sim_output)) - to_integer(signed(o_mul))) < 2
      --   report "Not calculated correctly"
      --   severity error;

      wait until falling_edge(Clk);
    end loop;

  end process WaveGen_Proc;


end architecture fir_simulation;

