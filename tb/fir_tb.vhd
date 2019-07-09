library ieee, modelsim_lib;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use modelsim_lib.util.all;
use ieee.math_real.all;
use work.random_faults.all;

----------------------------------------------------------------------

entity fir_tb is

end entity fir_tb;

-------------------------------------------------------------------------------

architecture fir_simulation of fir_tb is

  -- component generics
  constant N     : integer := 24;
  constant ORDER : integer := 10;

  -- component ports
  signal u_i           : std_logic_vector (N-1 downto 0);
  signal y_o           : std_logic_vector (N-1 downto 0);
  signal y_o_n_modular : std_logic_vector (N-1 downto 0);


  -- clock
  signal Clk : std_logic := '1';

  signal sim_output : std_logic_vector (N-1 downto 0);

  file input_test_vector1 : text open read_mode is "utils/octave/input.txt";

  file output_test_vector : text open read_mode is "utils/octave/output_filter.txt";

  file fault_test_vector : text open read_mode is "utils/faults.txt";

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


  n_modular_fir_1 : entity work.n_modular_fir
    generic map (
      N       => N,
      ORDER   => ORDER,
      FIR_NUM => 5)
    port map (
      clk_i => Clk,
      u_i   => u_i,
      y_o   => y_o_n_modular);

  force_process : process
    variable tv : line;
  begin
    --signal_force("/adder_tb/dut_i_num1", b"000000000000000000000111", 25 ns, freeze, 90 ns, 1);
    --signal_force("/fir_tb/fir_1/GEN_MAC(0)/MAC/r_reg", b"000000000000000000000000", 40 ns, freeze, open, 1);
    --signal_force("/fir_tb/fir_1/GEN_MAC(0)/MAC/add_fault_select", b"0100", 40 ns, freeze, 200 ns, 1);
    --signal_force("/fir_tb/fir_1/GEN_MAC(0)/MAC/add_fault_value", b"111111111111111111111111", 40 ns, freeze, open, 1);
    --signal_force("/fir_tb/fir_1/GEN_MAC(0)/MAC/add_fault_select", b"0100", 40 ns, freeze, 200 ns, 1);
    --signal_force("/fir_tb/fir_1/GEN_MAC(0)/MAC/add_fault_value", b"111111111111111111111111", 40 ns, freeze, open, 1);

    -- Injecting Fault to MAC(x) module


    signal_force(fault0_sel_sig, fault0_select, fault0_start_time, freeze, fault0_stop_time, 1);
    signal_force(fault0_val_sig, fault0_value, fault0_start_time, freeze, fault0_stop_time, 1);
    signal_force(fault0_sel_sig_n_modular, fault0_select, fault0_start_time, freeze, fault0_stop_time, 1);
    signal_force(fault0_val_sig_n_modular, fault0_value, fault0_start_time, freeze, fault0_stop_time, 1);

    signal_force(fault1_sel_sig, fault1_select, fault1_start_time, freeze, fault1_stop_time, 1);
    signal_force(fault1_val_sig, fault1_value, fault1_start_time, freeze, fault1_stop_time, 1);
    signal_force(fault1_sel_sig_n_modular, fault1_select, fault1_start_time, freeze, fault1_stop_time, 1);
    signal_force(fault1_val_sig_n_modular, fault1_value, fault1_start_time, freeze, fault1_stop_time, 1);

    signal_force(fault2_sel_sig, fault2_select, fault2_start_time, freeze, fault2_stop_time, 1);
    signal_force(fault2_val_sig, fault2_value, fault2_start_time, freeze, fault2_stop_time, 1);
    signal_force(fault2_sel_sig_n_modular, fault2_select, fault2_start_time, freeze, fault2_stop_time, 1);
    signal_force(fault2_val_sig_n_modular, fault2_value, fault2_start_time, freeze, fault2_stop_time, 1);

    signal_force(fault3_sel_sig, fault3_select, fault3_start_time, freeze, fault3_stop_time, 1);
    signal_force(fault3_val_sig, fault3_value, fault3_start_time, freeze, fault3_stop_time, 1);
    signal_force(fault3_sel_sig_n_modular, fault3_select, fault3_start_time, freeze, fault3_stop_time, 1);
    signal_force(fault3_val_sig_n_modular, fault3_value, fault3_start_time, freeze, fault3_stop_time, 1);

    signal_force(fault4_sel_sig, fault4_select, fault4_start_time, freeze, fault4_stop_time, 1);
    signal_force(fault4_val_sig, fault4_value, fault4_start_time, freeze, fault4_stop_time, 1);
    signal_force(fault4_sel_sig_n_modular, fault4_select, fault4_start_time, freeze, fault4_stop_time, 1);
    signal_force(fault4_val_sig_n_modular, fault4_value, fault4_start_time, freeze, fault4_stop_time, 1);

    signal_force(fault5_sel_sig, fault5_select, fault5_start_time, freeze, fault5_stop_time, 1);
    signal_force(fault5_val_sig, fault5_value, fault5_start_time, freeze, fault5_stop_time, 1);
    signal_force(fault5_sel_sig_n_modular, fault5_select, fault5_start_time, freeze, fault5_stop_time, 1);
    signal_force(fault5_val_sig_n_modular, fault5_value, fault5_start_time, freeze, fault5_stop_time, 1);

    signal_force(fault6_sel_sig, fault6_select, fault6_start_time, freeze, fault6_stop_time, 1);
    signal_force(fault6_val_sig, fault6_value, fault6_start_time, freeze, fault6_stop_time, 1);
    signal_force(fault6_sel_sig_n_modular, fault6_select, fault6_start_time, freeze, fault6_stop_time, 1);
    signal_force(fault6_val_sig_n_modular, fault6_value, fault6_start_time, freeze, fault6_stop_time, 1);

    -- signal_force(fault7_sel_sig, fault7_select, fault7_start_time, freeze, fault7_stop_time, 1);
    -- signal_force(fault7_val_sig, fault7_value, fault7_start_time, freeze, fault7_stop_time, 1);
    signal_force(fault7_sel_sig_n_modular, fault7_select, fault7_start_time, freeze, fault7_stop_time, 1);
    signal_force(fault7_val_sig_n_modular, fault7_value, fault7_start_time, freeze, fault7_stop_time, 1);

    -- signal_force(fault8_sel_sig, fault8_select, fault8_start_time, freeze, fault8_stop_time, 1);
    -- signal_force(fault8_val_sig, fault8_value, fault8_start_time, freeze, fault8_stop_time, 1);
    signal_force(fault8_sel_sig_n_modular, fault8_select, fault8_start_time, freeze, fault8_stop_time, 1);
    signal_force(fault8_val_sig_n_modular, fault8_value, fault8_start_time, freeze, fault8_stop_time, 1);

    -- signal_force(fault9_sel_sig, fault9_select, fault9_start_time, freeze, fault9_stop_time, 1);
    -- signal_force(fault9_val_sig, fault9_value, fault9_start_time, freeze, fault9_stop_time, 1);
    signal_force(fault9_sel_sig_n_modular, fault9_select, fault9_start_time, freeze, fault9_stop_time, 1);
    signal_force(fault9_val_sig_n_modular, fault9_value, fault9_start_time, freeze, fault9_stop_time, 1);

    wait;
  end process force_process;


  -- waveform generation
  WaveGen_Proc : process
    variable tv  : line;
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

      assert abs(abs(to_integer(signed(sim_output))) - abs(to_integer(signed(y_o_n_modular)))) < 420000
        report "Not calculated correctly"
        severity error;

      wait until falling_edge(Clk);
    end loop;

  end process WaveGen_Proc;


end architecture fir_simulation;

