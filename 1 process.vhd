library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity balise is
	port(
	H, R : in std_logic;
	L    : out std_logic
	);
	
end balise;

architecture test of balise is
	type etats is (a, b, c, d, e, f);
	signal etat : etats;
	begin
		process(H, R)
		begin
			if(R = '1')
				then etat <= a;
					  L <= '1';
			elsif(H'event and H = '1')
				then case etat is
					when a => L <= '0';
								 etat <= b;
					when b => L <= '1';
								 etat <= c;
					when c => L <= '1';
								 etat <= d;
					when d => L <= '0';
								 etat <= e;
					when e => L <= '0';
								 etat <= f;
					when f => L <= '1';
								 etat <= a;
				end case;
			end if;
		end process;
end test;
