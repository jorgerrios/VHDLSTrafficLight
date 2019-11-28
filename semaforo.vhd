----------------------------------------------------------------------------------
-- Company: Samsung 
-- Engineer: Jorge Rodríguez Ríos
-- 
-- Create Date:    11:07:31 12/16/2017 
-- Design Name: 
-- Module Name:    semaforo - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity semaforo is
port ( sensor : in STD_LOGIC; -- Sensor
 clk : in STD_LOGIC; -- clock
 rst_n : in STD_LOGIC; -- reset active low
 light_highway: out STD_LOGIC_VECTOR(2 downto 0);
 light_farm: out STD_LOGIC_VECTOR(2 downto 0));
end semaforo;

architecture Behavioral of semaforo is
signal cnt: natural range 0 to 400;
signal verde: STD_LOGIC_VECTOR(2 downto 0);
signal amarillo: STD_LOGIC_VECTOR(2 downto 0);
signal rojo: STD_LOGIC_VECTOR(2 downto 0);

begin

process(clk, rst_n)
begin
verde<= "001";
amarillo<= "010";
rojo<= "100";


if(rst_n = '0') then

	light_highway<= verde ;
	light_farm<= rojo;
	cnt<= 0;
end if;

	if(clk'event and clk='1') then
		if(sensor = '1') then
			if(cnt = 0) then
			cnt<= cnt + 1;
			light_highway<= amarillo;
			light_farm<= rojo;
			end if;
		end if;
	end if;
	if (clk = '1' and clk'event) then
		if(cnt >= 1) then
			if(cnt = 6) then
			light_highway<= rojo;
			light_farm<= verde;
			cnt <= cnt + 1;
			elsif(cnt = 20) then
			light_highway<= rojo;
			light_farm<= amarillo;
			cnt<= cnt + 1;
			elsif(cnt = 26) then
			light_highway<= verde;
			light_farm<= rojo;
			cnt<= cnt + 1;
			elsif(cnt = 46) then
			cnt <= 0;
			else
			cnt<= cnt + 1;
			end if;
		end if;
	end if;
	
	end process;
end Behavioral;
		
	
		


