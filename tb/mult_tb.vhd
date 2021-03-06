library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use std.textio.all;
use work.txt_util.all;

-------------------------------------------------------------------------------

entity mult_tb is

end entity mult_tb;

-------------------------------------------------------------------------------

architecture testing_mult of mult_tb is

  -- component generics
  constant N : integer := 24;

  -- component ports
  signal dut_i_num1 : std_logic_vector (N-1 downto 0);
  signal dut_i_num2 : std_logic_vector (N-1 downto 0);
  signal dut_o_mul  : std_logic_vector (N-1 downto 0);
  signal sim_output : std_logic_vector (N-1 downto 0);

  -- clock
  signal Clk : std_logic := '1';

  constant per_c          : time := 20ns;
  file input_test_vector1 : text open read_mode is "/home/milos/FIR-fault-tolerant/utils/octave/input2.txt";
  file input_test_vector2 : text open read_mode is "/home/milos/FIR-fault-tolerant/utils/octave/input_sine.txt";
  file output_test_vector : text open read_mode is "/home/milos/octave/output_mult.txt";

begin  -- architecture testing_mul

  -- component instantiation
  mult_1 : entity work.mult
    generic map (
      N => N)
    port map (
      i_num1 => dut_i_num1,
      i_num2 => dut_i_num2,
      o_mul  => dut_o_mul);
  -- clock generation
  Clk <= not Clk after per_c/2;

  -- waveform generation
  WaveGen_Proc : process
    variable tv : line;
  begin
    -- insert signal assignments here

    dut_i_num1 <= (others => '0');
    readline(output_test_vector, tv);
    sim_output <= to_std_logic_vector(string(tv));
    wait until falling_edge(Clk);

    while not endfile(input_test_vector1) loop
      readline(input_test_vector1, tv);
      dut_i_num1 <= to_std_logic_vector(string(tv));
      readline(input_test_vector2, tv);
      -- dut_i_num2 <= to_std_logic_vector(string(tv));
      dut_i_num2 <= std_logic_vector(to_signed(5870000, 24));

      readline(output_test_vector, tv);
      sim_output <= to_std_logic_vector(string(tv));

      wait for 5 ns;

      assert abs(to_integer(signed(sim_output)) - to_integer(signed(dut_o_mul))) < 2
        report "Not calculated correctly"
        severity error;

      wait until falling_edge(Clk);
    end loop;

  end process WaveGen_Proc;


end architecture testing_mult;
