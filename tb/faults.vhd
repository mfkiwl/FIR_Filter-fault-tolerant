library ieee;
use ieee.std_logic_1164.all;

package faults is
  constant fault1_select     : string  := "0100";
  constant fault1_value      : string  := "001000001000000000000000";
  constant fault1_val_sig    : string  := "/fir_tb/fir_1/GEN_MAC(0)/MAC/fault_value(2)";
  constant fault1_sel_sig    : string  := "/fir_tb/fir_1/GEN_MAC(0)/MAC/fault_select(2)";
  constant fault1_start_time : time    := 1000 ns;
  constant fault1_stop_time  : time    := 1500 ns;

end faults;
