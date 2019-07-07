-------------------------------------------------------------------------------
-- Title      : Testbench for design "fault_injector"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : fault_injector_tb.vhd
-- Author     : milos  <milos@milos-desktop>
-- Company    : 
-- Created    : 2019-07-08
-- Last update: 2019-07-08
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2019 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2019-07-08  1.0      milos	Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------------------

entity fault_injector_tb is

end entity fault_injector_tb;

-------------------------------------------------------------------------------

architecture fault_injector of fault_injector_tb is

  -- component generics
  constant N : integer := 24;

  -- component ports
  signal i_signal        : std_logic_vector (N-1 downto 0);
  signal i_fault_value   : std_logic_vector (N-1 downto 0);
  signal i_fault_select  : std_logic_vector (3 downto 0);
  signal o_faulty_signal : std_logic_vector (N-1 downto 0);

  -- clock
  signal Clk : std_logic := '1';

begin  -- architecture fault_injector

  -- component instantiation
  DUT: entity work.fault_injector
    generic map (
      N => N)
    port map (
      i_signal        => i_signal,
      i_fault_value   => i_fault_value,
      i_fault_select  => i_fault_select,
      o_faulty_signal => o_faulty_signal);

  -- clock generation
  Clk <= not Clk after 10 ns;

  i_signal      <= b"010101010100111100001111";
  i_fault_value <= b"111100000000010000100010";
  i_fault_select <= b"0000", b"1000" after 20 ns, b"0100" after 40 ns, b"0010" after 60 ns,b"0001" after 80 ns;

  -- waveform generation
  WaveGen_Proc: process
  begin
    -- insert signal assignments here


    wait until Clk = '1';
  end process WaveGen_Proc;


end architecture fault_injector;

