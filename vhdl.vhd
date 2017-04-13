
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
	signal etatP, etatF : etats;
	begin
-------------------------------------------------------------------------------------------------------------------------
	etat_present : process(H, R)
		begin
			if(R = '1')
				then etatP <= a;
					etatF <= b;
			elsif(H'event and H = '1')
				then etatP <= etatF;
					case etatF is
						when a => etatF <= b;
						when b => etatF <= c;
						when c => etatF <= d;
						when d => etatF <= e;
						when e => etatF <= f;
						when f => etatF <= a;
				end case;
			end if;
	end process;
-------------------------------------------------------------------------------------------------------------------------	
	etat_lampe : process(etatP)
		begin
				case etatP is
					when a => L <= '1';
					when c => L <= '1';
					when d => L <= '1';
					when others => L <= '0';
				end case;
	end process;
-------------------------------------------------------------------------------------------------------------------------	
		
end test;
