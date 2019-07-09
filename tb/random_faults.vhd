library ieee;
use ieee.std_logic_1164.all;

package random_faults is


	constant fault0_select	: string	:= "0001";
	constant fault0_value	: string	:= "101101010001110101100110";
	constant fault0_val_sig	: string	:= "/fir_tb/fir_1/GEN_MAC(0)/MAC/fault_value(1)";
	constant fault0_sel_sig	: string	:= "/fir_tb/fir_1/GEN_MAC(0)/MAC/fault_select(1)";
	constant fault0_start_time	: time	:= 1182 ns;
	constant fault0_stop_time	: time	:= 1891 ns;

	constant fault1_select	: string	:= "1000";
	constant fault1_value	: string	:= "110111001000111010011110";
	constant fault1_val_sig	: string	:= "/fir_tb/fir_1/GEN_MAC(7)/MAC/fault_value(2)";
	constant fault1_sel_sig	: string	:= "/fir_tb/fir_1/GEN_MAC(7)/MAC/fault_select(2)";
	constant fault1_start_time	: time	:= 1111 ns;
	constant fault1_stop_time	: time	:= 2414 ns;

	constant fault2_select	: string	:= "0100";
	constant fault2_value	: string	:= "110001000000100010110000";
	constant fault2_val_sig	: string	:= "/fir_tb/fir_1/GEN_MAC(6)/MAC/fault_value(1)";
	constant fault2_sel_sig	: string	:= "/fir_tb/fir_1/GEN_MAC(6)/MAC/fault_select(1)";
	constant fault2_start_time	: time	:= 2744 ns;
	constant fault2_stop_time	: time	:= 2827 ns;

	constant fault3_select	: string	:= "1000";
	constant fault3_value	: string	:= "010001100110001110100011";
	constant fault3_val_sig	: string	:= "/fir_tb/fir_1/GEN_MAC(8)/MAC/fault_value(1)";
	constant fault3_sel_sig	: string	:= "/fir_tb/fir_1/GEN_MAC(8)/MAC/fault_select(1)";
	constant fault3_start_time	: time	:= 2771 ns;
	constant fault3_stop_time	: time	:= 2842 ns;

end random_faults;
