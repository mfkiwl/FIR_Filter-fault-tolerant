library ieee;
use ieee.std_logic_1164.all;

package random_faults is


	constant fault0_select	: string	:= "0001";
	constant fault0_value	: string	:= "101010000011000111101111";
	constant fault0_val_sig	: string	:= "/fir_tb/fir_1/GEN_MAC(3)/MAC/fault_value(0)";
	constant fault0_val_sig_n_modular	: string	:= "/fir_tb/n_modular_fir_1/GEN_FIRS(3)/fir/GEN_MAC(3)/MAC/fault_value(0)";
	constant fault0_sel_sig	: string	:= "/fir_tb/fir_1/GEN_MAC(3)/MAC/fault_select(0)";
	constant fault0_sel_sig_n_modular	: string	:= "/fir_tb/n_modular_fir_1/GEN_FIRS(3)/fir/GEN_MAC(3)/MAC/fault_select(0)";
	constant fault0_start_time	: time	:= 522 ns;
	constant fault0_stop_time	: time	:= 1091 ns;

	constant fault1_select	: string	:= "1000";
	constant fault1_value	: string	:= "111010010011111010101110";
	constant fault1_val_sig	: string	:= "/fir_tb/fir_1/GEN_MAC(2)/MAC/fault_value(1)";
	constant fault1_val_sig_n_modular	: string	:= "/fir_tb/n_modular_fir_1/GEN_FIRS(4)/fir/GEN_MAC(2)/MAC/fault_value(1)";
	constant fault1_sel_sig	: string	:= "/fir_tb/fir_1/GEN_MAC(2)/MAC/fault_select(1)";
	constant fault1_sel_sig_n_modular	: string	:= "/fir_tb/n_modular_fir_1/GEN_FIRS(4)/fir/GEN_MAC(2)/MAC/fault_select(1)";
	constant fault1_start_time	: time	:= 2194 ns;
	constant fault1_stop_time	: time	:= 2399 ns;

	constant fault2_select	: string	:= "0010";
	constant fault2_value	: string	:= "101111101000100000111001";
	constant fault2_val_sig	: string	:= "/fir_tb/fir_1/GEN_MAC(0)/MAC/fault_value(0)";
	constant fault2_val_sig_n_modular	: string	:= "/fir_tb/n_modular_fir_1/GEN_FIRS(5)/fir/GEN_MAC(0)/MAC/fault_value(0)";
	constant fault2_sel_sig	: string	:= "/fir_tb/fir_1/GEN_MAC(0)/MAC/fault_select(0)";
	constant fault2_sel_sig_n_modular	: string	:= "/fir_tb/n_modular_fir_1/GEN_FIRS(5)/fir/GEN_MAC(0)/MAC/fault_select(0)";
	constant fault2_start_time	: time	:= 2042 ns;
	constant fault2_stop_time	: time	:= 2411 ns;

	constant fault3_select	: string	:= "1000";
	constant fault3_value	: string	:= "001101111111110111111000";
	constant fault3_val_sig	: string	:= "/fir_tb/fir_1/GEN_MAC(6)/MAC/fault_value(1)";
	constant fault3_val_sig_n_modular	: string	:= "/fir_tb/n_modular_fir_1/GEN_FIRS(2)/fir/GEN_MAC(6)/MAC/fault_value(1)";
	constant fault3_sel_sig	: string	:= "/fir_tb/fir_1/GEN_MAC(6)/MAC/fault_select(1)";
	constant fault3_sel_sig_n_modular	: string	:= "/fir_tb/n_modular_fir_1/GEN_FIRS(2)/fir/GEN_MAC(6)/MAC/fault_select(1)";
	constant fault3_start_time	: time	:= 1232 ns;
	constant fault3_stop_time	: time	:= 2491 ns;

	constant fault4_select	: string	:= "0100";
	constant fault4_value	: string	:= "000001001010000110111010";
	constant fault4_val_sig	: string	:= "/fir_tb/fir_1/GEN_MAC(1)/MAC/fault_value(1)";
	constant fault4_val_sig_n_modular	: string	:= "/fir_tb/n_modular_fir_1/GEN_FIRS(2)/fir/GEN_MAC(1)/MAC/fault_value(1)";
	constant fault4_sel_sig	: string	:= "/fir_tb/fir_1/GEN_MAC(1)/MAC/fault_select(1)";
	constant fault4_sel_sig_n_modular	: string	:= "/fir_tb/n_modular_fir_1/GEN_FIRS(2)/fir/GEN_MAC(1)/MAC/fault_select(1)";
	constant fault4_start_time	: time	:= 916 ns;
	constant fault4_stop_time	: time	:= 1977 ns;

	constant fault5_select	: string	:= "0001";
	constant fault5_value	: string	:= "011101011001111111001101";
	constant fault5_val_sig	: string	:= "/fir_tb/fir_1/GEN_MAC(8)/MAC/fault_value(0)";
	constant fault5_val_sig_n_modular	: string	:= "/fir_tb/n_modular_fir_1/GEN_FIRS(5)/fir/GEN_MAC(8)/MAC/fault_value(0)";
	constant fault5_sel_sig	: string	:= "/fir_tb/fir_1/GEN_MAC(8)/MAC/fault_select(0)";
	constant fault5_sel_sig_n_modular	: string	:= "/fir_tb/n_modular_fir_1/GEN_FIRS(5)/fir/GEN_MAC(8)/MAC/fault_select(0)";
	constant fault5_start_time	: time	:= 1243 ns;
	constant fault5_stop_time	: time	:= 1851 ns;

	constant fault6_select	: string	:= "0100";
	constant fault6_value	: string	:= "010111010011111011101111";
	constant fault6_val_sig	: string	:= "/fir_tb/fir_1/GEN_MAC(3)/MAC/fault_value(1)";
	constant fault6_val_sig_n_modular	: string	:= "/fir_tb/n_modular_fir_1/GEN_FIRS(1)/fir/GEN_MAC(3)/MAC/fault_value(1)";
	constant fault6_sel_sig	: string	:= "/fir_tb/fir_1/GEN_MAC(3)/MAC/fault_select(1)";
	constant fault6_sel_sig_n_modular	: string	:= "/fir_tb/n_modular_fir_1/GEN_FIRS(1)/fir/GEN_MAC(3)/MAC/fault_select(1)";
	constant fault6_start_time	: time	:= 2207 ns;
	constant fault6_stop_time	: time	:= 2575 ns;

	constant fault7_select	: string	:= "0100";
	constant fault7_value	: string	:= "101010010100101110110110";
	constant fault7_val_sig	: string	:= "/fir_tb/fir_1/GEN_MAC(4)/MAC/fault_value(2)";
	constant fault7_val_sig_n_modular	: string	:= "/fir_tb/n_modular_fir_1/GEN_FIRS(4)/fir/GEN_MAC(4)/MAC/fault_value(2)";
	constant fault7_sel_sig	: string	:= "/fir_tb/fir_1/GEN_MAC(4)/MAC/fault_select(2)";
	constant fault7_sel_sig_n_modular	: string	:= "/fir_tb/n_modular_fir_1/GEN_FIRS(4)/fir/GEN_MAC(4)/MAC/fault_select(2)";
	constant fault7_start_time	: time	:= 1753 ns;
	constant fault7_stop_time	: time	:= 2660 ns;

	constant fault8_select	: string	:= "1000";
	constant fault8_value	: string	:= "110011110010011101010100";
	constant fault8_val_sig	: string	:= "/fir_tb/fir_1/GEN_MAC(1)/MAC/fault_value(0)";
	constant fault8_val_sig_n_modular	: string	:= "/fir_tb/n_modular_fir_1/GEN_FIRS(3)/fir/GEN_MAC(1)/MAC/fault_value(0)";
	constant fault8_sel_sig	: string	:= "/fir_tb/fir_1/GEN_MAC(1)/MAC/fault_select(0)";
	constant fault8_sel_sig_n_modular	: string	:= "/fir_tb/n_modular_fir_1/GEN_FIRS(3)/fir/GEN_MAC(1)/MAC/fault_select(0)";
	constant fault8_start_time	: time	:= 1725 ns;
	constant fault8_stop_time	: time	:= 2576 ns;

	constant fault9_select	: string	:= "0001";
	constant fault9_value	: string	:= "110101111110000000000101";
	constant fault9_val_sig	: string	:= "/fir_tb/fir_1/GEN_MAC(4)/MAC/fault_value(0)";
	constant fault9_val_sig_n_modular	: string	:= "/fir_tb/n_modular_fir_1/GEN_FIRS(4)/fir/GEN_MAC(4)/MAC/fault_value(0)";
	constant fault9_sel_sig	: string	:= "/fir_tb/fir_1/GEN_MAC(4)/MAC/fault_select(0)";
	constant fault9_sel_sig_n_modular	: string	:= "/fir_tb/n_modular_fir_1/GEN_FIRS(4)/fir/GEN_MAC(4)/MAC/fault_select(0)";
	constant fault9_start_time	: time	:= 2639 ns;
	constant fault9_stop_time	: time	:= 2752 ns;

end random_faults;
