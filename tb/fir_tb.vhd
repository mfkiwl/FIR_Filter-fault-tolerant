library ieee, modelsim_lib;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use modelsim_lib.util.all;

----------------------------------------------------------------------

entity fir_tb is

end entity fir_tb;

-------------------------------------------------------------------------------

architecture fir_simulation of fir_tb is

  -- component generics
  constant N     : integer := 24;
  constant ORDER : integer := 10;

  -- component ports
  signal u_i : std_logic_vector (N-1 downto 0);
  signal y_o : std_logic_vector (N-1 downto 0);


  -- clock
  signal Clk : std_logic := '1';

  signal sim_output : std_logic_vector (N-1 downto 0);
  
  file input_test_vector1 : text open read_mode is "C:\Users\milos\Desktop\FIR_Filter-fault-tolerant\utils\octave\input.txt";

  file output_test_vector : text open read_mode is "C:\Users\milos\Desktop\FIR_Filter-fault-tolerant\utils\octave\output_filter.txt";

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
      
      
  force_process : process
	begin
		--signal_force("/adder_tb/dut_i_num1", b"000000000000000000000111", 25 ns, freeze, 90 ns, 1);
		--signal_force("/fir_tb/fir_1/GEN_MAC(0)/MAC/r_reg", b"000000000000000000000000", 40 ns, freeze, open, 1);
		wait;
	end process force_process;


  -- waveform generation
  WaveGen_Proc : process
    variable tv : line;
    variable tmp : std_logic_vector (N-1 downto 0);

  begin
    -- insert signal assignments here

    readline(input_test_vector1, tv);
    read(tv, tmp);
    u_i        <= tmp;
    readline(output_test_vector, tv);
    read(tv, tmp);
    sim_output <= tmp;
    wait until falling_edge(Clk);

    while not endfile(input_test_vector1) loop
      readline(input_test_vector1, tv);
      read(tv, tmp);
      u_i        <= tmp;
      readline(output_test_vector, tv);
      read(tv, tmp);
      sim_output <= tmp;

      wait for 5 ns;

      assert abs(abs(to_integer(signed(sim_output))) - abs(to_integer(signed(y_o)))) < 420000
        report "Not calculated correctly"
        severity error;

      wait until falling_edge(Clk);
    end loop;

  end process WaveGen_Proc;


end architecture fir_simulation;

