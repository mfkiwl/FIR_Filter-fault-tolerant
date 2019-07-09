library ieee;
use ieee.std_logic_1164.all;

package faults is
  constant N             : integer := 24;
  constant fault1_select : string  := "1000";
  constant fault1_value  : string  := "011111111111111111111111";
  constant fault1_val_sig : string  := "/fir_tb/fir_1/GEN_MAC(8)/MAC/add_fault_value";
  constant fault1_sel_sig : string  := "/fir_tb/fir_1/GEN_MAC(8)/MAC/add_fault_select";

end faults;
