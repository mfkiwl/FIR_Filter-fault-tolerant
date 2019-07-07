library IEEE;
use IEEE.STD_LOGIC_1164.all;

use IEEE.NUMERIC_STD.all;


-- Fault descriptions:
--    1. behavioral fault   -  output is equal to fault value
--    2. flip bit fault     - flips bits where fault value is “1”
--    3. SA1                - sets bits to “1” where fault value is “1”
--    4. SA0                - sets bits to “0” where fault value is “1”

entity fault_injector is
  generic (
    N : integer := 24);
  port (
    i_signal        : in std_logic_vector (N-1 downto 0);
    i_fault_value   : in std_logic_vector (N-1 downto 0);
    i_fault_select  : in std_logic_vector (3 downto 0);  -- Not sure !!!?
    o_faulty_signal : out std_logic_vector (N-1 downto 0)
    );
end fault_injector;

---------------------------------------------------------
architecture Behavioral of fault_injector is
  signal w_out_tmp : std_logic_vector(N downto 0);
begin

  mux_process : process (i_signal, i_fault_value, i_fault_select) is
  begin  -- process mux_process

    case i_fault_select is
      when "1000" => o_faulty_signal <= i_fault_value;
      when "0100" => o_faulty_signal <= i_fault_value xor i_signal;
      when "0010" => o_faulty_signal <= i_fault_value or i_signal;
      when "0001" => o_faulty_signal <= (not i_fault_value) and i_signal;

      when others => o_faulty_signal <= i_signal;
    end case;

  end process mux_process;


end Behavioral;
