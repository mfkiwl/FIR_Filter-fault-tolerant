library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity mac_faulty is
  generic (
    N : integer := 24);
  port (i_clk : in  std_logic;
        i_u   : in  std_logic_vector (N-1 downto 0);
        i_mac : in  std_logic_vector (N-1 downto 0);
        i_bn  : in  std_logic_vector (N-1 downto 0);
        o_mac : out std_logic_vector (N-1 downto 0));
end mac_faulty;

--------------------------------------------------------
architecture Behavioral of mac_faulty is
  signal r_reg             : std_logic_vector(N-1 downto 0) := (others => '0');
  -- Wires without fault
  signal w_mult            : std_logic_vector(N-1 downto 0) := (others => '0');
  signal w_add             : std_logic_vector(N-1 downto 0) := (others => '0');
  -- Wires with fault
  signal w_wf_reg          : std_logic_vector(N-1 downto 0) := (others => '0');
  signal w_wf_mult         : std_logic_vector(N-1 downto 0) := (others => '0');
  signal w_wf_add          : std_logic_vector(N-1 downto 0) := (others => '0');
  -- Signals that are going to be Forced in ModelSim
  signal reg_fault_value   : std_logic_vector(N-1 downto 0) := (others => '0');
  signal reg_fault_select  : std_logic_vector(3 downto 0)   := (others => '0');
  signal mult_fault_value  : std_logic_vector(N-1 downto 0) := (others => '0');
  signal mult_fault_select : std_logic_vector(3 downto 0)   := (others => '0');
  signal add_fault_value   : std_logic_vector(N-1 downto 0) := (others => '0');
  signal add_fault_select  : std_logic_vector(3 downto 0)   := (others => '0');
begin

  p_reg_proc : process (i_clk) is
  begin  -- process p_reg_proc
    if i_clk'event and i_clk = '0' then  -- falling clock edge
      r_reg <= i_mac;
    end if;
  end process p_reg_proc;

  fault_injector_reg : entity work.fault_injector
    generic map (
      N => N)
    port map (
      i_signal        => r_reg,
      i_fault_value   => reg_fault_value,
      i_fault_select  => reg_fault_select,
      o_faulty_signal => w_wf_reg);


  mult_1 : entity work.mult
    generic map (
      N => N)
    port map (
      i_num1 => i_u,
      i_num2 => i_bn,
      o_mul  => w_mult);

  fault_injector_mult : entity work.fault_injector
    generic map (
      N => N)
    port map (
      i_signal        => w_mult,
      i_fault_value   => mult_fault_value,
      i_fault_select  => mult_fault_select,
      o_faulty_signal => w_wf_mult);



  adder_1 : entity work.adder
    generic map (
      N => N)
    port map (
      i_num1 => w_wf_mult,
      i_num2 => w_wf_reg,
      o_sum  => w_add);

  fault_injector_add : entity work.fault_injector
    generic map (
      N => N)
    port map (
      i_signal        => w_add,
      i_fault_value   => add_fault_value,
      i_fault_select  => add_fault_select,
      o_faulty_signal => w_wf_add);

  o_mac <= w_wf_add;

end Behavioral;
