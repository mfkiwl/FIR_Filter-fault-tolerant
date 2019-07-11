library ieee;
use ieee.std_logic_1164.all;

package random_faults is


	constant fault0_select	: string	:= "1000";
	constant fault0_value	: string	:= "100100111111110101111101";
	constant fault0_val_sig	: string	:= "/fir_tb/fir_1/GEN_MAC(4)/MAC/fault_value(0)";
	constant fault0_val_sig_n_modular	: string	:= "/fir_tb/n_modular_fir_1/GEN_FIRS(4)/fir/GEN_MAC(4)/MAC/fault_value(0)";
	constant fault0_sel_sig	: string	:= "/fir_tb/fir_1/GEN_MAC(4)/MAC/fault_select(0)";
	constant fault0_sel_sig_n_modular	: string	:= "/fir_tb/n_modular_fir_1/GEN_FIRS(4)/fir/GEN_MAC(4)/MAC/fault_select(0)";
	constant fault0_start_time	: time	:= 1557 ns;
	constant fault0_stop_time	: time	:= 1641 ns;

	constant fault1_select	: string	:= "0100";
	constant fault1_value	: string	:= "000101011010010010000101";
	constant fault1_val_sig	: string	:= "/fir_tb/fir_1/GEN_MAC(3)/MAC/fault_value(1)";
	constant fault1_val_sig_n_modular	: string	:= "/fir_tb/n_modular_fir_1/GEN_FIRS(3)/fir/GEN_MAC(3)/MAC/fault_value(1)";
	constant fault1_sel_sig	: string	:= "/fir_tb/fir_1/GEN_MAC(3)/MAC/fault_select(1)";
	constant fault1_sel_sig_n_modular	: string	:= "/fir_tb/n_modular_fir_1/GEN_FIRS(3)/fir/GEN_MAC(3)/MAC/fault_select(1)";
	constant fault1_start_time	: time	:= 1846 ns;
	constant fault1_stop_time	: time	:= 2088 ns;

	constant fault2_select	: string	:= "0001";
	constant fault2_value	: string	:= "101000000100011001001011";
	constant fault2_val_sig	: string	:= "/fir_tb/fir_1/GEN_MAC(0)/MAC/fault_value(2)";
	constant fault2_val_sig_n_modular	: string	:= "/fir_tb/n_modular_fir_1/GEN_FIRS(5)/fir/GEN_MAC(0)/MAC/fault_value(2)";
	constant fault2_sel_sig	: string	:= "/fir_tb/fir_1/GEN_MAC(0)/MAC/fault_select(2)";
	constant fault2_sel_sig_n_modular	: string	:= "/fir_tb/n_modular_fir_1/GEN_FIRS(5)/fir/GEN_MAC(0)/MAC/fault_select(2)";
	constant fault2_start_time	: time	:= 1507 ns;
	constant fault2_stop_time	: time	:= 2059 ns;

	constant fault3_select	: string	:= "0100";
	constant fault3_value	: string	:= "101110011101100101000000";
	constant fault3_val_sig	: string	:= "/fir_tb/fir_1/GEN_MAC(5)/MAC/fault_value(2)";
	constant fault3_val_sig_n_modular	: string	:= "/fir_tb/n_modular_fir_1/GEN_FIRS(4)/fir/GEN_MAC(5)/MAC/fault_value(2)";
	constant fault3_sel_sig	: string	:= "/fir_tb/fir_1/GEN_MAC(5)/MAC/fault_select(2)";
	constant fault3_sel_sig_n_modular	: string	:= "/fir_tb/n_modular_fir_1/GEN_FIRS(4)/fir/GEN_MAC(5)/MAC/fault_select(2)";
	constant fault3_start_time	: time	:= 1144 ns;
	constant fault3_stop_time	: time	:= 2448 ns;

	constant fault4_select	: string	:= "0010";
	constant fault4_value	: string	:= "101101110110010001010011";
	constant fault4_val_sig	: string	:= "/fir_tb/fir_1/GEN_MAC(0)/MAC/fault_value(2)";
	constant fault4_val_sig_n_modular	: string	:= "/fir_tb/n_modular_fir_1/GEN_FIRS(3)/fir/GEN_MAC(0)/MAC/fault_value(2)";
	constant fault4_sel_sig	: string	:= "/fir_tb/fir_1/GEN_MAC(0)/MAC/fault_select(2)";
	constant fault4_sel_sig_n_modular	: string	:= "/fir_tb/n_modular_fir_1/GEN_FIRS(3)/fir/GEN_MAC(0)/MAC/fault_select(2)";
	constant fault4_start_time	: time	:= 2368 ns;
	constant fault4_stop_time	: time	:= 2514 ns;

	constant fault5_select	: string	:= "0001";
	constant fault5_value	: string	:= "001100010000000101101111";
	constant fault5_val_sig	: string	:= "/fir_tb/fir_1/GEN_MAC(7)/MAC/fault_value(2)";
	constant fault5_val_sig_n_modular	: string	:= "/fir_tb/n_modular_fir_1/GEN_FIRS(4)/fir/GEN_MAC(7)/MAC/fault_value(2)";
	constant fault5_sel_sig	: string	:= "/fir_tb/fir_1/GEN_MAC(7)/MAC/fault_select(2)";
	constant fault5_sel_sig_n_modular	: string	:= "/fir_tb/n_modular_fir_1/GEN_FIRS(4)/fir/GEN_MAC(7)/MAC/fault_select(2)";
	constant fault5_start_time	: time	:= 2634 ns;
	constant fault5_stop_time	: time	:= 2728 ns;

	constant fault6_select	: string	:= "0100";
	constant fault6_value	: string	:= "111000101110001001010101";
	constant fault6_val_sig	: string	:= "/fir_tb/fir_1/GEN_MAC(5)/MAC/fault_value(1)";
	constant fault6_val_sig_n_modular	: string	:= "/fir_tb/n_modular_fir_1/GEN_FIRS(1)/fir/GEN_MAC(5)/MAC/fault_value(1)";
	constant fault6_sel_sig	: string	:= "/fir_tb/fir_1/GEN_MAC(5)/MAC/fault_select(1)";
	constant fault6_sel_sig_n_modular	: string	:= "/fir_tb/n_modular_fir_1/GEN_FIRS(1)/fir/GEN_MAC(5)/MAC/fault_select(1)";
	constant fault6_start_time	: time	:= 1689 ns;
	constant fault6_stop_time	: time	:= 2066 ns;

	constant fault7_select	: string	:= "0100";
	constant fault7_value	: string	:= "001111011010110101010101";
	constant fault7_val_sig	: string	:= "/fir_tb/fir_1/GEN_MAC(3)/MAC/fault_value(2)";
	constant fault7_val_sig_n_modular	: string	:= "/fir_tb/n_modular_fir_1/GEN_FIRS(5)/fir/GEN_MAC(3)/MAC/fault_value(2)";
	constant fault7_sel_sig	: string	:= "/fir_tb/fir_1/GEN_MAC(3)/MAC/fault_select(2)";
	constant fault7_sel_sig_n_modular	: string	:= "/fir_tb/n_modular_fir_1/GEN_FIRS(5)/fir/GEN_MAC(3)/MAC/fault_select(2)";
	constant fault7_start_time	: time	:= 1067 ns;
	constant fault7_stop_time	: time	:= 1436 ns;

	constant fault8_select	: string	:= "0001";
	constant fault8_value	: string	:= "001001111110001010101111";
	constant fault8_val_sig	: string	:= "/fir_tb/fir_1/GEN_MAC(0)/MAC/fault_value(2)";
	constant fault8_val_sig_n_modular	: string	:= "/fir_tb/n_modular_fir_1/GEN_FIRS(2)/fir/GEN_MAC(0)/MAC/fault_value(2)";
	constant fault8_sel_sig	: string	:= "/fir_tb/fir_1/GEN_MAC(0)/MAC/fault_select(2)";
	constant fault8_sel_sig_n_modular	: string	:= "/fir_tb/n_modular_fir_1/GEN_FIRS(2)/fir/GEN_MAC(0)/MAC/fault_select(2)";
	constant fault8_start_time	: time	:= 2387 ns;
	constant fault8_stop_time	: time	:= 2512 ns;

	constant fault9_select	: string	:= "0001";
	constant fault9_value	: string	:= "110111101010010010110000";
	constant fault9_val_sig	: string	:= "/fir_tb/fir_1/GEN_MAC(6)/MAC/fault_value(2)";
	constant fault9_val_sig_n_modular	: string	:= "/fir_tb/n_modular_fir_1/GEN_FIRS(5)/fir/GEN_MAC(6)/MAC/fault_value(2)";
	constant fault9_sel_sig	: string	:= "/fir_tb/fir_1/GEN_MAC(6)/MAC/fault_select(2)";
	constant fault9_sel_sig_n_modular	: string	:= "/fir_tb/n_modular_fir_1/GEN_FIRS(5)/fir/GEN_MAC(6)/MAC/fault_select(2)";
	constant fault9_start_time	: time	:= 1243 ns;
	constant fault9_stop_time	: time	:= 1595 ns;

end random_faults;
